<!--#include file="inc_strConn.asp"-->
<%
id=request("id")
if id="" then id=0

mode=request("mode")
if mode="" then mode=0

if idsession=0 then
	if id>0 then Session("id_prodotto_preferiti")=id
	response.Redirect("/iscrizione.asp?prov=2")
end if

if idsession>0 and mode=0 then
	if id=0 then id=Session("id_prodotto_preferiti")
	if id="" then id=0

	if id>0 then
		Set ts = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM Prodotti_Madre where PkId="&id
		ts.Open sql, conn, 1, 1
			PrezzoProdotto=ts("PrezzoOfferta")
			Titolo_Madre=ts("Titolo")
			Codice_Madre=ts("Codice")
			Url_Madre=ts("Url")
		ts.close

		Set ts = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM Preferiti"
		ts.Open sql, conn, 3, 3
			ts.addnew
			ts("FkIscritto")=idsession
			ts("FkProdotto_Madre")=id
			ts("Titolo_Madre")=Titolo_Madre
			ts("Codice_Madre")=Codice_Madre
			ts("PrezzoProdotto")=PrezzoProdotto
			ts("Url_Madre")=Url_Madre
			ts("Data")=Now()
			ts.update
		ts.close

		Session("id_prodotto_preferiti")=0
		'Session.Contents.Remove("Nome_Variabile")'
	end if
end if



'eliminazione prodotto/riga dai preferiti
if mode=1 then
	riga=request("riga")
	if riga="" or isnull(riga) then riga=0
	'response.write("riga:"&riga)
	if riga>0 then
		Set ts = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM Preferiti where PkId="&riga
		ts.Open sql, conn, 3, 3
			ts.delete
			ts.update
		ts.close
	end if
end if
%>
<!DOCTYPE html>
<html>

<head>
    <title>Decor &amp; Flowers - Prodotti preferiti</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Decor &amp; Flowers.">
    <meta name="keywords" content="">
    <!--#include file="inc_head.asp"-->
</head>

<body>
  <!--#include file="inc_header_1.asp"-->
    <div id="block-main" class="block-main">
        <!--#include file="inc_header_2.asp"-->
    </div>
    <%
  		Set rs = Server.CreateObject("ADODB.Recordset")
  		sql = "SELECT * FROM Preferiti WHERE FkCliente="&idsession&""
  		rs.Open sql, conn, 1, 1

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
            <div class="row">
                <div class="title">
                    <h4>Carrello</h4>
                </div>
						</div>
				</div>

        <div class="col-sm-12">
            <div class="col-md-8">
                <div class="row">
                    <!--<div class="title">
                        <h4>Carrello</h4>
                    </div>-->
                    <div class="col-md-12">
                        <div class="top-buffer">
                            <table id="cart" class="table table-hover table-condensed table-cart">
                                <thead>
                                    <tr>
                                        <th style="width:45%">Prodotto</th>
                                        <th style="width:10%">Prezzo</th>
                                        <th style="width:8%">Quantit&agrave;</th>
                                        <th style="width:22%" class="text-center">Totale</th>
                                        <th style="width:15%"></th>
                                    </tr>
                                </thead>

																<%if rs.recordcount>0 then%>
																<tbody>
																		<%
																		Do while not rs.EOF
																		FkProdotto_Figlio=rs("FkProdotto_Figlio")
																		FkProdotto_Madre=rs("FkProdotto_Madre")
																		NomePagina="/scheda.asp?pkid_prod="&FkProdotto_Madre

																		Set url_prodotto_rs = Server.CreateObject("ADODB.Recordset")
																		sql = "SELECT PkId, Pezzi FROM Prodotti_Figli where PkId="&FkProdotto_Figlio
																		url_prodotto_rs.Open sql, conn, 1, 1
																			maxpezzi=url_prodotto_rs("pezzi")
																		url_prodotto_rs.close
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
                                            <!--<input type="number" class="form-control text-center" name="quantita" value="<%=quantita%>">-->
																						<select class="form-control text-center" data-size="5" title="quantita" name="quantita" id="quantita">
	                        										<option title="0" value="0">0</option>
	                        										<%
	                        										FOR npezzi=1 TO maxpezzi
	                        										%>
	                        										<option title="<%=npezzi%>" value=<%=npezzi%> <%if cInt(quantita)=cInt(npezzi) then%> selected<%end if%>><%=npezzi%></option>
	                        										<%
	                        										NEXT
	                        										%>
	                        									</select>
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
	                                        <td class="text-center"><strong>Totale <%if ss("TotaleCarrello")<>0 then%>
												  <%=FormatNumber(ss("TotaleCarrello"),2)%>&euro;<%else%>0&euro;<%end if%></strong></td>
	                                    </tr>
	                                    <tr>
	                                        <td><a href="index.asp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continua gli acquisti</a></td>
	                                        <td colspan="2" class="hidden-xs"></td>
	                                        <td class="hidden-xs text-center"><strong>Totale <%if ss("TotaleCarrello")<>0 then%>
												  <%=FormatNumber(ss("TotaleCarrello"),2)%><%else%>0<%end if%> &euro;</strong></td>
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

								<div class="row">

										<div class="col-md-6">
												<!--condizioni di vendita-->
												<div class="panel panel-default payment-list">
														<!-- Default panel contents -->
														<div class="panel-heading">
															<h5>Pagamenti accettati</h5>
														</div>
														<ul class="list-group">
															<li class="list-group-item"><strong>PAGAMENTI SICURI</strong></li>
															<li class="list-group-item"><i class="fa fa-check"></i> <em>Bonifico bancario: 0&euro;</em></li>
															<li class="list-group-item"><i class="fa fa-check"></i> <em>Carte di credito, prepagate: 0&euro;</em></li>
															<li class="list-group-item"><i class="fa fa-check"></i> <em>Contrassegno in contanti: 4&euro;</em></li>
														</ul>
												</div>
										</div>
										<div class="col-md-6">
												<!--condizioni di vendita-->
												<div class="panel panel-default payment-list">
														<!-- Default panel contents -->
														<div class="panel-heading">
															<h5>SPEDIZIONI</h5>
														</div>
														<ul class="list-group">
															<li class="list-group-item"><strong>CONSEGNE IN TUTTA ITALIA</strong></li>
															<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini superiori a 100&euro;: 0&euro;</em></li>
															<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini fino a  100&euro;: 10&euro;</em></li>
															<li class="list-group-item">&nbsp;</li>
														</ul>
												</div>
										</div>

								</div>

            </div>

						<p>&nbsp;</p>

						<div class="col-md-4">
								<%if ss.recordcount>0 then%>
								<div class="panel panel-default" style="box-shadow: 0 3px 5px #ccc;">
                    <ul class="list-group text-center">
                        <li class="list-group-item" style="padding-top: 20px">
                            <p><strong>Totale carrello:</strong><br /><br />
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

								<div class="alert alert-success" role="alert" style="text-align: center;">
                  <em>Hai bisogno di aiuto? Contattaci!</em><br /><br /><a href="mailto:info@decorandflowers.it" class="alert-link"><span class="glyphicon glyphicon-envelope"></span> info@decorandflowers.it</a>
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
