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
								<div class="span12">
									<div class="span12">Seguimiento de Entregables</div>
								</div>
							</div>
							<div class="space-20"></div>
							<div class="row-fluid">
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
								</table>
							</div>										
						</div>
					</div>

					<div id="segAdquisiciones" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="span9">Seguimiento de Adquisiciones</div>
								<div class="span3">
									<button class="btn btn-info span12">
										<i class="icon-plus bigger-125"></i>
										Agregar 
									</button>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablasegAdquisiciones" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Id</th>
										<th>Estado</th>
										<th>Categor&iacute;</th>
										<th>Descripci&oacute;n</th>
										<th>Fecha de Compra</th>
										<th>Responsable</th>
										<th>Cantidad</th>
										<th>Costo Unitario</th>
										<th>Opciones</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>

					<div id="agenda" class="tab-pane">
						falta agenda
					</div>

					<div id="crtlCambios" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="span9">Control de Cambios</div>
								<div class="span3">
									<button class="btn btn-info span12">
										<i class="icon-plus bigger-125"></i>
										Agregar
									</button>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
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
							</table>
						</div>
					</div>

					<div id="infAvance" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="span9">Informe de Avance</div>
								<div class="span3">
									<button class="btn btn-info span12">
										<i class="icon-plus bigger-125"></i>
										Agregar
									</button>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
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
	<!-- [INI] MODAL TAREA-->
	<form id="registrarTarea">
		<div id="modal-Tarea" class="modal hide" tabindex="-1">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">Registro de Tareas</h4>
			</div>
			<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
				<div class="row-fluid">
					<div class="span2">ID:</div>
					<div class="span4"><input type="text" class="span6" id="idTarea" readonly="readonly"/></div>
					<div class="span2">Estado:</div>
					<div class="span4"><select class="span12" id="estadoTarea" ></select></div>
				</div>
				<div class="row-fluid">
					<div class="span2">Descripci&oacute;n:</div>
					<div class="span10"><textarea class="span12" id="descripcionTarea"></textarea></div>
				</div>
				<div class="row-fluid">
					<div class="span2">Fecha de Inicio:</div>
					<div class="span4">
						<div class="row-fluid input-append">
							<input class="date-picker span10" id="fecIniTarea" type="text" />
							<span class="add-on">
								<i class="icon-calendar"></i>
							</span>
						</div>
					</div>
					<div class="span2">Fecha de Fin:</div>
					<div class="span4">
						<div class="row-fluid input-append">
							<input class="date-picker span10" id="fecFinTarea" type="text" />
							<span class="add-on">
								<i class="icon-calendar"></i>
							</span>
						</div>
					</div>
				</div>	
				<div class="row-fluid">
					<div class="span2">Horas:</div>
					<div class="span4"><input type="text" class="span12" id="horasTarea"/></div>
					<div class="span2">Recursos:</div>
					<div class="span4">
						<div class="row-fluid">
							<div class="span10">
								<input type="text" class="span12" id="recursoTarea" readonly="readonly"/>
							</div>
							<div class="span2">
								<a href="#mostrarRecurso" class="blue tooltip-info" role="button" data-rel="tooltip" data-toggle="modal" title="Elegir Recurso" data-placement="left">
									<i class="icon-search bigger-130"></i>
								</a>
							</div>
						</div>
					</div>
				</div>	
				<div class="row-fluid">
					<div class="span2">Responsable:</div>
					<div class="span4"><select class="span12" id="responsableTarea"></select></div>
					<div class="span2">Complejidad:</div>
					<div class="span4"><select class="span12" id="complejidadTarea"></select></div>
				</div>
				<div class="row-fluid">
					<div class="span2">Justificaci&oacute;n:</div>
					<div class="span10"><textarea class="span12" id="justificacionTarea"></textarea></div>
				</div>	
			</div>
			<div class="modal-footer">
				<button class="btn btn-small" data-dismiss="modal">
					<i class="icon-remove"></i>
					Cancelar
				</button>
	
				<button class="btn btn-small btn-primary">
					<i class="icon-save"></i>
					Guardar
				</button>
			</div>
		</div>
	</form>
	<!-- [FIN] MODAL TAREA -->
	<!-- [INI] MODAL HACER/RESPONDER-->
	<div id="modal-HacerResponder" class="modal hide" tabindex="-1"> 
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Tarea <small><i id="dscConsultaTarea"class="icon-double-angle-right"></i> overview &amp; stats</small></h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<div class="row-fluid">
					
				<div class="span12">
					<div class="widget-box ">
						<div class="widget-header">
							<h4 class="lighter smaller">
								<i class="icon-comment blue"></i>
								Consultas
							</h4>
						</div>

						<div class="widget-body">
							<div class="widget-main no-padding">
								<div class="dialogs">
									<div class="itemdiv dialogdiv">
										<div class="user">
											<img alt="Alexa's Avatar" src="../assets/avatars/avatar2.png" />
										</div>

										<div class="body">
											<div class="time">
												<i class="icon-time"></i>
												<span class="green">4 sec</span>
											</div>

											<div class="name">
												<a href="#">Alexa</a>
											</div>
											<div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo massa sed ipsum porttitor facilisis.</div>

											<div class="tools">
												<a href="#" class="btn btn-minier btn-info">
													<i class="icon-only icon-share-alt"></i>
												</a>
											</div>
										</div>
									</div>

									<div class="itemdiv dialogdiv">
										<div class="user">
											<img alt="John's Avatar" src="../assets/avatars/avatar2.png" />
										</div>

										<div class="body">
											<div class="time">
												<i class="icon-time"></i>
												<span class="blue">38 sec</span>
											</div>

											<div class="name">
												<a href="#">John</a>
											</div>
											<div class="text">Raw denim you probably haven&#39;t heard of them jean shorts Austin.</div>

											<div class="tools">
												<a href="#" class="btn btn-minier btn-info">
													<i class="icon-only icon-share-alt"></i>
												</a>
											</div>
										</div>
									</div>

									<div class="itemdiv dialogdiv">
										<div class="user">
											<img alt="Bob's Avatar" src="../assets/avatars/avatar2.png" />
										</div>

										<div class="body">
											<div class="time">
												<i class="icon-time"></i>
												<span class="orange">2 min</span>
											</div>

											<div class="name">
												<a href="#">Bob</a>
												<span class="label label-info arrowed arrowed-in-right">admin</span>
											</div>
											<div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo massa sed ipsum porttitor facilisis.</div>

											<div class="tools">
												<a href="#" class="btn btn-minier btn-info">
													<i class="icon-only icon-share-alt"></i>
												</a>
											</div>
										</div>
									</div>

									<div class="itemdiv dialogdiv">
										<div class="user">
											<img alt="Jim's Avatar" src="../assets/avatars/avatar2.png" />
										</div>

										<div class="body">
											<div class="time">
												<i class="icon-time"></i>
												<span class="grey">3 min</span>
											</div>

											<div class="name">
												<a href="#">Jim</a>
											</div>
											<div class="text">Raw denim you probably haven&#39;t heard of them jean shorts Austin.</div>

											<div class="tools">
												<a href="#" class="btn btn-minier btn-info">
													<i class="icon-only icon-share-alt"></i>
												</a>
											</div>
										</div>
									</div>

									<div class="itemdiv dialogdiv">
										<div class="user">
											<img alt="Alexa's Avatar" src="../assets/avatars/avatar2.png" />
										</div>

										<div class="body">
											<div class="time">
												<i class="icon-time"></i>
												<span class="green">4 min</span>
											</div>

											<div class="name">
												<a href="#">Alexa</a>
											</div>
											<div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</div>

											<div class="tools">
												<a href="#" class="btn btn-minier btn-info">
													<i class="icon-only icon-share-alt"></i>
												</a>
											</div>
										</div>
									</div>
								</div>	
							
								<form id="hacerResponderTarea">
									<div class="form-actions input-append">
										<input placeholder="Escribe tu mensaje aqu&iacute; ..." type="text" class="width-75" name="message" />
										<button class="btn btn-small btn-info no-radius" onclick="return false;">
											<i class="icon-share-alt"></i>
											<span class="hidden-phone">Enviar</span>
										</button>
									</div>
								</form>
							
							</div>
						</div>
					</div>
				</div>					
			</div>
		</div>
		<div class="modal-footer">
			<button class="btn btn-small" data-dismiss="modal">
				<i class="icon-remove"></i>
				Salir
			</button>
		</div>
	</div>
	<!-- [FIN] MODAL HACER/RESPONDER -->
	<!-- [INI] MODAL ASIGNAR RECURSO-->
	<form id="registrarRecursoTarea">
		<div id="mostrarRecurso" class="modal hide" tabindex="-1">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">Recursos por Asignar</h4>
			</div>
			<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
				<div class="row-fluid">
					<div class="span2">Roles:</div>
					<div class="span10"><select class="span12" id="rolesAsignarTarea"></select></div>
				</div>	
				
				<div class="row-fluid">
					<select id="idrecursoAsignadoTarea" class="span12" multiple="multiple" size="10">
						<option value="AL">Alabama</option>
						<option value="AK">Alaska</option>
					</select>
				</div>			
			</div>
			<div class="modal-footer">
				<button class="btn btn-small" data-dismiss="modal">
					<i class="icon-undo"></i>
					Salir
				</button>
	
				<button id="asignarRecursoTarea" class="btn btn-small btn-primary" data-dismiss="modal">
					<i class="icon-ok"></i>
					Asignar
				</button>
			</div>
		</div>
	</form>
	<!-- [FIN] MODAL ASIGNAR RECURSO -->
	
	<!-- [INI] MODAL ENVIAR A CERTIFICACION-->
	<form id="registrarEnvioCertificacion">
		<div id="modal-EnviarCertificacion" class="modal hide" tabindex="-1">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">Env&iacute;o para Certificaci&oacute;n</h4>
			</div>
			<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
				<div class="row-fluid">
					<div class="span3">
						<button class="btn btn-app btn-primary no-radius">
							<i class="icon-envelope bigger-230"></i>Enviar
						</button>
					</div>
					<div class="span9">
						<div class="row-fluid">
							<div class="span2">Para:</div>
							<div class="span10"><input type="text" class="span12" id="destinoCertificacion"/></div>
						</div>
						<div class="row-fluid">
							<div class="span2">CC:</div>
							<div class="span10"><input type="text" class="span12" id="ccdestinoCertificacion"/></div>
						</div>
						<div class="row-fluid">
							<div class="span2">Asunto:</div>
							<div class="span10"><input type="text" class="span12" id="asuntoDestinoCertificacion"/></div>
						</div>
						<div class="row-fluid">
							<div class="span2">Entregable:</div>
							<div class="span10"><input type="file" id="envioEntregableCertificacion" /></div>
						</div>
					</div>
				</div>	
				<div class="row-fluid">
					<div class="span3">Observaciones:</div>
					<div class="span9"><textarea rows="5" class="span12" id="observacionCertificacion"></textarea></div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-small" data-dismiss="modal">
					<i class="icon-undo"></i>
					Salir
				</button>	
<!-- 				<button id="asignarRecursoTarea" class="btn btn-small btn-primary" data-dismiss="modal"> -->
<!-- 					<i class="icon-ok"></i> -->
<!-- 					Asignar -->
<!-- 				</button> -->
			</div>
		</div>
	</form>
	<!-- [FIN] MODAL ENVIAR A CERTIFICACION -->
</div>	