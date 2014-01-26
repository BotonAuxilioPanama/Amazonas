
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->

<%



dim op
dim pagina
op = CInt(Request.QueryString("Op"))


Select Case op
Case 1
pagina = "Registro.asp"
Case 2
pagina = "RegistroTiempo.asp"
Case 3
pagina = "RegOrden.asp"
Case 4
pagina = "TablaFecha.asp"
Case 5
pagina = "ListaRecorridos.asp"
Case 6
pagina = "VerOrdenRecorrido.asp"
Case 7
pagina = "TablaModal.asp"
Case Else
pagina = "Menu.asp"
End Select

cabecera "Seleccione la Competencia", ""

%>


          <section class="col-md-6 col-xs-12 col-md-offset-3">
            <a class="btn btn-primary btn-lg btn-block btn-lg" href="<%=pagina+"?Comp=1"%>" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            Competencia Nacional</a>
            

            <a class="btn btn-primary btn-lg btn-block btn-lg" href="<%=pagina+"?Comp=2"%>" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="justificar">Competencia Internacional</span></a>
          </section>

     <%
      piePag()
%>
