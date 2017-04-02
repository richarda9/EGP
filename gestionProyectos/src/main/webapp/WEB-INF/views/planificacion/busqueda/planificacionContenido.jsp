<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<div class="span12">
			<form class="">
				<div class="row-fluid">
					<div class="span3">
						<div class="control-group">
							<label class="control-label" for="proyecto">Proyecto</label>	
							<div class="controls">
								<select id="proyecto" name="proyecto" title="proyecto">
									<option value="">Seleccionar</option>
								</select>	
							</div>
						</div>
					</div>
					<div class="span3">
						<div class="control-group">
							<label class="control-label" for="idcliente">Cliente</label>	
							<div class="controls">
								<select id="idcliente" name="idcliente" title="cliente">
									<option value="">Seleccionar</option>
								</select>	
							</div>
						</div>
					</div>
					<div class="span3">
						<div class="control-group">
							<label class="control-label" for="idTipoProyecto">Tipo de Proyecto</label>	
							<div class="controls">
								<select id="idTipoProyecto" name="idTipoProyecto" title="idTipoProyecto">
									<option value="">Seleccionar</option>
								</select>	
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
				<div class="span3">
					<div class="control-group">
						<label class="control-label" for="dscResponsable">Responsable</label>
	
						<div class="controls">
							<input type="text" id="dscResponsable" 
								name="dscResponsable" placeholder="Responsable" />
						</div>
					</div>
				</div>
				
				<div class="span3">
					<div class="control-group">
						<label class="control-label" for="fechaInicio">Fecha Inicio</label>
	
						<div class="controls">
							<div class="row-fluid input-append">
								<input id="fechaInicio" type="text" data-date-format="dd-mm-yyyy" />
								<span class="add-on">
									<i class="icon-calendar"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="span3">
					<div class="control-group">
						<label class="control-label" for="fechafin">Fecha Fin</label>
	
						<div class="controls">
							<div class="row-fluid input-append">
								<input id="fechafin" type="text" data-date-format="dd-mm-yyyy" />
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
						<div class="span6"></div>
						<div class="span2" style="float: left;">
							<button class="btn btn-info span12">
								<i class="icon-search bigger-125"></i>
								Buscar
							</button>
						</div>
						<div class="span2" style="float: left;">
							<button class="btn btn-info span12">
								<i class=" icon-download-alt bigger-125"></i>
								Exportar
							</button>
						</div>
					</div>							
				</div>
			</form>
		</div>
	</div>
<!-- 	<div class="space-20"></div> -->
	<div class="row-fluid">
		<div class="table-header">&nbsp;</div>
		<table id="tablaEstadoProyecto"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>Proyecto</th>
					<th>Cliente</th>
					<th>Tipo de Proyecto</th>
					<th>Fecha de Inicio</th>
					<th>Responsable</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="td-actions">
						<div class="hidden-phone visible-desktop action-buttons">
							<a class="abrir-eliminarEproyecto red"
								href="../planificacion/mntPlanificacion.htm?idPlanificacion=1" data-toggle="modal"
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
									<li><a href="../anteproyecto/mntPlanificacion.htm?idPlanificacion=1"
										class="abrir-eliminarEproyecto tooltip-error"
										data-rel="tooltip" title="Editar" data-toggle="modal"
										data-id="${estadoProyecto.id}"> <span class="red">
												<i class="icon-edit bigger-120"></i>
										</span>
									</a></li>
								</ul>
							</div>
						</div>
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
						<td></td>
						<td></td>
						<td></td>
						<td class="td-actions">
							<div class="hidden-phone visible-desktop action-buttons">
								<a class="abrir-eliminarEproyecto red"
									href="../anteproyecto/mntAnteproyecto.htm?idAnteproyecto=1" data-toggle="modal"
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
										<li><a href="../anteproyecto/mntAnteproyecto.htm?idAnteproyecto=1"
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