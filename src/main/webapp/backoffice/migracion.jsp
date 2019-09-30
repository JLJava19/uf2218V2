<%@page import="com.ipartek.formacion.controller.listener.UsuariosLogeadosListener"%>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%> 
<%@include file="../includes/mensaje.jsp"%>


<h1>Migración</h1>
 
 
 <div>Lineas leidas: ${lineasLeidas}</div>
 <div>Lineas insertadas: ${lineasInsertadas}</div>
 <div>Lineas erroneas: ${lineasErroneas}</div>
  <div>Tiempo: ${tiempo} ms</div>
 


<%@include file="../includes/footer.jsp"%>