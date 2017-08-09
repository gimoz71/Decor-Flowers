<!--#include file="inc_strConn.asp"-->
<%if idsession=0 then response.Redirect("iscrizione.asp")%>
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
        <div class="top-buffer">

        </div>
        <!--#include file="inc_menu.asp"-->
        <div class="col-md-9">

            <div class="title">
                <h4>Inserisci il tuo commento!</h4>
            </div>
            <div class="col-md-12">
              <%if mode=1 then%>
                <p class="description">Il tuo commento &egrave; stato inserito correttamente, adesso il nostro staff lo valuter&agrave; e se sar&agrave; approvato, ti verr&agrave; recapitata una notifica via email.<br />Grazie della tua collaborazione dallo staff di Cristalensi.<br /><br /><a href="https://www.cristalensi.it/commenti_elenco.asp" class="button_link_red" style="float:right">Elenco commenti</a>
                </p>
              <%else%>
                <p class="description">Inserisci un commento su i prodotti acquistati, se ti sono piaciuti o no, oppure un commento sul sito internet o sull'azienda e lo staff.<br />Il commento non sar&agrave; pubblicato immediatamente ma sar&agrave; soggetto a un controllo da parte del nostro staff per evitare che vengano inseriti contenuti non leciti, offese e termini non pubblicabili.<br />Si prega di non inserire codice html, email, link e collegamenti ad altri siti internet: il commento non sar&agrave; pubblicato.<br />Per ogni commento saranno pubblicati anche il <strong>Nome</strong> e la <strong>Citt&agrave;</strong> inseriti al momento dell'iscrizione.
                </p>
                <%if mode=2 then%><p><strong>Attenzione! Controllare il testo inserito rispettando le regole, grazie.</strong></p><%end if%>
                <form class="form-horizontal" method="post" action="commenti_form.asp?mode=1" name="newsform2">
                    <div class="form-group">
                        <label for="testo" class="col-sm-2 control-label">Commento</label>
                        <div class="col-sm-10">
                            <textarea name="testo" style="width: 100%" rows="4" id="testo"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="valutazione" class="col-sm-2 control-label">Valutazione</label>
                        <div class="col-sm-10">
                            <select class="selectpicker show-menu-arrow  show-tick" data-size="5" title="valutazione" name="valutazione" id="valutazione">
                            <option value="5" selected>5 - Ottimo</option>
                            <option value="4">4 - Buono</option>
                            <option value="3">3 - Sufficiente</option>
                            <option value="2">2 - Insufficiente</option>
                            <option value="1">1 - Scarso</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-8">
                            <a href="commenti_elenco.asp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Elenco commenti</a>
                            <button type="submit" class="btn btn-danger">Invia</button>
                        </div>
                    </div>
                </form>
              <%end if%>
            </div>

        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->
