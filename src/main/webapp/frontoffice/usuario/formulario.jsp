<%@page import="com.ipartek.formacion.controller.frontoffice.MisDatosController"%>

<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>

	<h1>Detalle Usuario</h1>

	<div class="row">
		<div class="col">
		
			<%@include file="../../includes/mensaje.jsp"%>
			
			<form action="frontoffice/usuario" method="post" class="mb-2">
			
				<input type="hidden" name="op" value="<%=MisDatosController.OP_GUARDAR%>">
			

				
				<div class="form-group">
					<label for="nombre">Nombre:</label>
					<input type="text" name="nombre" value="${usuarioEditar.nombre}"
					       placeholder="M�nimio 3 m�ximo 150"
					       class="form-control" readonly>
				</div>
				
				<div class="form-group">
					<label for="contrasenya">Password:</label>
					<input type="password" name="contrasenya" value="${usuarioEditar.contrasenya}"					      
						   class="form-control">
				</div>	
				
				<div class="form-group">
					<label for="newPass1">Nuevo Password:</label>
					<input type="password" name="newPass1" value=""					      
						   class="form-control">
				</div>
				
				<div class="form-group">
					<label for="newPass2">Nuevo Password:</label>
					<input type="password" name="newPass2" value=""					      
						   class="form-control">
				</div>
				
				<div class="form-group">
					<label for="fecha_creacion">Fecha Creacion:</label>
					<fmt:formatDate value="${usuarioEditar.fechaCreacion}" var="fecha1"  pattern="dd-MM-yyyy HH:mm:ss" />
					<input type="text" name="fecha_creacion" value="${fecha1}" class="form-control" disabled>
				</div>	
					
			
				<input type="submit" value="${(usuarioEditar.id != -1)?'Modificar Password':'Crear'}" class="btn btn-outline-primary  btn-block">
			
			</form>
			
			<c:if test="${usuarioEditar.id != -1}">
			
				
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-outline-danger btn-block" data-toggle="modal" data-target="#exampleModal">
				  Dar de baja
				</button>
		
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">�Estas Seguro de dar de BAJA el usuario?</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <p>Cuidado porque operaci�n no es reversible</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        	<form action="frontoffice/usuario" method="post">	
							<input type="hidden" name="op" value="<%=MisDatosController.OP_ELIMINAR%>">			
							<input type="submit" value="Darse de baja" class="btn btn-danger btn-block">	
						</form>
				      </div>
				    </div>
				  </div>
				</div>
				
				
			</c:if>	
			
			
			
		</div>
		
	</div>
	
<%@include file="../../includes/footer.jsp"%>