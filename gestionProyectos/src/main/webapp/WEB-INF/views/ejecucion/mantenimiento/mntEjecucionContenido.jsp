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
									<legend>Proveedor</legend>
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
															<a class="abrir-eliminarTproyecto red" href="#modal-proveedor" data-toggle="modal" data-id="${tipoProyecto.id}">
																<i class="icon-edit" data-rel="tooltip" title="Desasignar"> </i>
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
																				<i class="icon-edit"></i>
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
						<div class="space-20"></div>
						<div class="row-fluid">
							<div class="span12">
								<fieldset>
									<legend>Cliente</legend>
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
															<a class="abrir-eliminarTproyecto red" href="#modal-cliente" data-toggle="modal" data-id="${tipoProyecto.id}">
																<i class="icon-edit" data-rel="tooltip" title="Desasignar"> </i>
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
																				<i class="icon-edit"></i>
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
											<div class="row-fluid">
												<div class="span12">
													<div class="span6">Tareas Pendientes</div>
													<div class="span3">
														<button class="btn btn-info span12">
															<i class="icon-plus bigger-125"></i>
															Guardar Cambios 
														</button>
													</div><div class="span3">
														<button class="btn btn-info span12">
															<i class="icon-plus bigger-125"></i>
															Agregar 
														</button>
													</div>
												</div>
											</div>
											<div class="space-20"></div>
											<div class="row-fluid">
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
								<div class="span12">
									<div class="span12">Certificaci&oacute;n de Entregables</div>
								</div>
							</div>
							<div class="space-20"></div>
							<div class="row-fluid">
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
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">Proveedor</h4>
			</div>

			<div class="modal-body overflow-visible">
				<div class="control-group">
					<label class="control-label" for="rolasigproveedorEditar">Roles por asignar:</label>

					<div class="controls">
						<div class="span12">
							<select id="rolasigproveedorEditar"></select>
						</div> 
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="recdispproveedorEditar">Recursos disponibles:</label>

					<div class="controls">
						<div class="span12">
							<select id="recdispproveedorEditar"></select>
						</div> 
					</div>
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
	<!-- [FIN] MODAL PROVEEDOR -->
	
	<!-- [INI] MODAL CLIENTE -->
	<form id="idformClienteEditar" class="form-horizontal">
		<div id="modal-cliente" class="modal hide" tabindex="-1">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">Cliente</h4>
			</div>

			<div class="modal-body overflow-visible">
				<div class="control-group">
					<label class="control-label" for="rolasigclienteEditar">Roles por asignar:</label>
	
					<div class="controls">
						<div class="span12">
							<select id="rolasigclienteEditar"></select>
						</div> 
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="recdispclienteEditar">Recursos disponibles:</label>
	
					<div class="controls">
						<div class="span12">
							<input id="recdispclienteEditar" />
						</div> 
					</div>
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
	<!-- [FIN] MODAL CLIENTE -->
</div>	