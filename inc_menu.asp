<div class="col-md-3 hidden-xs">
    <div class="row top-buffer">
        <h4>RICERCA PER CATEGORIE</h4>
        <div class="panel-group" id="accordion">
          <%
          Set cat_rs=Server.CreateObject("ADODB.Recordset")
          sql = "SELECT * "
          sql = sql + "FROM Categorie_1 "
          sql = sql + "ORDER BY Posizione ASC, Titolo_1 ASC"
          cat_rs.Open sql, conn, 1, 1
          if cat_rs.recordcount>0 then
            Do While Not cat_rs.EOF
            Pkid_Cat_1=cat_rs("Pkid")
            Titolo_1_Cat_1=cat_rs("Titolo_1")

            Set sot_rs=Server.CreateObject("ADODB.Recordset")
            sql = "SELECT * "
            sql = sql + "FROM Categorie_2 "
            sql = sql + "WHERE FkCategoria_1="&Pkid_Cat_1&""
            sql = sql + "ORDER BY Posizione ASC, Titolo_1 ASC"
            sot_rs.Open sql, conn, 1, 1
          %>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="#" class="panel-title"><%=Titolo_1_Cat_1%></a>
                    <%if sot_rs.recordcount>0 then%><span class="expand-accordion" data-toggle="collapse" data-parent="#accordion" href="#collapse<%=Pkid_Cat_1%>"><span class="caret"></span></span><%end if%>
                </div>
                <%
                if sot_rs.recordcount>0 then
                %>
                <div id="collapse<%=Pkid_Cat_1%>" class="panel-collapse collapse">
                    <div class="list-group">
                        <%
                        Do While Not sot_rs.EOF
                        Pkid_Cat_2=sot_rs("Pkid")
                        Titolo_1_Cat_2=sot_rs("Titolo_1")
                        %>
                        <a href="#" class="list-group-item" title="<%=Titolo_1_Cat_2%>"><%=Titolo_1_Cat_2%></a>
                        <%
                        sot_rs.movenext
                        loop
                        %>
                    </div>
                </div>
                <%
                end if
                %>
            </div>
          <%
            sot_rs.close

            cat_rs.movenext
            loop
          end if
          cat_rs.close
          %>
        </div>
        <%
        Set eve_rs=Server.CreateObject("ADODB.Recordset")
        sql = "SELECT * "
        sql = sql + "FROM Eventi "
        sql = sql + "ORDER BY Posizione ASC, Titolo_1 ASC"
        eve_rs.Open sql, conn, 1, 1
        if eve_rs.recordcount>0 then


        %>
        <div class="panel-group top-buffer" id="accordion">
            <h4>RICERCA PER EVENTI</h4>
            <%
            Do While Not eve_rs.EOF
            Pkid_Eve=eve_rs("Pkid")
            Titolo_1_Eve=eve_rs("Titolo_1")
            %>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="#" class="panel-title" title="<%=Titolo_1_Eve%>"><%=Titolo_1_Eve%></a>
                </div>
            </div>
            <%
            eve_rs.movenext
            loop
            %>
        </div>
        <%
        end if
        cat_rs.close
        %>
    </div>
</div>
