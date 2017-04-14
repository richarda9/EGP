<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<div class="span12">
			<div class="span5"></div>
			<div class="span7">
				<div class="row-fluid">
					<div class="span12">
						<div class="span3" style="float: left;">
							<button class="btn btn-small btn-info span12">
								<i class="icon-share-alt"></i>
								Planificar
							</button>
						</div>
						<div class="span3" style="float: left;">
							<button class="btn btn-small btn-info span12">
								<i class="icon-print"></i>
								Imprimir
							</button>
						</div>
						<div class="span3" style="float: left;">
							<a class="btn btn-small btn-info span12" href="#mntLeccionAprendida" data-toggle="modal">
								<i class="icon-remove-sign"></i>
								Cancelar
							</a>
						</div>
						<div class="span2" style="float: left;">
							<a class="btn btn-small btn-info span12" href="#mntLeccionAprendida" data-toggle="modal">
								<i class="icon-save"></i>
								Guardar
							</a>
						</div>
						<div class="span1" style="float: left;">
							<a class="btn btn-small btn-info span12" href="#mntLeccionAprendida" data-toggle="modal">
								<i class="icon-undo"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="space-20"></div>
		<div class="space-20"></div>
		<div class="space-20"></div>
	</div>
	
	
	
	<div class="row-fluid">
		<div id="user-profile-2" class="user-profile row-fluid">
			<div class="tabbable">					
				<ul class="nav nav-tabs padding-18">
					<li class="active">
						<a data-toggle="tab" href="#generalEmpresa"> 
							General
						</a>
					</li>
					<li>
						<a data-toggle="tab" href="#empresaProyecto"> 
							Empresa
						</a>
					</li>
					<li>
						<a data-toggle="tab" href="#observaciones"> 
							Observaciones
						</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tipoSupuesto"> 
							Anexo
						</a>
					</li>
				</ul>
				<div class="tab-content no-border padding-24">
					<!-- [INI] GENERALIDADES -->
					<div id="generalEmpresa" class="tab-pane in active">
						<div class="row-fluid">
							<form id="registrarTipoProyecto">
								<div class="span12">								
									<div class="span4">
										<div class="control-group">
											<label class="control-label" for="dscAsocProyecto">Asociado a Proyecto</label>
											<div class="controls">
												<select id="dscAsocProyecto" name="dscAsocProyecto" >
													<option value="">Seleccionar</option>
												</select>	
											</div>
										</div>							    
									</div>				
									<div class="span4">
										<div class="control-group">
											<label class="control-label" for="fechaContacto">Fecha de Contacto</label>
											<div class="controls">
												<div class="row-fluid input-append">
												<input id="fechaContacto" type="text" data-date-format="dd-mm-yyyy" />
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
											</div>
										</div>							    
									</div>
								</div>
								<div class="row-fluid">
									<div class="span12">								
										<div class="span4">
											<div class="control-group">
												<label class="control-label" for="idTipoProyecto">Tipo de Proyecto</label>
												<div class="controls">
													<select id="idTipoProyecto" name="idTipoProyecto" >
														<option value="">Seleccionar</option>
														<c:forEach var="tipoProyecto" items="${model.listaTipoProyecto}" varStatus="contador">
														   <option value="${tipoProyecto.id}">${tipoProyecto.descripcion}</option>
														</c:forEach>
													</select>	
												</div>
											</div>							    
										</div>										
										<div class="span4">
											<div class="control-group">
												<label class="control-label" for="dscEjecutivoCuenta">Ejecutivo de Cuenta</label>
												<div class="controls">
													<select id="dscEjecutivoCuenta" name="dscEjecutivoCuenta">
														<option value="">Seleccionar</option>
													</select>	
												</div>
											</div>							    
										</div>											
										<div class="span4">
											<div class="control-group">
												<label class="control-label" for="dscResponsable">Responsable</label>
												<div class="controls">
													<select id="dscResponsable" name="dscResponsable">
														<option value="">Seleccionar</option>
													</select>	
												</div>
											</div>							    
										</div>		
									</div>	
									<div class="span12">
										<div class="control-group">
											<label class="control-label" for="dscEjecutivoCuenta">Titulo o nombre del Proyecto</label>
											<div class="controls">
												<textarea id="dscEjecutivoCuenta" rows="5" class="span10"></textarea>
											</div>
										</div>
									</div>	
									<div class="span12">
										<div class="control-group">
											<label class="control-label" for="dscAlcanceInicial">Alcance Inicial</label>
											<div class="controls">
												<textarea id="dscAlcanceInicial" rows="5" class="span10"></textarea>
											</div>
										</div>
									</div>	
									<div class="span12">
										<div class="control-group">
											<label class="control-label" for="dscObjetivo">Objetivo</label>
											<div class="controls">
												<textarea id="dscObjetivo" rows="5" class="span10"></textarea>
											</div>
										</div>
									</div>
								</div>					
							</form>
							<hr/>
							<div class="space-20"></div>
						</div>
						<!--/row-fluid-->
		
						<div class="space-20"></div>
					</div>
					<!-- [FIN] GENERALIDADES -->
					
					<!-- [INI] EMPRESA -->
					<div id="empresaProyecto" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<form class="form-horizontal">
									<div class="control-group">
										<label class="control-label" for="idEmpresa">Empresa</label>
					
										<div class="controls">
											<select id="empresa" name="empresa" title="empresa">
												<option value="">Seleccionar</option>
												<c:forEach var="empresa" items="${model.listaEmpresa}" varStatus="contador">
												   <option value="${empresa.idEmpresa}">${empresa.razonSocial}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="row-fluid">
								<fieldset>
  									<legend>Interesados</legend>
  										<form class="">
  											<div class="span4">
												<div class="control-group">
	<!-- 												<label class="control-label" for="idEmpresa">Empresa</label> -->
													<div class="controls">
														<select id="idContacto" class="span12" name="idContacto" title="Contacto" >
															<option value="">Seleccionar Contacto</option>
														</select>	
													</div>
												</div>
											</div>
  											<div class="span5">
												<div class="control-group">
	<!-- 												<label class="control-label" for="idEmpresa">Empresa</label> -->
													<div class="controls">
														<input type="text" id="idInteres" class="span12" name="idInteres" placeholder="Interes"/>
													</div>
												</div>
											</div>
  											<div class="span3">
												<button class="btn btn-small btn-info span12">
													<i class="icon-plus-sign bigger-125"></i>
													Agregar interesados
												</button>
											</div>
										</form>
  								</fieldset>				
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaEstadoProyecto"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Interesado</th>
										<th>Cargo</th>
										<th>Inter&eacute;s</th>
										<th>Opciones</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									<td></td>
									<td></td>
									<td></td>
									<td class="td-actions">
										<!-- [INI] EDITAR -->
										<div class="hidden-phone visible-desktop action-buttons">
											<a class="abrir-eliminarEproyecto"
												href="#mntLeccionAprendida" data-toggle="modal"
												data-id="${estadoProyecto.id}"> <i
												class="icon-edit bigger-130" data-rel="tooltip"
												title="Editar"> </i>
											</a>
										</div>
			
										<div class="hidden-desktop visible-phone">
											<div class="inline position-relative">
												<button class="btn btn-minier btn-yellow dropdown-toggle"
													data-toggle="dropdown">
													<i class="icon-caret-down icon-only bigger-120"></i>
												</button>
			
												<ul
													class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
													<li><a href="#mntLeccionAprendida"
														class="abrir-eliminarEproyecto tooltip-error"
														data-rel="tooltip" title="Editar" data-toggle="modal"
														data-id="${estadoProyecto.id}"> <span class="blue">
																<i class="icon-edit bigger-120"></i>
														</span>
													</a></li>
												</ul>
											</div>
										</div>
										<!-- [FIN] EDITAR -->
										<!-- [INI] ELIMINAR -->
										<div class="hidden-phone visible-desktop action-buttons">
											<a class="abrir-eliminarEproyecto red"
												href="#eliminarLeccionAprendida" data-toggle="modal"
												data-id="${estadoProyecto.id}"> <i
												class="icon-trash bigger-130" data-rel="tooltip"
												title="Cancelar"> </i>
											</a>
										</div>
			
										<div class="hidden-desktop visible-phone">
											<div class="inline position-relative">
												<button class="btn btn-minier btn-yellow dropdown-toggle"
													data-toggle="dropdown">
													<i class="icon-caret-down icon-only bigger-120"></i>
												</button>
			
												<ul
													class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
													<li><a href="#eliminarLeccionAprendida"
														class="abrir-eliminarEproyecto tooltip-error"
														data-rel="tooltip" title="Cancelar" data-toggle="modal"
														data-id="${estadoProyecto.id}"> <span class="red">
																<i class="icon-trash bigger-120"></i>
														</span>
													</a></li>
												</ul>
											</div>
										</div>
										<!-- [FIN] ELIMINAR -->
									</td>
									</tr>
									<c:forEach var="estadoProyecto" items="${model.listaEstadoProyecto}" varStatus="contador">
										<tr>
											<td class="center">												
												<c:out value="${contador.count}"/>
											</td>
											<td><c:out value="${estadoProyecto.descripcion}"></c:out></td>
											<c:choose>
												<c:when test="${estadoProyecto.estado == 1}">
													<td class="hidden-480"><span class="label label-info"><b>ACTIVO</b></span>
													</td>
												</c:when>
												<c:otherwise>
													<td class="hidden-480"><span
														class="label label-danger"><b>INACTIVO</b></span></td>
												</c:otherwise>
											</c:choose>
											<td class="td-actions">
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="abrir-eliminarEproyecto red"
														href="../cierre/mntCierre.htm?idcierre=1" data-toggle="modal"
														data-id="${estadoProyecto.id}"> <i
														class="icon-edit bigger-130" data-rel="tooltip"
														title="Cancelar"> </i>
													</a>
												</div>
					
												<div class="hidden-desktop visible-phone">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-yellow dropdown-toggle"
															data-toggle="dropdown">
															<i class="icon-caret-down icon-only bigger-120"></i>
														</button>
					
														<ul
															class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li><a href="../cierre/mntCierre.htm?idcierre=1"
																class="abrir-eliminarEproyecto tooltip-error"
																data-rel="tooltip" title="Cancelar" data-toggle="modal"
																data-id="${estadoProyecto.id}"> <span class="red">
																		<i class="icon-edit bigger-120"></i>
																</span>
															</a></li>
														</ul>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- [FIN] EMPRESA -->
					
					<!-- [INI] OBSERVACIONES -->
					<div id="observaciones" class="tab-pane">
						<form class="form-horizontal">
							<div class="row-fluid">						
								<div class="span12">								
										<div class="control-group">
<!-- 											<label class="control-label" for="idEmpresa">Empresa</label> -->
						
											<div class="controls">
												<textarea rows="5" id="dscObservacion" class="span12" name="dscObservacion" 
															placeholder="Ingresar observacion"></textarea>
											</div>
										</div>
								</div>
							</div>
							<div class="row-fluid">
								<fieldset>
									<legend>Interesados</legend>
									<div class="span6">
										<div class="control-group">
<!-- 												<label class="control-label" for="idEmpresa">Empresa</label> -->
											<div class="controls">
												<input type="file" id="archObservacion" />
											</div>
										</div>
									</div>
									<div class="span3">
										<div class="control-group">
<!-- 												<label class="control-label" for="idEmpresa">Empresa</label> -->
											<div class="controls">
												<input type="text" id="idInteres" class="span12" name="idInteres" placeholder="Interes"/>
											</div>
										</div>
									</div>
									<div class="span3">
										<button class="btn btn-small btn-info span12">
											<i class="icon-plus-sign bigger-125"></i>
											Agregar observaci&oacute;n
										</button>
									</div>
 								</fieldset>				
							</div>
						</form>
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaEstadoProyecto"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Interesado</th>
										<th>Cargo</th>
										<th>Inter&eacute;s</th>
										<th>Opciones</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									<td></td>
									<td></td>
									<td></td>
									<td class="td-actions">
										<!-- [INI] EDITAR -->
										<div class="hidden-phone visible-desktop action-buttons">
											<a class="abrir-eliminarEproyecto"
												href="#mntLeccionAprendida" data-toggle="modal"
												data-id="${estadoProyecto.id}"> <i
												class="icon-edit bigger-130" data-rel="tooltip"
												title="Editar"> </i>
											</a>
										</div>
			
										<div class="hidden-desktop visible-phone">
											<div class="inline position-relative">
												<button class="btn btn-minier btn-yellow dropdown-toggle"
													data-toggle="dropdown">
													<i class="icon-caret-down icon-only bigger-120"></i>
												</button>
			
												<ul
													class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
													<li><a href="#mntLeccionAprendida"
														class="abrir-eliminarEproyecto tooltip-error"
														data-rel="tooltip" title="Editar" data-toggle="modal"
														data-id="${estadoProyecto.id}"> <span class="blue">
																<i class="icon-edit bigger-120"></i>
														</span>
													</a></li>
												</ul>
											</div>
										</div>
										<!-- [FIN] EDITAR -->
										<!-- [INI] ELIMINAR -->
										<div class="hidden-phone visible-desktop action-buttons">
											<a class="abrir-eliminarEproyecto red"
												href="#eliminarLeccionAprendida" data-toggle="modal"
												data-id="${estadoProyecto.id}"> <i
												class="icon-trash bigger-130" data-rel="tooltip"
												title="Cancelar"> </i>
											</a>
										</div>
			
										<div class="hidden-desktop visible-phone">
											<div class="inline position-relative">
												<button class="btn btn-minier btn-yellow dropdown-toggle"
													data-toggle="dropdown">
													<i class="icon-caret-down icon-only bigger-120"></i>
												</button>
			
												<ul
													class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
													<li><a href="#eliminarLeccionAprendida"
														class="abrir-eliminarEproyecto tooltip-error"
														data-rel="tooltip" title="Cancelar" data-toggle="modal"
														data-id="${estadoProyecto.id}"> <span class="red">
																<i class="icon-trash bigger-120"></i>
														</span>
													</a></li>
												</ul>
											</div>
										</div>
										<!-- [FIN] ELIMINAR -->
									</td>
									</tr>
									<c:forEach var="estadoProyecto" items="${model.listaEstadoProyecto}" varStatus="contador">
										<tr>
											<td class="center">												
												<c:out value="${contador.count}"/>
											</td>
											<td><c:out value="${estadoProyecto.descripcion}"></c:out></td>
											<c:choose>
												<c:when test="${estadoProyecto.estado == 1}">
													<td class="hidden-480"><span class="label label-info"><b>ACTIVO</b></span>
													</td>
												</c:when>
												<c:otherwise>
													<td class="hidden-480"><span
														class="label label-danger"><b>INACTIVO</b></span></td>
												</c:otherwise>
											</c:choose>
											<td class="td-actions">
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="abrir-eliminarEproyecto red"
														href="../cierre/mntCierre.htm?idcierre=1" data-toggle="modal"
														data-id="${estadoProyecto.id}"> <i
														class="icon-edit bigger-130" data-rel="tooltip"
														title="Cancelar"> </i>
													</a>
												</div>
					
												<div class="hidden-desktop visible-phone">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-yellow dropdown-toggle"
															data-toggle="dropdown">
															<i class="icon-caret-down icon-only bigger-120"></i>
														</button>
					
														<ul
															class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li><a href="../cierre/mntCierre.htm?idcierre=1"
																class="abrir-eliminarEproyecto tooltip-error"
																data-rel="tooltip" title="Cancelar" data-toggle="modal"
																data-id="${estadoProyecto.id}"> <span class="red">
																		<i class="icon-edit bigger-120"></i>
																</span>
															</a></li>
														</ul>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- [FIN] OBSERVACIONES -->
				</div>
			</div>
		</div>
	</div>
</div>