<!--#include file="inc_strConn.asp"-->
<%
cat_1=request("cat_1")
if cat_1="" then cat_1=0

cat_2=request("cat_2")
if cat_2="" then cat_2=0

if cat_2>0 then
  Set sot_rs=Server.CreateObject("ADODB.Recordset")
  sql = "SELECT * "
  sql = sql + "FROM Categorie_2 "
  sql = sql + "WHERE PkId="&cat_2&""
  sot_rs.Open sql, conn, 1, 1
  if sot_rs.recordcount>0 then
    Titolo_1_Cat_2=sot_rs("Titolo_1")
    Titolo_2_Cat_2=sot_rs("Titolo_2")
    Descrizione_Cat_2=sot_rs("Descrizione")
    Title_Cat_2=sot_rs("Title")
    Description_Cat_2=sot_rs("Description")
    FkCategoria_1=sot_rs("FkCategoria_1")
    if FkCategoria_1="" or IsNull(FkCategoria_1) then FkCategoria_1=0
  end if
  sot_rs.close

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
  if Len(Titolo_2_Cat_2)>0 then
    titolo_pagina=Titolo_2_Cat_2
    descrizione_pagina=Descrizione_Cat_2
  else
    titolo_pagina=Titolo_1_Cat_2
    descrizione_pagina=Descrizione_Cat_2
  end if
end if

if cat_2=0 and cat_1>0 then
  Set cat_rs=Server.CreateObject("ADODB.Recordset")
  sql = "SELECT * "
  sql = sql + "FROM Categorie_1 "
  sql = sql + "WHERE PkId="&cat_1&""
  cat_rs.Open sql, conn, 1, 1
  if cat_rs.recordcount>0 then
    Titolo_1_Cat_1=cat_rs("Titolo_1")
    Titolo_2_Cat_1=cat_rs("Titolo_2")
    Descrizione_Cat_1=cat_rs("Descrizione")
    Title_Cat_1=cat_rs("Title")
    Description_Cat_1=cat_rs("Description")
  end if
  cat_rs.close

  titolo_pagina=Titolo_1_Cat_1
  descrizione_pagina=Descrizione_Cat_1
end if
%>
<!DOCTYPE html>
<html>

<head>
    <title><%=titolo_pagina%> - Decor &amp; Flowers</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="<%=descrizione_pagina%> - Decor &amp; Flowers.">
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
                    <div class="top-buffer">
                        <div class="title">
                            <h1 class="main"><%=titolo_pagina%></h1>
                        </div>
                        <div class="panel panel-default" style="border: none;">
                            <div class="panel-body">
                                <p style="font-size: 1.2em; text-align: justify">
                                    <%=descrizione_pagina%>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row top-buffer">
              <div class="col-sm-12">
                  <nav class="navbar navbar-default">
                      <div class="container-fluid">
                          <!-- Brand and toggle get grouped for better mobile display -->
                          <div class="navbar-header">
                              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                  <span class="sr-only">Toggle navigation</span>
                                  <span class="icon-bar"></span>
                                  <span class="icon-bar"></span>
                                  <span class="icon-bar"></span>
                              </button>
                              <a class="navbar-brand" href="#">Ordina per:</a>
                          </div>

                          <!-- Collect the nav links, forms, and other content for toggling -->
                          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                              <ul class="nav navbar-nav">
                                  <li> <p class="navbar-text">prezzo</p></li>
                                  <li class="active"><a href="#"><i class="glyphicon glyphicon-eur"></i> + </a></li>
                                  <li ><a href="#"><i class="glyphicon glyphicon-eur"></i> - </a></li>
                                  <li><p class="navbar-text">ordine alfabetico</p></li>
                                  <li><a href="#">A/Z</a></li>
                                  <li><a href="#">Z/A</a></li>

                              </ul>
                          </div>
                          <!-- /.navbar-collapse -->
                      </div>
                      <!-- /.container-fluid -->
                  </nav>
              </div>
                <%
                Set pro_rs=Server.CreateObject("ADODB.Recordset")
                sql = "SELECT * "
                sql = sql + "FROM Prodotti_Madre "
                if cat_2>0 then sql = sql + "WHERE (Stato=1 AND FkCategoria_2="&cat_2&") "
                if cat_2=0 and cat_1>0 then sql = sql + "WHERE (Stato=1 AND FkCategoria_1="&cat_1&") "
                if cat_2=0 and cat_1=0 then sql = sql + "WHERE (Stato=1) "
                sql = sql + "ORDER BY Posizione ASC, Titolo ASC"
                pro_rs.Open sql, conn, 1, 1
                if pro_rs.recordcount>0 then
                  Do While Not pro_rs.EOF
                  Pkid_Prod=pro_rs("Pkid")
                  Titolo_Prod=pro_rs("Titolo")
                  Codice_Prod=pro_rs("Codice")
                  PrezzoProdotto=pro_rs("PrezzoProdotto")
                  if PrezzoProdotto="" or IsNull(PrezzoProdotto) then PrezzoProdotto=0
                  PrezzoOfferta=pro_rs("PrezzoOfferta")
                  if PrezzoOfferta="" or IsNull(PrezzoOfferta) then PrezzoOfferta=0

                  Set img_rs=Server.CreateObject("ADODB.Recordset")
      						sql = "SELECT TOP 1 * FROM Immagini WHERE FkContenuto="&Pkid_Prod&" and Tabella='Prodotti_Madre' ORDER BY Posizione ASC"
      						img_rs.Open sql, conn, 1, 1
      						if img_rs.recordcount>0 then
                    img="https://www.decorandflowers.it/public/thumb/"&NoLettAcc(img_rs("File"))
                  else
                    img=""
                  end if
                  img_rs.close
                %>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <article class="col-item">
                        <div class="photo">
                            <a href="scheda.asp?pkid_prod=<%=Pkid_Prod%>" class="prod-img-replace" style="background-image: url(<%=img%>)" title="Scheda del prodotto <%=Titolo_Prod%>"><img alt="<%=Titolo_Prod%>" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="price-details col-md-6">
                                    <a href="scheda.asp?pkid_prod=<%=Pkid_Prod%>" title="Scheda del prodotto <%=Titolo_Prod%>"><h3><%=Titolo_Prod%></h3></a>
                                    <p class="details">codice: <b><%=Codice_Prod%></b></p>
                                    <div class="price-box separator">
                                      <%if PrezzoOfferta>0 then%>
                                        <span class="price-new"><i class="fa fa-tag"></i>&nbsp;<%=PrezzoOfferta%> &euro;</span><br />
                                        <%if PrezzoProdotto>0 then%><span class="price-old">invece di <b><%=PrezzoProdotto%> &euro;</b></span><%else%>&nbsp;<%end if%>
                                      <%else%>
                                        <span class="price-new"><i class="fa fa-tag"></i>&nbsp;<%=PrezzoProdotto%> &euro;</span><br />&nbsp;
                                      <%end if%>
                                    </div>
                                </div>
                            </div>
                            <div class="separator clear-left">
                                <p class="btn-add">
                                    <a href="#" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="Aggiungi ai preferiti"><i class="fa fa-heart"></i></a>
                                </p>
                                <p class="btn-details">
                                    <a href="scheda.asp?pkid_prod=<%=Pkid_Prod%>" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="vedi ed aggiungi al carrello">scheda <i class="fa fa-chevron-right"></i></a>
                                </p>
                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </article>
                </div>
                <%
                  pro_rs.movenext
                  loop
                end if
                pro_rs.close
                %>
            </div>
        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->
