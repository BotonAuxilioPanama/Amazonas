<%@ Language="VBScript" %>


<!-- #include file = "db/conectar.asp"-->
<!-- #include file = "asp/libreria.asp"-->


<%
dim cant
cant = INT(request.QueryString("cant"))
dim comp
comp = CInt(Request.QueryString("Comp"))


dim arrselect()
redim arrselect(cant)
dim id()
redim id(cant)
dim id2()
redim id2(cant)
dim censo()
redim censo(cant)
dim centinela
centinela = 0


for t = 1 to cant step 1
	arrselect(t)= "amazona"&t
next

for w = 1 to cant step 1
	id(w) = CINT(request.Form(arrselect(w)))
next

for q = 1 to cant step 1
	id2(q) = id(q)
	censo(q) = 0
next

for y = 1 to cant step 1 
	for z = 1 to cant step 1
		if id(y) = id2(z) then
			censo(y) = censo(y) + 1
		end if
	next
next

for x = 1 to cant step 1 
	if censo(x) > 1 then
		centinela = 1
	end if
next

if centinela = 0 then 
	for g = 1 to cant step 1
		guardarOrden id(g),g
	next

	response.redirect("PagResultado.asp?res=1&Op=3&Comp="&comp ) 
else
	response.redirect("PagResultado.asp?res=2&Op=3" )
end if

%>





