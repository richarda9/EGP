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
						<a data-toggle="tab" href="#costosOperaciones">
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
					<div id="dscProducto" class="tab-pane in active">
						<br>
						<div class="wysiwyg-editor" id="editor1"></div>
					</div>

					<div id="alcance" class="tab-pane">
						<div id="accordion2" class="accordion">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#definicionAlcance" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">
										Definici&oacute;n del Alcance
									</a>
								</div>

								<div class="accordion-body in collapse" id="definicionAlcance">
									<div class="accordion-inner">
										<br>
										<div class="wysiwyg-editor" id="editor2"></div>
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
											<div class="span4">
												<button class="btn btn-info span12">
													<i class="icon-plus bigger-125"></i>
													Agregar Requisito
												</button>
											</div>
										</div>
										<br>
										<table id="tablaReqProyecto" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>Tipo</th>
													<th>Codigo</th>
													<th>Descripci&oacute;n</th>
													<th>Observaciones</th>
<!-- 													<th>Mockups</th> -->
													<th>Opciones</th>
												</tr>
											</thead>
				
											<tbody>
												<tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
<!-- 													<td></td> -->
													<td></td>													
												</tr>
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
											<div class="span4">
												<button class="btn btn-info span12">
													<i class="icon-plus bigger-125"></i>
													Agregar Exclusi&oacute;n
												</button>
											</div>
											<div class="span4">
												<button class="btn btn-info span12">
													<i class="icon-plus bigger-125"></i>
													Importar Plantilla
												</button>
											</div>
										</div>
										<br>
										<table id="tablaExclProyecto" class="table table-striped table-bordered table-hover">
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
							
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#supuestos" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">
										Supuestos y Consideraciones
									</a>
								</div>
								<div class="accordion-body collapse" id="supuestos">
									<div class="accordion-inner">
										<div class="row-fluid">
											<div class="span4">
												<button class="btn btn-info span12">
													<i class="icon-plus bigger-125"></i>
													Agregar Supuesto
												</button>
											</div>
											<div class="span4">
												<button class="btn btn-info span12">
													<i class="icon-plus bigger-125"></i>
													Importar Plantilla
												</button>
											</div>
										</div>
										<br>
										<table id="tablaSupuestoProyecto" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>Tipo</th>
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
													<td></td>													
												</tr>
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
											<div class="span4">
												<button class="btn btn-info span12">
													<i class="icon-plus bigger-125"></i>
													Agregar Dependencia
												</button>
											</div>
											<div class="span4">
												<button class="btn btn-info span12">
													<i class="icon-plus bigger-125"></i>
													Importar Plantilla
												</button>
											</div>
										</div>
										<br>
										<table id="tablaDependenciaProyecto" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>Tipo</th>
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
													<td></td>													
												</tr>
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
											<div class="span4">
												<button class="btn btn-info span12">
													<i class="icon-plus bigger-125"></i>
													Agregar Factor Exito
												</button>
											</div>
											<div class="span4">
												<button class="btn btn-info span12">
													<i class="icon-plus bigger-125"></i>
													Importar Plantilla
												</button>
											</div>
										</div>
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

					<div id="recursoHumanos" class="tab-pane">
						<div id="accordion2" class="accordion">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#OrgEquipo" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">
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
									<a href="#responsabilidades" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">
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
						<p>riesgos.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
					</div>

					<div id="adquisiciones" class="tab-pane">
						<p>"adquisiciones"	.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
					</div>

					<div id="costos" class="tab-pane">
						<p>"costos"	.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
					</div>

					<div id="costosOperativos" class="tab-pane">
						<p>"costosOperativos"	.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
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
</div>	