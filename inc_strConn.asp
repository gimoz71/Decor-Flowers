<%
Response.CacheControl = "no-cache"
Response.AddHeader "Pragma", "no-cache"
Response.Expires = -1500

On Error Resume Next

	Set conn = Server.CreateObject("ADODB.Connection")
  conn.open = "Provider = SQLOLEDB; Data Source = 62.149.153.60; Database = MSSql145843; User ID = MSSql145843; Password=4141i46474"

	path_img="d:\inetpub\webs\decorandflowersit\public\"
	path_thumb="d:\inetpub\webs\decorandflowersit\public\thumb\"

	fromURL = Request.ServerVariables("HTTP_REFERER")
	toUrl = Request.ServerVariables("SCRIPT_NAME")


	'strDaDoveVengo = Request.Servervariables("HTTP_REFERER")
	UltimoSlash1 = InStrRev(fromURL,"/")
	fromURL = Mid((fromURL),(UltimoSlash1 + 1), len(fromURL)- UltimoSlash1)
	'Response.Write "La pagina di provenienza �: " &fromURL& ".<br>"

	UltimoSlash2 = InStrRev(toUrl,"/")
	toUrl = Mid((toUrl),(UltimoSlash2 + 1), len(toUrl)- UltimoSlash2)
	'Response.Write "La pagina dove sono �: " &toURL& "."

If Err.Number <> 0 Then
	Response.Redirect("/aggiornamento.html")
End IF


Function TogliTAG(Stringa)
   Dim RegEx, Temp

   Temp = Stringa
   Set RegEx = New RegExp
   RegEx.Pattern = "<[^>]*>"
   RegEx.Global = True
   RegEx.IgnoreCase = True
   Temp = RegEx.Replace(Temp, "")
   Set RegEx = Nothing

   TogliTAG = Temp
End Function

Function NoHTML(strInput)

 Dim RegEx
 Set RegEx = New RegExp
 RegEx.Pattern = "<[^>]*>"
 RegEx.Global = True
 RegEx.IgnoreCase = True

 ' conserva la formattazione
 strInput = Replace(strInput, "<br>", chr(10))
 'strInput = Replace(strInput, "'", "")
 strInput = Replace(strInput, """", "")

 strInput = Replace(strInput, "é", "&eacute;")
 strInput = Replace(strInput, "è", "&egrave;")
 strInput = Replace(strInput, "à", "&agrave;")
 strInput = Replace(strInput, "ù", "&ugrave;")
 strInput = Replace(strInput, "ì", "&igrave;")
 strInput = Replace(strInput, "ò", "&ograve;")

 NoHTML = RegEx.Replace(strInput, "")

End Function


Function NoLettAcc(strInput)

	strInput = Replace(strInput, "é", "&eacute;")
	strInput = Replace(strInput, "è", "&egrave;")
	strInput = Replace(strInput, "à", "&agrave;")
	strInput = Replace(strInput, "ù", "&ugrave;")
	strInput = Replace(strInput, "ì", "&igrave;")
	strInput = Replace(strInput, "ò", "&ograve;")
 	strInput = Replace(strInput, "€", "&#8364;")
 	strInput = Replace(strInput, "'", "&#8217;")
	strInput = Replace(strInput, " ", "%20")

 NoLettAcc = strInput

End Function

'rewrite url per i produttori
	Function ConvertiTitoloInUrlProduttore(Titolo, IDArticolo)
		Risultato = Titolo

		Set RegEx = New RegExp
		RegEx.Pattern = "<[^>]*>"
		RegEx.Global = True
		RegEx.IgnoreCase = True
		Risultato = RegEx.Replace(Risultato, "")

		Risultato = LCase(Risultato)
		Risultato = Replace(Risultato, " - ", "-")
		Risultato = Replace(Risultato, " ", "-")
		Risultato = Replace(Risultato, ",", "")
		Risultato = Replace(Risultato, "\", "-")
		Risultato = Replace(Risultato, "/", "-")
		Risultato = Replace(Risultato, ":", "")
		Risultato = Replace(Risultato, "*", "-")
		Risultato = Replace(Risultato, "?", "-")
		Risultato = Replace(Risultato, "<", "-")
		Risultato = Replace(Risultato, ">", "-")
		Risultato = Replace(Risultato, "|", "-")
		Risultato = Replace(Risultato, """", "")
		Risultato = Replace(Risultato, "'", "")
		Risultato = Replace(Risultato, "�", "a")
		Risultato = IDArticolo & "f-" & Risultato & ".asp"
		ConvertiTitoloInUrlProduttore = Risultato
	End Function
%>
