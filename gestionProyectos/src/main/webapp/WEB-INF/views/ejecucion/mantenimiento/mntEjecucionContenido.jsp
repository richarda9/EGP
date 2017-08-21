<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<input id="idProyectoGeneral" name="idproyecto" type="hidden" value="${model.idProyecto}" />
		<div class="span12">
			<div class="tabbable tabs-left">
				<ul class="nav nav-tabs" id="myTab3">
					<li class="active">
						<a data-toggle="tab" href="#asigResponsable">
							Asignaci&oacute;n de Responsables
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#segTareas">
							Seguimiento de tareas
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#certiEntregable">
							Certificaci&oacute;n de Entregables
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#segEntregable">
							Seguimiento de Entregables
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#segAdquisiciones">
							Seguimiento de Adquisiciones
						</a>
					</li>

<!-- 					<li> -->
<!-- 						<a data-toggle="tab" href="#agenda"> -->
<!-- 							Agenda -->
<!-- 						</a> -->
<!-- 					</li> -->

					<li>
						<a data-toggle="tab" href="#crtlCambios">
							Control de Cambios
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#infAvance">
							Informe de Avance
						</a>
					</li>
				</ul>

				<div class="tab-content">
					<div id="asigResponsable" class="tab-pane in active">
						<div class="row-fluid">
							<div class="page-header position-relative">
								<h1>Asignaci&oacute;n de Responsables</h1>
							</div>
						</div>
						<br>
						<div class="row-fluid">
							<div class="span12">
								<fieldset>
									<legend style="font-size: 14px;">PROVEEDOR</legend>
									<form id="idformProveedor" class="form-horizontal">
										<input type="hidden" name="idproyecto" value="${model.idProyecto}"/>
										<input type="hidden" name="tiporol" value="1"/>
										<div class="control-group">
											<label class="control-label" for="rolasigproveedor">Roles por asignar:</label>
											<div class="controls">
												<div class="span12">
													<select id="rolasigproveedor" name="idrol" onchange="mostrarRecursoAsignar(this)">
														<option value="">Seleccionar</option>
														<c:forEach var="listaProveedor" items="${model.listaRolProveedor}" varStatus="contador">
														   <option value="${listaProveedor.id}">${listaProveedor.nombre}</option>
														</c:forEach>
													</select>
												</div> 
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="recdispproveedor">Recursos disponibles:</label>
											<div class="controls">
												<div class="span12">
													<select id="recdispproveedor" name="idrecurso"></select>
												</div> 
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<div class="span5">
													<button class="btn btn-small btn-primary" style="float: right;" type="submit">
														<i class="icon-plus"></i>
														Asignar
													</button>
												</div>
											</div>
										</div>
									</form>
									<br>
									<div class="row-fluid">
										<div class="table-header">Lista Proveedores</div>
										<table id="tablaRecProveedor" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>Rol</th>
													<th>Recurso</th>
													<th>Opciones</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="lista" items="${model.listaProveedores}" varStatus="contador">
													<tr>
													<td><c:out value="${lista.dsctiporol}"/></td>
													<td><c:out value="${lista.nomcompletopersona}"/></td>
													<td class="td-actions">
														<div class="hidden-phone visible-desktop action-buttons">
															<a class="red tooltip-error" href="#modal-proveedor" data-toggle="modal"
																data-rel="tooltip" title="Desasignar" onclick="desasignarProveedor(${lista.id})">
																<i class="icon-minus-sign bigger-130"></i>
															</a>
														</div>
			
														<div class="hidden-desktop visible-phone">
															<div class="inline position-relative">
																<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
																	<i class="icon-caret-down icon-only bigger-120"></i>
																</button>
			
																<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
																	<li>
																		<a href="#modal-proveedor" class="tooltip-error" onclick="desasignarProveedor(${lista.id})"
																			data-rel="tooltip" title="Desasignar" data-toggle="modal" >
																			<span class="red">
																				<i class="icon-minus-sign bigger-120"></i>
																			</span>
																		</a>
																	</li>
																</ul>
															</div>
														</div>
													</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</fieldset>
							</div>
						</div>
						<div class="space-20"></div><div class="space-20"></div>
						<div class="row-fluid">
							<div class="span12">
								<fieldset>
									<legend style="font-size: 14px;">CLIENTE</legend>
									<form id="idformCliente" class="form-horizontal">
										<input type="hidden" name="idproyecto" value="${model.idProyecto}"/>
										<input type="hidden" name="tiporol" value="2"/>
										<div class="control-group">
											<label class="control-label" for="rolasigcliente">Roles por asignar:</label>

											<div class="controls">
												<div class="span12">
													<select id="rolasigcliente" name="idrol" onchange="mostrarRecursoAsignar(this)">
														<option value="">Seleccionar</option>
														<c:forEach var="listaCliente" items="${model.listaRolCliente}" varStatus="contador">
														   <option value="${listaCliente.id}">${listaCliente.nombre}</option>
														</c:forEach>
													</select>
												</div> 
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="recdispcliente">Recursos disponibles:</label>

											<div class="controls">
												<div class="span12">
													<select id="recdispcliente" name="idrecurso"></select>
												</div> 
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<div class="span5">
													<button type="submit" class="btn btn-small btn-primary" style="float: right;">
														<i class="icon-plus"></i>
														Asignar
													</button>
												</div>
											</div>
										</div>
									</form>
									<br>
									<div class="row-fluid">
										<div class="table-header">Lista Clientes</div>
										<table id="tablaRecCliente" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>Rol</th>
													<th>Recurso</th>
													<th>Opciones</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="lista" items="${model.listaCliente}" varStatus="contador">
													<tr>
													<td><c:out value="${lista.dsctiporol}"/></td>
													<td><c:out value="${lista.nomcompletopersona}"/></td>
													<td class="td-actions">
														<div class="hidden-phone visible-desktop action-buttons">
															<a class="red tooltip-error" href="#modal-cliente" data-toggle="modal"
																data-rel="tooltip" title="Desasignar" onclick="desasignarCliente(${lista.id})">
																<i class="icon-minus-sign bigger-130"></i>
															</a>
														</div>
			
														<div class="hidden-desktop visible-phone">
															<div class="inline position-relative">
																<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
																	<i class="icon-caret-down icon-only bigger-120"></i>
																</button>
			
																<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
																	<li>
																		<a href="#modal-cliente" class="tooltip-error" onclick="desasignarCliente(${lista.id})"
																			data-rel="tooltip" title="Desasignar" data-toggle="modal" >
																			<span class="red">
																				<i class="icon-minus-sign bigger-120"></i>
																			</span>
																		</a>
																	</li>
																</ul>
															</div>
														</div>
													</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</fieldset>
							</div>
						</div>
					</div>

					<div id="segTareas" class="tab-pane">
						<div id="user-profile-2" class="user-profile row-fluid">
							<div class="tabbable">
								<ul class="nav nav-tabs padding-18">
									<li class="active">
										<a data-toggle="tab" href="#seguimientoTareas"> 
											Seguimiento
										</a>
									</li>
<!-- 									<li> -->
<!-- 										<a data-toggle="tab" href="#gantTareas">  -->
<!-- 											Gantt -->
<!-- 										</a> -->
<!-- 									</li> -->
								</ul>
								
								<div class="tab-content no-border padding-24">
									<div id="seguimientoTareas" class="tab-pane in active">
										<div class="row-fluid">
											<div class="page-header position-relative">
												<h1>Tareas Pendientes</h1>
											</div>
										</div>
										<div class="row-fluid">
											<div class="row-fluid">
												<div class="span12">
													<div class="span3"></div>
													<div class="span6">
														<div class="row-fluid">
															<div class="span3">
																<a id="btnGuardarTarea" class="btn btn-small btn-primary">
																	<i class="icon-save"></i>Guardar 
																</a>															
															</div>
															<div class="span3">
																<a href="#modal-Tarea" id="btnAgregarTarea" role="button" class="btn btn-small btn-primary" data-toggle="modal">
																	<i class="icon-plus"></i>Agregar 
																</a>
															</div>
															<div class="span3">
																<a id="btnEditarTarea" class="btn btn-small btn-primary">
																	<i class="icon-edit"></i>Editar &nbsp;&nbsp; 
																</a>
															</div>
															<div class="span3">
																<a id="btnEliminarTarea" class="btn btn-small btn-primary">
																	<i class="icon-trash"></i>Eliminar 
																</a>
															</div>
														</div>
													</div>
													<div class="span3">
<!-- 														<div class="row-fluid"> -->
<!-- 															<div class="span12"> -->
<!-- 																<a href="#modal-HacerResponder" id="btnResponderTarea" role="button" class="btn btn-small btn-primary" data-toggle="modal"> -->
<!-- 																	<i class="icon-comments"></i>Hacer/Responder  -->
<!-- 																</a>															 -->
<!-- 															</div> -->
<!-- 														</div> -->
													</div>
												</div>
											</div>
											<div class="space-20"></div>
											<div class="row-fluid">
												<div class="table-header">Lista Tareas Pendientes</div>
												<table id="tablaSegTareas" class="table table-striped table-bordered table-hover"
												       style="width: 100%;">
													<thead>
														<tr>
															<th>Id</th>
															<th>Descripci&oacute;n</th>
															<th>Fecha Inicio</th>
															<th>Fecha Fin</th>
															<th>Complejidad</th>
															<th>Horas</th>
															<th>Estado</th>
															<th>Justificaci&oacute;n</th>
															<!-- Campos Ocultos-->
															<th>Codigo Estado</th>
															<th>Codigo Complejidad</th>
															<th>Codigo Recursos</th>
															<th>Tarea Predecesora</th>
															<th>Codigo Responsable</th>
														</tr>
													</thead>	
													<tbody>
													</tbody>
												</table>
											</div>										
										</div>
									</div>
									
<!-- 									<div id="gantTareas" class="tab-pane"> -->
<!-- 										<div class="row-fluid"> -->
<!-- 											xD -->
<!-- 										</div> -->
<!-- 									</div> -->
								</div>
							</div>
						</div>
					</div>

					<div id="certiEntregable" class="tab-pane">
						<div class="row-fluid">
							<div class="row-fluid">
								<div class="page-header position-relative">
									<h1>Certificaci&oacute;n de Entregables</h1>
								</div>
							</div>
							<div class="space-20"></div>
							<div class="row-fluid">
								<div class="table-header">Lista la Certificaci&oacute;n de Entregables</div>
								<table id="tablacertiEntregables" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>Id</th>
											<th>Estado</th>
											<th>Nombre</th>
											<th>Descripci&oacute;n</th>
											<th>Fecha de Envio</th>
											<th>Responsable Entregable</th>
											<th>Fecha de Aprobaci&oacute;n</th>
											<th>Asignado Certificaci&oacute;n</th>
											<th>Opciones</th>
										</tr>
									</thead>									
								</table>
							</div>										
						</div>
					</div>

					<div id="segEntregable" class="tab-pane">
						<div class="row-fluid">
							<div class="row-fluid">
								<div class="page-header position-relative">
									<h1>Seguimiento de Entregables</h1>
								</div>
							</div>
							<div class="space-20"></div>
							<div class="row-fluid">
								<div class="table-header">Lista de Entregables</div>
								<table id="tablasegEntregables" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>Entregable</th>
											<th>Fecha de Envio</th>
											<th>Responsable</th>
<!-- 											<th>Comentarios</th> -->
											<th>Estado</th>
											<th>Fecha de Respuesta</th>
											<th>Responsable</th>
											<th>Comentario de Respuesta</th>
											<th>Opciones</th>
										</tr>
									</thead>
								</table>
							</div>										
						</div>
					</div>

					<div id="segAdquisiciones" class="tab-pane">
						<div class="row-fluid">
							<div class="row-fluid">
								<div class="page-header position-relative">
									<h1>Seguimiento de Adquisiciones</h1>
								</div>
							</div>
							<div class="span12">
								<div class="span9"></div>
								<div class="span3">
									<a id="btnAdquisciones" href="#modal-Adquisiciones" role="button" class="btn btn-small btn-primary" data-toggle="modal">
										<i class="icon-plus"></i>Agregar 
									</a>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<div class="table-header">Lista de Adquisiciones</div>
							<table id="tablasegAdquisiciones" class="table table-striped table-bordered table-hover" style="width: 100%;">
								<thead>
									<tr>
										<th>Id</th>
										<th>Estado Adquisici&oacute;n</th>
										<th>Categor&iacute;a</th>
										<th>Descripci&oacute;n</th>
										<th>Fecha de Compra</th>
										<th>Responsable</th>
										<th>Cantidad</th>
										<th>Costo Unitario</th>
										<th>Estado Registro</th>
										<th>Opciones</th>
										<th>idEstado</th>
										<th>idCategoria</th>
										<th>idResponsable</th>										
									</tr>
								</thead>
							</table>
						</div>
					</div>

<!-- 					<div id="agenda" class="tab-pane"> -->
<!-- 						falta agenda -->
<!-- 					</div> -->

					<div id="crtlCambios" class="tab-pane">
						<div class="row-fluid">
							<div class="row-fluid">
								<div class="page-header position-relative">
									<h1>Control de Cambios</h1>
								</div>
							</div>
							<div class="span12">
								<div class="span9"></div>
								<div class="span3">
									<a href="#modal-ctrolCambios" id="btnCtrolCambios" role="button" class="btn btn-small btn-primary" data-toggle="modal">
										<i class="icon-plus"></i>Agregar 
									</a>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<div class="table-header">Lista de Control de Cambios</div>
							<table id="tablaControlCambios" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Id</th>
										<th>Descripci&oacute;n de la Solicitud</th>
										<th>Fecha de Solicitud</th>
<!-- 										<th>Solicitante</th> -->
										<th>Complejidad</th>
										<th>Horas Estimadas</th>
										<th>Comentarios</th>
										<th>Opciones</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="listaCtrolCambios" items="${model.listaCtrolCambios}" varStatus="contador">
										<tr>
											<td><c:out value="${listaCtrolCambios.codctrolcambios}"/></td>
											<td><c:out value="${listaCtrolCambios.descripcionCtrolCambios}"/></td>
											<td><c:out value="${listaCtrolCambios.fecSolCtrolCambios}"/></td>
<%-- 											<td><c:out value="${listaCtrolCambios.dscSolicitante}"/></td> --%>
											<td><c:out value="${listaCtrolCambios.dscComplejidad}"/></td>
											<td><c:out value="${listaCtrolCambios.horasEstimadas}"/></td>
											<td><c:out value="${listaCtrolCambios.comentarios}"/></td>
											<td class="td-actions">
												<!-- [INI] BOTON EDITAR -->
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="blue tooltip-info" href="#modal-ctrolCambios" data-toggle="modal" 
													   data-rel="tooltip" title="Editar" onclick="editarCtrolCambios(${listaCtrolCambios.idCtrolCambios})">
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
																<a href="#modal-ctrolCambios" class="tooltip-info" onclick="editarCtrolCambios(${listaCtrolCambios.idCtrolCambios})" 
																	data-rel="tooltip" title="Editar" data-toggle="modal">
																	<span class="blue">
																		<i class="icon-edit bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
												<!-- [FIN] BOTON EDITAR -->
												<!-- [INI] BOTON ELIMINAR -->
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="red tooltip-error" href="#modal-eliminarCtrolCambios" data-toggle="modal"  
													   data-rel="tooltip" title="Eliminar" onclick="eliminarCtrolCambios(${listaCtrolCambios.idCtrolCambios})">
														<i class="icon-trash bigger-130"></i>
													</a>
												</div>
	
												<div class="hidden-desktop visible-phone">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
															<i class="icon-caret-down icon-only bigger-120"></i>
														</button>
	
														<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li>
																<a href="#modal-eliminarCtrolCambios" class="tooltip-error" onclick="eliminarCtrolCambios(${listaCtrolCambios.idCtrolCambios})" 
																	data-rel="tooltip" title="Eliminar" data-toggle="modal">
																	<span class="red">
																		<i class="icon-trash bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
												<!-- [FIN] BOTON ELIMINAR -->
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<div id="infAvance" class="tab-pane">
						<div class="row-fluid">
							<div class="row-fluid">
								<div class="page-header position-relative">
									<h1>Informe de Avance</h1>
								</div>
							</div>
							<div class="span12">
								<div class="span9"></div>
								<div class="span3">
									<a id="btnInfAvance" href="#modal-infoAvance" role="button" class="btn btn-small btn-primary" data-toggle="modal">
										<i class="icon-plus"></i>Agregar 
									</a>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<div class="table-header">Lista de Informe de Avance</div>
							<table id="tablainfAvance" class="table table-striped table-bordered table-hover" style="width: 100%;">
								<thead>
									<tr>
										<th>Id</th>
										<th>Descripci&oacute;n</th>
										<th>Fecha de Env&iacute;o</th>
										<th>Tipo</th>
										<th>Opciones</th>
										<th>idInfAvance</th>
										<th>idTipoInfAvance</th>
										<th>fechaIniInfAvance</th>
										<th>fechaFinInfAvance</th>
										<th>IncAdquisicion</th>
										<th>IncCtrolCambio</th>
										<th>IncTareaTerminada</th>
										<th>IncTareaAtrasada</th>
										<th>IncReuniones</th>
										<th>correoDirigido</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- [INI] MODAL PROVEEDOR -->
	<form id="idformProveedorEditar" class="form-horizontal">
		<div id="modal-proveedor" class="modal hide" tabindex="-1">
			<div class="modal-header no-padding">
				<div class="table-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>

			<div class="modal-body padding">
				<input type="hidden" name="id" id="idrecursoProvEliminar"/>
				¿Est&aacute; seguro de Desasignar al Proveedor seleccionado?
			</div>	
			<div class="modal-footer">
				<button class="btn btn-small btn-primary">
					<i class="icon-ok"></i> Confirmar
				</button>
				<button class="btn btn-small" data-dismiss="modal">
					<i class="icon-remove"></i> Salir
				</button>
			</div>
		</div>
	</form>
	<!-- [FIN] MODAL PROVEEDOR -->
	
	<!-- [INI] MODAL CLIENTE -->
	<form id="idformClienteEditar" class="form-horizontal">
		<div id="modal-cliente" class="modal hide" tabindex="-1">
			<div class="modal-header no-padding">
				<div class="table-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>

			<div class="modal-body padding">
				<input type="hidden" name="id" id="idrecursoClieEliminar"/>
				¿Est&aacute; seguro de Desasignar al Cliente seleccionado?
			</div>	
			<div class="modal-footer">
				<button class="btn btn-small btn-primary">
					<i class="icon-ok"></i> Confirmar
				</button>
				<button class="btn btn-small" data-dismiss="modal">
					<i class="icon-remove"></i> Salir
				</button>
			</div>
		</div>
	</form>
	<!-- [FIN] MODAL CLIENTE -->
	
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/registroTareas.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/mostrarControlCambios.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/consultasProyecto.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/asignarRecursos.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/envioCertificacion.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/envioAprobacion.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/registroSeguimientoEntregable.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/registroAdquisiciones.jsp"%>	
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/registroControlCambio.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/registroInformeAvance.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/seguimientoCertificacion.jsp"%>

</div>	