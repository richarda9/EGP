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
				<div class="row-fluid">
					<div class="span12">
						<div class="table-header">Lista Tipo de Proyecto</div>
						<table id="tablaTipoProyecto" class="table table-striped table-bordered table-hover"  style="width: 100%;">
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
				<div class="row-fluid">
					<div class="span12">
						<div class="table-header center">Lista Estado de Proyecto</div>
						<table id="tablaEstadoProyecto" class="table table-striped table-bordered table-hover"  style="width: 100%;">
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
						</table>
					</div>
				</div>
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
				<div class="row-fluid">
					<div class="span12">
						<div class="table-header">Lista Tipo de Requisito de Proyecto</div>
						<table id="tablaTipoRequisitoProyecto"  style="width: 100%;"
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
						</table>
					</div>					
				</div>
			</div>
			<!-- [FIN] TIPO DE REQUISITO -->

			<!-- [INI] TIPO DE SUPUESTO -->
			<div id="tipoSupuesto" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal" id="registrarTipoSupuesto">
								<div class="row-fluid">
									<div class="control-group">
										<label class="control-label" for="idTipoProyectoSup">Tipo de Proyecto:</label>
										<div class="controls">
											<div class="span12">
												<select id="idTipoProyectoSup" name="idTipoProyecto" class="span12" title="Tipo de Proyecto">
													<option value="">Seleccionar</option>
												</select>	
											</div>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label" for="idTipoSupuesto">Descripcion:</label>
										<div class="controls">
											<div class="span12">
												<input type="text" class="span12" id="idTipoSupuesto" name="descripcion" placeholder="Tipo de Supuesto" />
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
				<div class="row-fluid">
					<div class="span12">
						<div class="table-header">Lista Tipo de Supuesto de Proyecto</div>
						<table id="tablaTipoSupuestoProyecto"  style="width: 100%;"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center"><label>
											<span class="lbl"></span>
									</label></th>
									<th>Tipo Proyecto</th>
									<th>Descripci&oacute;n Tipo Supuesto</th>
									<th>Estado</th>
									<th></th>
								</tr>
							</thead>
						</table>
					</div>					
				</div>
			</div>
			<!-- [FIN] TIPO DE SUPUESTO -->
			
			<!-- [INI] TIPO DE DEPENDENCIA -->
			<div id="tipoDependencia" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal" id="registrarTipoDependencia">
								<div class="row-fluid">
									<div class="control-group">
										<label class="control-label" for="idTipoProyectoDep">Tipo de Proyecto:</label>
										<div class="controls">
											<div class="span12">
												<select id="idTipoProyectoDep" name="idTipoProyecto" class="span12" title="Tipo de Proyecto">
													<option value="">Seleccionar</option>
												</select>	
											</div>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label" for="idTipoDependencia">Descripcion:</label>
										<div class="controls">
											<div class="span12">
												<input type="text" class="span12" id="idTipoDependencia" name="descripcion" placeholder="Tipo de Dependencia" />
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
				<div class="row-fluid">
					<div class="span12">
						<div class="table-header">Lista Tipo de Dependencia de Proyecto</div>
						<table id="tablaTipoDependenciaProyecto"  style="width: 100%;"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center"><label>
											<span class="lbl"></span>
									</label></th>
									<th>Tipo Proyecto</th>
									<th>Descripci&oacute;n Tipo Dependencia</th>
									<th>Estado</th>
									<th></th>
								</tr>
							</thead>
						</table>
					</div>					
				</div>
			</div>
			<!-- [FIN] TIPO DE DEPENDENCIA -->
			
			<!-- [INI] CATEGORIA DE ADQUISICIONES -->
			<div id="adquisiciones" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal" id="registrarCategoriaAdquisicion">
								<div class="row-fluid">
								<div class="control-group">
									<label class="control-label" for="descripcionCatAdquisicion">Categor&iacute;a:</label>
									<div class="controls">
										<div class="span12">
											<input type="text" class="span12" id="descripcionCatAdquisicion" 
													name="descripcion" placeholder="Categoria de Adquisiciones" />
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
				<div class="row-fluid">
					<div class="span12">
						<div class="table-header">Lista Categor&iacute;a Adquisiciones</div>
						<table id="tablaCategoriaAdquisiciones" class="table table-striped table-bordered table-hover"  style="width: 100%;">
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
						</table>
					</div>
				</div>
			</div>
			<!-- [FIN] CATEGORIA DE ADQUISICIONES -->
			
			<!-- [INI] COSTO OPERATIVO -->
			<div id="costoOperativo" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal" id="registrarCostoOperativo">
								<div class="row-fluid">
								<div class="control-group">
									<label class="control-label" for="idCostosOperativos">Costo Operativo:</label>
									<div class="controls">
										<div class="span12">
											<input type="text" class="span12" id="idCostosOperativos" 
													name="descripcion" placeholder="Tipo de Costos Operativos" />
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
				<div class="row-fluid">
					<div class="span12">
						<div class="table-header">Lista Costos Operativos</div>
						<table id="tablaCostoOpertivo" class="table table-striped table-bordered table-hover"  style="width: 100%;">
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
						</table>
					</div>
				</div>
			</div>
			<!-- [FIN] COSTO OPERATIVO -->
			
			<!-- [INI] FORMAS DE PAGO -->
			<div id="formasPago" class="tab-pane">
				<div class="row-fluid">
					<div class="span9 center">
						<form class="form-horizontal" id="registrarFormaPago">
								<div class="row-fluid">
								<div class="control-group">
									<label class="control-label" for="idFormaPago">Forma de Pago:</label>
									<div class="controls">
										<div class="span12">
											<input type="text" class="span12" id="idFormaPago" 
													name="descripcion" placeholder="Forma de Pago" />
										</div>
									</div>
								</div>
								    <button class="btn btn-small btn-primary" type="submit">
								    	<i class="icon-save bigger-125"></i> Agregar
								    </button>								    
								</div>								
						</form>
					</div>
					<hr/>
					<div class="row-fluid">
						<div class="span12">
							<div class="table-header">Lista Formas de Pago</div>
							<table id="tablaFormaPago" class="table table-striped table-bordered table-hover"  style="width: 100%;">
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
							</table>
						</div>
					</div>									
				</div>
			</div>
			<!-- [FIN] FORMAS DE PAGO -->
		</div>
	</div>
</div>
</div>