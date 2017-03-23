<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<div class="span12">
			<div class="tabbable tabs-left">
				<ul class="nav nav-tabs" id="myTab3">
					<li class="active"><a data-toggle="tab" href="#home3"> 
						Cierre
					</a></li>

					<li><a data-toggle="tab" href="#profile3"> 
						Lecciones Aprendidas
					</a></li>

					<li><a data-toggle="tab" href="#dropdown13"> 
						Acta de Cierre
					</a></li>
				</ul>

				<div class="tab-content">
					<div id="home3" class="tab-pane in active">
						<div class="row-fluid">
							<div class="span12">
								<form class="form-horizontal">
									<div class="control-group">
										<label class="control-label" for="fechaCierre">Fecha de Cierre</label>
					
										<div class="controls">
											<div class="row-fluid input-append">
												<input id="fechaCierre" type="text" data-date-format="dd-mm-yyyy" />
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="valorcompra">Compra</label>
					
										<div class="controls">
											<textarea class="span6" rows="5" cols="20"></textarea>
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
					</div>

					<div id="profile3" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<form class="form-horizontal">
									<div class="control-group">
										<label class="control-label" for="idEntregable">Entregable</label>
					
										<div class="controls">
											<select id="idEntregable" name="idEntregable" class="span6" title="Tipo de Proyecto">
												<option value="">Seleccionar</option>
											</select>	
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<div class="span4"></div>
								<div class="span2" style="float: left;">
									<button class="btn btn-info">
										<i class="icon-search bigger-125"></i>
										Buscar
									</button>
								</div>
								<div class="span2" style="float: left;">
									<button class="btn btn-info">
										<i class=" icon-download-alt bigger-125"></i>
										Exportar
									</button>
								</div>
								<div class="span2" style="float: left;">
									<button class="btn btn-info">
										<i class="icon-print bigger-125"></i>
										Imprimir
									</button>
								</div>
								<div class="span2" style="float: left;">
									<a class="btn btn-info" href="#mntLeccionAprendida" data-toggle="modal">
										<i class="icon-file bigger-125"></i>
										Agregar
									</a>
								</div>
							</div>							
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<div class="table-header">&nbsp;</div>
							<table id="tablaEstadoProyecto"
								class="table table-striped table-bordered table-hover">
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
									<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td class="td-actions">
										<!-- [INI] EDITAR -->
										<div class="hidden-phone visible-desktop action-buttons">
											<a class="abrir-eliminarEproyecto"
												href="#mntLeccionAprendida" data-toggle="modal"
												data-id="${estadoProyecto.id}"> <i
												class="icon-edit bigger-130" data-rel="tooltip"
												title="Editar"> </i>
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
													<li><a href="#mntLeccionAprendida"
														class="abrir-eliminarEproyecto tooltip-error"
														data-rel="tooltip" title="Editar" data-toggle="modal"
														data-id="${estadoProyecto.id}"> <span class="blue">
																<i class="icon-edit bigger-120"></i>
														</span>
													</a></li>
												</ul>
											</div>
										</div>
										<!-- [FIN] EDITAR -->
										<!-- [INI] ELIMINAR -->
										<div class="hidden-phone visible-desktop action-buttons">
											<a class="abrir-eliminarEproyecto red"
												href="#eliminarLeccionAprendida" data-toggle="modal"
												data-id="${estadoProyecto.id}"> <i
												class="icon-trash bigger-130" data-rel="tooltip"
												title="Cancelar"> </i>
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
													<li><a href="#eliminarLeccionAprendida"
														class="abrir-eliminarEproyecto tooltip-error"
														data-rel="tooltip" title="Cancelar" data-toggle="modal"
														data-id="${estadoProyecto.id}"> <span class="red">
																<i class="icon-trash bigger-120"></i>
														</span>
													</a></li>
												</ul>
											</div>
										</div>
										<!-- [FIN] ELIMINAR -->
									</td>
									</tr>
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
											<td></td>
											<td></td>
											<td></td>
											<td class="td-actions">
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="abrir-eliminarEproyecto red"
														href="../cierre/mntCierre.htm?idcierre=1" data-toggle="modal"
														data-id="${estadoProyecto.id}"> <i
														class="icon-edit bigger-130" data-rel="tooltip"
														title="Cancelar"> </i>
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
															<li><a href="../cierre/mntCierre.htm?idcierre=1"
																class="abrir-eliminarEproyecto tooltip-error"
																data-rel="tooltip" title="Cancelar" data-toggle="modal"
																data-id="${estadoProyecto.id}"> <span class="red">
																		<i class="icon-edit bigger-120"></i>
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

					<div id="dropdown13" class="tab-pane">
						<p>Etsy mixtape wayfarers, ethical wes anderson tofu before
							they sold out mcsweeney's organic lomo retro fanny pack lo-fi
							farm-to-table readymade.</p>
						<p>Raw denim you probably haven't heard of them jean shorts
							Austin.</p>
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
					type="hidden" name="idLeccionAprendida" id="idLeccionAprendida" />
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
	<!-- [INI] AGREGAR Y/O EDITAR LECCION APRENDIDA -->
	<form id="formMntLeccionAprendida" class="form-horizontal">
		<div id="mntLeccionAprendida" class="modal hide fade" tabindex="-1">
			<div class="modal-header padding">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">Mantenimiento Lecciones Aprendidas</h4>
			</div>

			<div class="modal-body padding">
				<div class="control-group">
					<label class="control-label" for="dscEntregableAfectado">Entregable Afectado</label>

					<div class="controls">
						<select id="dscEntregableAfectado" name="dscEntregableAfectado" title="Entregable Afectado">
							<option value="">Seleccionar</option>
						</select>	
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="dscproblema">Descripci&oacute;n del problema</label>

					<div class="controls">
						<textarea id="dscproblema" rows="5"></textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="dsccausa">Causa</label>

					<div class="controls">
						<textarea id="dsccausa" rows="5"></textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="dsccorrelativa">Acci&oacute;n Correlativa</label>

					<div class="controls">
						<textarea id="dsccorrelativa" rows="5"></textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="dscobtenido">Resultado Obtenido</label>

					<div class="controls">
						<textarea id="dscobtenido" rows="5"></textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="dscaprendida">Lecci&oacute;n Aprendida</label>

					<div class="controls">
						<textarea id="dscaprendida" rows="5"></textarea>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button class="btn btn-small btn-primary" type="submit">
					<i class="icon-save"></i> Confirmar
				</button>
				<button class="btn btn-small btn-light" data-dismiss="modal">
					<i class="icon-remove"></i> Salir
				</button>
			</div>

		</div>
	</form>
	<!-- [FIN] AGREGAR Y/O EDITAR LECCION APRENDIDA -->
</div>
