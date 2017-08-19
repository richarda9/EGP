<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<input id="idProyectoGeneral" name="idProyecto" type="hidden" value="${model.idProyecto}" />
		<div class="span12">
			<div class="tabbable tabs-left">
				<ul class="nav nav-tabs" id="myTab3">
					<li class="active"><a data-toggle="tab" href="#cierre"> 
						Cierre
					</a></li>

					<li><a data-toggle="tab" href="#leccionesAprendidas"> 
						Lecciones Aprendidas
					</a></li>

					<li><a data-toggle="tab" href="#actaCierre"> 
						Acta de Cierre
					</a></li>
				</ul>

				<div class="tab-content">
					<div id="cierre" class="tab-pane in active">
						<div class="row-fluid">
							<div class="span12">
								<form:form  class="form-horizontal" action="registrar_cierreProyecto.htm" modelAttribute="registrarProyectoCierre" method="POST">
									<form:input path="idProyecto" type="hidden" value="${model.idProyecto}" />
									<div class="control-group">
										<label class="control-label" for="fechaCierre">Fecha de Cierre</label>
					
										<div class="controls">
											<div class="row-fluid input-append">
												<form:input id="fechaCierreProyecto" type="text" path="fechaCierreProyecto" data-date-format="dd-mm-yyyy" />
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="comentariosCierreProyecto">Comentarios</label>
					
										<div class="controls">
											<form:textarea id="comentariosCierreProyecto" path="comentariosCierreProyecto"
												class="span6" rows="5" cols="20"></form:textarea>
										</div>
									</div>
									<div class="form-actions">
										<button class="btn btn-small btn-primary" type="submit">
											<i class="icon-save bigger-110"></i>
											Guardar
										</button>
					
										&nbsp; &nbsp; &nbsp;
										<button class="btn btn-small" type="reset">
											<i class="icon-undo bigger-110"></i>
											Limpiar
										</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>

					<div id="leccionesAprendidas" class="tab-pane">					
						<div class="row-fluid">
							<div class="page-header position-relative">
								<h1>Lecciones Aprendidas</h1>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<div class="span12">
								<form class="form-horizontal">
									<div class="control-group">
										<label class="control-label" for="idEntregable">Entregable</label>
					
										<div class="controls">
											<select id="idEntregable" name="idEntregable" class="span4" title="Tipo de Proyecto">
												<option value="">Seleccionar</option>
												<c:forEach var="entregable" items="${model.listaEntregable}" varStatus="contador">
												   <option value="${entregable.identregable}">${entregable.nombre}</option>
												</c:forEach>												
											</select>	
										</div>
									</div>
								</form>
							</div>
						</div>
						
						<div class="row-fluid">
							<div class="span12">
								<div class="span4"></div>
								<div class="span8">
									<div class="span3" >
										<button class="btn btn-small btn-primary" id="btnBuscarLecAprendida">
											<i class="icon-search"></i>
											Buscar
										</button>
									</div>
									<div class="span3">
										<a href="#mntLeccionAprendida" id="btnAgregarLecAprendida" role="button" class="btn btn-small btn-primary" data-toggle="modal">
											<i class="icon-plus"></i>Agregar 
										</a>
									</div>
<!-- 									<div class="span3" > -->
<!-- 										<button class="btn btn-small btn-primary"> -->
<!-- 											<i class=" icon-download-alt"></i> -->
<!-- 											Exportar -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 									<div class="span3" > -->
<!-- 										<button class="btn btn-small btn-primary"> -->
<!-- 											<i class=" icon-print"></i> -->
<!-- 											Imprimir -->
<!-- 										</button> -->
<!-- 									</div> -->
								</div>
							</div>							
						</div>
						
						<div class="space-20"></div>
						<div class="row-fluid">
							<div class="table-header">Lista Lecciones Aprendidas</div>
							<table id="tablaLecAprendidasProyecto" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center"><label>Id</label></th>
										<th>Entregable Afectado</th>
										<th>Descripci&oacute;n Problema</th>
										<th>Causa</th>
										<th>Acci&oacute;n Correctiva</th>
										<th>Resultado Obtenido</th>
										<th>Lecci&oacute;n Aprendida</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="leccionesAprendidas" items="${model.listaLeccionesAprendidas}" varStatus="contador">
										<tr>
											<td><c:out value="${leccionesAprendidas.codLeccionAprendida}"/></td>
											<td><c:out value="${leccionesAprendidas.nombreEntregable}"/></td>
											<td><c:out value="${leccionesAprendidas.dscproblema}"/></td>
											<td><c:out value="${leccionesAprendidas.dsccausa}"/></td>
											<td><c:out value="${leccionesAprendidas.dsccorrelativa}"/></td>
											<td><c:out value="${leccionesAprendidas.dscobtenido}"/></td>
											<td><c:out value="${leccionesAprendidas.dscaprendida}"/></td>											
											<td class="td-actions">
												<!-- [INI] BOTON EDITAR -->
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="blue tooltip-info" href="#mntLeccionAprendida" data-toggle="modal" data-id="${leccionesAprendidas.idLeccionAprendida}" 
													   data-rel="tooltip" title="Editar" onclick="editarLeccionAprendida(${leccionesAprendidas.idLeccionAprendida})">
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
																<a href="#mntLeccionAprendida" class="tooltip-info" onclick="editarLeccionAprendida(${leccionesAprendidas.idLeccionAprendida})" 
																	data-rel="tooltip" title="Editar" data-toggle="modal" data-id="${leccionesAprendidas.idLeccionAprendida}">
																	<span class="blue">
																		<i class="icon-edit bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
												<!-- [FIN] BOTON EDITAR -->
												<!-- [INI] BOTON ELIMINAR -->
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="red tooltip-error" href="#eliminarLeccionAprendida" data-toggle="modal" data-id="${leccionesAprendidas.idLeccionAprendida}" 
													   data-rel="tooltip" title="Eliminar" onclick="eliminarLeccionAprendida(${leccionesAprendidas.idLeccionAprendida})">
														<i class="icon-trash bigger-130"></i>
													</a>
												</div>
		
												<div class="hidden-desktop visible-phone">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
															<i class="icon-caret-down icon-only bigger-120"></i>
														</button>
		
														<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li>
																<a href="#eliminarLeccionAprendida" class="tooltip-error" onclick="eliminarLeccionAprendida(${leccionesAprendidas.idLeccionAprendida})" 
																	data-rel="tooltip" title="Eliminar" data-toggle="modal" data-id="${leccionesAprendidas.idLeccionAprendida}">
																	<span class="red">
																		<i class="icon-trash bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
												<!-- [FIN] BOTON ELIMINAR -->
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<div id="actaCierre" class="tab-pane">
						<div class="row-fluid">
							<div class="row-fluid">
								<div class="page-header position-relative">
									<h1>Acta de cierre</h1>
								</div>
							</div>
							<div class="space-20"></div>
							<div class="row-fluid">
								<div class="row-fluid">
									<div class="span12">
										<div class="span6"></div>
										<div class="span6">
											<div class="row-fluid">
												<div class="span6"></div>
												<div class="span6">
													<a href="#modal-ActaCierre" id="btnAgregarActaCierre" role="button" class="btn btn-small btn-primary" data-toggle="modal">
														<i class="icon-plus"></i>Agregar 
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="space-20"></div>
								<div class="table-header">Lista Acta de cierre</div>
								<table id="tablaCierreProyecto" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>Versi&oacute;n</th>
											<th>Sponsor</th>
											<th>Elaborado por</th>
											<th>Fecha de Elaboraci&oacute;n</th>
											<th>Opciones</th>
										</tr>
									</thead>
									<tbody>
									
										<c:forEach var="actaCierre" items="${model.listaActaCierre}" varStatus="contador">
											<tr>
												<td class="center">
													<label><c:out value="${actaCierre.versionActa}"></c:out></label>
												</td>
												<td><c:out value="${actaCierre.dscSponsor}"></c:out></td>
												<td><c:out value="${actaCierre.responsable}"></c:out></td>
												<td><c:out value="${actaCierre.fechaElaboracion}"></c:out></td>
											<td class="td-actions">
												<c:if test="${actaCierre.envioCorreo ==  0}">
													<!-- [INI] BOTON EDITAR -->
													<div class="hidden-phone visible-desktop action-buttons">
														<a class="blue tooltip-info" href="#modal-ActaCierre" data-toggle="modal" data-id="${actaCierre.idActaCierre}" 
														   data-rel="tooltip" title="Editar" onclick="editarActaCierre(${actaCierre.idActaCierre})">
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
																	<a href="#modal-ActaCierre" class="tooltip-info" data-rel="tooltip" onclick="editarActaCierre(${actaCierre.idActaCierre})"
																		title="Editar" data-toggle="modal" data-id="${actaCierre.idActaCierre}">
																		<span class="blue">
																			<i class="icon-edit bigger-120"></i>
																		</span>
																	</a>
																</li>
															</ul>
														</div>
													</div>
													<!-- [FIN] BOTON EDITAR -->
												</c:if>
												<!-- [INI] BOTON IMPRIMIR -->
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="blue tooltip-info" href="#modal-VisualizarCertificacion" data-toggle="modal" data-id="${actaCierre.idActaCierre}" 
													   data-rel="tooltip" title="Imprimir">
														<i class="icon-print bigger-130"></i>
													</a>
												</div>
	
												<div class="hidden-desktop visible-phone">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
															<i class="icon-caret-down icon-only bigger-120"></i>
														</button>
	
														<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li>
																<a href="#modal-VisualizarCertificacion" class="tooltip-info" data-rel="tooltip" 
																	title="Imprimir" data-toggle="modal" data-id="${actaCierre.idActaCierre}">
																	<span class="blue">
																		<i class="icon-print bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
												<!-- [FIN] BOTON IMPRIMIR -->
												<!-- [INI] BOTON ENVIAR CORREO -->
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="blue tooltip-info" href="#modal-EnviarCertificacion" data-toggle="modal" data-id="${actaCierre.idActaCierre}" 
													   data-rel="tooltip" title="Enviar por Correo">
														<i class="icon-envelope bigger-130"></i>
													</a>
												</div>
	
												<div class="hidden-desktop visible-phone">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
															<i class="icon-caret-down icon-only bigger-120"></i>
														</button>
	
														<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li>
																<a href="#modal-EnviarCertificacion" class="abrir-eliminarTproyecto tooltip-info" data-rel="tooltip" 
																	title="Enviar por Correo" data-toggle="modal" data-id="${actaCierre.idActaCierre}">
																	<span class="blue">
																		<i class="icon-envelope bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
												<!-- [FIN] BOTON ENVIAR CORREO -->
											</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- [INI] ELIMINAR LECCION APRENDIDA -->
	<form id="formEliminarLeccionAprendida">
		<div id="eliminarLeccionAprendida" class="modal hide fade" tabindex="-1">
			<div class="modal-header no-padding">
				<div class="table-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>

			<div class="modal-body padding">
				<b style="text-align: center">¿SEGURO DE ELIMINAR? </b> <input
					type="hidden" name="idLeccionAprendida" id="idLeccionAprendidaEliminar" />
			</div>

			<div class="modal-footer">
				<button class="btn btn-small btn-primary" type="submit">
					<i class="icon-ok"></i> Confirmar
				</button>
				<button class="btn btn-small btn-light" data-dismiss="modal">
					<i class="icon-remove"></i> Salir
				</button>
			</div>

		</div>
	</form>
	<!-- [FIN] ELIMINAR LECCION APRENDIDA -->
	
	<%@ include file="/WEB-INF/views/ventanasEmergentes/cierre/registroLeccionesAprendidas.jsp"%>
	<%@ include file="/WEB-INF/views/ventanasEmergentes/cierre/registroActaCierre.jsp"%>
</div>
