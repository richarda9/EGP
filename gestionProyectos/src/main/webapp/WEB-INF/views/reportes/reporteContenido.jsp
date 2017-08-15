<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<div class="span12">
			<div class="tabbable tabs-left">
				
				<ul class="nav nav-tabs">
<!-- 					<li class="active"> -->
<!-- 						<a data-toggle="tab" href="#rptCarteraClientes"> -->
<!-- 							Cartera de Clientes -->
<!-- 						</a> -->
<!-- 					</li> -->
					<li class="active">
						<a data-toggle="tab" href="#rptProyectos">
							Reporte de Proyectos
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#rptTareasxProyecto">
							Reporte Tareas por Proyecto
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#rptEntregablexProyecto">
							Reporte de Entregables por Proyecto
						</a>
					</li>

<!-- 					<li> -->
<!-- 						<a data-toggle="tab" href="#rptRecursoxProyecto"> -->
<!-- 							Reporte de Recursos por Proyecto -->
<!-- 						</a> -->
<!-- 					</li> -->

<!-- 					<li> -->
<!-- 						<a data-toggle="tab" href="#agenda"> -->
<!-- 							Agenda -->
<!-- 						</a> -->
<!-- 					</li> -->

<!-- 					<li> -->
<!-- 						<a data-toggle="tab" href="#crtlCambios"> -->
<!-- 							Control de Cambios -->
<!-- 						</a> -->
<!-- 					</li> -->

<!-- 					<li> -->
<!-- 						<a data-toggle="tab" href="#infAvance"> -->
<!-- 							Informe de Avance -->
<!-- 						</a> -->
<!-- 					</li> -->
				</ul>
				<div class="tab-content">
<!-- 					<div id="rptCarteraClientes" class="tab-pane in active"> -->
<!-- 						<div class="row-fluid"> -->
<!-- 							<div class="span12"> -->
<!-- 								<form id="formBsqEjecucion" class="form-horizontal"> -->
<!-- 									<div class="control-group"> -->
<!-- 										<label class="control-label" for="proyecto">Proyecto</label>	 -->
<!-- 										<div class="controls"> -->
<!-- 											<select id="proyecto" name="idProyecto" title="proyecto"> -->
<!-- 												<option value="">Seleccionar</option> -->
<!-- 											</select>	 -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="control-group"> -->
<!-- 										<label class="control-label" for="idcliente">Empresa</label>	 -->
<!-- 										<div class="controls"> -->
<!-- 											<select id="idcliente" name="idCliente" title="cliente"> -->
<!-- 												<option value="">Seleccionar</option> -->
<!-- 											</select>	 -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="control-group"> -->
<!-- 										<label class="control-label" for="idTipoProyecto">Tipo de Proyecto</label>	 -->
<!-- 										<div class="controls"> -->
<!-- 											<select id="idTipoProyecto" name="idTipoProyecto" title="idTipoProyecto"> -->
<!-- 												<option value="">Seleccionar</option> -->
<!-- 											</select>	 -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="control-group"> -->
<!-- 										<label class="control-label" for="dscResponsable">Responsable</label> -->
<!-- 										<div class="controls">					 -->
<!-- 											<select id="idResponsableProyecto" name="idResponsableProyecto"> -->
<!-- 												<option value="">Seleccionar</option> -->
<!-- 											</select> -->
<!-- 										</div> -->
<!-- 									</div> -->
									
<!-- 									<div class="control-group"> -->
<!-- 										<label class="control-label" for="fechaInicio">Fecha Inicio</label> -->
					
<!-- 										<div class="controls"> -->
<!-- 											<div class="row-fluid input-append"> -->
<!-- 												<input id="fechaInicio" name="fechaInicio" type="text" data-date-format="dd-mm-yyyy" /> -->
<!-- 												<span class="add-on"> -->
<!-- 													<i class="icon-calendar"></i> -->
<!-- 												</span> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="control-group"> -->
<!-- 										<label class="control-label" for="fechafin">Fecha Fin</label> -->
					
<!-- 										<div class="controls"> -->
<!-- 											<div class="row-fluid input-append"> -->
<!-- 												<input id="fechafin" name="fechaFin" type="text" data-date-format="dd-mm-yyyy" /> -->
<!-- 												<span class="add-on"> -->
<!-- 													<i class="icon-calendar"></i> -->
<!-- 												</span> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="row-fluid"> -->
<!-- 										<div class="span12"> -->
<!-- 											<div class="span2" > -->
<!-- 												<button type="submit" class="btn btn-small btn-primary" style="float: right;"> -->
<!-- 													<i class="icon-search"></i> -->
<!-- 													Buscar -->
<!-- 												</button> -->
<!-- 											</div> -->
<!-- 											<div class="span2" > -->
<!-- 												<button class="btn btn-small btn-primary" style="float: left;"> -->
<!-- 													<i class=" icon-download-alt"></i> -->
<!-- 													Exportar -->
<!-- 												</button> -->
<!-- 											</div> -->
<!-- 										</div>							 -->
<!-- 									</div> -->
<!-- 								</form> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div id="rptProyectos" class="tab-pane in active">
						<div class="row-fluid">
							<div class="span12">
								<form id="formRptProyectos" class="form-horizontal" >									
									<div class="control-group">
										<label class="control-label" for="idcliente">Empresa</label>	
										<div class="controls">
											<select id="idcliente" name="idCliente" title="cliente">
												<option value="">Seleccionar</option>
												<c:forEach var="lista" items="${model.listaEmpresa}">
												   <option value="${lista.idEmpresa}">${lista.razonSocial}</option>
												</c:forEach>
											</select>	
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="idTipoProyecto">Tipo de Proyecto</label>	
										<div class="controls">
											<select id="idTipoProyecto" name="idTipoProyecto">
												<option value="">Seleccionar</option>
												<c:forEach var="lista" items="${model.listaTipoProyecto}">
												   <option value="${lista.id}">${lista.descripcion}</option>
												</c:forEach>
											</select>	
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="estadoProyecto">Estado Proyecto</label>
										<div class="controls">					
											<select id="estadoProyecto" name="idEstadoProyecto">
												<option value="">Seleccionar</option>
												<c:forEach var="lista" items="${model.listaEstadoProyecto}">
												   <option value="${lista.id}">${lista.descripcion}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="estadoRegistro">Estado Registro</label>
										<div class="controls">					
											<select id="estadoRegistro" name="estadoRegistro">
												<option value="">Seleccionar</option>
												<option value="1" selected="selected">ACTIVO</option>
												<option value="0">INACTIVO</option>
											</select>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label" for="fechaInicioProyecto">Fecha Inicio</label>
					
										<div class="controls">
											<div class="row-fluid input-append">
												<input id="fechaInicioProyecto" name="fechaInicioProyecto" type="text" data-date-format="dd-mm-yyyy" />
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="fechafinProyecto">Fecha Fin</label>
					
										<div class="controls">
											<div class="row-fluid input-append">
												<input id="fechafinProyecto" name="fechafinProyecto" type="text" data-date-format="dd-mm-yyyy" />
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span12">
											<div class="span2" >
												<a onclick="descargarRptProyectosPDf();" class="btn btn-small btn-primary" style="float: right;">
													<i class="icon-download-alt"></i>
													Exportar PDF
												</a>
											</div>
<!-- 											<div class="span2"> -->
<!-- 												<a href="/gestionProyectos/temp/infoProyectos-20170811221540415.htm" class="btn btn-small btn-primary" style="float: left;" -->
<!-- 												   target="_blank"> -->
<!-- 													<i class=" icon-download-alt"></i> -->
<!-- 													Exportar Excel -->
<!-- 												</a> -->
<!-- 											</div> -->
										</div>							
									</div>
								</form>
							</div>
						</div>
					</div>
					<div id="rptTareasxProyecto" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<form id="formRptTareasxProyectos" class="form-horizontal">									
									<div class="control-group">
										<label class="control-label" for="idProyectoTareas">Proyecto</label>	
										<div class="controls">
											<select id="idProyectoTareas" name="idProyecto">
													<option value="">Seleccionar</option>
													<c:forEach var="lista" items="${model.listaProyecto}" varStatus="contador">
													   <option value="${lista.idProyecto}">${lista.nombreProyecto}</option>
													</c:forEach>
											</select>	
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="idEstadoTarea">Estado Tarea</label>	
										<div class="controls">
											<select id="idEstadoTarea" name="idEstadoTarea">
												<option value="">Seleccionar</option>
												<c:forEach var="lista" items="${model.listaEstadoTarea}" varStatus="contador">
												   <option value="${lista.id}">${lista.descripcion}</option>
												</c:forEach>
											</select>	
										</div>
									</div>									
									<div class="control-group">
										<label class="control-label" for="fechaInicioTareaProyecto">Fecha Inicio</label>
					
										<div class="controls">
											<div class="row-fluid input-append">
												<input id="fechaInicioTareaProyecto" name="fechaInicio" type="text" data-date-format="dd-mm-yyyy" />
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="fechafinTareaProyecto">Fecha Fin</label>
					
										<div class="controls">
											<div class="row-fluid input-append">
												<input id="fechafinTareaProyecto" name="fechaFin" type="text" data-date-format="dd-mm-yyyy" />
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span12">
											<div class="span2" >
												<a onclick="descargarRptTareasxProyectoPDF();" class="btn btn-small btn-primary" style="float: right;">
													<i class="icon-download-alt"></i>
													Exportar PDF
												</a>
											</div>
<!-- 											<div class="span2" > -->
<!-- 												<a href="/gestionProyectos/temp/infoProyectos-20170811221540415.htm" class="btn btn-small btn-primary" style="float: left;" -->
<!-- 												   target="_blank"> -->
<!-- 													<i class=" icon-download-alt"></i> -->
<!-- 													Exportar Excel -->
<!-- 												</a> -->
<!-- 											</div> -->
										</div>							
									</div>
								</form>
							</div>
						</div>
					</div>
					<div id="rptEntregablexProyecto" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<form id="formRptEntregablesxProyectos" class="form-horizontal">									
									<div class="control-group">
										<label class="control-label" for="idProyectoEntregable">Proyecto</label>	
										<div class="controls">
											<select id="idProyectoEntregable" name="idProyecto" title="Proyecto">
													<option value="">Seleccionar</option>
													<c:forEach var="lista" items="${model.listaProyecto}">
													   <option value="${lista.idProyecto}">${lista.nombreProyecto}</option>
													</c:forEach>
											</select>	
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="idEstadoEntregable">Estado Entregable</label>	
										<div class="controls">
											<select id="idEstadoEntregable" name="idEstadoEntregable">
												<option value="">Seleccionar</option>
												<c:forEach var="lista" items="${model.listaEstadoEntregable}">
												   <option value="${lista.id}">${lista.descripcion}</option>
												</c:forEach>
											</select>	
										</div>
									</div>									
<!-- 									<div class="control-group"> -->
<!-- 										<label class="control-label" for="fechaInicioProyecto">Fecha Inicio</label> -->
					
<!-- 										<div class="controls"> -->
<!-- 											<div class="row-fluid input-append"> -->
<!-- 												<input id="fechaInicioProyecto" name="fechaInicioProyecto" type="text" data-date-format="dd-mm-yyyy" /> -->
<!-- 												<span class="add-on"> -->
<!-- 													<i class="icon-calendar"></i> -->
<!-- 												</span> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="control-group"> -->
<!-- 										<label class="control-label" for="fechafinProyecto">Fecha Fin</label> -->
					
<!-- 										<div class="controls"> -->
<!-- 											<div class="row-fluid input-append"> -->
<!-- 												<input id="fechafinProyecto" name="fechafinProyecto" type="text" data-date-format="dd-mm-yyyy" /> -->
<!-- 												<span class="add-on"> -->
<!-- 													<i class="icon-calendar"></i> -->
<!-- 												</span> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
									<div class="row-fluid">
										<div class="span12">
											<div class="span2" >
												<a onclick="descargarRptEntregablesxProyectoPDF();" class="btn btn-small btn-primary" style="float: right;">
													<i class="icon-download-alt"></i>
													Exportar PDF
												</a>
											</div>
<!-- 											<div class="span2" > -->
<!-- 												<a href="/gestionProyectos/temp/infoProyectos-20170811221540415.htm" class="btn btn-small btn-primary" style="float: left;" -->
<!-- 												   target="_blank"> -->
<!-- 													<i class=" icon-download-alt"></i> -->
<!-- 													Exportar Excel -->
<!-- 												</a> -->
<!-- 											</div> -->
										</div>							
									</div>
								</form>
							</div>
						</div>
					</div>
<!-- 					<div id="rptRecursoxProyecto" class="tab-pane"> -->
<!-- 						<div class="row-fluid"> -->
<!-- 						rptRecursoxProyecto -->
<!-- 						</div> -->
<!-- 					</div>					 -->
				</div>
			</div>
		</div>
	</div>
</div>