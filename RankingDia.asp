
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->

<%

dim dia
dim mes 
dim anio
dim fecha
dim fechaSQL
dia = CInt(Request.QueryString("d"))
mes = CInt(Request.QueryString("m"))
anio = CInt(Request.QueryString("a"))

fecha = dia&"/"&mes&"/"&anio
fechaSQL =  mes&"/"&dia&"/"&anio

cabecera "Resultados Por Competencias Diarios", ""
%>

        <div class="row"> 
            <section class="col-md-6 col-xs-12">
              <h2>Competencia Nacional</h2>

             
             <article class="table-responsive col-md-6 col-md-offset-2 col-xs-12">
              <h3>Mejor Tiempo Individual</h3>
              <h3> <%=FormatDateTime(fecha,1) %></h3>
             
                          <%MejorTiempoDia(fechaSQL)%>
          

             
           </article>

           
       </section>


       <section class="col-md-6 col-xs-12">
        <h2>Competencia Internacional</h2>

        

       <article class="table-responsive col-md-6 col-md-offset-2 col-xs-12">
        <h3>Mejor Tiempo Individual</h3>
        

           <%MejorTiempoDiaInter(fechaSQL)%>

       
     </article>

    
 </section>
</div>
<%
piePag()
%>