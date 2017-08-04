<!--#include file="inc_strConn.asp"-->
<%
if idsession=0 then response.Redirect("iscrizione.asp")

mode=request("mode")
if mode="" then mode=0

if mode=1 or mode=2 then
	IdOrdine=request("IdOrdine")

	if IdOrdine>0 then
		session("ordine_shop")=IdOrdine
		if mode=1 then response.Redirect("carrello1.asp")
	end if
end if
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
		<script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-103870379-1', 'auto');
      ga('send', 'pageview');

    </script>
</head>

<body>
  <!--#include file="inc_header_1.asp"-->
    <div id="block-main" class="block-main">
        <!--#include file="inc_header_2.asp"-->
    </div>
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-sm-12">
            <div class="row bs-wizard">
                <div class="col-sm-5 bs-wizard-step disabled">
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
            <div class="col-md-12">
							<div class="row">
									<div class="title">
											<h4>Elenco ordini</h4>
									</div>
									<div class="col-md-12">
											<div class="top-buffer">
													<table id="cart" class="table table-hover table-condensed table-cart">
															<thead>
																	<tr>
																			<th style="width:30%">Codice ordine - Data</th>
																			<th style="width:10%">Totale</th>
																			<th style="width:30%">Stato/Informazioni</th>
																			<th style="width:30%" class="text-center">Azioni</th>
																	</tr>
															</thead>
															<%
																Set rs = Server.CreateObject("ADODB.Recordset")
																sql = "SELECT * FROM Ordini WHERE FkIscritto="&idsession&" ORDER BY PkId DESC"
																rs.Open sql, conn, 1, 1
															%>
															<%if rs.recordcount>0 then%>
															<tbody>
																	<%
																	Do while not rs.EOF

																	InfoSpedizione=rs("InfoSpedizione")
																	NoteCri=rs("NoteCri")
																	stato=rs("Stato")
																	'response.write("stato:"&stato)

																	if stato=0 then etichetta_stato="Carrello iniziato"
																	if stato=1 then etichetta_stato="Carrello iniziato"
																	if stato=2 then etichetta_stato="Spedizione scelta"
																	if stato=12 then etichetta_stato="Spedizione scelta"
																	if stato=3 then etichetta_stato="Pagamento da scegliere"
																	if stato=22 then etichetta_stato="Pagamento da scegliere"

																	if stato=4 then etichetta_stato="Pagato con PayPal"
																	if stato=5 then etichetta_stato="Pagamento annullato"
																	if stato=6 then etichetta_stato="In fase di pagamento"
																	if stato=7 then etichetta_stato="Ordine in lavorazione"
																	if stato=8 then
																		etichetta_stato="Prodotti spediti"
																		if InfoSpedizione<>"" then etichetta_stato=etichetta_stato&"<br>"&InfoSpedizione
																		if Left(NoteCri,4)="http" then etichetta_stato=etichetta_stato&"<br><a href="""&NoteCri&""" target=_blank>LINK</a>"
																	end if
																	%>
																	<tr>
																			<td data-th="Product" class="cart-product">
																					<div class="row">
																							<div class="col-sm-12">
																									<h5 class="nomargin">[<%=rs("PkId")%>] - <%=rs("DataAggiornamento")%></h5>
																							</div>
																					</div>
																			</td>
																			<td data-th="Price" class="hidden-xs">
																			<%
																			TotaleGenerale=rs("TotaleGenerale")
																			if TotaleGenerale="" or Isnull(TotaleGenerale) then TotaleGenerale=0
																			%>
																			<%=FormatNumber(TotaleGenerale,2)%>&#8364;
																			</td>
																			<td data-th="Quantity">
																					<em><%=etichetta_stato%></em>
																			</td>
																			<td class="actions" data-th="">
																			<button type="button" name="visualizza" class="btn btn-default" onClick="MM_openBrWindow('stampa_ordine.asp?idordine=<%=rs("PkId")%>&mode=0','','width=760,height=400,scrollbars=yes')">visualizza</button>
																			&nbsp;<button type="button" name="stampa" class="btn btn-default" onClick="MM_openBrWindow('stampa_ordine.asp?idordine=<%=rs("PkId")%>&mode=1','','width=760,height=900,scrollbars=yes')">stampa</button>
																			<%if stato=0 or stato=1 or stato=2 or stato=3 or stato=5 or stato=6 then%>
																			<br><button type="button" name="modifica" class="btn btn-default" style="margin-top:5px;" onClick="document.location.href='ordini_elenco.asp?IdOrdine=<%=rs("PkId")%>&mode=1';">continua l'ordine</button>
																			<%else%>
																				<%if stato=12 or stato=22 then%>
																				<br><a href="ordini_elenco.asp?IdOrdine=<%=rs("PkId")%>&mode=2"><b>[<%=rs("PkId")%>]&nbsp;-&nbsp;<%=rs("DataAggiornamento")%></b></a>
																				&nbsp;<button type="button" name="modifica" class="btn btn-default" onClick="document.location.href='ordini_elenco.asp?IdOrdine=<%=rs("PkId")%>&mode=2';" style="margin:5px 0px;">continua l'ordine</button><br>
																				<%end if%>
																			<%end if%>

																			</td>
																	</tr>
																	<%
																	rs.movenext
																	loop
																	%>
																</tbody>
															<%else%>
																<tbody>
																<tr>
																		<td data-th="Product" class="cart-product">
																				<div class="row">
																						<div class="col-sm-12">
																								<h5 class="nomargin"><br>Non sono presenti ordini</h5>
																						</div>
																		</td>
																</tr>
																</tbody>
															<%end if%>
															<%
															rs.close
															%>
													</table>
											</div>
									</div>
							</div>
            </div>

						<p>&nbsp;</p>

						<!--<div class="col-md-4">
								<div class="alert alert-success" role="alert" style="text-align: center;">
                  <em>Hai bisogno di aiuto? Contattaci!</em><br /><br /><a href="tel: 0571.594000" class="alert-link"><span class="glyphicon glyphicon-earphone"></span> 0571.594000</a><br /><a href="mailto:info@decorandflowers.it" class="alert-link"><span class="glyphicon glyphicon-envelope"></span> info@decorandflowers.it</a>
                  <br /><br />Lunedi - Venerdi<br />9.00 - 13.00 | 14.00 - 18.00<br />Sabato e Domenica CHIUSI<br />
                </div>
						</div>-->
        </div>


		</div>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->
