<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3 address-col">
                <img src="images/logo_v3_footer.png" alt="Decor & Flowers" style="width: 100%; padding-bottom: 15px;"/>
                <p>
                    Decorandflowers<br>
                    C.F. e Iscr. Reg. Impr. di Firenze 06741510488<br />
                    R.E.A. di Firenze<br />
                    Via delle mimose, 13<br />
                    50050 Capraia e Limite (Firenze)<br />
                    E-mail: info@decorandflowers.it
                </p>
                <!--<h4>Contatti Social</h4>
                <p class="social">
                    <a href="#"><i class="fa fa-facebook-square"></i></a>
                    <a href="#"><i class="fa fa-youtube-square"></i></a>
                </p>-->
            </div>
            <div class="col-md-3 menu-col">
                <h4>Cerca per Eventi</h4>
                <ul>
                    <li><a href="/prodotti_eventi.asp?eve=1">San valentino</a></li>
                    <li><a href="/prodotti_eventi.asp?eve=2">Festa della donna</a></li>
                    <li><a href="/prodotti_eventi.asp?eve=3">Pasqua</a></li>
                    <li><a href="/prodotti_eventi.asp?eve=7">Festa della mamma</a></li>
                    <li><a href="/prodotti_eventi.asp?eve=8">Provenzale</a></li>
                    <li><a href="/prodotti_eventi.asp?eve=6">Estivo</a></li>
                    <li><a href="/prodotti_eventi.asp?eve=9">Autunno</a></li>
                </ul>
                <h4>Novit&aacute; e Offerte</h4>
                <ul>
                    <li><a href="novita.asp">Tutti gli ultimi arrivi</a></li>
                    <li><a href="offerte.asp">Offerte e promozioni</a></li>
                </ul>
            </div>
            <div class="col-md-3 menu-col">
                <h4>Riferimenti</h4>
                <ul>
                    <li><a href="contatti.asp">Contatti</a></li>
                    <!--<li><a>Chi siamo</a></li>-->
                </ul>
                <h4>Area Clienti</h4>
                <ul>
                    <li><a>Iscriviti/Accedi</a></li>
                    <!--<li><a>Lista dei desideri</a></li>-->
                    <li><a>Dicono noi</a></li>
                    <li><a>Area Clienti</a></li>
                </ul>
                <h4>Note legali</h4>
                <ul>
                    <li><a href="condizioni-di-vendita.asp">Condizioni di vendita</a></li>
                    <li><a href="privacy.asp">Privacy e note legali</a></li>
                </ul>
            </div>

            <div class="col-md-3 menu-col">
                <h4>Spedizioni</h4>
                <ul class="checklist">
                    <li>Spedizioni GRATUITE in tutta Italia per ordini superiori a 100&euro;</li>
                </ul>
                <br />
                <h4>Pagamenti accettati</h4>
                <ul class="checklist">
                    <li>Bonifico Bancario - PostePay</li>
                    <li>Contrassegno</li>
                    <li>Carte di credito - Prepagate - PayPal</li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<div class="floating-links">

</div>
<span id="top-link-block" class="hidden">
    <a href="#top" class="well well-sm"  onclick="$('html,body').animate({scrollTop:0},'slow');return false;">
        <i class="glyphicon glyphicon-chevron-up"></i> Back to Top
    </a>
</span>
<!-- /top-link-block -->
<!-- fine finestra modale -->

<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="javascripts/bootstrap.js"></script>
<script src="javascripts/holder.js"></script>
<script src="javascripts/readmore.js"></script>
<script src="javascripts/jquery.fancybox.js"></script>
<script src="javascripts/custom.js"></script>


<%if pkid_prod>0 then%>

  <%if Stato_Prod=2 or (TotalePezzi=0 and Varianti="no") then%>
  <SCRIPT language="JavaScript">
    function verifica_request() {

    email=document.requestform.email.value;

    if (email==""){
      alert("Non  e\' stato compilato il campo \"Email\".");
      return false;
    }
    if (email.indexOf("@")==-1 || email.indexOf(".")==-1){
    alert("ATTENZIONE! \"e-mail\" non valida.");
    return false;
    }

      else

        document.requestform.method = "post";
        document.requestform.action = "<%=toUrl_completo%>?pkid_prod=<%=pkid_prod%>";
        document.requestform.submit();
    }

  </SCRIPT>
  <%if ric=1 then%>
    <div style="display: none; max-width: 800px;" id="hidden-content">
    <h4>Richiesta informazioni e disponibilit&agrave; per<br /><b><%=Titolo_Prod%></b><br />Codice prodotto: <%=Codice_Prod%></h4>
    <p><strong>La richiesta &egrave; stata inoltrata correttamente, il nostro staff ti contatter&agrave; il prima possibile.<br />Saluti da DecorAndFlowers.it</strong></p>
  <%else%>
    <div style="display: none; max-width: 800px;" id="hidden-content">
        <h4>Richiesta informazioni e disponibilit&agrave; per<br /><b><%=Titolo_Prod%></b><br />Codice prodotto: <%=Codice_Prod%></h4>

        <p class="description">Per richiedere informazioni, disponibilit&agrave; o un preventivo del prodotto riempi il seguente modulo, oppure contattaci direttamente, indicando eventualmente le varianti a cui fai riferimento.</p>
        <form class="form-horizontal" name="requestform" id="requestform" onSubmit="return verifica_request();">
        <input type="hidden" name="ric" value="1" />
            <div class="form-group">
                <label for="nome" class="col-sm-4 control-label">Nome</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="nome" name="nome">
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-4 control-label">Indirizzo Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" id="email" name="email">
                </div>
            </div>
            <div class="form-group">
                <label for="telefono" class="col-sm-4 control-label">Telefono</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="telefono" name="telefono">
                </div>
            </div>
            <div class="form-group">
                <label for="richiesta" class="col-sm-4 control-label">Dettagli richiesta</label>
                <div class="col-sm-8">
                    <textarea class="form-control" name="richesta"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-8">
                    <button type="submit" id="diocane" class="btn btn-danger">invia richiesta</button>
                </div>
            </div>
        </form>
    </div>
  <%end if%>
  <script>
      <% if ric=1 then %>
      $(document).ready(function() {
          $(".launch").fancybox().trigger('click');
      });
      <% end if %>
  </script>
  <%end if%>

  <%
  Set var_rs=Server.CreateObject("ADODB.Recordset")
  sql = "SELECT * "
  sql = sql + "FROM Prodotti_Figli WHERE FkProdotto_Madre="&pkid_prod&" AND Pezzi=0 "
  sql = sql + "ORDER BY Titolo ASC"
  var_rs.Open sql, conn, 1, 1
  if var_rs.recordcount>0 then
  Do while not var_rs.EOF
  pkid_prodotto_figlio=var_rs("PkId")
  %>
  <SCRIPT language="JavaScript">
    function verifica_request_<%=pkid_prodotto_figlio%>() {

    email=document.requestform_<%=pkid_prodotto_figlio%>.email.value;

    if (email==""){
      alert("Non  e\' stato compilato il campo \"Email\".");
      return false;
    }
    if (email.indexOf("@")==-1 || email.indexOf(".")==-1){
    alert("ATTENZIONE! \"e-mail\" non valida.");
    return false;
    }

      else

        document.requestform_<%=pkid_prodotto_figlio%>.method = "post";
        document.requestform_<%=pkid_prodotto_figlio%>.action = "<%=toUrl_completo%>?pkid_prod=<%=pkid_prod%>";
        document.requestform_<%=pkid_prodotto_figlio%>.submit();
    }

  </SCRIPT>
  <%if ric=1 and pkid_prodotto_figlio=pkid_prodotto_figlio_email then%>
    <div style="display: none; max-width: 800px;" id="hidden-response-<%=pkid_prodotto_figlio%>">
    <h4>Richiesta informazioni e disponibilit&agrave; per<br /><b><%=Titolo_Prod%></b><br />Codice prodotto: <%=Codice_Prod%> - Variante: <%=var_rs("Codice")%></h4>
    <p><strong>La richiesta &egrave; stata inoltrata correttamente, il nostro staff ti contatter&agrave; il prima possibile.<br />Saluti da DecorAndFlowers.it</strong></p>
  <%else%>
    <div style="display: none; max-width: 800px;" id="hidden-content-<%=pkid_prodotto_figlio%>">
        <h4>Richiesta informazioni e disponibilit&agrave; per<br /><b><%=Titolo_Prod%></b><br />Codice prodotto: <%=Codice_Prod%> - Variante: <%=var_rs("Codice")%></h4>

        <p class="description">Per richiedere informazioni, disponibilit&agrave; o un preventivo del prodotto riempi il seguente modulo, oppure contattaci direttamente, indicando eventualmente le varianti a cui fai riferimento.</p>
        <form class="form-horizontal" name="requestform_<%=pkid_prodotto_figlio%>" id="requestform_<%=pkid_prodotto_figlio%>" onSubmit="return verifica_request_<%=pkid_prodotto_figlio%>();">
        <input type="hidden" name="ric" value="1" />
        <input type="hidden" name="pkid_prodotto_figlio_email" value="<%=pkid_prodotto_figlio%>" />
            <div class="form-group">
                <label for="nome" class="col-sm-4 control-label">Nome</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="nome" name="nome">
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-4 control-label">Indirizzo Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" id="email" name="email">
                </div>
            </div>
            <div class="form-group">
                <label for="telefono" class="col-sm-4 control-label">Telefono</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="telefono" name="telefono">
                </div>
            </div>
            <div class="form-group">
                <label for="richiesta" class="col-sm-4 control-label">Dettagli richiesta</label>
                <div class="col-sm-8">
                    <textarea class="form-control" name="richesta"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-8">
                    <button type="submit" id="diocane" class="btn btn-danger">invia richiesta</button>
                </div>
            </div>
        </form>
    </div>
  <%end if%>
  <script>
      <% if ric=1 and pkid_prodotto_figlio=pkid_prodotto_figlio_email then %>
      $(document).ready(function() {
          $(".launch_<%=pkid_prodotto_figlio%>").fancybox().trigger('click');
      });
      <% end if %>
  </script>
  <%
  var_rs.movenext
  loop
  end if
  var_rs.close
  %>

<%end if%>
