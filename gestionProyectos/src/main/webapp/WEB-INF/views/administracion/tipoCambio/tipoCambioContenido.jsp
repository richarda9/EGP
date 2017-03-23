<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<div class="span12">
			<form class="form-horizontal">
				<div class="control-group">
					<label class="control-label" for="fechaCambio">Fecha</label>

					<div class="controls">
						<div class="row-fluid input-append">
							<input id="fechaCambio" type="text" data-date-format="dd-mm-yyyy" />
							<span class="add-on">
								<i class="icon-calendar"></i>
							</span>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="valorcompra">Compra</label>

					<div class="controls">
						<input type="text" id="valorcompra" placeholder="valor compra" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="valorventa">Venta</label>

					<div class="controls">
						<input type="text" id="valorventa" placeholder="valor venta" />
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
		<div class="table-header">Lista Tipo de Cambio</div>
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