<%@page import="com.ipartek.formacion.controller.listener.UsuariosLogeadosListener"%>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%> 
<%@include file="../includes/mensaje.jsp"%>


<h1>Resultado Migracion</h1>
 
<div class="">
	
		<p>Lineas Leidas <b>${lineasLeidas}</b></p>
		<p>Lineas Insertadas <b>${lineasInsertadas}</b></p>
		<p>Lineas Erroneas <b>${lineasErroneas}</b></p>
		<p>Tiempo <b>${tiempo}</b> ms</p>   
   
</div>





<%@include file="../includes/footer.jsp"%>