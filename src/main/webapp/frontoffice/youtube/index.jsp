<%@page import="com.ipartek.formacion.controller.frontoffice.MisDatosController"%>
<%@page import="com.ipartek.formacion.controller.frontoffice.MisVideosController"%>

<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>

		
	<%@include file="../../includes/mensaje.jsp"%>
			
	
	<a href="frontoffice/videos?op=<%=VideoController.OP_NUEVO%>" class="mt-3 mb-3 btn btn-outline-primary btn-block">Nuevo Video</a>
	
	
	<div class="row">
	
		${mensaje }
	
		<div class="col">
			<h1>Videos Publicados</h1>
			<ul class="list-group">
	  			<c:forEach items="${videosVisibles}" var="v" >	  
  				  	<li class="list-group-item">
				  		<a href="frontoffice/videos?op=<%=VideoController.OP_DETALLE%>&id=${v.id}">
				  			<img class="float-left mr-3" src="https://img.youtube.com/vi/${v.codigo}/default.jpg" alt="Imagen destacda del video ${v.nombre}"/>
				  			<p class="h3 text-justify">${v.nombre}</p>
				  		</a>
				  		 <!-- PONEMOS AQUI LO Q HE CORTADO -->
				  							  			
				  		<p><i class="fas fa-tag mr-1"></i>${v.categoria.nombre}</p>
				  		<c:if test="${v.likes != 0 }">
							<span><i class="fas fa-heart mr-1"></i>${v.likes } Likes</span>
						</c:if>
						<c:if test="${v.likes == 0 }">
							<span><i class="far fa-heart mr-1"></i>${v.likes } Likes</span>	
						</c:if>				  		
				  	</li>					
		  	  
				</c:forEach>
			</ul>		
		</div>
		
		
	</div>
	
	
<%@include file="../../includes/footer.jsp"%>