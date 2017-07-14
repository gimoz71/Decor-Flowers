<!--#include file="inc_strConn.asp"-->
<%
	mode=request("mode")
	if mode="" then mode=0

	'se la session è già aperta sfrutto il pkid dell'ordine, altrimenti ne apro una
	IdOrdine=session("ordine_shop")
	if IdOrdine="" then IdOrdine=0

	id_madre=request("id_madre")
	if id_madre="" then id_madre=0
	response.write("id_madre:"&id_madre&"<br>")

	if id_madre>0 then
		ordine="KO"
		Set var_rs=Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * "
		sql = sql + "FROM Prodotti_Figli WHERE FkProdotto_Madre="&id_madre&" "
		sql = sql + "ORDER BY Titolo ASC"
		var_rs.Open sql, conn, 1, 1
		if var_rs.recordcount>0 then
			Do while not var_rs.EOF
			pkid_prodotto_figlio=var_rs("PkId")
				pezzi=request("pezzi_"&pkid_prodotto_figlio)
				response.write("pezzi:"&pezzi&"<br>")
				'if pezzi="" or pezzi=0 then ordine="KO"
				if pezzi>0 then ordine="OK"
			var_rs.movenext
			loop
		end if
		var_rs.close

	end if
response.write("ordine:"&ordine&"<br>")
		if IdOrdine=0 and ordine="OK" then
			Set os1 = Server.CreateObject("ADODB.Recordset")
			sql = "SELECT * FROM Ordini"
			os1.Open sql, conn, 3, 3

			os1.addnew
			os1("FkCliente")=idsession
			os1("stato")=0
			os1("TotaleCarrello")=0
			os1("TotaleGenerale")=0
			os1("DataOrdine")=now()
			os1("DataAggiornamento")=now()
			os1("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
			os1.update

			os1.close

			Set os1 = Server.CreateObject("ADODB.Recordset")
			sql = "SELECT Top 1 PkId FROM Ordini Order by PkId Desc"
			os1.Open sql, conn, 1, 1
			IdOrdine=os1("PkId")
			os1.close

			'Creo una sessione con l'id dell'ordine
			Session("ordine_shop")=IdOrdine

		end if

		IdOrdine=cInt(IdOrdine)

	'modifica del carrello: eliminazione o modifica di un articolo nel carrello
		'if mode=2 then
			'cs = conn.Execute("Delete * FROM RigheOrdine Where FkOrdine="&IdOrdine)
			'mode=0
		'end if

		if mode>0 then
			'eliminazione prodotto/riga dal carrello
			if mode=2 then
				riga=request("riga")
				if riga="" or isnull(riga) then riga=0
				if riga>0 then
					Set ts = Server.CreateObject("ADODB.Recordset")
					sql = "SELECT * FROM RigheOrdine where PkId="&riga
					ts.Open sql, conn, 3, 3
						ts.delete
						ts.update
					ts.close
				end if
			end if

			if mode=1 then
				'parte per la modifica delle quantita di un articolo nel carrello

				riga=request("riga")
				if riga="" or isnull(riga) then riga=0
				quantita=request("quantita")
				if quantita="" or isnull(quantita) then quantita=0

				if riga>0 then
					Set ts = Server.CreateObject("ADODB.Recordset")
					sql = "SELECT * FROM RigheOrdine where PkId="&riga
					ts.Open sql, conn, 3, 3
						PrezzoProdotto=ts("PrezzoProdotto")
						ts("Quantita")=Quantita
						ts("TotaleRiga")=(Quantita*PrezzoProdotto)
						ts.update
					ts.close
				end if
			end if

		else
	'inserimento di un prodotto per la prima volta scelto con il carrello già aperto
			'Prendo il prezzo del prodotto

			if ordine="OK" then

			'prendo le caretteristriche del prodotto

			Set prodotto_rs = Server.CreateObject("ADODB.Recordset")
			sql = "SELECT * FROM Prodotti_Madre where PkId="&id_madre&""
			prodotto_rs.Open sql, conn, 1, 1

			Codice_madre=prodotto_rs("Codice")
			Titolo_madre=prodotto_rs("Titolo")

			prodotto_rs.close

				Set var_rs=Server.CreateObject("ADODB.Recordset")
				sql = "SELECT * "
				sql = sql + "FROM Prodotti_Figli WHERE FkProdotto_Madre="&id_madre&" "
				sql = sql + "ORDER BY Titolo ASC"
				var_rs.Open sql, conn, 1, 1
				if var_rs.recordcount>0 then
					Do while not var_rs.EOF
						pkid_prodotto_figlio=var_rs("PkId")
						Codice_figlio=var_rs("Codice")
						Titolo_figlio=var_rs("Titolo")
						PrezzoProdotto_figlio=var_rs("PrezzoProdotto")
						pezzi=request("pezzi_"&pkid_prodotto_figlio)
						if pezzi>0 then
								Set riga_rs = Server.CreateObject("ADODB.Recordset")
								sql = "SELECT * FROM RigheOrdine"
								riga_rs.Open sql, conn, 3, 3

								riga_rs.addnew
								riga_rs("FkOrdine")=IdOrdine
								riga_rs("FkIscritto")=idsession
								riga_rs("FkProdotto_Madre")=id_madre
								riga_rs("Codice_Madre")=Codice_Madre
								riga_rs("Titolo_Madre")=Titolo_Madre
								riga_rs("FkProdotto_Figlio")=pkid_prodotto_figlio
								riga_rs("Codice_Figlio")=Codice_figlio
								riga_rs("Titolo_Figlio")=Titolo_figlio
								riga_rs("PrezzoProdotto")=PrezzoProdotto_figlio
								riga_rs("Quantita")=pezzi
								TotaleRiga=PrezzoProdotto_figlio*pezzi
								riga_rs("TotaleRiga")=TotaleRiga
								riga_rs("Data")=now()
								riga_rs.update

								riga_rs.close
						end if
					var_rs.movenext
					loop
				end if
				var_rs.close





			end if
		end if

				'Calcolo la somma per l'ordine
				Set rs2 = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT FkOrdine, SUM(TotaleRiga) AS TotaleCarrello FROM RigheOrdine WHERE FkOrdine="&IdOrdine&" GROUP BY FkOrdine"
				rs2.Open sql, conn, 3, 3
					TotaleCarrello=rs2("TotaleCarrello")
					if TotaleCarrello="" or isnull(TotaleCarrello) then TotaleCarrello=0
				rs2.close


				'Aggiorno la tabella dell'ordine con la somma calcolata prima
				Set ss = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT * FROM Ordini where PkId="&IdOrdine
				'response.write("sql2:"&sql)
				ss.Open sql, conn, 3, 3
				if ss.recordcount>0 then
					ss("TotaleCarrello")=TotaleCarrello
					ss("TotaleGenerale")=TotaleCarrello
					ss("DataAggiornamento")=now()
					ss("Stato")=0
					ss("FkCliente")=idsession
					ss("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
					ss.update
				end if
				ss.close
%>
<!DOCTYPE html>
<html>

<head>
    <title>Decor &amp; Flowers</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Decor &amp; Flowers.">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Decor &amp; Flowers.">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
    <link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="/android-chrome-192x192.png" sizes="192x192">
    <link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
    <link rel="manifest" href="/manifest.json">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#2790cf">
    <meta name="msapplication-TileColor" content="#2790cf">
    <meta name="msapplication-TileImage" content="/mstile-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link href="stylesheets/styles.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="stylesheets/customization.css" shim-shadowdom>
    <link href="javascripts/html5shiv.js" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,400i,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Slabo+27px" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/webcomponentsjs/0.7.5/webcomponents.min.js"></script>
    <link rel="import" href="awesome-slider.html">
    <style type="text/css">
        .clearfix:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
    </style>
    <script language="javascript">
    function NoteCliente()
    {
        document.modulocarrello.method = "post";
        document.modulocarrello.action = "carrello2.asp";
        document.modulocarrello.submit();
    }
    </script>

</head>

<body>
  <!--#include file="inc_header_1.asp"-->
    <div id="block-main" class="block-main">
        <!--#include file="inc_header_2.asp"-->
    </div>
    <%
  		Set rs = Server.CreateObject("ADODB.Recordset")
  		sql = "SELECT * FROM RigheOrdine WHERE FkOrdine="&idOrdine&""
  		rs.Open sql, conn, 1, 1
  		num_prodotti_carrello=rs.recordcount

  		Set ss = Server.CreateObject("ADODB.Recordset")
  		sql = "SELECT * FROM Ordini where pkid="&idOrdine
  		ss.Open sql, conn, 1, 1
  	%>
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-sm-12">
            <div class="row bs-wizard">
                <div class="col-sm-5 bs-wizard-step active">
                    <div class="text-center bs-wizard-stepnum">1</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Carrello</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">2</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Accedi / Iscriviti</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">3</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Indirizzo di spedizione</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">4</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Pagamento &amp; fatturazione</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">5</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Conferma dell'ordine</div>
                </div>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="col-md-8">
                <div class="row">
                    <div class="title">
                        <h4>Carrello</h4>
                    </div>
                    <div class="col-md-12">
                        <div class="top-buffer">
                            <table id="cart" class="table table-hover table-condensed table-cart">
                                <thead>
                                    <tr>
                                        <th style="width:45%">Prodotto</th>
                                        <th style="width:10%">Prezzo</th>
                                        <th style="width:8%">Quantit&agrave;</th>
                                        <th style="width:22%" class="text-center">Subtotale</th>
                                        <th style="width:15%"></th>
                                    </tr>
                                </thead>

																<%if rs.recordcount>0 then%>
																<tbody>
																		<%
																		Do while not rs.EOF

																		'Set url_prodotto_rs = Server.CreateObject("ADODB.Recordset")
																		'sql = "SELECT PkId, NomePagina FROM Prodotti where PkId="&rs("FkProdotto")&""
																		'url_prodotto_rs.Open sql, conn, 1, 1

																		'NomePagina=url_prodotto_rs("NomePagina")
																		'if Len(NomePagina)>0 then
																			'NomePagina="/public/pagine/"&NomePagina
																		'else
																			'NomePagina="#"
																		'end if

																		'url_prodotto_rs.close
																		%>
																		<form method="post" action="carrello1.asp?mode=1&riga=<%=rs("pkid")%>">
																		<%
																		quantita=rs("quantita")
																		if quantita="" then quantita=1
																		%>
																		<tr>
                                        <td data-th="Product" class="cart-product">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <h5 class="nomargin"><a href="<%=NomePagina%>" title="Scheda del prodotto: <%=NomePagina%>"><%=rs("Titolo_Madre")%> - <%=rs("Titolo_Figlio")%></a></h5>
																										<p><strong>Codice: <%=rs("Codice_Madre")%> - <%=rs("Codice_Figlio")%></strong></p>
                                                </div>
                                            </div>
                                        </td>
                                        <td data-th="Price" class="hidden-xs"><%=FormatNumber(rs("PrezzoProdotto"),2)%>&euro;</td>
                                        <td data-th="Quantity">
                                            <input type="number" class="form-control text-center" name="quantita" value="<%=quantita%>">
                                        </td>
                                        <td data-th="Subtotal" class="text-center"><%=FormatNumber(rs("TotaleRiga"),2)%>&euro;</td>
                                        <td class="actions" data-th="">
                                            <button class="btn btn-info btn-sm" type="submit"><i class="fa fa-refresh"></i></button>
                                            <button class="btn btn-danger btn-sm" type="button" onClick="location.href='carrello1.asp?mode=2&riga=<%=rs("pkid")%>'"><i class="fa fa-trash-o"></i></button>
                                        </td>
                                    </tr>
																		</form>
																		<%
																		rs.movenext
																		loop
																		%>

																	</tbody>
																	<%if ss.recordcount>0 then%>
	                                <tfoot>
	                                    <tr class="visible-xs">
	                                        <td class="text-center"><strong>Totale <%if ss("TotaleGenerale")<>0 then%>
												  <%=FormatNumber(ss("TotaleGenerale"),2)%>&euro;<%else%>0&euro;<%end if%></strong></td>
	                                    </tr>
	                                    <tr>
	                                        <td><a href="index.asp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continua gli acquisti</a></td>
	                                        <td colspan="2" class="hidden-xs"></td>
	                                        <td class="hidden-xs text-center"><strong>Totale <%if ss("TotaleGenerale")<>0 then%>
												  <%=FormatNumber(ss("TotaleGenerale"),2)%><%else%>0<%end if%> &euro;</strong></td>
	                                        <td></td>
	                                    </tr>
	                                </tfoot>
																	<%end if%>
																<%else%>
																	<tbody>
																	<tr>
																			<td data-th="Product" class="cart-product">
																					<div class="row">
																							<div class="col-sm-12">
																									<h5 class="nomargin"><br>Nessun prodotto nel carrello</h5>
																							</div>
																			</td>
																	</tr>
																	</tbody>
																<%end if%>


                            </table>

                        </div>
                    </div>

                </div>
								<%if ss.recordcount>0 then%>
								<form method="post" name="modulocarrello" action="carrello2.asp">
								<div class="panel panel-default user-comment">
										<!-- Default panel contents -->
										<div class="panel-heading">
												<h5><i class="glyphicon glyphicon-warning-sign"></i> Eventuali annotazioni</h5>
										</div>
										<ul class="list-group">
												<li class="list-group-item">
												<p>Potete usare questo spazio per inserire eventuali comunicazioni in relazione ai prodotti acquistati.</p>
												<textarea name="NoteCliente" style="width: 100%" rows="2" id="NoteCliente"><%=ss("NoteCliente")%></textarea>
												</li>
										</ul>
								</div>
								</form>
								<%end if%>

            </div>
            <div class="col-md-4">
								<%if ss.recordcount>0 then%>
								<div class="panel panel-default" style="box-shadow: 0 3px 5px #ccc;">
                    <ul class="list-group text-center">
                        <li class="list-group-item" style="padding-top: 20px">
                            <p>Totale carrello:<br />
                                <span class="price-new"><i class="fa fa-tag"></i>&nbsp;<%if ss("TotaleGenerale")<>0 then%>
								<%=FormatNumber(ss("TotaleGenerale"),2)%><%else%>0<%end if%> &euro;</span>
                            </p>
                        </li>
                    </ul>
                    <div class="panel-footer">
                        <a href="#" class="btn btn-danger btn-block" onClick="NoteCliente();">Completa l'acquisto <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
								<%end if%>

								<!--condizioni di vendita-->
								<div class="panel panel-default payment-list">
										<!-- Default panel contents -->
										<div class="panel-heading">
											<h5>Condizioni di vendita</h5>
										</div>
										<ul class="list-group">
											<li class="list-group-item"><strong>PAGAMENTI SICURI</strong></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Bonifico bancario: 0&euro;</em></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Carte di credito e prepagate: 0&euro;</em></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Contrassegno in contanti: 4&euro;</em></li>
											<li class="list-group-item">&nbsp;</li>
											<li class="list-group-item"><strong>SPEDIZIONE IN TUTTA ITALIA ASSICURATA</strong></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini superiori a 100&euro;: 0&euro;</em></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini fino a  100&euro;: 10&euro;</em></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Ritiro in sede: 0&euro;</em></li>
										</ul>
										<div class="panel-footer"><a href="#" class="btn btn-success">Condizioni di vendita <i class="fa fa-chevron-right"></i></a></div>
								</div>
								<div class="alert alert-success" role="alert" style="text-align: center;">
                  <em>Hai bisogno di aiuto? Contattaci!</em><br /><br /><a href="tel: 0571.594000" class="alert-link"><span class="glyphicon glyphicon-earphone"></span> 0571.911163</a> - <a href="mailto:info@decorandflowers.it" class="alert-link"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a>
                  <br /><br />Lunedi - Venerdi<br />9.00 - 13.00 | 14.00 - 18.00<br />Sabato e Domenica CHIUSI<br />
                </div>
            </div>
        </div>


		</div>
		<%
		ss.close
		rs.close
		%>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->