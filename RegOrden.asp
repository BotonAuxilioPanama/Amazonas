<!DOCTYPE html>
<html lang = "es">
<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "db/conectar.asp"-->

<%

dim comp
dim paginaTit
comp = CInt(Request.QueryString("Comp"))


Select Case comp
Case 1
paginaTit = "Nacional"
Case 2
paginaTit = "Internacional"
Case Else
paginaTit = "Desconocido"
End Select

%>
<head>
  <title>Orden de Recorrido </title>

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
        <h1 >Encuentro de Amazonas 2014 <br> <small>Feria de Sona, Veraguas </small></h1>
        <h3 >Registrar Orden de Recorrido</h3> 
        <h3 >Para Competencia <%=paginaTit%></h3>
      </header>
      

       <section class="col-md-12">
        <form class="form-horizontal col-md-10 col-md-offset-2" role="form">

         <div class="form-group" >
                <label for="amazona1" class="col-md-2 control-label">#1</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona1">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>
            
         <div class="form-group" >
                <label for="amazona2" class="col-md-2 control-label">#2</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona2">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>

               <div class="form-group" >
                <label for="amazona3" class="col-md-2 control-label">#3</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona3">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>


               <div class="form-group" >
                <label for="amazona4" class="col-md-2 control-label">#4</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona4">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>

              </div> <div class="form-group" >
                <label for="amazona5" class="col-md-2 control-label">#5</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona5">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>

               <div class="form-group" >
                <label for="amazona6" class="col-md-2 control-label">#6</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona6">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>

               <div class="form-group" >
                <label for="amazona7" class="col-md-2 control-label">#7</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona7">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>


               <div class="form-group" >
                <label for="amazona8" class="col-md-2 control-label">#8</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona8">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>


               <div class="form-group" >
                <label for="amazona9" class="col-md-2 control-label">#9</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona9">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>

               <div class="form-group" >
                <label for="amazona10" class="col-md-2 control-label">#10</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona10">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>

               <div class="form-group" >
                <label for="amazona11" class="col-md-2 control-label">#11</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona11">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>


               <div class="form-group" >
                <label for="amazona12" class="col-md-2 control-label">#12</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona12">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>

               <div class="form-group" >
                <label for="amazona13" class="col-md-2 control-label">#13</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona13">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>

               <div class="form-group" >
                <label for="amazona14" class="col-md-2 control-label">#14</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona14">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>

               <div class="form-group" >
                <label for="amazona15" class="col-md-2 control-label">#15</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona15">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>


               <div class="form-group" >
                <label for="amazona16" class="col-md-2 control-label">#16</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona16">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>


               <div class="form-group" >
                <label for="amazona17" class="col-md-2 control-label">#17</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona17">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>

               <div class="form-group" >
                <label for="amazona18" class="col-md-2 control-label">#18</label>
                <div class="col-md-6">
                  <select class="form-control" id="amazona18">
                    <option>Ivette Sanjur</option>
                    <option>Lucia Canto</option>
                    <option>Maria Abrego</option>
                    <option>Ambar Ruiz</option>
                    <option>Melisa Delgado</option>
                  </select>
                </div>
              </div>
             <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                  <button type="submit" class="btn btn-primary">
                     <span class=" glyphicon glyphicon-floppy-save"></span>
                  Guardar
                  </button>
                </div>
              </div>


            

        </form>
      </section>


     
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