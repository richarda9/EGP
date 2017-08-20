<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<div class="span12">
			<form  name="formBuscarPlanificacion" id="formBuscarPlanificacion" method="post">
				<div class="row-fluid">
					<div class="span3">
						<div class="control-group">
							<label class="control-label" for="proyecto">Proyecto</label>	
							<div class="controls">
								<select id="idProyecto" name="idProyecto" title="proyecto">
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
								<select id="idEmpresa" name="idEmpresa" title="cliente">
									<option value="">Seleccionar</option>
									<c:forEach var="empresa" items="${model.listaEmpresa}" varStatus="contador">
								   		<option value="${empresa.idEmpresa}">${empresa.razonSocial}</option>
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
								   <option value="${responsableProyecto.iddetalle}">${responsableProyecto.nombres}</option>
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
				</form>
				<div class="row-fluid">
					<div class="span12">
						<div class="span2" style="float: left;">
							<button class="btn btn-small btn-primary span12" onclick="buscarPlanificacion()">
								<i class="icon-search bigger-125"></i>
								Buscar
							</button>
						</div>						
					</div>							
				</div>	
				</br>		
		</div>
	</div>
<!-- 	<div class="space-20"></div> -->
	<div class="row-fluid">
		<div class="table-header">&nbsp;</div>
		<table id="tablaBuscarPlanificacion"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>Proyecto</th>
					<th>Empresa</th>
					<th>Tipo de Proyecto</th>
					<th>Fecha de Inicio</th>
					<th>Responsable</th>
					<th></th>
				</tr>
			</thead>
		</table>
	</div>
	
	<%@ include file="/WEB-INF/views/cancelar/cancelarContenido.jsp"%>
</div>	