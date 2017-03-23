<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div id="user-profile-2" class="user-profile row-fluid">
		<div class="tabbable">
			<ul class="nav nav-tabs padding-18">
				<li class="active">
					<a data-toggle="tab" href="#configuracion"> 
						Configuraci&oacute;n
					</a>
				</li>
				<li>
					<a data-toggle="tab" href="#complejidad"> 
						Tipo de Complejidad
					</a>
				</li>
				<li>
					<a data-toggle="tab" href="#estado"> 
						Estado Entregables
					</a>
				</li>
			</ul>
			<div class="tab-content no-border padding-24">
				<div id="configuracion" class="tab-pane in active">
					<div class="row-fluid">
						<div class="span12">
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label" for="fileserver">File Server</label>

									<div class="controls">
										<input type="text" class="span6" id="fileserver" placeholder=""/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="dscsatisfaccion">Encuesta de Satisfacci&oacute;n</label>

									<div class="controls">
										<input type="text" class="span6" id="dscsatisfaccion" placeholder="dsc satisfaccion" />
									</div>
								</div>
								<div class="form-actions">
									<button class="btn btn-info" type="submit">
										<i class="icon-save bigger-110"></i>
										Guardar
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="icon-undo bigger-110"></i>
										Limpiar
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="space-20"></div>
				</div>
				
				<div id="complejidad" class="tab-pane">
					<div class="row-fluid">
						<div class="span12">
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label" for="tipoComplejidad">Tipo de Complejidad</label>

									<div class="controls">
										<input type="text" class="span6" id="tipoComplejidad" placeholder=""/>
									</div>
								</div>
								<div class="form-actions">
									<button class="btn btn-info" type="submit">
										<i class="icon-save bigger-110"></i>
										Guardar
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="icon-undo bigger-110"></i>
										Limpiar
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="space-20"></div>
					<div class="row-fluid">
						<div class="table-header">Lista Tipo de Complejidad</div>
						<table id="tablaEstadoProyecto"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center"><label>
											<span class="lbl"></span>
									</label></th>
									<th>Descripci&oacute;n</th>
									<th>Estado</th>
									<th></th>
								</tr>
							</thead>

							<tbody>
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
													href="#eliminarEstadoProyecto" data-toggle="modal"
													data-id="${estadoProyecto.id}"> <i
													class="icon-trash bigger-130" data-rel="tooltip"
													title="Eliminar"> </i>
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
														<li><a href="#eliminarEstadoProyecto"
															class="abrir-eliminarEproyecto tooltip-error"
															data-rel="tooltip" title="Eliminar" data-toggle="modal"
															data-id="${estadoProyecto.id}"> <span class="red">
																	<i class="icon-trash bigger-120"></i>
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
				
				<div id="estado" class="tab-pane">
					<div class="row-fluid">
						<div class="span12">
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label" for="estadoEntregable">Estado Entregable</label>

									<div class="controls">
										<input type="text" class="span6" id="estadoEntregable" placeholder=""/>
									</div>
								</div>
								<div class="form-actions">
									<button class="btn btn-info" type="submit">
										<i class="icon-save bigger-110"></i>
										Guardar
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="icon-undo bigger-110"></i>
										Limpiar
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="space-20"></div>
					<div class="row-fluid">
						<div class="table-header">Lista Estado Entregable</div>
						<table id="tablaEstadoProyecto"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center"><label>
											<span class="lbl"></span>
									</label></th>
									<th>Descripci&oacute;n</th>
									<th>Estado</th>
									<th></th>
								</tr>
							</thead>

							<tbody>
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
													href="#eliminarEstadoProyecto" data-toggle="modal"
													data-id="${estadoProyecto.id}"> <i
													class="icon-trash bigger-130" data-rel="tooltip"
													title="Eliminar"> </i>
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
														<li><a href="#eliminarEstadoProyecto"
															class="abrir-eliminarEproyecto tooltip-error"
															data-rel="tooltip" title="Eliminar" data-toggle="modal"
															data-id="${estadoProyecto.id}"> <span class="red">
																	<i class="icon-trash bigger-120"></i>
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
			</div>
		</div>
	</div>
</div>