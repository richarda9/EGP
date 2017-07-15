<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div id="user-profile-2" class="user-profile row-fluid">
		<div class="tabbable">
			<ul class="nav nav-tabs padding-18">
<!-- 				<li class="active"> -->
<!-- 					<a data-toggle="tab" href="#configuracion">  -->
<!-- 						Configuraci&oacute;n -->
<!-- 					</a> -->
<!-- 				</li> -->
				<li class="active">
					<a data-toggle="tab" href="#complejidad"> 
						Tipo de Complejidad
					</a>
				</li>
				<li>
					<a data-toggle="tab" href="#estado"> 
						Estado Entregables
					</a>
				</li>
			</ul>
			<div class="tab-content no-border padding-24">
<!-- 				<div id="configuracion" class="tab-pane in active"> -->
<!-- 					<div class="row-fluid"> -->
<!-- 						<div class="span12"> -->
<!-- 							<form class="form-horizontal"> -->
<!-- 								<div class="control-group"> -->
<!-- 									<label class="control-label" for="fileserver">File Server</label> -->

<!-- 									<div class="controls"> -->
<!-- 										<input type="text" class="span6" id="fileserver" placeholder=""/> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="control-group"> -->
<!-- 									<label class="control-label" for="dscsatisfaccion">Encuesta de Satisfacci&oacute;n</label> -->

<!-- 									<div class="controls"> -->
<!-- 										<input type="text" class="span6" id="dscsatisfaccion" placeholder="dsc satisfaccion" /> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="form-actions"> -->
<!-- 									<button class="btn btn-info" type="submit"> -->
<!-- 										<i class="icon-save bigger-110"></i> -->
<!-- 										Guardar -->
<!-- 									</button> -->

<!-- 									&nbsp; &nbsp; &nbsp; -->
<!-- 									<button class="btn" type="reset"> -->
<!-- 										<i class="icon-undo bigger-110"></i> -->
<!-- 										Limpiar -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 							</form> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="space-20"></div> -->
<!-- 				</div> -->
				
				<div id="complejidad" class="tab-pane in active">
					<div class="row-fluid">
						<div class="span9 center">
							<form id="formComplejidad" class="form-horizontal">
								<div class="row-fluid">
									<div class="control-group">
										<label class="control-label" for="tipoComplejidad">Tipo de Complejidad</label>
										<div class="controls">
											<input type="text" class="span6" id="tipoComplejidad" name="descripcion" placeholder=""/>
										</div>
									</div>								
								    <button class="btn btn-small btn-primary" type="submit">
								    	<i class="icon-save bigger-125"></i> Agregar
								    </button>	
							    </div>
							</form>
						</div>
					</div>
					<div class="space-20"></div>
					<div class="row-fluid">
						<div class="table-header">Lista Tipo de Complejidad</div>
						<table id="tablaComplejidadEntregable" class="table table-striped table-bordered table-hover" style="width: 100%;">
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
				
				<div id="estado" class="tab-pane">
					<div class="row-fluid">
						<div class="span9 center">
							<form id="formEstadoEntregable" class="form-horizontal">
								<div class="row-fluid">
									<div class="control-group">
										<label class="control-label" for="estadoEntregable">Estado Entregable</label>
										<div class="controls">
											<input type="text" class="span6" id="estadoEntregable" name="descripcion"/>
										</div>
									</div>								
								    <button class="btn btn-small btn-primary" type="submit">
								    	<i class="icon-save bigger-125"></i> Agregar
								    </button>
							    </div>
							</form>
						</div>
					</div>
					<div class="space-20"></div>
					<div class="row-fluid">
						<div class="table-header">Lista Estado Entregable</div>
						<table id="tablaEstadoEntregable" class="table table-striped table-bordered table-hover" style="width: 100%;">
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
		</div>
	</div>
</div>