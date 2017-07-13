<div class="col-md-3 hidden-xs">
    <div class="row">
        <!-- <h4>RICERCA PER CATEGORIE</h4> -->
        <div class="panel-group" id="accordion">
          <%
          Set cat_rs=Server.CreateObject("ADODB.Recordset")
          sql = "SELECT * "
          sql = sql + "FROM Categorie_1 "
          sql = sql + "ORDER BY Posizione ASC, Titolo_1 ASC"
          cat_rs.Open sql, conn, 1, 1
          if cat_rs.recordcount>0 then
            Do While Not cat_rs.EOF
            Pkid_Cat_1_menu=cat_rs("Pkid")
            Titolo_1_Cat_1_menu=cat_rs("Titolo_1")

            Set sot_rs=Server.CreateObject("ADODB.Recordset")
            sql = "SELECT * "
            sql = sql + "FROM Categorie_2 "
            sql = sql + "WHERE FkCategoria_1="&Pkid_Cat_1_menu&""
            sql = sql + "ORDER BY Posizione ASC, Titolo_1 ASC"
            sot_rs.Open sql, conn, 1, 1
          %>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="prodotti.asp?cat_1=<%=Pkid_Cat_1_menu%>" class="panel-title"><%=Titolo_1_Cat_1_menu%></a>
                    <%if sot_rs.recordcount>0 then%><span class="expand-accordion" data-toggle="collapse" data-parent="#accordion" href="#collapse<%=Pkid_Cat_1_menu%>"><span class="caret"></span></span><%end if%>
                </div>
                <%
                if sot_rs.recordcount>0 then
                %>
                <div id="collapse<%=Pkid_Cat_1_menu%>" class="panel-collapse collapse">
                    <div class="list-group">
                        <%
                        Do While Not sot_rs.EOF
                        Pkid_Cat_2_menu=sot_rs("Pkid")
                        Titolo_1_Cat_2_menu=sot_rs("Titolo_1")
                        %>
                        <a href="prodotti.asp?cat_2=<%=Pkid_Cat_2_menu%>" class="list-group-item" id="<%=Pkid_Cat_2_menu%>" title="<%=Titolo_1_Cat_2_menu%>"><%=Titolo_1_Cat_2_menu%></a>
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
            Pkid_Eve_menu=eve_rs("Pkid")
            Titolo_1_Eve_menu=eve_rs("Titolo_1")
            %>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="#" class="panel-title" title="<%=Titolo_1_Eve_menu%>"><%=Titolo_1_Eve_menu%></a>
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
