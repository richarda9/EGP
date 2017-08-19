<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<div class="span12">
			<form id="formBsqCierre">	
				<div class="row-fluid">
					<div class="span3">
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
					<div class="span3">
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
					</div>
				</div>	
				<div class="row-fluid">
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
						<div class="span1"></div>
						<div class="span2">
							<button class="btn btn-small btn-primary span12" type="submit">
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
					<th>Proyecto</th>
					<th>Cliente</th>
					<th>Tipo de Proyecto</th>
					<th>Fecha de Inicio</th>
					<th>Estado</th>
					<th></th>
				</tr>
			</thead>
		</table>
	</div>
	
	<%@ include file="/WEB-INF/views/cancelar/cancelarContenido.jsp"%>
</div>