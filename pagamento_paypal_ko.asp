<!--#include file="inc_strConn.asp"-->
<%
	Call Visualizzazione("",0,"pagamento_paypal_ko.asp")

	'IdOrdine=request("item_number")
	'if IdOrdine="" then IdOrdine=0

		Set rs=Server.CreateObject("ADODB.Recordset")
		sql = "Select * From Iscritti where pkid="&idsession
		rs.Open sql, conn, 1, 1

		nominativo_email=rs("nome")&" "&rs("cognome")
		email=rs("email")

		rs.close

			'invio l'email all'amministratore
			HTML1 = ""
			HTML1 = HTML1 & "<html>"
			HTML1 = HTML1 & "<head>"
			HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
			HTML1 = HTML1 & "<title>DecorAndFlowers</title>"
			HTML1 = HTML1 & "</head>"
			HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
			HTML1 = HTML1 & "<table width='553' border='0' cellspacing='0' cellpadding='0'>"
			HTML1 = HTML1 & "<tr>"
			HTML1 = HTML1 & "<td>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Un ordine con pagamento da Paypal dal sito internet non &egrave; andato a buon fine.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti dell'ordine:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&idsession&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@decorandflowers.it"
			Destinatario = "info@decorandflowers.it"
			Oggetto = "Pagamento con Paypal non andato a buon fine"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.decorandflowers.it"
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "postmaster@decorandflowers.it"
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "alessandrO81"

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			Mittente = "info@decorandflowers.it"
			Destinatario = "viadeimedici@gmail.com"
			Oggetto = "Pagamento con Paypal non andato a buon fine"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.decorandflowers.it"
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "postmaster@decorandflowers.it"
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "alessandrO81"

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			'fine invio email
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
									<div class="col-sm-5 bs-wizard-step complete">
											<div class="text-center bs-wizard-stepnum">1</div>
											<div class="progress">
													<div class="progress-bar"></div>
											</div>
											<a href="carrello1.asp" class="bs-wizard-dot"></a>
											<div class="bs-wizard-info text-center">Carrello</div>
									</div>
									<div class="col-sm-5 bs-wizard-step complete">
											<div class="text-center bs-wizard-stepnum">2</div>
											<div class="progress">
													<div class="progress-bar"></div>
											</div>
											<a href="iscrizione.asp" class="bs-wizard-dot"></a>
											<div class="bs-wizard-info text-center">Accedi / Iscriviti</div>
									</div>
									<div class="col-sm-5 bs-wizard-step complete">
											<div class="text-center bs-wizard-stepnum">3</div>
											<div class="progress">
													<div class="progress-bar"></div>
											</div>
											<a href="carrello2.asp" class="bs-wizard-dot"></a>
											<div class="bs-wizard-info text-center">Indirizzo di spedizione</div>
									</div>
									<div class="col-sm-5 bs-wizard-step complete">
											<div class="text-center bs-wizard-stepnum">4</div>
											<div class="progress">
													<div class="progress-bar"></div>
											</div>
											<a href="carrello3.asp" class="bs-wizard-dot"></a>
											<div class="bs-wizard-info text-center">Pagamento &amp; fatturazione</div>
									</div>
									<div class="col-sm-5 bs-wizard-step active">
											<div class="text-center bs-wizard-stepnum">5</div>
											<div class="progress">
													<div class="progress-bar"></div>
											</div>
											<a href="#" class="bs-wizard-dot"></a>
											<div class="bs-wizard-info text-center">Conferma dell'ordine</div>
									</div>
		            </div>
		        </div>
		        <div class="col-md-12">
								<div class="col-md-12 hidden-print">
										<p class="description">
											<br /><br />La procedura di pagamento attraverso PayPal non &egrave; stata completata correttamente oppure ci sono stati errori nel sistema di pagamento.<br /><br />
												Puoi contattare il nostro staff e spiegare la situazione, ti saremo di aiuto.
												<br / ><br / >
												<em>Nel caso in cui si volessero modificare alcuni dati o cambiare il sistema di pagamento l'ordine &egrave; presente nell'Area Clienti.</em>
												<br / ><br / >
												Cordiali saluti, lo staff di DecorAndFlowers.it
												<br / ><br / >

										</p>
								</div>
						</div>

		    </div>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->