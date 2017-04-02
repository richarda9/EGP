<%@ include file="/WEB-INF/views/include.jsp"%>
<div >
<div id="user-profile-2" class="user-profile row-fluid">
	<div class="tabbable">
		<ul class="nav nav-tabs padding-18">
			<li class="active">
				<a data-toggle="tab" href="#tipoProyecto"> 
					Tipo de Proyecto
				</a>
			</li>
			<li>
				<a data-toggle="tab" href="#estadoProyecto"> 
					Estado de Proyecto
				</a>
			</li>
			<li>
				<a data-toggle="tab" href="#tipoRequisito"> 
					Tipo de Requisito
				</a>
			</li>
			<li>
				<a data-toggle="tab" href="#tipoSupuesto"> 
					Tipo de Supuesto
				</a>
			</li>
			<li>
				<a data-toggle="tab" href="#tipoDependencia"> 
					Tipo de Dependencia
				</a>
			</li>
			<li>
				<a data-toggle="tab" href="#adquisiciones"> 
					Categoria de Adquisicion
				</a>
			</li>
			<li>
				<a data-toggle="tab" href="#costoOperativo"> 
					Costos Operativos
				</a>
			</li>
			<li>
				<a data-toggle="tab" href="#formasPago"> 
					Formas de Pago
				</a>
			</li>
		</ul>

		<div class="tab-content no-border padding-24">
		    <!-- [INI] TIPO DE PROYECTO -->
			<div id="tipoProyecto" class="tab-pane in active">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal" id="registrarTipoProyecto">
								<div class="row-fluid">
								<div class="control-group">
									<label class="control-label" for="descripcionTipoProyecto">Tipo de Proyecto:</label>
									<div class="controls">
										<div class="span12">
											<input type="text" class="span12" id="descripcionTipoProyecto" 
													name="descripcion" placeholder="Tipo de Proyecto" />
										</div>
									</div>
								</div>
								    <button class="btn btn-small btn-primary" type="submit">
								    	<i class="icon-save bigger-125"></i> Agregar
								    </button>								    
								</div>								
						</form>
					</div>
				</div>
				<hr/>
				<c:if test="${not empty model.listaTipoProyecto}">
				<div class="row-fluid">
					<div class="span12">
						<div class="table-header center">
							<b>LISTA TIPO DE PROYECTO</b> 
						</div>
						<table id="tablaTipoProyecto" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">
										<label>
											<span class="lbl"></span>
										</label>
									</th>
									<th>Descripci&oacute;n</th>
									<th>Estado</th>
									<th></th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="tipoProyecto" items="${model.listaTipoProyecto}" varStatus="contador">
									<tr>
										<td class="center">
											<label>
												<c:out value="${contador.count}"/>
											</label>
											</td>
										<td><c:out value="${tipoProyecto.descripcion}"></c:out></td>
										<c:choose>
											<c:when test="${tipoProyecto.estado == 1}">
												<td class="hidden-480"> 
													<span class="label label-info"><b>ACTIVO</b></span>
													</td>
											</c:when>
											<c:otherwise>
												<td class="hidden-480"> 
													<span class="label label-danger"><b>INACTIVO</b></span>
													</td>
											</c:otherwise>
										</c:choose>
										<td class="td-actions">
											<div class="hidden-phone visible-desktop action-buttons">
												<a class="abrir-eliminarTproyecto red" href="#eliminarTipoProyecto" data-toggle="modal" data-id="${tipoProyecto.id}">
													<i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i>
												</a>
											</div>

											<div class="hidden-desktop visible-phone">
												<div class="inline position-relative">
													<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
														<i class="icon-caret-down icon-only bigger-120"></i>
													</button>

													<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
														<li>
															<a href="##eliminarTipoProyecto" class="abrir-eliminarTproyecto tooltip-error" 
																data-rel="tooltip" title="Eliminar" data-toggle="modal" data-id="${tipoProyecto.id}">
																<span class="red">
																	<i class="icon-trash bigger-120"></i>
																</span>
															</a>
														</li>
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
				</c:if>
				<!--/row-fluid-->
				<div class="space-20"></div>
			</div>
			<!-- [FIN] TIPO DE PROYECTO -->

			<!-- [INI] ESTADO DE PROYECTO -->
			<div id="estadoProyecto" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal" id="registrarEstadoProyecto">
							<div class="row-fluid">
								<div class="control-group">
									<label class="control-label" for="descripcionEstadoProyecto">Estado de Proyecto:</label>
									<div class="controls">
										<div class="span12">
											<input type="text" class="span12" id="descripcionEstadoProyecto"
										name="descripcion" placeholder="Estado de Proyecto" />
										</div>
									</div>
								</div>
								<button type="submit" class="btn btn-small btn-primary">
									<i class="icon-save bigger-125"></i> Agregar
								</button>
							</div>
						</form>
					</div>
				</div>
				<hr />
				<c:if test="${not empty model.listaEstadoProyecto}">
					<div class="row-fluid">
						<div class="span12">
							<div class="table-header center">Lista Estado de Proyecto</div>
							<table id="tablaEstadoProyecto"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center"><label>
												<span class="lbl"></span>
										</label></th>
										<th>Descripci&oacute;n</th>
										<th>Estado</th>
										<th></th>
									</tr>
								</thead>

								<tbody>
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
											<td class="td-actions">
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="abrir-eliminarEproyecto red"
														href="#eliminarEstadoProyecto" data-toggle="modal"
														data-id="${estadoProyecto.id}"> <i
														class="icon-trash bigger-130" data-rel="tooltip"
														title="Eliminar"> </i>
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
															<li><a href="#eliminarEstadoProyecto"
																class="abrir-eliminarEproyecto tooltip-error"
																data-rel="tooltip" title="Eliminar" data-toggle="modal"
																data-id="${estadoProyecto.id}"> <span class="red">
																		<i class="icon-trash bigger-120"></i>
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
				</c:if>
			</div>
			<!-- [FIN] ESTADO DE PROYECTO -->

			<!-- [INI] TIPO DE REQUISITO -->
			<div id="tipoRequisito" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal" id="registrarTipoRequisito">
								<div class="row-fluid">
									<div class="control-group">
										<label class="control-label" for="idTipoProyecto">Tipo de Proyecto:</label>
										<div class="controls">
											<div class="span12">
												<select id="idTipoProyectoReq" name="idTipoProyecto" class="span12" title="Tipo de Proyecto">
													<option value="">Seleccionar</option>
													<c:forEach var="tipoProyecto" items="${model.listaTipoProyecto}" varStatus="contador">
													   <option value="${tipoProyecto.id}">${tipoProyecto.descripcion}</option>
													</c:forEach>
												</select>	
											</div>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label" for="idReqProyecto">Descripcion:</label>
										<div class="controls">
											<div class="span12">
												<input type="text" class="span12" id="idReqProyecto" name="descripcion" placeholder="Tipo de Requisito" />
											</div>
										</div>
									</div>								
								    <button type="submit" class="btn btn-small btn-primary">
								    	<i class="icon-save bigger-125"></i> Agregar
								    </button>		
								</div>							
						</form>															
					</div>
				</div>
				<hr/>	
				<c:if test="${not empty model.listaTipoRequisito}">
					<div class="row-fluid">
						<div class="span12">
							<div class="table-header center">Lista Tipo de Requisito de Proyecto</div>
							<table id="tablaTipoRequisitoProyecto"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center"><label>
												<span class="lbl"></span>
										</label></th>
										<th>Tipo Proyecto</th>
										<th>Descripci&oacute;n Tipo Requisito</th>
										<th>Estado</th>
										<th></th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="tiporequisitoProyecto" items="${model.listaTipoRequisito}" varStatus="contador">
										<tr>
											<td class="center">												
												<c:out value="${contador.count}"/>
											</td>
											<td><c:out value="${tiporequisitoProyecto.dsc_tipoproyecto}"></c:out></td>
											<td><c:out value="${tiporequisitoProyecto.descripcion}"></c:out></td>
											<c:choose>
												<c:when test="${tiporequisitoProyecto.estado == 1}">
													<td class="hidden-480"><span class="label label-info"><b>ACTIVO</b></span>
													</td>
												</c:when>
												<c:otherwise>
													<td class="hidden-480"><span
														class="label label-danger"><b>INACTIVO</b></span></td>
												</c:otherwise>
											</c:choose>
											<td class="td-actions">
												<div class="hidden-phone visible-desktop action-buttons">
													<a class="abrir-eliminarEproyecto red"
														href="#eliminarEstadoProyecto" data-toggle="modal"
														data-id="${tiporequisitoProyecto.id}"> <i
														class="icon-trash bigger-130" data-rel="tooltip"
														title="Eliminar"> </i>
													</a>
												</div>

												<div class="hidden-desktop visible-phone">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-yellow dropdown-toggle"
															data-toggle="dropdown">
															<i class="icon-caret-down icon-only bigger-120"></i>
														</button>

														<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li>
																<a href="#eliminarEstadoProyecto"
																	class="abrir-eliminarEproyecto tooltip-error"
																	data-rel="tooltip" title="Eliminar" data-toggle="modal"
																	data-id="${tiporequisitoProyecto.id}"> <span class="red">
																			<i class="icon-trash bigger-120"></i>
																	</span>
																</a>
															</li>
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
				</c:if>
			</div>
			<!-- [FIN] TIPO DE REQUISITO -->

			<!-- [INI] TIPO DE SUPUESTO -->
			<div id="tipoSupuesto" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal">
								<div class="row-fluid">
									<select id="idTipoProyectoSup" class="span6" title="Tipo de Proyecto">
										<option value="" />Seleccione tipo de proyecto...
										<option value="AL" />Alabama
										<option value="AK" />Alaska
									</select>								
									<br/><br/>
									<input type="text" class="span6" id="idTipoSupuesto" placeholder="Tipo de Supuesto" />
									<br/><br/>
									<label class="span4"></label>									
								    <button id="idguardarProyecto" class="btn btn-small btn-primary">
								    	<i class="icon-save bigger-125"></i> Agregar
								    </button>		
								</div>
								<div class="row-fluid">
								</div>
								<br/>
								<div class="row-fluid">
								</div>
								
								<hr/>
								
								<div class="row-fluid">
									<select id="idselectTipoSupuesto" class="span6" multiple="multiple" size="10">
										<option value="AL" />Alabama
										<option value="AK" />Alaska
									</select>
								</div>
						</form>
					</div>
				</div>
			</div>
			<!-- [FIN] TIPO DE SUPUESTO -->
			
			<!-- [INI] TIPO DE DEPENDENCIA -->
			<div id="tipoDependencia" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal">
								<div class="row-fluid">
									<select id="idTipoProyectoSup" class="span6" title="Tipo de Proyecto">
										<option value="" />Seleccione tipo de proyecto...
										<option value="AL" />Alabama
										<option value="AK" />Alaska
										<option value="AZ" />Arizona
										<option value="AR" />Arkansas
									</select>								
									<br/><br/>
									<input type="text" class="span6" id="idTipoDependencia" placeholder="Tipo de Dependencia" />
									<br/><br/>
									<label class="span4"></label>									
								    <button id="idguardarProyecto" class="btn btn-small btn-primary">
								    	<i class="icon-save bigger-125"></i> Agregar
								    </button>		
								</div>
								<div class="row-fluid">
								</div>
								<br/>
								<div class="row-fluid">
								</div>
								
								<hr/>
								
								<div class="row-fluid">
									<select id="idselectTipoSupuesto" class="span6" multiple="multiple" size="10">
										<option value="AL" />Alabama
										<option value="AK" />Alaska
										<option value="AZ" />Arizona
									</select>
								</div>
						</form>
					</div>
				</div>
			</div>
			<!-- [FIN] TIPO DE DEPENDENCIA -->
			
			<!-- [INI] CATEGORIA DE ADQUISICIONES -->
			<div id="adquisiciones" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal">
								<div class="row-fluid">
									<input type="text" class="span6" id="idCategoriaAdquisiciones" placeholder="Categoria de Adquisiciones" />
								    <br/><br/>
								    <label class="span4"></label>
								    <button id="idguardarProyecto" class="btn btn-small btn-primary">
								    	<i class="icon-save bigger-125"></i> Agregar
								    </button>								    
								</div>
								
								<hr/>
								
								<div class="row-fluid">
									<select id="idselectCategoriaAdquisiciones" class="span6" multiple="multiple" size="10">
										<option value="AL" />Alabama
										<option value="AK" />Alaska
									</select>
								</div>
						</form>
					</div>
				</div>
			</div>
			<!-- [FIN] CATEGORIA DE ADQUISICIONES -->
			
			<!-- [INI] COSTO OPERATIVO -->
			<div id="costoOperativo" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal">
								<div class="row-fluid">
									<input type="text" class="span6" id="idCostosOperativos" placeholder="Tipo de Costos Operativos" />
								    <br/><br/>
								    <label class="span4"></label>
								    <button id="idguardarProyecto" class="btn btn-small btn-primary">
								    	<i class="icon-save bigger-125"></i> Agregar
								    </button>								    
								</div>
								
								<hr/>
								
								<div class="row-fluid">
									<select id="idselectCategoriaAdquisiciones" class="span6" multiple="multiple" size="10">
										<option value="AL" />Alabama
										<option value="AK" />Alaska
									</select>
								</div>
						</form>
					</div>
				</div>
			</div>
			<!-- [FIN] COSTO OPERATIVO -->
			
			<!-- [INI] FORMAS DE PAGO -->
			<div id="formasPago" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal">
								<div class="row-fluid">
									<input type="text" class="span6" id="idCostosOperativos" placeholder="Formas de Pago" />
								    <br/><br/>
								    <label class="span4"></label>
								    <button id="idguardarProyecto" class="btn btn-small btn-primary">
								    	<i class="icon-save bigger-125"></i> Agregar
								    </button>								    
								</div>
								
								<hr/>
								
								<div class="row-fluid">
									<select id="idselectCategoriaAdquisiciones" class="span6" multiple="multiple" size="10">
										<option value="AL" />Alabama
										<option value="AK" />Alaska
										<option value="AZ" />Arizona
									</select>
								</div>
						</form>
					</div>
				</div>
			</div>
			<!-- [FIN] FORMAS DE PAGO -->
		</div>
	</div>
</div>

	<!-- [INI] ELIMINAR TIPO PROYECTO -->
	<form id="formEliminarTipoProyecto">
		<div id="eliminarTipoProyecto" class="modal hide fade" tabindex="-1">
			<div class="modal-header no-padding">
				<div class="table-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>

			<div class="modal-body padding">
				<b style="text-align: center">¿SEGURO DE ELIMINAR? </b> <input
					type="hidden" name="idTipoProyecto" id="idTipoProyecto" />
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
	<!-- [FIN] ELIMINAR TIPO PROYECTO -->

	<!-- [INI] ELIMINAR ESTADO PROYECTO -->
	<form id="formEliminarEstadoProyecto">
		<div id="eliminarEstadoProyecto" class="modal hide fade" tabindex="-1">
			<div class="modal-header no-padding">
				<div class="table-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>

			<div class="modal-body padding">
				<b style="text-align: center">¿SEGURO DE ELIMINAR? </b> <input
					type="hidden" name="idEstadoProyecto" id="idEstadoProyecto" />
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
	<!-- [FIN] ELIMINAR ESTADO PROYECTO -->
</div>