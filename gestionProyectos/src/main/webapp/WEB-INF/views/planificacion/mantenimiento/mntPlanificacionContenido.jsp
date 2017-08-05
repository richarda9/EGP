<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<div class="span12">
			<div class="tabbable tabs-left">
				<ul class="nav nav-tabs" id="myTab3">
					<li class="active">
						<a data-toggle="tab" href="#dscProducto">
							<i class="pink icon-dashboard bigger-110"></i>
							Descripci&oacute;n del Producto
							<input id = "codigoPy" type="hidden" value="${model.codigoPy}"/>
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#alcance">
							<i class="blue icon-user bigger-110"></i>
							Alcance
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#recursoHumanos">
							<i class="icon-rocket"></i>
							Recursos Humanos
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#cronograma">
							<i class="icon-rocket"></i>
							Cronograma
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#entregable">
							<i class="icon-rocket"></i>
							Entregables
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#riesgos">
							<i class="icon-rocket"></i>
							Riesgos
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#adquisiciones">
							<i class="icon-rocket"></i>
							Adquisiciones
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#costos">
							<i class="icon-rocket"></i>
							Costos
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#costosOperativos">
							<i class="icon-rocket"></i>
							Costos Operativos
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#presupuesto">
							<i class="icon-rocket"></i>
							Presupuesto
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#formasdePago">
							<i class="icon-rocket"></i>
							Formas de Pago
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#contrato">
							<i class="icon-rocket"></i>
							Contrato
						</a>
					</li>
				</ul>
				
				<div class="tab-content">
					<!-- INI - PLANIFICACION - DESCRIPCION PRODUCTO  -->
					<div id="dscProducto" class="tab-pane in active">
						<div class="row-fluid">
							<div class="span12">
								<div class="page-header position-relative"><h1>Descripci&oacute;n del Producto del Proyecto</h1></div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<div class="span6"></div>
								<div class="span3" style="float:left;">
									<a class="btn btn-small btn-info span12" onclick="guardarDescripcion()">
										<i class="icon-save bigger-125"></i>
										Guardar
									</a>
								</div>
								<div class="span3" style="float:left;">
									<button class="btn btn-small btn-info span12">
										<i class="icon-undo bigger-125"></i>
										Limpiar
									</button>
								</div>
								<!-- <div class="span3" style="float:left;">
									<button class="btn btn-info span12">
										<i class="icon-download bigger-125"></i>
										Importar Plantilla
									</button>
								</div> -->
							</div>
						</div>
						<br>
						<form  name="formPlanDescripcion" id="formPlanDescripcion" method="post">
							<textarea class="span12" id="descripcion" name="descripcion" >${model.descripcionProductoProyecto}</textarea>
						</form>
					</div>
					<!-- FIN - PLANIFICACION - DESCRIPCION PRODUCTO  -->

					<!-- INI - PLANIFICACION - ALCANCE  -->
					<div id="alcance" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="page-header position-relative"><h1>Alcance</h1></div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<div class="span9"></div>
								<div class="span3" style="float:left;">
									<a class="btn btn-small btn-info span12" onclick="guardarAlcance()">
										<i class="icon-save bigger-125"></i>
										Guardar
									</a>
								</div>
							</div>
						</div>
						<br>
						<div id="accordion2" class="accordion">
						<form  name="formPlanAlcance" id="formPlanAlcance" method="post">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#definicionAlcance" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">
										Definici&oacute;n del Alcance
									</a>
								</div>

								<div class="accordion-body in collapse" id="definicionAlcance">
									<div class="accordion-inner">
										<br>
										<div class="control-group">
											<textarea class="span12" id="txtdefinicionAlcance" name="definicionAlcance">${model.alcanceInicial}</textarea>
										</div>
									</div>
								</div>
							</div>

							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#reqProyecto" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">
										Requisitos del Proyecto
									</a>
								</div>

								<div class="accordion-body collapse" id="reqProyecto">
									<div class="accordion-inner">
										<div class="row-fluid">
											<div class="span12">
												<div class="control-group">
													<label class="control-label" for="tipo">Tipo</label>	
													<div class="controls">
														<select id="idTipoRequisito" title="tipo">
															<option value="">Seleccionar</option>
															<c:forEach var="tipoRequisito" items="${model.listaTipoRequisito}" varStatus="contador">
															   <option value="${tipoRequisito.id}">${tipoRequisito.descripcion}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<div class="span6">
													<div class="control-group">
														<label class="control-label" for="descripcion">Descripción</label>	
														<div class="controls">
															<input type="text" id="idDescripcionAlcance" class="span12" placeholder="Descripción"/>															
														</div>
													</div>
												</div>
												<div class="span6">
													<div class="control-group">
														<label class="control-label" for="observacion">Observación</label>	
														<div class="controls">
															<input type="text" id="idObservacionAlcance" class="span12" placeholder="Observación"/>															
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span9"></div>
											<div class="span3">
												<a class="btn btn-small btn-info span12" onclick="agregarPlanificacionRequisito()">
													<i class="icon-plus-sign bigger-125"></i>
													Agregar Requisito
												</a>
											</div>										
										</div>
										<br>
										<table id="tablaReqProyecto" class="table table-striped table-bordered table-hover" style = "width : 100%">
											<thead>
												<tr>
													<th>Tipo</th>
													<!-- <th>Codigo</th> -->
													<th>Descripci&oacute;n</th>
													<th>Observaciones</th>
<!-- 													<th>Mockups</th> -->
													<th>Opciones</th>
												</tr>
											</thead>
				
											<tbody>
												<!-- <tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>													
												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
							</div>

							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#exclusiones" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">
										Exclusiones
									</a>
								</div>
								<div class="accordion-body collapse" id="exclusiones">
									<div class="accordion-inner">										
										<div class="row-fluid">
											<div class="control-group">
												<label class="control-label" for="descripcion">Descripción</label>	
												<div class="controls">
													<input type="text" id="idDescripcionExlclusion" class="span12" placeholder="Descripción"/>															
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span9"></div>
											<div class="span3">
												<a class="btn btn-small btn-info span12" onclick="agregarPlanificacionExclusion()">
													<i class="icon-plus-sign bigger-125"></i>
													Agregar Exclusi&oacute;n
												</a>
											</div>										
										</div>
										<br>
										<table id="tablaExclProyecto" class="table table-striped table-bordered table-hover" style= "width:100%">
											<thead>
												<tr>
													<!-- <th>Codigo</th> -->
													<th>Descripci&oacute;n</th>
													<th>Opciones</th>
												</tr>
											</thead>
				
											<tbody>
												<!-- <tr>
													<td></td>
													<td></td>
													<td></td>													
												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
							
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#supuestos" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">
										Supuestos y Consideraciones
									</a>
								</div>
								<div class="accordion-body collapse" id="supuestos">
									<div class="accordion-inner">									
										<div class="row-fluid">
											<div class="span12">
												<div class="control-group">
													<label class="control-label" for="tipo">Tipo</label>	
													<div class="controls">
														<select id="idTipoSupuesto" title="tipo">
															<option value="">Seleccionar</option>
															<c:forEach var="tipoSupuesto" items="${model.listaTipoSupuesto}" varStatus="contador">
															   <option value="${tipoSupuesto.id}">${tipoSupuesto.descripcion}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<div class="control-group">
													<label class="control-label" for="descripcion">Descripción</label>	
													<div class="controls">
														<input type="text" id="idDescripcionSupuesto" class="span12" placeholder="Descripción"/>															
													</div>
												</div>											
											</div>
										</div>
										<div class="row-fluid">
											<div class="span9"></div>
											<div class="span3">
												<a class="btn btn-small btn-info span12" onclick="agregarPlanificacionSupuesto()">
													<i class="icon-plus-sign bigger-125"></i>
													Agregar Supuesto
												</a>
											</div>										
										</div>
										<br>									
										<table id="tablaSupuestoProyecto" class="table table-striped table-bordered table-hover" style = "width: 100%">
											<thead>
												<tr>
													<th>Tipo</th>
													<th>Descripci&oacute;n</th>
													<th>Opciones</th>
												</tr>
											</thead>
				
											<tbody>
												<!-- <tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>													
												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
							
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#dependencias" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">
										Dependencias
									</a>
								</div>
								<div class="accordion-body collapse" id="dependencias">
									<div class="accordion-inner">									
										<div class="row-fluid">
											<div class="span12">
												<div class="control-group">
													<label class="control-label" for="tipo">Tipo</label>	
													<div class="controls">
														<select id="idTipoDependencia" title="tipo">
															<option value="">Seleccionar</option>
															<c:forEach var="tipoDependencia" items="${model.listaTipoDependencia}" varStatus="contador">
															   <option value="${tipoDependencia.id}">${tipoDependencia.descripcion}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<div class="control-group">
													<label class="control-label" for="descripcion">Descripción</label>	
													<div class="controls">
														<input type="text" id="idDescripcionDependencia" class="span12" placeholder="Descripción"/>															
													</div>
												</div>											
											</div>
										</div>
										<div class="row-fluid">
											<div class="span9"></div>
											<div class="span3">
												<a class="btn btn-small btn-info span12" onclick="agregarPlanificacionDependencia()">
													<i class="icon-plus-sign bigger-125"></i>
													Agregar Dependencia
												</a>
											</div>										
										</div>
										<br>
										<table id="tablaDependenciaProyecto" class="table table-striped table-bordered table-hover" style ="width:100%">
											<thead>
												<tr>
													<th>Tipo</th>
													<th>Descripci&oacute;n</th>
													<th>Opciones</th>
												</tr>
											</thead>
				
											<tbody>
												<!-- <tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>													
												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
							
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#facExito" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">
										Factores cr&iacute;ticos de &eacute;xitos
									</a>
								</div>
								<div class="accordion-body collapse" id="facExito">
									<div class="accordion-inner">
									
										<div class="row-fluid">
											<div class="control-group">
												<label class="control-label" for="descripcion">Descripción</label>	
												<div class="controls">
													<input type="text" id="idDescripcionFactorExito" class="span12" placeholder="Descripción"/>															
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span9"></div>
											<div class="span3">
												<a class="btn btn-small btn-info span12" onclick="agregarPlanificacionFactorExito()">
													<i class="icon-plus-sign bigger-125"></i>
													Agregar Factor
												</a>
											</div>										
										</div>
										<br>
										<table id="tablafactExitoProyecto" class="table table-striped table-bordered table-hover" style="width: 100%">
											<thead>
												<tr>
													<!-- <th>Codigo</th> -->
													<th>Descripci&oacute;n</th>
													<th>Opciones</th>
												</tr>
											</thead>
				
											<tbody>
												<!-- <tr>
													<td></td>
													<td></td>
													<td></td>													
												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</form>
						</div>
					</div>
					<!-- FIN - PLANIFICACION - ALCANCE  -->

					<div id="recursoHumanos" class="tab-pane">
						<div id="accordion3" class="accordion">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#OrgEquipo" data-parent="#accordion3" data-toggle="collapse" class="accordion-toggle collapsed">
										Organigrama del Equipo
									</a>
								</div>

								<div class="accordion-body in collapse" id="OrgEquipo">
									<div class="accordion-inner">
										<p><b style="font-size: 9px;">**Haga click derecho sobre el puesto para desplegar el menu</b></p>
										<div class="row-fluid">
											<div class="span12">
												<div class="widget-box span6">
													<div class="widget-header header-color-blue2">
														<h4 class="lighter smaller">Proveedor</h4>
													</div>
				
													<div class="widget-body">
														<div class="widget-main padding-8">
															<div id="arbolProveedor" class="tree"></div>
														</div>
													</div>
												</div>
												<div class="widget-box span6">
													<div class="widget-header header-color-blue2">
														<h4 class="lighter smaller">Cliente</h4>
													</div>
				
													<div class="widget-body">
														<div class="widget-main padding-8">
															<div id="arbolCliente" class="tree"></div>
														</div>
													</div>
												</div>
											</div>
										</div>										
									</div>
								</div>
							</div>
							
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#responsabilidades" data-parent="#accordion3" data-toggle="collapse" class="accordion-toggle collapsed">
										Responsabilidades
									</a>
								</div>
								<div class="accordion-body collapse" id="responsabilidades">
									<div class="accordion-inner">
										<br>
										<table id="tablafactExitoProyecto" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>Codigo</th>
													<th>Descripci&oacute;n</th>
													<th>Opciones</th>
												</tr>
											</thead>
				
											<tbody>
												<tr>
													<td></td>
													<td></td>
													<td></td>													
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div id="cronograma" class="tab-pane">
						<p>Cronograma.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
					</div>

					<div id="entregable" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="span9">Entregables del Proyecto</div>
								<div class="span3">
									<button class="btn btn-info span12">
										<i class="icon-plus bigger-125"></i>
										Agregar Entregable
									</button>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaEntregableProyecto" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Entregable</th>
										<th>Fecha</th>
										<th>Descripci&oacute;n</th>
										<th>Productos</th>
										<th>Opciones</th>
									</tr>
								</thead>	
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>	
										<td></td>
										<td></td>												
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div id="riesgos" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="span9">Riesgos del Proyecto</div>
								<div class="span3">
									<button class="btn btn-info span12">
										<i class="icon-plus bigger-125"></i>
										Agregar Riesgo
									</button>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaRiesgosProyecto" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Riesgo</th>
										<th>Responsable</th>
										<th>Impacto</th>
										<th>Probabilidad</th>
										<th>Contingencia</th>
										<th>Mitigaci&oacute;n</th>
										<th>Opciones</th>
									</tr>
								</thead>	
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>	
										<td></td>
										<td></td>		
										<td></td>
										<td></td>											
									</tr>
								</tbody>
							</table>
						</div>
<!-- 						<div class="space-20"></div> -->
						<br>
						<div class="row-fluid">
							<div class="span12">
								<fieldset>
								  <legend style="font-size: 10px;margin-bottom: 0px;">LEYENDA IMPACTO</legend>
								
								  <div class="span1"></div>
								  <div class="span2"><label class="leyendaClass">5 - Muy bajo.</label></div>
								  <div class="span2"><label class="leyendaClass">10 - Bajo.</label></div>
								  <div class="span2"><label class="leyendaClass">20 - Moderado.</label></div>
								  <div class="span2"><label class="leyendaClass">40 - Alto.</label></div>
								  <div class="span2"><label class="leyendaClass">80 - Muy alto.</label></div>
									  <div class="span1"></div>
								</fieldset>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<fieldset>
								  <legend style="font-size: 10px;margin-bottom: 0px;">LEYENDA PROBABILIDAD</legend>
								
								  <div class="span1"></div>
								  <div class="span2"><label class="leyendaClass">10 - Muy bajo.</label></div>
								  <div class="span2"><label class="leyendaClass">30 - Bajo.</label></div>
								  <div class="span2"><label class="leyendaClass">50 - Moderado.</label></div>
								  <div class="span2"><label class="leyendaClass">70 - Alto.</label></div>
								  <div class="span2"><label class="leyendaClass">90 - Muy alto.</label></div>
								  <div class="span1"></div>
								</fieldset>
							</div>
						</div>
					</div>

					<div id="adquisiciones" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="span9">Adquisiciones para el Proyecto</div>
								<div class="span3">
									<button class="btn btn-info span12">
										<i class="icon-plus bigger-125"></i>
										Agregar Adquisici&oacute;n
									</button>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaAdquisicionesProyecto" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Producto</th>
										<th>Categor&iacute;a</th>
										<th>Cantidad</th>
										<th>Costo Un.</th>
										<th>Fecha de Adquisici&oacute;n</th>
										<th>Opciones</th>
									</tr>
								</thead>	
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>	
										<td></td>
										<td></td>
										<td></td>												
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div id="costos" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="span9">Costos del Proyecto</div>
								<div class="span3">
									<label>TOTAL COSTOS: S/. xxx.xx</label>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaCostosProyecto" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Rol</th>
										<th>Tipo</th>
										<th>Banda Salarial</th>
										<th>Costo</th>
									</tr>
								</thead>	
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>	
										<td></td>												
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div id="costosOperativos" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="span8">Costos Operativos</div>
								<div class="span4">
									<button class="btn btn-info span12">
										<i class="icon-plus bigger-125"></i>
										Agregar Costo operativo
									</button>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaCostosProyecto" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Tipo</th>
										<th>Descripci&oacute;n</th>
										<th>Fecha</th>
										<th>Monto</th>
										<th>Opciones</th>
									</tr>
								</thead>	
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>	
										<td></td>	
										<td></td>												
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div id="presupuesto" class="tab-pane">
						<p>"presupuesto"	.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
					</div>

					<div id="formasdePago" class="tab-pane">
						<p>"formasdePago"	.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
					</div>

					<div id="contrato" class="tab-pane">
						<p>"contrato".</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 	<div class="space-20"></div> -->
<!-- 	Jr. Leon Velarde -->

	<!-- INI - MODAL ELIMINAR REQUISITO PROYECTO TABLA-->
	<div id="modalEliminarRequisitoProyecto" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar requisito?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarRequisitoProyecto" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>

	</div>
	<!-- FIN - MODAL ELIMINAR REQUISITO PROYECTO TABLA-->
	
	<!-- INI - MODAL ELIMINAR EXCLUSIONES TABLA-->
	<div id="modalEliminarExclusiones" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar exclusión?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarExclusion" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>

	</div>
	<!-- FIN - MODAL ELIMINAR EXCLUSIONES TABLA-->
	
	<!-- INI - MODAL ELIMINAR SUPUESTO TABLA-->
	<div id="modalEliminarSupuesto" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar supuesto?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarSupuesto" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>

	</div>
	<!-- FIN - MODAL ELIMINAR SUPUESTO TABLA-->
	
	<!-- INI - MODAL ELIMINAR DEPENDENCIA TABLA-->
	<div id="modalEliminarDependencia" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar dependencia?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarDependencia" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>

	</div>
	<!-- FIN - MODAL ELIMINAR DEPENDENCIA TABLA-->	
	
	<!-- INI - MODAL ELIMINAR FACTOR EXITO TABLA-->
	<div id="modalEliminarFactorExito" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar factor de éxito?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarFactorExito" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>

	</div>
	<!-- FIN - MODAL ELIMINAR FACTOR EXITO TABLA-->	

</div>	