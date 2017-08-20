<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="page-header position-relative">
		<h1>Recursos</h1>
	</div>
	<div class="row-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="span10"></div>
				<div class="span2">
					<a id="btnAgregarRecursos" href="#modal-Recurso" role="button" class="btn btn-small btn-primary" data-toggle="modal">
						<i class="icon-plus"></i>Agregar 
					</a>
				</div>
			</div>
		</div>
		<br>
		<div class="row-fluid">
			<div class="table-header">Lista de Recursos</div>
			<table id="tablaRecursosProyecto" class="table table-striped table-bordered table-hover" style="width: 100%;">
				<thead>
					<tr>
						<th>Nombre y Apellidos</th>
						<th>Perfil</th>
						<th>Celular</th>
						<th>Estado</th>
						<th>Opciones</th>
						
						<th>tipoDocumento</th>
						<th>NroDocumento</th>
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>IdPerfil</th>
						<th>Direccion</th>
						<th>RSFacebook</th>
						<th>RSTwitter</th>
						<th>RSLinkedin</th>
						<th>RSGmail</th>
						<th>Correo</th>
						<th>PerfilProfesional</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<!-- [INI] MODAL RECURSO-->
	<form id="registrarRecurso">
		<div id="modal-Recurso" class="modal hide" tabindex="-1">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">Registro de Recursos</h4>
			</div>
			<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
				<input type="hidden" id="idPersona" name="id" />
				<div class="row-fluid">
					<div class="span6">
						<div class="control-group row-fluid">
							<div class="control-label span4">Tipo Documento:</div>
							<div class="span8">
								<select class="span12" id="idTipoDocumento" name="idTipoDocumento">
									<option value="">Seleccionar</option>
									<c:forEach var="lista" items="${model.listaTipoDocumento}" varStatus="contador">
									   <option value="${lista.id}">${lista.descripcion}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="span6">				
						<div class="control-group row-fluid">
							<div class="control-label span4">Nro. Documento:</div>
							<div class="span8">
								<input class="span12" id="nroDocumento" name="nroDocumento" type="text" />
							</div>
						</div>
					</div>
				</div>
				<div class="control-group row-fluid">
					<div class="control-label span2">Nombres:</div>
					<div class="span10"><input type="text" class="span12" id="nombresRecurso" name="nombres"/></div>
				</div>
				<div class="control-group row-fluid">
					<div class="control-label span2">Apellidos:</div>
					<div class="span10"><input type="text" class="span12" id="apellidosRecurso" name="apellidos"/></div>
				</div>	
				<div class="row-fluid">
					<div class="span6">
						<div class="control-group row-fluid">
							<div class="control-label span4">Celular:</div>
							<div class="span8"><input type="text" class="span12" id="celularRecurso" name="celular"/></div>
						</div>
					</div>
					<div class="span6">
						<div class="control-group row-fluid">
							<div class="control-label span4">Perfil:</div>
							<div class="span8">
								<select class="span12" id="idPerfilRecurso" name="idTipoCargo">
									<option value="">Seleccionar</option>
									<c:forEach var="lista" items="${model.listaTipoCargo}" varStatus="contador">
									   <option value="${lista.id}">${lista.nombreRol}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</div>	
				<div class="control-group row-fluid">
					<div class="control-label span2">Direcci&oacute;n:</div>
					<div class="span10"><input type="text" class="span12" id="direccionRecurso" name="direccion"/></div>
				</div>				
				<div class="row-fluid">
					<div class="span2">Redes Sociales</div>
					<div class="control-group span5">
						<span class="span12 input-icon input-icon-left">
							<input type="text" class="span12" id="twitterRecurso" name="twitterRecurso"/>
							<i class="icon-twitter-sign blue"></i>
						</span>
					</div>
					<div class="control-group span5">
						<span class="span12 input-icon input-icon-left">
							<input type="text" class="span12" id="facebookRecurso" name="facebookRecurso"/>
							<i class="icon-facebook-sign blue"></i>
						</span>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span2"></div>
					<div class="control-group span5">
						<span class="span12 input-icon input-icon-left">
							<input type="text" class="span12" id="linkedinRecurso" name="linkedinRecurso"/>
							<i class="icon-linkedin-sign blue"></i>
						</span>
					</div>
					<div class="control-group span5">
						<span class="span12 input-icon input-icon-left">
							<input type="text" class="span12" id="gmailRecurso" name="gmailRecurso"/>
							<i class="icon-google-plus-sign blue"></i>
						</span>
					</div>
				</div>
				<div class="control-group row-fluid">
					<div class="span12">
						<div class="control-group row-fluid">
							<div class="control-label span2">Correo:</div>
							<div class="span10">
							  <input type="text" class="span12" id="correoRecurso" name="correo" />
							</div>
						</div>
					</div>
				</div>	
				<div class="row-fluid">
					<div class="span6">
						<div class="control-group row-fluid">
							<div class="control-label span4">Estado:</div>
							<div class="span8">
								<select id="estadoRecurso" name="estado">
									<option value="">Seleccionar</option>
									<option value="1">ACTIVO</option>
									<option value="0">INACTIVO</option>
								</select> 
							</div>
						</div>
					</div>
					<div class="span6">
						<div class="control-group row-fluid">
						</div>
					</div>
				</div>	
				<div class="control-group row-fluid">
					<div class="control-label span2">Perfil Profesional:</div>
					<div class="span10"><textarea rows="5" class="span12" id="perfilRecurso" name="dscperfil"></textarea></div>
				</div>	
			</div>
			<div class="modal-footer">
				<button class="btn btn-small" data-dismiss="modal">
					<i class="icon-remove"></i>
					Cancelar
				</button>
	
				<button class="btn btn-small btn-primary" type="submit">
					<i class="icon-save"></i>
					Guardar
				</button>
			</div>
		</div>
	</form>
	<!-- [FIN] MODAL RECURSO -->
</div>