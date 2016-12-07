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
									<input type="text" class="span6" id="descripcionTipoProyecto" 
										   name="descripcion" placeholder="Tipo de Proyecto" />
								    <br/><br/>
								    <label class="span4"></label>
								    <button class="btn btn-small btn-primary" type="submit">
								    	<i class="icon-save bigger-125"></i> Agregar
								    </button>								    
								</div>								
						</form>
																
								<hr/>
								
								<div class="table-header">
									Lista Tipo de Proyecto
								</div>
								<table id="tablaTipoProyecto" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="center">
												<label>
													<input type="checkbox" />
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
														<input type="checkbox" />
														<span class="lbl"></span>
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
				<!--/row-fluid-->

				<div class="space-20"></div>
			</div>
			<!-- [FIN] TIPO DE PROYECTO -->

			<!-- [INI] ESTADO DE PROYECTO -->
			<div id="estadoProyecto" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal">
								<div class="row-fluid">
									<input type="text" class="span6" id="idEstadoProyecto" placeholder="Estado de Proyecto" />
								    <br/><br/>
								    <label class="span4"></label>
								    <button id="idguardarProyecto" class="btn btn-small btn-primary">
								    	<i class="icon-save bigger-125"></i> Agregar
								    </button>								    
								</div>
								
								<hr/>
								
								<div class="row-fluid">
									<select id="idselectEstadoProyecto" class="span6" multiple="multiple" size="10" onmousedown ="detectarBoton(event);">
										<option value="AL" />Alabama
										<option value="AK" />Alaska
										<option value="AZ" />Arizona
										<option value="AR" />Arkansas
										<option value="CA" />California
										<option value="CO" />Colorado
										<option value="CT" />Connecticut
										<option value="DE" />Delaware
										<option value="FL" />Florida
										<option value="GA" />Georgia
										<option value="HI" />Hawaii
										<option value="ID" />Idaho
										<option value="IL" />Illinois
										<option value="IN" />Indiana
										<option value="IA" />Iowa
										<option value="KS" />Kansas
										<option value="KY" />Kentucky
										<option value="LA" />Louisiana
										<option value="ME" />Maine
										<option value="MD" />Maryland
										<option value="MA" />Massachusetts
										<option value="MI" />Michigan
										<option value="MN" />Minnesota
										<option value="MS" />Mississippi
										<option value="MO" />Missouri
										<option value="MT" />Montana
										<option value="NE" />Nebraska
										<option value="NV" />Nevada
										<option value="NH" />New Hampshire
										<option value="NJ" />New Jersey
										<option value="NM" />New Mexico
										<option value="NY" />New York
										<option value="NC" />North Carolina
										<option value="ND" />North Dakota
										<option value="OH" />Ohio
										<option value="OK" />Oklahoma
										<option value="OR" />Oregon
										<option value="PA" />Pennsylvania
										<option value="RI" />Rhode Island
										<option value="SC" />South Carolina
										<option value="SD" />South Dakota
										<option value="TN" />Tennessee
										<option value="TX" />Texas
										<option value="UT" />Utah
										<option value="VT" />Vermont
										<option value="VA" />Virginia
										<option value="WA" />Washington
										<option value="WV" />West Virginia
										<option value="WI" />Wisconsin
										<option value="WY" />Wyoming
									</select>
								</div>
						</form>
					</div>
				</div>
			</div>
			<!-- [FIN] ESTADO DE PROYECTO -->

			<!-- [INI] TIPO DE REQUISITO -->
			<div id="tipoRequisito" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal">
								<div class="row-fluid">
									<select id="idTipoProyectoReq" class="span6" title="Tipo de Proyecto">
										<option value="" />Seleccione tipo de proyecto...
										<option value="AL" />Alabama
										<option value="AK" />Alaska
										<option value="AZ" />Arizona
										<option value="AR" />Arkansas
										<option value="CA" />California
										<option value="CO" />Colorado
										<option value="CT" />Connecticut
										<option value="DE" />Delaware
										<option value="FL" />Florida
										<option value="GA" />Georgia
										<option value="HI" />Hawaii
										<option value="ID" />Idaho
										<option value="IL" />Illinois
										<option value="IN" />Indiana
										<option value="IA" />Iowa
										<option value="KS" />Kansas
										<option value="KY" />Kentucky
										<option value="LA" />Louisiana
										<option value="ME" />Maine
										<option value="MD" />Maryland
										<option value="MA" />Massachusetts
										<option value="MI" />Michigan
										<option value="MN" />Minnesota
										<option value="MS" />Mississippi
										<option value="MO" />Missouri
										<option value="MT" />Montana
										<option value="NE" />Nebraska
										<option value="NV" />Nevada
										<option value="NH" />New Hampshire
										<option value="NJ" />New Jersey
										<option value="NM" />New Mexico
										<option value="NY" />New York
										<option value="NC" />North Carolina
										<option value="ND" />North Dakota
										<option value="OH" />Ohio
										<option value="OK" />Oklahoma
										<option value="OR" />Oregon
										<option value="PA" />Pennsylvania
										<option value="RI" />Rhode Island
										<option value="SC" />South Carolina
										<option value="SD" />South Dakota
										<option value="TN" />Tennessee
										<option value="TX" />Texas
										<option value="UT" />Utah
										<option value="VT" />Vermont
										<option value="VA" />Virginia
										<option value="WA" />Washington
										<option value="WV" />West Virginia
										<option value="WI" />Wisconsin
										<option value="WY" />Wyoming
									</select>								
									<br/><br/>
									<input type="text" class="span6" id="idEstadoProyecto" placeholder="Tipo de Requisito" />
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
									<select id="idselectEstadoProyecto" class="span6" multiple="multiple" size="10">
										<option value="AL" />Alabama
										<option value="AK" />Alaska
										<option value="AZ" />Arizona
										<option value="AR" />Arkansas
										<option value="CA" />California
										<option value="CO" />Colorado
										<option value="CT" />Connecticut
										<option value="DE" />Delaware
										<option value="FL" />Florida
										<option value="GA" />Georgia
										<option value="HI" />Hawaii
										<option value="ID" />Idaho
										<option value="IL" />Illinois
										<option value="IN" />Indiana
										<option value="IA" />Iowa
										<option value="KS" />Kansas
										<option value="KY" />Kentucky
										<option value="LA" />Louisiana
										<option value="ME" />Maine
										<option value="MD" />Maryland
										<option value="MA" />Massachusetts
										<option value="MI" />Michigan
										<option value="MN" />Minnesota
										<option value="MS" />Mississippi
										<option value="MO" />Missouri
										<option value="MT" />Montana
										<option value="NE" />Nebraska
										<option value="NV" />Nevada
										<option value="NH" />New Hampshire
										<option value="NJ" />New Jersey
										<option value="NM" />New Mexico
										<option value="NY" />New York
										<option value="NC" />North Carolina
										<option value="ND" />North Dakota
										<option value="OH" />Ohio
										<option value="OK" />Oklahoma
										<option value="OR" />Oregon
										<option value="PA" />Pennsylvania
										<option value="RI" />Rhode Island
										<option value="SC" />South Carolina
										<option value="SD" />South Dakota
										<option value="TN" />Tennessee
										<option value="TX" />Texas
										<option value="UT" />Utah
										<option value="VT" />Vermont
										<option value="VA" />Virginia
										<option value="WA" />Washington
										<option value="WV" />West Virginia
										<option value="WI" />Wisconsin
										<option value="WY" />Wyoming
									</select>
								</div>
						</form>
					</div>
				</div>
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
										<option value="AZ" />Arizona
										<option value="AR" />Arkansas
										<option value="CA" />California
										<option value="CO" />Colorado
										<option value="CT" />Connecticut
										<option value="DE" />Delaware
										<option value="FL" />Florida
										<option value="GA" />Georgia
										<option value="HI" />Hawaii
										<option value="ID" />Idaho
										<option value="IL" />Illinois
										<option value="IN" />Indiana
										<option value="IA" />Iowa
										<option value="KS" />Kansas
										<option value="KY" />Kentucky
										<option value="LA" />Louisiana
										<option value="ME" />Maine
										<option value="MD" />Maryland
										<option value="MA" />Massachusetts
										<option value="MI" />Michigan
										<option value="MN" />Minnesota
										<option value="MS" />Mississippi
										<option value="MO" />Missouri
										<option value="MT" />Montana
										<option value="NE" />Nebraska
										<option value="NV" />Nevada
										<option value="NH" />New Hampshire
										<option value="NJ" />New Jersey
										<option value="NM" />New Mexico
										<option value="NY" />New York
										<option value="NC" />North Carolina
										<option value="ND" />North Dakota
										<option value="OH" />Ohio
										<option value="OK" />Oklahoma
										<option value="OR" />Oregon
										<option value="PA" />Pennsylvania
										<option value="RI" />Rhode Island
										<option value="SC" />South Carolina
										<option value="SD" />South Dakota
										<option value="TN" />Tennessee
										<option value="TX" />Texas
										<option value="UT" />Utah
										<option value="VT" />Vermont
										<option value="VA" />Virginia
										<option value="WA" />Washington
										<option value="WV" />West Virginia
										<option value="WI" />Wisconsin
										<option value="WY" />Wyoming
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
										<option value="AZ" />Arizona
										<option value="AR" />Arkansas
										<option value="CA" />California
										<option value="CO" />Colorado
										<option value="CT" />Connecticut
										<option value="DE" />Delaware
										<option value="FL" />Florida
										<option value="GA" />Georgia
										<option value="HI" />Hawaii
										<option value="ID" />Idaho
										<option value="IL" />Illinois
										<option value="IN" />Indiana
										<option value="IA" />Iowa
										<option value="KS" />Kansas
										<option value="KY" />Kentucky
										<option value="LA" />Louisiana
										<option value="ME" />Maine
										<option value="MD" />Maryland
										<option value="MA" />Massachusetts
										<option value="MI" />Michigan
										<option value="MN" />Minnesota
										<option value="MS" />Mississippi
										<option value="MO" />Missouri
										<option value="MT" />Montana
										<option value="NE" />Nebraska
										<option value="NV" />Nevada
										<option value="NH" />New Hampshire
										<option value="NJ" />New Jersey
										<option value="NM" />New Mexico
										<option value="NY" />New York
										<option value="NC" />North Carolina
										<option value="ND" />North Dakota
										<option value="OH" />Ohio
										<option value="OK" />Oklahoma
										<option value="OR" />Oregon
										<option value="PA" />Pennsylvania
										<option value="RI" />Rhode Island
										<option value="SC" />South Carolina
										<option value="SD" />South Dakota
										<option value="TN" />Tennessee
										<option value="TX" />Texas
										<option value="UT" />Utah
										<option value="VT" />Vermont
										<option value="VA" />Virginia
										<option value="WA" />Washington
										<option value="WV" />West Virginia
										<option value="WI" />Wisconsin
										<option value="WY" />Wyoming
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
										<option value="AR" />Arkansas
										<option value="CA" />California
										<option value="CO" />Colorado
										<option value="CT" />Connecticut
										<option value="DE" />Delaware
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
										<option value="AZ" />Arizona
										<option value="AR" />Arkansas
										<option value="CA" />California
										<option value="CO" />Colorado
										<option value="CT" />Connecticut
										<option value="DE" />Delaware
										<option value="FL" />Florida
										<option value="GA" />Georgia
										<option value="HI" />Hawaii
										<option value="ID" />Idaho
										<option value="IL" />Illinois
										<option value="IN" />Indiana
										<option value="IA" />Iowa
										<option value="KS" />Kansas
										<option value="KY" />Kentucky
										<option value="LA" />Louisiana
										<option value="ME" />Maine
										<option value="MD" />Maryland
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
										<option value="AZ" />Arizona
										<option value="AR" />Arkansas
										<option value="CA" />California
										<option value="CO" />Colorado
										<option value="CT" />Connecticut
										<option value="DE" />Delaware
										<option value="FL" />Florida
										<option value="GA" />Georgia
										<option value="HI" />Hawaii
										<option value="ID" />Idaho
										<option value="IL" />Illinois
										<option value="IN" />Indiana
										<option value="IA" />Iowa
										<option value="KS" />Kansas
										<option value="KY" />Kentucky
										<option value="LA" />Louisiana
										<option value="ME" />Maine
										<option value="MD" />Maryland
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
										<option value="AR" />Arkansas
										<option value="CA" />California
										<option value="CO" />Colorado
										<option value="CT" />Connecticut
										<option value="DE" />Delaware
										<option value="FL" />Florida
										<option value="GA" />Georgia
										<option value="HI" />Hawaii
										<option value="ID" />Idaho
										<option value="IL" />Illinois
										<option value="IN" />Indiana
										<option value="IA" />Iowa
										<option value="KS" />Kansas
										<option value="KY" />Kentucky
										<option value="LA" />Louisiana
										<option value="ME" />Maine
										<option value="MD" />Maryland
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
</div>