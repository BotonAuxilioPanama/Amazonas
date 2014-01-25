<%
'--------------------------------------------------------------------------
'         Inclusión del Archivo de Base de Datos
'--------------------------------------------------------------------------
%>
<!-- #include file = "asp/libreria.asp"-->
<!-- #include file = "db/conectar.asp"-->
<%
cabecera "Prueba de Plantilla", "Hola que ase"


%>
<div class="jumbotron">
  <h1>Hello, world!  <%= Session("User") %></h1>
  <p>.Cupcake ipsum dolor sit amet. Powder bonbon croissant halvah carrot cake cotton candy bear claw chocolate cake. Wafer sweet roll sweet roll wafer carrot cake croissant oat cake soufflé biscuit.
Topping apple pie cookie danish lollipop muffin. Chocolate cake apple pie bonbon icing cookie icing candy caramels. Gingerbread toffee soufflé bonbon brownie candy tootsie roll. Marshmallow dragée lemon drops jelly-o toffee gummi bears marzipan pastry tootsie roll.</p>
  <p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p>
</div>
<%
piePag()
%>




