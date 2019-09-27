<%@page import="com.ipartek.formacion.controller.listener.UsuariosLogeadosListener"%>
<%@page import="com.ipartek.formacion.controller.frontoffice.MisDatosController"%>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%> 
<%@include file="../includes/mensaje.jsp"%>


<h1>FRONTOFFICE de ${usuario.nombre}</h1>
 
<div class="row">
    <div class="col-xl-3 col-sm-6 mb-3">
      <div class="card text-white bg-primary o-hidden h-100">
        <div class="card-body">
          <div class="card-body-icon">
            <i class="fab fa-youtube"></i>
          </div>
          <div class="mr-5">${numeroVideos} videos</div>
        </div>
        <a class="card-footer text-white clearfix small z-1" href="frontoffice/videos">
          <span class="float-left">Ver Videos</span>
          <span class="float-right">
            <i class="fas fa-angle-right"></i>
          </span>
        </a>
      </div>
    </div>
    
    <div class="col-xl-3 col-sm-6 mb-3">
      <div class="card text-white bg-warning o-hidden h-100">
        <div class="card-body">
          <div class="card-body-icon">
           	<i class="fas fa-users"></i>
          </div>
          <div class="mr-5">${usuario.nombre}</div>
        </div>
        <a class="card-footer text-white clearfix small z-1" href="frontoffice/usuario?op=<%=MisDatosController.OP_DETALLE%>&id=${id=usuario.id}">
          <span class="float-left">Modificar datos</span>
          <span class="float-right">
            <i class="fas fa-angle-right"></i>
          </span>
        </a>
      </div>
    </div>
    
    <div class="col-xl-3 col-sm-6 mb-3">
      <div class="card text-white bg-success o-hidden h-100">
        <div class="card-body">
          <div class="card-body-icon">
            <i class="fas fa-heart"></i>
          </div>
          <div class="mr-5">Has recibido ${likes} likes.</div>
        </div>
        
      </div>
    </div>
   
   
   
   
   
 </div>





<%@include file="../includes/footer.jsp"%>


