<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<div class="span12">
			<form id="formBsqEjecucion" class="form-horizontal">
				<div class="control-group">
					<label class="control-label" for="proyecto">Proyecto</label>	
					<div class="controls">
						<select id="proyecto" name="idProyecto" title="proyecto">
							<option value="">Seleccionar</option>
							<c:forEach var="proyecto" items="${model.listaProyecto}" varStatus="contador">
							   <option value="${proyecto.idProyecto}">${proyecto.nombreProyecto}</option>
							</c:forEach>
						</select>	
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="idcliente">Empresa</label>	
					<div class="controls">
						<select id="idcliente" name="idCliente" title="cliente">
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
					<label class="control-label" for="dscResponsable">Responsable</label>
					<div class="controls">					
						<select id="idResponsableProyecto" name="idResponsableProyecto">
							<option value="">Seleccionar</option>
							<c:forEach var="responsableProyecto" items="${model.listaResponsableProyecto}" varStatus="contador">
							   <option value="${responsableProyecto.idDetalle}">${responsableProyecto.nombres}</option>
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
						<div class="span2" >
							<button type="submit" class="btn btn-small btn-primary" style="float: right;">
								<i class="icon-search"></i>
								Buscar
							</button>
						</div>
						<div class="span2" >
							<button class="btn btn-small btn-primary" style="float: left;">
								<i class=" icon-download-alt"></i>
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
		<div class="table-header">Lista de Proyectos</div>
		<table id="tablaProyectoEjecucion"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
<!-- 					<th>Id Proyecto</th> -->
					<th>Proyecto</th>
<!-- 					<th>Id Cliente</th> -->
					<th>Empresa</th>
<!-- 					<th>Id Tipo de Proyecto</th> -->
					<th>Tipo de Proyecto</th>
					<th>Fecha de Inicio</th>
<!-- 					<th>Id Responsable</th> -->
					<th>Responsable</th>
					<th>Opciones</th>
				</tr>
			</thead>
			<!-- <tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="td-actions"> -->
						<!-- [INI] BOTON EDITAR 
							<div class="hidden-phone visible-desktop action-buttons">
								<a class="abrir-eliminarEproyecto blue tooltip-info" href="../ejecucion/mntEjecucion.htm?idEjecucion=1" data-toggle="modal"
									data-id="${estadoProyecto.id}" data-rel="tooltip" title="Editar"> 
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
											<a href="../ejecucion/mntEjecucion.htm?idEjecucion=1" class="abrir-eliminarEproyecto tooltip-info"
											   data-rel="tooltip" title="Editar" data-toggle="modal" data-id="${estadoProyecto.id}"> 
												<span class="blue"><i class="icon-edit bigger-120"></i></span>
											</a>
										</li>
									</ul>
								</div>
							</div>
							 [FIN] BOTON EDITAR -->
							<!-- [INI] BOTON CANCELAR 
							<div class="hidden-phone visible-desktop action-buttons">
								<a class="abrir-eliminarEproyecto red tooltip-error" href="#modalCancelarProyecto" data-toggle="modal"
								   data-id="${estadoProyecto.id}" data-rel="tooltip" title="Cancelar"> 
									<i class="icon-remove-sign bigger-130"></i>
								</a>
							</div>

							<div class="hidden-desktop visible-phone">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#modalCancelarProyecto" class="abrir-eliminarEproyecto tooltip-error" data-rel="tooltip" 
												title="Cancelar" data-toggle="modal" data-id="${estadoProyecto.id}"> 
											   		<span class="red"><i class="icon-remove-sign bigger-120"></i></span>
											</a>
										</li>
									</ul>
								</div>
							</div>
							 [FIN] BOTON CANCELAR  -->
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 				<c:forEach var="estadoProyecto" items="${model.listaEstadoProyecto}" varStatus="contador"> --%>
<!-- 					<tr> -->
<!-- 						<td class="center">												 -->
<%-- 							<c:out value="${contador.count}"/> --%>
<!-- 						</td> -->
<%-- 						<td><c:out value="${estadoProyecto.descripcion}"></c:out></td> --%>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${estadoProyecto.estado == 1}"> --%>
<!-- 								<td class="hidden-480"><span class="label label-info"><b>ACTIVO</b></span></td> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<td class="hidden-480"><span class="label label-danger"><b>INACTIVO</b></span></td> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td class="td-actions"> -->
<!-- 							[INI] BOTON EDITAR -->
<!-- 							<div class="hidden-phone visible-desktop action-buttons"> -->
<!-- 								<a class="abrir-eliminarEproyecto blue tooltip-info" href="../ejecucion/mntEjecucion.htm?idEjecucion=1" data-toggle="modal" -->
<%-- 									data-id="${estadoProyecto.id}" data-rel="tooltip" title="Editar">  --%>
<!-- 										<i class="icon-edit bigger-130"></i> -->
<!-- 								</a> -->
<!-- 							</div> -->

<!-- 							<div class="hidden-desktop visible-phone"> -->
<!-- 								<div class="inline position-relative"> -->
<!-- 									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown"> -->
<!-- 										<i class="icon-caret-down icon-only bigger-120"></i> -->
<!-- 									</button> -->

<!-- 									<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close"> -->
<!-- 										<li> -->
<!-- 											<a href="../ejecucion/mntEjecucion.htm?idEjecucion=1" class="abrir-eliminarEproyecto tooltip-info" -->
<%-- 											   data-rel="tooltip" title="Editar" data-toggle="modal" data-id="${estadoProyecto.id}">  --%>
<!-- 												<span class="blue"><i class="icon-edit bigger-120"></i></span> -->
<!-- 											</a> -->
<!-- 										</li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							[FIN] BOTON EDITAR -->
<!-- 							[INI] BOTON CANCELAR -->
<!-- 							<div class="hidden-phone visible-desktop action-buttons"> -->
<!-- 								<a class="abrir-eliminarEproyecto red tooltip-error" href="#modalCancelarProyecto" data-toggle="modal" -->
<%-- 								   data-id="${estadoProyecto.id}" data-rel="tooltip" title="Cancelar">  --%>
<!-- 									<i class="icon-remove-sign bigger-130"></i> -->
<!-- 								</a> -->
<!-- 							</div> -->

<!-- 							<div class="hidden-desktop visible-phone"> -->
<!-- 								<div class="inline position-relative"> -->
<!-- 									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown"> -->
<!-- 										<i class="icon-caret-down icon-only bigger-120"></i> -->
<!-- 									</button> -->

<!-- 									<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close"> -->
<!-- 										<li> -->
<!-- 											<a href="#modalCancelarProyecto" class="abrir-eliminarEproyecto tooltip-error" data-rel="tooltip"  -->
<%-- 												title="Cancelar" data-toggle="modal" data-id="${estadoProyecto.id}">  --%>
<!-- 											   		<span class="red"><i class="icon-remove-sign bigger-120"></i></span> -->
<!-- 											</a> -->
<!-- 										</li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							[FIN] BOTON CANCELAR  -->
<!-- 						</td> -->
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</tbody> -->
		</table>
	</div>
	
	<%@ include file="/WEB-INF/views/cancelar/cancelarContenido.jsp"%>
</div>	