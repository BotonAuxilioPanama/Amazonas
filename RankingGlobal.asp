<!DOCTYPE html>
<html lang = "es">
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->

<%
existe_sesion
%>
<head>
<title>Ranking Global </title>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Login del Sistema">
  <meta name="author" content="@jockrlos22">


  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/estilos.css" rel="stylesheet">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
      <![endif]-->
    </head>
    <body>

      <div id="wrap">
        <div class="container">

          <header class="page-header">
            <h1>Encuentro de Amazonas 2014 <br> <small>Feria de Sona, Veraguas</small></h1>
            <h3>Resultados Por Competencias Globales</h3> 
          </header>

        <div class="row"> 
            <section class="col-md-6 col-xs-12">
              <h2>Competencia Nacional</h2>

              <article class="table-responsive col-md-6 col-md-offset-3 col-xs-12">
                <h3>Mejor Promedio Individual</h3>
               
                  
                  <%PromedioInd(1)%>
                  
              
             </article>

             <article class="table-responsive col-md-6 col-md-offset-3 col-xs-12">
              <h3>Mejor Tiempo Individual</h3>
             

              <%TiempoInd(1)%>

             
           </article>

           <article class="table-responsive col-md-6  col-md-offset-3 col-xs-12">
            <h3>Mejor Equipo</h3>
           




            <%RankingEquipo(1)%>




           
         </article>
       </section>


       <section class="col-md-6 col-xs-12">
        <h2>Competencia Internacional</h2>

        <article class="table-responsive col-md-6 col-md-offset-3 col-xs-12">
          <h3>Mejor Promedio Individual</h3>
        

           <%PromedioInd(2)%>

        
       </article>

       <article class="table-responsive col-md-6 col-md-offset-3 col-xs-12">
        <h3>Mejor Tiempo Individual</h3>
        

           <%TiempoInd(2)%>

       
     </article>

     <article class="table-responsive col-md-6  col-md-offset-3 col-xs-12">
      <h3>Mejor Equipo</h3>
     

          <% RankingEquipo(2)%>

     
   </article>
 </section>
</div>
</div>
</div>

<footer id="footer">
 <div class="container">
   <p class="text-muted"><span class="glyphicon glyphicon-copyright-mark"> </span>Club de Amazonas de Veraguas 2014</p>
 </div>
</footer>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>