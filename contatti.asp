<!--#include file="inc_strConn.asp"-->
<!DOCTYPE html>
<html>

<head>
    <title>Contatti Decor &amp; Flowers</title>
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
</head>

<body>
  <!--#include file="inc_header_1.asp"-->
    <div id="block-main" class="block-main">
        <!--#include file="inc_header_2.asp"-->
    </div>
    <div class="container content">
        <!--#include file="inc_slider.asp"-->
        <div class="top-buffer">

        </div>
        <!--#include file="inc_menu.asp"-->
        <div class="col-md-9">
            <div class="row top-buffer">
                <div class="col-md-12">
                    <h1 class="slogan subtitle">Contatti e riferimenti Decor &amp; Flowers</h1>
                    <div class="panel panel-default" style="border: none;">
                        <div class="panel-body">
                            <p style="font-size: 1.2em; text-align: justify">
                              Decorandflowers<br>
                              C.F. e Iscr. Reg. Impr. di Firenze 06741510488<br />
                              R.E.A. di Firenze<br />
                              Via delle mimose, 13<br />
                              50050 Capraia e Limite (Firenze)<br />
                              E-mail: info@decorandflowers.it
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row top-buffer">
                <div class="col-xl-12">
                    <h4 class="subtitle">Categorie in evidenza</h4>
                </div>
                <%
                Set cat_rs=Server.CreateObject("ADODB.Recordset")
                sql = "SELECT TOP 4 * "
                sql = sql + "FROM Categorie_1 "
                sql = sql + "WHERE PrimoPiano='True' "
                sql = sql + "ORDER BY Posizione ASC, Titolo_1 ASC"
                cat_rs.Open sql, conn, 1, 1

                if cat_rs.recordcount>0 then
                  Do While Not cat_rs.EOF
                  Pkid_Cat_1=cat_rs("Pkid")
                  Titolo_1_Cat_1=cat_rs("Titolo_1")

                  Set img_rs=Server.CreateObject("ADODB.Recordset")
                  sql = "SELECT TOP 1 * FROM Immagini WHERE FkContenuto="&Pkid_Cat_1&" and Tabella='Categorie_1' ORDER BY Posizione ASC"
                  img_rs.Open sql, conn, 1, 1
                  if img_rs.recordcount>0 then
                    img="https://www.decorandflowers.it/public/thumb/"&NoLettAcc(img_rs("File"))
                  else
                    img="images/thumb_d&f.png"
                  end if
                  img_rs.close
                %>
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <article class="col-item">
                        <div class="photo">
                            <a href="#" class="prod-img-replace" style="background-image: url(<%=img%>)"><img alt="<%=Titolo_1_Cat_1%>" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="prodotti.asp?cat_1=<%=Pkid_Cat_1%>" title="<%=Titolo_1_Cat_1%>"><h1><%=Titolo_1_Cat_1%></h1></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <%
                  cat_rs.movenext
                  loop
                end if
                cat_rs.close
                %>
            </div>


        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->
