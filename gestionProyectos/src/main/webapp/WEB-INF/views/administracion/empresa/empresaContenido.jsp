<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="page-header position-relative">
		<h1>Empresa</h1>
	</div>
	<div class="row-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="span10"></div>
				<div class="span2">
					<a id="btnAgregarEmpresa" href="#modal-Empresa" role="button" class="btn btn-small btn-primary" data-toggle="modal">
						<i class="icon-plus"></i>Agregar 
					</a>
				</div>
			</div>
		</div>
		<br>
		<div class="row-fluid">
			<div class="table-header">Lista de Empresas</div>
			<table id="tablaEmpresaProyecto" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>Raz&oacute;n Social</th>
						<th>Pa&iacute;s</th>
						<th>Fecha de Registro</th>
						<th>Tel&eacute;fono</th>
						<th>Opciones</th>
					</tr>
				</thead>	
				<tbody>
					<c:forEach var="empresa" items="${model.listaEmpresa}" varStatus="contador">
						<tr>
							<td><c:out value="${empresa.razonSocial}"></c:out></td>
							<td><c:out value="${empresa.dscpais}"></c:out></td>
							<td><c:out value="${empresa.fechaRegistro}"></c:out></td>
							<td><c:out value="${empresa.telefono}"></c:out></td>
							<td class="td-actions">
								<!-- [INI] BOTON EDITAR -->
								<div class="hidden-phone visible-desktop action-buttons">
									<a class="blue tooltip-info" onclick="editarEmpresa('${empresa.idEmpresa}')" data-rel="tooltip" title="Editar">
										<i class="icon-edit bigger-130"></i>
									</a>
								</div>

								<div class="hidden-desktop visible-phone">
									<div class="inline position-relative">
										<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
											<i class="icon-caret-down icon-only bigger-120"></i>
										</button>

										<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
											<li>
												<a onclick="editarEmpresa('${empresa.idEmpresa}')" class="tooltip-info" data-rel="tooltip" title="Editar">
													<span class="blue">
														<i class="icon-edit bigger-120"></i>
													</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
								<!-- [FIN] BOTON EDITAR -->
							    <!-- [INI] ELIMINAR -->
								<div class="hidden-phone visible-desktop action-buttons">
									<a class="red tooltip-error" onclick="eliminarEmpresa('${empresa.idEmpresa}')" data-rel="tooltip" title="Eliminar">
										<i class="icon-trash bigger-130"> </i>
									</a>
								</div>

								<div class="hidden-desktop visible-phone">
									<div class="inline position-relative">
										<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
											<i class="icon-caret-down icon-only bigger-120"></i>
										</button>

										<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
											<li>
												<a class="tooltip-error" data-rel="tooltip" title="Eliminar" onclick="eliminarEmpresa('${empresa.idEmpresa}')" >
													<span class="red">
														<i class="icon-trash bigger-120"></i>
													</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
								<!-- [FIN] ELIMINAR -->
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- [INI] MODAL -->
	<form id="registrarEmpresa">
		<input type="hidden" id="idEmpresaModal" name="idEmpresa">
		<div id="modal-Empresa" class="modal hide" tabindex="-1">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">Registro Empresa</h4>
			</div>
			<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
				<div id="datosEmpresa" class="accordion">
					<div class="accordion-group">
						<div class="accordion-heading">
							<a href="#infoGeneral" data-parent="#datosEmpresa" data-toggle="collapse" class="accordion-toggle">
								Informaci&oacute;n General
							</a>
						</div>
	
						<div class="accordion-body in collapse" id="infoGeneral">
							<div class="accordion-inner">
								<div class="control-group row-fluid">
									<div class="control-label span3">Raz&oacute;n Social</div>
									<div class="span9"><input type="text" class="span12" id="razonSocialEmpresa" name="razonSocialEmpresa"/></div>
								</div>
								<div class="row-fluid">
									<div class="span6">
										<div class="control-group row-fluid">
											<div class="control-label span6">Ruc</div>
											<div class="span6"><input type="text" class="span12" id="rucEmpresa" name="rucEmpresa"/></div>
										</div>
									</div>
									<div class="span6">
										<div class="control-group row-fluid">
											<div class="control-label span4">Pa&iacute;s</div>
											<div class="span8">
												<select class="span12" id="paisEmpresa" name="paisEmpresa">
													<option value="">Seleccionar</option>
													<c:forEach var="listaPais" items="${model.listaPais}" varStatus="contador">
													   <option value="${listaPais.idPais}">${listaPais.descripcion}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="control-group row-fluid">
									<div class="control-label span3">P&aacute;gina Web</div>
									<div class="span9"><input type="text" class="span12" id="paginawebEmpresa" name="paginawebEmpresa"/></div>
								</div>
								<div class="control-group row-fluid">
									<div class="control-label span3">Direcci&oacute;n</div>
									<div class="span9"><input type="text" class="span12" id="direccionEmpresa" name="direccionEmpresa"/></div>
								</div>
								<div class="row-fluid">
									<div class="span3">Redes Sociales</div>
									<div class="span4">
										<span class="span12 input-icon input-icon-left">
											<input type="text" class="span12" id="twitterEmpresa" name="twitterEmpresa"/>
											<i class="icon-twitter-sign blue"></i>
										</span>
									</div>
									<div class="span5">
										<span class="span12 input-icon input-icon-left">
											<input type="text" class="span12" id="fecebookEmpresa" name="fecebookEmpresa"/>
											<i class="icon-facebook-sign blue"></i>
										</span>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span3"></div>
									<div class="span4">
										<span class="span12 input-icon input-icon-left">
											<input type="text" class="span12" id="linkedinEmpresa" name="linkedinEmpresa"/>
											<i class="icon-linkedin-sign blue"></i>
										</span>
									</div>
									<div class="span5">
										<span class="span12 input-icon input-icon-left">
											<input type="text" class="span12" id="gmailEmpresa" name="gmailEmpresa"/>
											<i class="icon-google-plus-sign blue"></i>
										</span>
									</div>
								</div>
								<div class="row-fluid">
								    <div class="control-group span6">
								    	<div class="control-label span6">Tel&eacute;fono</div>
										<div class="span6"><input type="text" class="span12" id="teleEmpresa" name="teleEmpresa"/></div>
								    </div>
								    <div class="control-group span6">								    	
									<div class="control-label span4">Anexo</div>
									<div class="span8"><input type="text" class="span12" id="anexoEmpresa" name="anexoEmpresa"/></div>
								    </div>
								</div>
								<div class="control-group row-fluid">
									<div class="control-label span3">Correo</div>
									<div class="span9"><input type="text" class="span12" id="correoEmpresa" name="correoEmpresa"/></div>
								</div>
								<div class="control-group row-fluid">
									<div class="control-label span3">C&oacute;mo se contacto?</div>
									<div class="span9"><textarea class="span12" id="contactoEmpresa" name="contactoEmpresa"></textarea></div>
								</div>
							</div>
						</div>
					</div>
	
					<div class="accordion-group">
						<div class="accordion-heading">
							<a href="#contactoCliente" data-parent="#datosEmpresa" data-toggle="collapse" class="accordion-toggle collapsed">
								Contactos del Cliente
							</a>
						</div>
	
						<div class="accordion-body collapse" id="contactoCliente">
							<div class="accordion-inner">
								<input type="hidden" id="idDetEmpPersona" name="idDetEmpPersona"/>
								<input type="hidden" id="idPersona" name="idPersona"/>
								<input type="hidden" id="tipoOperacion" />
								<div class="control-group row-fluid">
									<div class="control-label span3">Nombres</div>
									<div class="span9"><input type="text" class="span12" id="nomContEmpresa" name="nomContEmpresa"/></div>
								</div>
								<div class="control-group row-fluid">
									<div class="control-label span3">Apellidos</div>
									<div class="span9"><input type="text" class="span12" id="apeContEmpresa" name="apeContEmpresa"/></div>
								</div>								
								<div class="row-fluid">
									<div class="span6">
										<div class="control-group row-fluid">
											<div class="control-label span6">Tel&eacute;fono</div>
											<div class="span6"><input type="text" class="span12" id="teleContEmpresa" name="teleContEmpresa"/></div>
										</div>
									</div>
									<div class="span6">
										<div class="control-group row-fluid">
											<div class="control-label span4">Anexo</div>
											<div class="span8"><input type="text" class="span12" id="anexoContEmpresa" name="anexoContEmpresa"/></div>
										</div>
									</div>
								</div>	
								<div class="control-group row-fluid">
									<div class="control-label span3">Correo Electr&oacute;nico</div>
									<div class="span9"><input type="text" class="span12" id="emailContEmpresa" name="emailContEmpresa"/></div>
								</div>								
								<div class="row-fluid">
									<div class="span7">
										<div class="control-group row-fluid">
											<div class="control-label span5">Cargo</div>
											<div class="span7">
												<select class="span12" id="cargoContEmpresa" name="cargoContEmpresa">
													<option value="">Seleccionar</option>
													<c:forEach var="listaProveedor" items="${model.listaTipoRol}" varStatus="contador">
													   <option value="${listaProveedor.id}">${listaProveedor.nombreRol}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group row-fluid">
											<div class="control-label span2">&Aacute;rea</div>
											<div class="span10"><input type="text" class="span12" id="areaContEmpresa" name="areaContEmpresa"/></div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span4"></div>
									<div class="span8">
									<div class="span4">
										<a id="btnAgregarContactoCliente" class="btn btn-small btn-primary">
											<i class="icon-plus"></i>
											Agregar
										</a>
									</div>
									<div class="span4">
										<a class="btn btn-small btn-primary" onclick="EditarContactoCliente();">
											<i class="icon-edit"></i>
											Editar &nbsp;&nbsp;
										</a>
									</div>
									<div class="span4">
										<a class="btn btn-small btn-primary" onclick="EliminarContactoCliente();"> 
											<i class="icon-trash"></i>
											Eliminar
										</a>
									</div>
									</div>
								</div>
								<br>
								<div class="row-fluid">
									<div class="table-header">Tabla Contacto de Cliente</div>
									<table id="tablaContEmpresaProyecto" class="table table-striped table-bordered table-hover" style="width: 100%;">
										<thead>
											<tr>
												<th>Contacto</th>
												<th>&Aacute;rea</th>
												<th>Tel&eacute;fono</th>
												<th>Email</th>
												<th>idDetEmpPersona</th>
												<th>nombre</th>
												<th>apellido</th>
												<th>anexo</th>
												<th>idcargo</th>
												<th>idPersona</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
	
					<div class="accordion-group">
						<div class="accordion-heading">
							<a href="#AdicionalEmp" data-parent="#datosEmpresa" data-toggle="collapse" class="accordion-toggle collapsed">
								Adicionales
							</a>
						</div>
	
						<div class="accordion-body collapse" id="AdicionalEmp">
						<br>
							<div class="row-fluid">
								<div class="span3">Logo</div>
								<div class="span8"><input type="file" id="logoEmpresa" name="logoEmpresa"/></div>
							</div>
							<div class="row-fluid">
								<div class="span3">Formato</div>
								<div class="span8"><input type="file" id="formatoEmpresa" name="formatoEmpresa"/></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-small" data-dismiss="modal">
					<i class="icon-remove"></i>
					Cancelar
				</button>
	
				<button type="submit" class="btn btn-small btn-primary">
					<i class="icon-save"></i>
					Guardar
				</button>
			</div>
		</div>
	</form>
	<!-- [FIN] MODAL -->
</div>