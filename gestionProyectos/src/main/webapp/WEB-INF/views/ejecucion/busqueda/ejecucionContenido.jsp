<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<div class="span12">
			<form id="formBsqEjecucion">
				<div class="row-fluid">
					<div class="span3">
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
					</div>
					<div class="span3">
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
					</div>
					<div class="span3">
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
					</div>			
				</div>
				<div class="row-fluid">
					<div class="span3">
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
					</div>
					<div class="span3">				
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
					</div>
					<div class="span3">
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
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="span2">
							<button type="submit" class="btn btn-small btn-primary span12" style="float: right;">
								<i class="icon-search"></i>
								Buscar
							</button>
						</div>
<!-- 						<div class="span2" > -->
<!-- 							<button class="btn btn-small btn-primary" style="float: left;"> -->
<!-- 								<i class=" icon-download-alt"></i> -->
<!-- 								Exportar -->
<!-- 							</button> -->
<!-- 						</div> -->
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
		</table>
	</div>
	
	<%@ include file="/WEB-INF/views/cancelar/cancelarContenido.jsp"%>
</div>	