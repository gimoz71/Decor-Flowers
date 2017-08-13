<!--#include file="inc_strConn.asp"-->
<%
IdOrdine=request("IdOrdine")
if IdOrdine="" then IdOrdine=0
if idOrdine=0 then response.redirect("carrello1.asp")

if idsession=0 then response.redirect("iscrizione.asp?prov=1")

Set ss = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM Ordini where pkid="&idOrdine
ss.Open sql, conn, 3, 3

if ss.recordcount>0 then
  TotaleCarrello=ss("TotaleCarrello")
  CostoSpedizioneTotale=ss("CostoSpedizione")
  TipoSpedizione=ss("TipoSpedizione")
  Nominativo_sp=ss("Nominativo_sp")
  Telefono_sp=ss("Telefono_sp")
  Indirizzo_sp=ss("Indirizzo_sp")
  CAP_sp=ss("CAP_sp")
  Citta_sp=ss("Citta_sp")
  Provincia_sp=ss("Provincia_sp")
  NoteCliente=ss("NoteCliente")

  FkPagamento=ss("FkPagamento")
  TipoPagamento=ss("TipoPagamento")
  CostoPagamento=ss("CostoPagamento")

  Nominativo=ss("Nominativo_fat")
  Rag_Soc=ss("Rag_Soc_fat")
  Cod_Fisc=ss("Cod_Fisc_fat")
  PartitaIVA=ss("PartitaIVA_fat")
  Indirizzo=ss("Indirizzo_fat")
  Citta=ss("Citta_fat")
  Provincia=ss("Provincia_fat")
  CAP=ss("CAP_fat")

  TotaleGenerale=ss("TotaleGenerale")

  DataAggiornamento=ss("DataAggiornamento")
end if

ss.close

Set rs=Server.CreateObject("ADODB.Recordset")
sql = "Select * From Iscritti where pkid="&idsession
rs.Open sql, conn, 1, 1
if rs.recordcount>0 then
  nominativo_iscr=rs("nome")&" "&rs("cognome")
  email_iscr=rs("email")
end if
rs.close
%>
<!DOCTYPE html>
<html>

<head>
    <title>Decor &amp; Flowers - Ordine n. <%=IdOrdine%></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Cristalensi.">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Cristalensi.">
    <link href="stylesheets/styles.css" rel="stylesheet" type="text/css">
    <link href="javascripts/html5shiv.js" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,400i,500,600,700" rel="stylesheet">
    <style type="text/css">
        .clearfix:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
        @media print{
            body {
                font-size: 135%;
            }
            h1,h2,h3,h4,h5 {
                font-size: 135%;
            }
            @page {
                size:  auto;
                margin: 0mm;
            }
        }
    </style>
</head>

<body>
    <div class="container-fluid content">
        <div class="row">
            <div class="col-xs-6"><img src="images/logo_v3_footer.png" style="height: 85px; margin: 15px;" /></div>
            <div class="col-xs-6">
                <p style="font-size: 70%; margin: 15px; color: #999">
                  Decorandflowers<br>
                  C.F. e Iscr. Reg. Impr. di Firenze 06741510488<br />
                  R.E.A. di Firenze<br />
                  Via delle mimose, 13<br />
                  50050 Capraia e Limite (Firenze)<br />
                  E-mail: info@decorandflowers.it
                </p>
            </div>
        </div>
        <div class="row top-buffer">
            <div class="col-md-12">
                <div class="title">
                    <h4>Ordine n. 30661 - Data 25/05/2017</h4>
                </div>
                <div class="col-md-12">
                    <div class="top-buffer">
                        <table id="cart" class="table table-hover table-condensed table-cart">
                            <thead>
                                <tr>
                                    <th style="width:45%">Prodotto</th>
                                    <th style="width:10%" class="text-center">Quantit&agrave;</th>
                                    <th style="width:10%" class="text-center">Prezzo unitario</th>
                                    <th style="width:20%" class="text-center">Subtotale</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h5 class="nomargin"><a href="scheda.html">Modello Plafoniera Moderna</a></h5>
                                                <p>Col.: Avorio antico - Lamp.: Bianco satinato</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Quantity" class="text-center">
                                        1
                                    </td>
                                    <td data-th="Price" class="hidden-xs text-center">55&euro;</td>
                                    <td data-th="Subtotal" class="text-center">55&euro;</td>
                                </tr>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h5 class="nomargin"><a href="scheda.html">Modello Plafoniera Moderna</a></h5>
                                                <p>Col.: Avorio antico - Lamp.: Bianco satinato</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Quantity" class="text-center">
                                        1
                                    </td>
                                    <td data-th="Price" class="hidden-xs text-center">55&euro;</td>
                                    <td data-th="Subtotal" class="text-center">55&euro;</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr class="visible-xs">
                                    <td colspan="4" class="text-center"><strong>Totale 110&euro;</strong></td>
                                </tr>
                                <tr class="hidden-xs">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="text-center"><strong>Totale 110&euro;</strong></td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <h5>Eventuali annotazioni</h5>
                                        <textarea class="form-control" rows="3" readonly style="font-size: 12px;">sdfwf adf fwf ewqfewq qwefewqf qwef ewqf qwefqwef qwef ewqfqwefqw qewf qwefewqfwqfsdfvf dv</textarea>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div class="row top-buffer">
                    <div class="col-md-6">
                        <div class="title">
                            <h4>Modalit&agrave; di spedizione</h4>
                        </div>
                        <div class="col-md-12 top-buffer">
                            <table id="cart" class="table table-hover table-condensed table-cart">
                                <thead>
                                    <tr>
                                        <th style="width:75%">Modalit&agrave; di spedizione</th>
                                        <th style="width:25%" class="text-center">Totale</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td data-th="Product" class="cart-product">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <p>Spedizione in Italia</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td data-th="Quantity" class="text-center">
                                            10,00&euro;
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="title">
                            <h4>indirizzo di spedizione</h4>
                        </div>
                        <div class="col-md-12 top-buffer">
                            <p>Nominativo: <b>Amintore Fanfani</b> - Indirizzo: <b>Via delle Acciughe 34 -57122 Livorno</b></p>
                        </div>
                    </div>
                </div>
                <div class="row top-buffer">
                    <div class="col-md-6">
                        <div class="title">
                            <h4>Modalit&agrave; di Pagamento</h4>
                        </div>
                        <div class="col-md-12 top-buffer">
                            <table id="cart" class="table table-hover table-condensed table-cart">
                                <thead>
                                    <tr>
                                        <th style="width:75%">Modalit&agrave; di pagamento</th>
                                        <th style="width:25%" class="text-center">Totale</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td data-th="Product" class="cart-product">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <p>Bonifico bancario</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td data-th="Quantity" class="text-center">
                                            0,00&euro;
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="title">
                            <h4>Dati di fatturazione</h4>
                        </div>
                        <div class="col-md-12 top-buffer">
                            <p>Nominativo: <b>Amintore Fanfani</b> - Indirizzo: <b>Via delle Acciughe 34 -57122 Livorno</b></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-md-12">
                    <div class="bg-primary">
                        <p style="font-size: 1.2em; text-align: right; padding: 10px 15px; color: #000;">Totale carrello: <b>349,00&euro;</b></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- /top-link-block -->
    <!-- fine finestra modale -->
    <!-- Bootstrap core JavaScript
        ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="javascripts/bootstrap.js"></script>
    <script src="javascripts/holder.js"></script>
    <script src="javascripts/jquery.bootstrap-touchspin.js"></script>
    <script src="javascripts/bootstrap-select.js"></script>
    <script src="javascripts/custom.js"></script>
</body>
</html>
<!--#include file="inc_strClose.asp"-->
