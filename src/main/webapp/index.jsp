<%@page import="com.ipartek.formacion.controller.publico.PublicController"%>
<%@include file="includes/header.jsp"%>
<%@include file="includes/navbar.jsp"%> 
<%@include file="includes/mensaje.jsp"%>


<h1>BIENVENIDO</h1>
 
<div class="row">
	<div class="col-8">
		
		<c:if test="${ empty videosInicial }">
			${mensaje }
		</c:if>
		
		<c:if test="${not empty videosInicial }">
			<h2>Listado de v�deos ordenados por likes.</h2>
			<ul class="list-group">
				<c:forEach items="${videosInicial}" var="v" >	  
					<li class="list-group-item">
						<a href="public/inicio?op=<%=PublicController.OP_DETALLE%>&id=${v.id}">
							<img class="float-left mr-3" src="https://img.youtube.com/vi/${v.codigo}/default.jpg" alt="Imagen destacda del video ${v.nombre}"/>
							<p class="h3">${v.nombre}</p>
						</a>
						
						<span><i class="fas fa-user mr-1"></i>${v.usuario.nombre}</span>			  			
						<span><i class="fas fa-tag mr-1"></i>${v.categoria.nombre}</span>
						
						<c:if test="${v.likes != 0 }">
							<span><a href="likes?id=${v.id}"><i class="fas fa-heart mr-1"></i></a>${v.likes } Likes</span>
						</c:if>
						<c:if test="${v.likes == 0 }">
							<span><a href="likes?id=${v.id}"><i class="fas fa-heart mr-1"></i></a>${v.likes } Likes</span>		
						</c:if>
						
					</li>					
				</c:forEach>
			</ul>
		</c:if>
				
	</div>
	
	<div class="col-4">
		<h2>BUSCAR V�DEO</h2>
			<form action="public/inicio" method="post">
				<div class="form-group">
					<label for="buscador">�Qu� buscas?</label>
					<input type="search" class="form-control" id="buscador" name="buscador" placeholder="Criterio de b�squeda">
				</div>
				<div class="form-group">
					<label for="opcionBuscar">Buscar por:</label>
					<select class="form-control" id="opcionBuscar" name="opcionBuscar">
						<option value="1">Nombre</option>
						<option value="2">Usuario</option>
					</select>					
				</div>
				<button type="submit" class="btn btn-primary btn-block">Filtrar</button>
				<a class="btn btn-primary btn-block" href="public/inicio">Limpiar Formulario</a>
			</form>
	</div>	
</div>



<%@include file="../includes/footer.jsp"%>