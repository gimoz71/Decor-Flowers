<div class="row hidden-xs">
    <div class="col-md-12 clearfix">
        <div id="slider">
          <%
          Set pps=Server.CreateObject("ADODB.Recordset")
          sql = "SELECT * FROM Immagini WHERE FkContenuto=1 and Tabella='slider' ORDER BY Posizione ASC"
          pps.Open sql, conn, 1, 1
          if pps.recordcount>0 then
            Do while not pps.EOF
          %>
            <div data-src="/public/<%=pps("File")%>"></div>
          <%
            pps.movenext
            loop
          end if
          pps.close
          %>
        </div>
    </div>
</div>
