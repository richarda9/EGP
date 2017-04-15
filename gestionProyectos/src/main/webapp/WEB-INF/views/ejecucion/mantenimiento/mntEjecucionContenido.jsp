<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
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

					<li>
						<a data-toggle="tab" href="#agenda">
							Agenda
						</a>
					</li>

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
										<div class="control-group">
											<label class="control-label" for="rolasigproveedor">Roles por asignar:</label>

											<div class="controls">
												<div class="span12">
													<select id="rolasigproveedor"></select>
												</div> 
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="recdispproveedor">Recursos disponibles:</label>

											<div class="controls">
												<div class="span12">
													<select id="recdispproveedor"></select>
												</div> 
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<div class="span5">
													<button class="btn btn-small btn-primary" style="float: right;">
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
												<tr>
													<td>sssssssssssssssssss s s skjdsjfgsdif asbdhhsgfiogf asdauif</td>
													<td> sdfksdfjk asjdb kjsdfjsdfsdhkf aasjdfhsdajfg asdfasj</td>
													<td class="td-actions">
														<div class="hidden-phone visible-desktop action-buttons">
															<a class="abrir-eliminarTproyecto red tooltip-error" href="#modal-proveedor" data-toggle="modal" data-id="${tipoProyecto.id}"
																data-rel="tooltip" title="Desasignar">
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
																		<a href="#modal-proveedor" class="abrir-eliminarTproyecto tooltip-error" 
																			data-rel="tooltip" title="Desasignar" data-toggle="modal" data-id="${tipoProyecto.id}">
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
									<form id="idformProveedor" class="form-horizontal">
										<div class="control-group">
											<label class="control-label" for="rolasigcliente">Roles por asignar:</label>

											<div class="controls">
												<div class="span12">
													<select id="rolasigcliente"></select>
												</div> 
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="recdispcliente">Recursos disponibles:</label>

											<div class="controls">
												<div class="span12">
													<input id="recdispcliente" />
												</div> 
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<div class="span5">
													<button class="btn btn-small btn-primary" style="float: right;">
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
												<tr>
													<td>sssssssssssssssssss s s skjdsjfgsdif asbdhhsgfiogf asdauif</td>
													<td> sdfksdfjk asjdb kjsdfjsdfsdhkf aasjdfhsdajfg asdfasj</td>
													<td class="td-actions">
														<div class="hidden-phone visible-desktop action-buttons">
															<a class="abrir-eliminarTproyecto red tooltip-error" href="#modal-cliente" data-toggle="modal" data-id="${tipoProyecto.id}" 
															   data-rel="tooltip" title="Desasignar">
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
																		<a href="#modal-cliente" class="abrir-eliminarTproyecto tooltip-error"  
																			data-rel="tooltip" title="Desasignar" data-toggle="modal" data-id="${tipoProyecto.id}">
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
									<li>
										<a data-toggle="tab" href="#gantTareas"> 
											Gantt
										</a>
									</li>
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
													<div class="span6"></div>
													<div class="span6">
														<div class="row-fluid">
															<div class="span6"></div>
															<div class="span6">
																<a href="#modal-Tarea" role="button" class="btn btn-small btn-primary" data-toggle="modal">
																	<i class="icon-plus"></i>Agregar 
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="space-20"></div>
											<div class="row-fluid">
												<div class="table-header">Lista Tareas Pendientes</div>
												<table id="tablaSegTareas" class="table table-striped table-bordered table-hover">
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
															<th>Opciones</th>
														</tr>
													</thead>	
													<tbody>
														<tr>
															<td>1</td>
															<td>sdsdsdssdsd</td>
															<td>sdsdsds</td>
															<td>sddsdsd</td>
															<td>sdsds</td>
															<td>weeweewe</td>
															<td>wewewewew</td>
															<td>sdsdsdsdsd</td>
															<td class="td-actions">
																<!-- [INI] BOTON EDITAR -->
																<div class="hidden-phone visible-desktop action-buttons">
																	<a class="abrir-eliminarTproyecto blue tooltip-info" href="#modal-Tarea" data-toggle="modal" data-id="${tipoProyecto.id}" 
																	   data-rel="tooltip" title="Editar">
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
																				<a href="#modal-Tarea" class="abrir-eliminarTproyecto tooltip-info"  
																					data-rel="tooltip" title="Editar" data-toggle="modal" data-id="${tipoProyecto.id}">
																					<span class="blue">
																						<i class="icon-edit bigger-120"></i>
																					</span>
																				</a>
																			</li>
																		</ul>
																	</div>
																</div>
																<!-- [FIN] BOTON EDITAR -->
																<!-- [INI] BOTON HACER/RESPONDER -->
																<div class="hidden-phone visible-desktop action-buttons">
																	<a class="abrir-eliminarTproyecto blue tooltip-info" href="#modal-HacerResponder" data-toggle="modal" data-id="${tipoProyecto.id}" 
																	   data-rel="tooltip" title="Hacer/Responder">
																		<i class="icon-comments bigger-130"></i>
																	</a>
																</div>
					
																<div class="hidden-desktop visible-phone">
																	<div class="inline position-relative">
																		<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
																			<i class="icon-caret-down icon-only bigger-120"></i>
																		</button>
					
																		<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
																			<li>
																				<a href="#modal-HacerResponder" class="abrir-eliminarTproyecto tooltip-info"  
																					data-rel="tooltip" title="Hacer/Responder" data-toggle="modal" data-id="${tipoProyecto.id}">
																					<span class="blue">
																						<i class="icon-comments bigger-120"></i>
																					</span>
																				</a>
																			</li>
																		</ul>
																	</div>
																</div>
																<!-- [FIN] BOTON HACER/RESPONDER -->
																<!-- [INI] BOTON ELIMINAR -->
																<div class="hidden-phone visible-desktop action-buttons">
																	<a class="abrir-eliminarTproyecto red tooltip-error" href="#" data-toggle="modal" data-id="${tipoProyecto.id}" 
																	   data-rel="tooltip" title="Eliminar">
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
																				<a href="#" class="abrir-eliminarTproyecto tooltip-error"  
																					data-rel="tooltip" title="Eliminar" data-toggle="modal" data-id="${tipoProyecto.id}">
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
													</tbody>
												</table>
											</div>										
										</div>
									</div>
									
									<div id="gantTareas" class="tab-pane">
										<div class="row-fluid">
											xD
										</div>
									</div>
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
											<th>Descripci&oacute;n</th>
											<th>Fecha de Envio</th>
											<th>Responsable Entregable</th>
											<th>Fecha de Aprobaci&oacute;n</th>
											<th>Asignado Certificaci&oacute;n</th>
											<th>Opciones</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="td-actions">
												<!-- [INI] BOTON ENVIAR A CERTIFICACION -->
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="abrir-eliminarTproyecto blue tooltip-info" href="#modal-EnviarCertificacion" data-toggle="modal" data-id="${tipoProyecto.id}" 
													   data-rel="tooltip" title="Enviar a Certificaci&oacute;n">
														<i class="icon-envelope bigger-130"></i>
													</a>
												</div>
	
												<div class="hidden-desktop visible-phone">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
															<i class="icon-caret-down icon-only bigger-120"></i>
														</button>
	
														<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li>
																<a href="#modal-EnviarCertificacion" class="abrir-eliminarTproyecto tooltip-info" data-rel="tooltip" 
																	title="Enviar a Certificaci&oacute;n" data-toggle="modal" data-id="${tipoProyecto.id}">
																	<span class="blue">
																		<i class="icon-envelope bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
												<!-- [FIN] BOTON CERTIFICACION -->
												<!-- [INI] BOTON VISUALIZAR CERTIFICACION -->
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="abrir-eliminarTproyecto blue tooltip-info" href="#modal-VisualizarCertificacion" data-toggle="modal" data-id="${tipoProyecto.id}" 
													   data-rel="tooltip" title="Visualizar Certificaci&oacute;n">
														<i class="icon-eye-open bigger-130"></i>
													</a>
												</div>
	
												<div class="hidden-desktop visible-phone">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
															<i class="icon-caret-down icon-only bigger-120"></i>
														</button>
	
														<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li>
																<a href="#modal-VisualizarCertificacion" class="abrir-eliminarTproyecto tooltip-info" data-rel="tooltip" 
																	title="Visualizar Certificaci&oacute;n" data-toggle="modal" data-id="${tipoProyecto.id}">
																	<span class="blue">
																		<i class="icon-eye-open bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
												<!-- [FIN] BOTON VISUALIZAR CERTIFICACION -->
											</td>
										</tr>
									</tbody>
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
											<th>Comentarios</th>
											<th>Estado</th>
											<th>Fecha de Respuesta</th>
											<th>Responsable</th>
											<th>Comentario de Respuesta</th>
											<th>Opciones</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="td-actions">
												<!-- [INI] BOTON ENVIAR PARA APROBACION -->
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="abrir-eliminarTproyecto blue tooltip-info" href="#modal-EnviarAprobacion" data-toggle="modal" data-id="${tipoProyecto.id}" 
													   data-rel="tooltip" title="Enviar para Aprobaci&oacute;n">
														<i class="icon-envelope bigger-130"></i>
													</a>
												</div>
	
												<div class="hidden-desktop visible-phone">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
															<i class="icon-caret-down icon-only bigger-120"></i>
														</button>
	
														<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li>
																<a href="#modal-EnviarAprobacion" class="abrir-eliminarTproyecto tooltip-info" data-rel="tooltip" 
																	title="Enviar para Aprobaci&oacute;n" data-toggle="modal" data-id="${tipoProyecto.id}">
																	<span class="blue">
																		<i class="icon-envelope bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
												<!-- [FIN] BOTON ENVIAR PARA APROBACION -->
												<!-- [INI] BOTON EDITAR -->
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="abrir-eliminarTproyecto blue tooltip-info" href="#modal-editarEntregable" data-toggle="modal" data-id="${tipoProyecto.id}" 
													   data-rel="tooltip" title="Editar">
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
																<a href="#modal-editarEntregable" class="abrir-eliminarTproyecto tooltip-info" data-rel="tooltip" 
																	title="Editar" data-toggle="modal" data-id="${tipoProyecto.id}">
																	<span class="blue">
																		<i class="icon-edit bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
												<!-- [FIN] BOTON EDITAR -->
											</td>
										</tr>
									</tbody>
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
									<a href="#modal-Adquisiciones" role="button" class="btn btn-small btn-primary" data-toggle="modal">
										<i class="icon-plus"></i>Agregar 
									</a>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<div class="table-header">Lista de Adquisiciones</div>
							<table id="tablasegAdquisiciones" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Id</th>
										<th>Estado</th>
										<th>Categor&iacute;a</th>
										<th>Descripci&oacute;n</th>
										<th>Fecha de Compra</th>
										<th>Responsable</th>
										<th>Cantidad</th>
										<th>Costo Unitario</th>
										<th>Opciones</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td class="td-actions">
											<!-- [INI] BOTON EDITAR -->
											<div class="hidden-phone visible-desktop action-buttons">
												<a class="abrir-eliminarTproyecto blue tooltip-info" href="#modal-Adquisiciones" data-toggle="modal" data-id="${tipoProyecto.id}" 
												   data-rel="tooltip" title="Editar">
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
															<a href="#modal-Adquisiciones" class="abrir-eliminarTproyecto tooltip-info"  
																data-rel="tooltip" title="Editar" data-toggle="modal" data-id="${tipoProyecto.id}">
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
												<a class="abrir-eliminarTproyecto red tooltip-error" href="#" data-toggle="modal" data-id="${tipoProyecto.id}" 
												   data-rel="tooltip" title="Eliminar">
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
															<a href="#" class="abrir-eliminarTproyecto tooltip-error"  
																data-rel="tooltip" title="Eliminar" data-toggle="modal" data-id="${tipoProyecto.id}">
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
								</tbody>
							</table>
						</div>
					</div>

					<div id="agenda" class="tab-pane">
						falta agenda
					</div>

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
									<a href="#modal-ctrolCambios" role="button" class="btn btn-small btn-primary" data-toggle="modal">
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
										<th>Solicitante</th>
										<th>Complejidad</th>
										<th>Horas Estimadas</th>
										<th>Comentarios</th>
										<th>Opciones</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td class="td-actions">
											<!-- [INI] BOTON EDITAR -->
											<div class="hidden-phone visible-desktop action-buttons">
												<a class="abrir-eliminarTproyecto blue tooltip-info" href="#modal-ctrolCambios" data-toggle="modal" data-id="${tipoProyecto.id}" 
												   data-rel="tooltip" title="Editar">
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
															<a href="#modal-ctrolCambios" class="abrir-eliminarTproyecto tooltip-info"  
																data-rel="tooltip" title="Editar" data-toggle="modal" data-id="${tipoProyecto.id}">
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
												<a class="abrir-eliminarTproyecto red tooltip-error" href="#" data-toggle="modal" data-id="${tipoProyecto.id}" 
												   data-rel="tooltip" title="Eliminar">
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
															<a href="#" class="abrir-eliminarTproyecto tooltip-error"  
																data-rel="tooltip" title="Eliminar" data-toggle="modal" data-id="${tipoProyecto.id}">
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
									<a href="#modal-infoAvance" role="button" class="btn btn-small btn-primary" data-toggle="modal">
										<i class="icon-plus"></i>Agregar 
									</a>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<div class="table-header">Lista de Informe de Avance</div>
							<table id="tablainfAvance" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Id</th>
										<th>Descripci&oacute;n</th>
										<th>Fecha de Env&iacute;o</th>
										<th>Tipo</th>
										<th>Opciones</th>
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
				�Est&aacute; seguro de Desasignar al Proveedor seleccionado?
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
				�Est&aacute; seguro de Desasignar al Cliente seleccionado?
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
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/consultasProyecto.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/asignarRecursos.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/envioCertificacion.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/envioAprobacion.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/registroSeguimientoEntregable.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/registroAdquisiciones.jsp"%>	
	<%@ include file="/WEB-INF/views/ventanasEmergentes/ejecucion/registroControlCambio.jsp"%>

</div>	