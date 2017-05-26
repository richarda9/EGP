<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<div class="span12">
			<form id="formBsqCierre" class="form-horizontal">	
				<div class="control-group">
					<label class="control-label" for="cliente">Cliente</label>	
					<div class="controls">
						<select id="cliente" name="idCliente">
							<option value="">Seleccionar</option>
							<c:forEach var="cliente" items="${model.listaCliente}" varStatus="contador">
							   <option value="${cliente.idEmpresa}">${cliente.razonSocial}</option>
							</c:forEach>
						</select>	
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="idTipoProyecto">Tipo de Proyecto</label>	
					<div class="controls">
						<select id="idTipoProyecto" name="idTipoProyecto" title="idTipoProyecto">
							<option value="">Seleccionar</option>
							<c:forEach var="tipoProyecto" items="${model.listaTipoProyecto}" varStatus="contador">
							   <option value="${tipoProyecto.id}">${tipoProyecto.descripcion}</option>
							</c:forEach>
						</select>	
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="idEstado">Estado</label>
	
					<div class="controls">
						<select id="idEstado" name="estado" title="">
							<option value="">Seleccionar</option>
							<c:forEach var="estadoProyecto" items="${model.listaEstadoProyecto}" varStatus="contador">
							   <option value="${estadoProyecto.id}">${estadoProyecto.descripcion}</option>
							</c:forEach>
						</select>	
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="fechaInicio">Fecha Inicio</label>
	
					<div class="controls">
						<div class="row-fluid input-append">
							<input id="fechaInicio" name="fechaInicio" type="text" data-date-format="dd-mm-yyyy" />
							<span class="add-on">
								<i class="icon-calendar"></i>
							</span>
						</div>
					</div>
				</div>				
				<div class="control-group">
					<label class="control-label" for="fechafin">Fecha Fin</label>
	
					<div class="controls">
						<div class="row-fluid input-append">
							<input id="fechafin" name="fechaFin" type="text" data-date-format="dd-mm-yyyy" />
							<span class="add-on">
								<i class="icon-calendar"></i>
							</span>
						</div>
					</div>
				</div>				
				<div class="row-fluid">
					<div class="span12">
						<div class="span2"></div>
						<div class="span2">
							<button class="btn btn-small btn-primary" type="submit">
								<i class="icon-search"></i>
								Buscar
							</button>
						</div>						
					</div>							
				</div>
			</form>
		</div>
	</div>
	<div class="row-fluid">
		<div class="table-header">Lista de Proyectos</div>
		<table id="tablaCierreProyecto"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class="center"><label>
							<span class="lbl"></span>
					</label></th>
					<th>Proyecto</th>
					<th>Cliente</th>
					<th>Tipo de Proyecto</th>
					<th>Fecha de Inicio</th>
					<th>Estado</th>
					<th></th>
				</tr>
			</thead>
<!-- 			<tbody> -->
<%-- 				<c:forEach var="estadoProyecto" items="${model.listaEstadoProyecto}" varStatus="contador"> --%>
<!-- 					<tr> -->
<!-- 						<td class="center">												 -->
<%-- 							<c:out value="${contador.count}"/> --%>
<!-- 						</td> -->
<%-- 						<td><c:out value="${estadoProyecto.descripcion}"></c:out></td> --%>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${estadoProyecto.estado == 1}"> --%>
<!-- 								<td class="hidden-480"><span class="label label-info"><b>ACTIVO</b></span> -->
<!-- 								</td> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<td class="hidden-480"><span -->
<!-- 									class="label label-danger"><b>INACTIVO</b></span></td> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td class="td-actions"> -->
<!-- 							<div class="hidden-phone visible-desktop action-buttons"> -->
<!-- 								<a class="abrir-eliminarEproyecto blue tooltip-info" href="../cierre/mntCierre.htm?idcierre=1" data-toggle="modal" -->
<%-- 									data-id="${estadoProyecto.id}" data-rel="tooltip" title="Cerrar"> --%>
<!-- 										<i class="icon-remove-sign bigger-130"> </i> -->
<!-- 								</a> -->
<!-- 							</div> -->

<!-- 							<div class="hidden-desktop visible-phone"> -->
<!-- 								<div class="inline position-relative"> -->
<!-- 									<button class="btn btn-minier btn-yellow dropdown-toggle" -->
<!-- 										data-toggle="dropdown"> -->
<!-- 										<i class="icon-caret-down icon-only bigger-120"></i> -->
<!-- 									</button> -->

<!-- 									<ul -->
<!-- 										class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close"> -->
<!-- 										<li><a href="../cierre/mntCierre.htm?idcierre=1" -->
<!-- 											class="abrir-eliminarEproyecto tooltip-info" -->
<!-- 											data-rel="tooltip" title="Cerrar" data-toggle="modal" -->
<%-- 											data-id="${estadoProyecto.id}"> <span class="blue"> --%>
<!-- 													<i class="icon-remove-sign bigger-120"></i> -->
<!-- 											</span> -->
<!-- 										</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</tbody> -->
		</table>
	</div>
	
	<%@ include file="/WEB-INF/views/cancelar/cancelarContenido.jsp"%>
</div>