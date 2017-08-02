<!--#include file="inc_strConn.asp"-->
<%
pkid_prod=request("pkid_prod")
if pkid_prod="" then pkid_prod=0


if pkid_prod>0 then
  Set pro_rs=Server.CreateObject("ADODB.Recordset")
  sql = "SELECT * "
  sql = sql + "FROM Prodotti_Madre "
  sql = sql + "WHERE PkId="&pkid_prod&""
  pro_rs.Open sql, conn, 1, 1
  if pro_rs.recordcount>0 then
    Titolo_Prod=pro_rs("Titolo")
    Codice_Prod=pro_rs("Codice")
    PrezzoProdotto=pro_rs("PrezzoProdotto")
    if PrezzoProdotto="" or IsNull(PrezzoProdotto) then PrezzoProdotto=0
    PrezzoOfferta=pro_rs("PrezzoOfferta")
    if PrezzoOfferta="" or IsNull(PrezzoOfferta) then PrezzoOfferta=0
    Descrizione_Prod=pro_rs("Descrizione")
    Materiale_Prod=pro_rs("Materiale")
    Dimensioni_Prod=pro_rs("Dimensioni")
    Colori_Prod=pro_rs("Colori")
    Stato_Prod=pro_rs("Stato")

    FkCategoria_1=pro_rs("FkCategoria_1")
    if FkCategoria_1="" or IsNull(FkCategoria_1) then FkCategoria_1=0
    FkCategoria_2=pro_rs("FkCategoria_2")
    if FkCategoria_2="" or IsNull(FkCategoria_2) then FkCategoria_2=0
  end if
  pro_rs.close

  if FkCategoria_1>0 then
    Set cat_rs=Server.CreateObject("ADODB.Recordset")
    sql = "SELECT * "
    sql = sql + "FROM Categorie_1 "
    sql = sql + "WHERE PkId="&FkCategoria_1&""
    cat_rs.Open sql, conn, 1, 1
    if cat_rs.recordcount>0 then
      Titolo_1_Cat_1=cat_rs("Titolo_1")
      Titolo_2_Cat_1=cat_rs("Titolo_2")
      Descrizione_Cat_1=cat_rs("Descrizione")
      Title_Cat_1=cat_rs("Title")
      Description_Cat_1=cat_rs("Description")
    end if
    cat_rs.close
  end if

  if FkCategoria_2>0 then
    Set sot_rs=Server.CreateObject("ADODB.Recordset")
    sql = "SELECT * "
    sql = sql + "FROM Categorie_2 "
    sql = sql + "WHERE PkId="&FkCategoria_2&""
    sot_rs.Open sql, conn, 1, 1
    if sot_rs.recordcount>0 then
      Titolo_1_Cat_2=sot_rs("Titolo_1")
      Titolo_2_Cat_2=sot_rs("Titolo_2")
      Descrizione_Cat_2=sot_rs("Descrizione")
      Title_Cat_2=sot_rs("Title")
      Description_Cat_2=sot_rs("Description")
    end if
    sot_rs.close
  end if

  Set var_rs=Server.CreateObject("ADODB.Recordset")
  sql = "SELECT FkProdotto_Madre, SUM(Pezzi) AS TotalePezzi "
  sql = sql + "FROM Prodotti_Figli WHERE FkProdotto_Madre="&pkid_prod&" "
  sql = sql + "GROUP BY FkProdotto_Madre"
  var_rs.Open sql, conn, 1, 1
  if var_rs.recordcount>0 then
    TotalePezzi=var_rs("TotalePezzi")
    Varianti="si"
  else
    TotalePezzi=0
    Varianti="no"
  end if
  var_rs.close
end if

%>
<!DOCTYPE html>
<html>

<head>
    <title><%=Titolo_Prod%> - <%=Titolo_1_Cat_2%> - <%=Titolo_1_Cat_1%> - Decor &amp; Flowers</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="<%=Descrizione_Prod%>, <%=Titolo_Prod%>, <%=Titolo_1_Cat_2%>, <%=Titolo_1_Cat_1%>, Decor &amp; Flowers.">
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
    <link href="stylesheets/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css">
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
    <SCRIPT language="JavaScript">
			function Verifica() {

					document.newsform2.method = "post";
					document.newsform2.action = "carrello1.asp";
					document.newsform2.submit();
			}
	  </SCRIPT>
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
        <ol class="breadcrumb">
            <li><a href="index.asp">Home</a></li>
            <li><a href="prodotti.asp?cat_1=<%=FkCategoria_1%>"><%=Titolo_1_Cat_1%></a></li>
            <li><a href="prodotti.asp?cat_2=<%=FkCategoria_2%>"><%=Titolo_1_Cat_2%></a></li>
            <li class="active"><%=Titolo_Prod%></li>
        </ol>
        <!--#include file="inc_menu.asp"-->

        <div class="col-md-9">
            <div class="row">
                <div class="col-md-12">
                    <div class="title">
                        <h1 class="main"><%=Titolo_Prod%></h1>
                        <p class="details">codice: <b><%=Codice_Prod%></b></p>
                    </div>
               </div>
               <div class="col-md-8">
                   <div class="top-buffer">
                         <p class="descrizione"><small>
                             <%=Descrizione_Prod%><br >
                             <%if Len(Materiale_Prod)>0 then%><strong>Materiale:</strong><%=Materiale_Prod%><br /><%end if%>
                             <%if Len(Dimensioni_Prod)>0 then%><strong>Dimensioni:</strong><%=Dimensioni_Prod%><br /><%end if%>
                             <%if Len(Colori_Prod)>0 then%><strong>Colori:</strong><%=Colori_Prod%><br /><%end if%>
                             </small>
                         </p>
                   </div>
              </div>
              <div class="col-md-4">
                  <div class="top-buffer">
                      <%if prezzoofferta>0 or prezzoprodotto>0 then%>
                      <div class="panel panel-default" style="box-shadow: 0 3px 5px #ccc;">
                            <ul class="list-group text-center">
                                <li class="list-group-item" style="padding-top: 20px">
                                    <p>
                                    Prezzo D&F<br />
                                    <span class="price-new"><i class="fa fa-tag"></i>&nbsp;<%=prezzoofferta%> &euro;</span><br />
                                    <%if prezzoprodotto>0 then%><span class="price-old">Invece di  <b><%=prezzoprodotto%> &euro;</b></span><br /><%end if%>
                                    </p>
                                </li>
                            </ul>
                            <%if Stato_Prod=2 or (TotalePezzi=0 and Varianti="no") then%>
                            <div class="panel-footer">
                                <a href="mailto:info@decorandflowers.it" rel="nofollow" class="btn btn-danger btn-block" title="Richiedi il prodotto al nostro staff">Ordina per email <i class="glyphicon glyphicon-envelope"></i></a>
                            </div>
                            <%end if%>
                      </div>
                      <%end if%>
                  </div>
             </div>
                <div class="col-md-12">
                    <div class="top-buffer">
                        <div class="top-buffer">
                            <hr />
                            <%
                            Set img_rs=Server.CreateObject("ADODB.Recordset")
                						sql = "SELECT * FROM Immagini WHERE FkContenuto="&Pkid_Prod&" and Tabella='Prodotti_Madre' ORDER BY Posizione ASC"
                						img_rs.Open sql, conn, 1, 1
                						if img_rs.recordcount>0 then
                            %>
                            <div class="row">
                                <%
                                Do While Not img_rs.EOF
                                img_thumb="https://www.decorandflowers.it/public/thumb/"&NoLettAcc(img_rs("File"))
                                img_zoom="https://www.decorandflowers.it/public/"&NoLettAcc(img_rs("Zoom"))
                                img_titolo=img_rs("Titolo")
                                %>
                                <div class="col-sm-3 col-xs-6">
                                    <div class="col-item">
                                        <div class="photo">
                                            <a href="<%=img_zoom%>" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(<%=img_thumb%>)"><img alt="900x550" src="images/blank.png"></a>
                                        </div>
                                    </div>
                                </div>
                                <%
                                img_rs.movenext
                                loop
                                %>
                            </div>
                            <%
                            end if
                            img_rs.close
                            %>
                        </div>
                        <%
                        Set var_rs=Server.CreateObject("ADODB.Recordset")
                        sql = "SELECT * "
                        sql = sql + "FROM Prodotti_Figli WHERE FkProdotto_Madre="&pkid_prod&" "
                        sql = sql + "ORDER BY Titolo ASC"
                        var_rs.Open sql, conn, 1, 1
                        if var_rs.recordcount>0 then
                        TotalePezzi=var_rs("TotalePezzi")
                        response.write("TotalePezzi:"&TotalePezzi)
                        %>
                        <form name="newsform2" id="newsform2" onSubmit="return Verifica();">
                        <input type="hidden" name="id_madre" id="id_madre" value="<%=pkid_prod%>">
                        <table id="cart" class="table table-hover table-condensed table-cart">
                            <thead>
                                <tr>
                                    <th style="width:60%">Variante</th>
                                    <th style="width:13%" class="hidden-xs text-right">Prezzo</th>
                                    <th style="width:12%" class="hidden-xs text-center">Disponibilit&agrave;</th>
                                    <th style="width:15%" class="text-center">Quantit&agrave;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                Do while not var_rs.EOF
                                img_thumb="https://www.decorandflowers.it/public/thumb/"&NoLettAcc(var_rs("Img"))
                                img_zoom="https://www.decorandflowers.it/public/"&NoLettAcc(var_rs("Img"))
                                pezzi=var_rs("Pezzi")
                                if pezzi="" or IsNull(pezzi) then pezzi=0
                                pkid_prodotto_figlio=var_rs("PkId")
                                %>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4">
                                                <div class="col-item">
                                                    <div class="photo">
                                                        <a href="<%=img_zoom%>" data-fancybox data-caption="Caption #1"  class="prod-img-replace" style="background-image: url(<%=img_thumb%>)"><img alt="900x550" src="images/blank.png"></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8">
                                                <h5 class="nomargin"><%=var_rs("Titolo")%></h5>
                                                <p>Codice: <%=var_rs("Codice")%></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Price" class="hidden-xs text-right"><%=var_rs("PrezzoProdotto")%> &euro;</td>
                                    <td data-th="Price" class="hidden-xs text-center"><%=Pezzi%></td>
                                    <td data-th="Quantity">
                                        <!--<input type="number" class="form-control text-center" name="pezzi_<%=pkid_prodotto_figlio%>" value="0" <%if Pezzi=0 then%>disabled<%end if%>>-->
                                        <%if Pezzi>0 then%>
                                        <input type="number" class="form-control text-center" name="pezzi_<%=pkid_prodotto_figlio%>" id="pezzi_<%=pkid_prodotto_figlio%>" value="0">
                                        <%else%>
                                        <a href="mailto:info@decorandflowers.it" rel="nofollow" class="btn btn-danger btn-block" title="Richiedi il prodotto al nostro staff">Ordina per email <i class="glyphicon glyphicon-envelope"></i></a>
                                        <%end if%>
                                    </td>
                                </tr>
                                <%
                                var_rs.movenext
                                loop
                                %>
                            </tbody>
                        </table>
                        <%if TotalePezzi>0 then%><a href="#" class="btn btn-danger btn-block" onClick="Verifica();">Aggiungi al carrello <i class="glyphicon glyphicon-shopping-cart"></i></a><%end if%>
                        </form>
                        <%
                        end if
                        var_rs.close
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--#include file="inc_footer.asp"-->

    <script src="javascripts/jquery.fancybox.js"></script>
</body>
<!--#include file="inc_strClose.asp"-->
