<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="page-header position-relative">
		<h1>Organigrama para el Proyecto</h1>
	</div>
	<div class="row-fluid">
		<div class="row-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="span10"></div>
					<div class="span2">
						<a id="btnAgregarOrganigrama" href="#modal-Organigrama" role="button" class="btn btn-small btn-primary" data-toggle="modal">
							<i class="icon-plus"></i>Agregar 
						</a>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="row-fluid">
			<div class="table-header">Lista de Recursos</div>
			<table id="tablaOrganigramaProyecto" class="table table-striped table-bordered table-hover" style="width: 100%;">
				<thead>
					<tr>
						<th>Rol</th>
						<th>Descripci&oacute;n</th>
						<th>Tipo Rol</th>
						<th>Estado</th>
						<th>Opciones</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	
	
	<!-- [INI] MODAL -->
	<form id="registrarOrganigrama">
		<div id="modal-Organigrama" class="modal hide" tabindex="-1">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">Registro Organigrama</h4>
			</div>
			<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
<!-- 				<div id="datosRol" class="accordion"> -->
<!-- 					<div class="accordion-group"> -->
<!-- 						<div class="accordion-heading"> -->
<!-- 							<a href="#infoGeneral" data-parent="#datosRol" data-toggle="collapse" class="accordion-toggle"> -->
<!-- 								Informaci&oacute;n Rol -->
<!-- 							</a> -->
<!-- 						</div> -->
	
<!-- 						<div class="accordion-body in collapse" id="infoGeneral"> -->
<!-- 							<div class="accordion-inner"> -->
								<input type="hidden" id="idTipoRol" name="id">
								<div class="control-group row-fluid">
									<div class="control-label span2">Nombre: </div>
									<div class="span10"><input type="text" class="span12" id="nombreRol" name="nombreRol"/></div>
								</div>
								<div class="control-group row-fluid">
									<div class="control-label span2">Descripci&oacute;n: </div>
									<div class="span10"><textarea class="span12" id="descripcion" name="descripcion"></textarea></div>
								</div>
								<div class="row-fluid">
									<div class="span6">
										<div class="control-group row-fluid">
											<div class="control-label span4">Tipo Rol:</div>
											<div class="span8">
												<select class="span12" id="tipoRol" name="tipoRol">
													<option value="">Seleccionar</option>
													<option value="1">PROVEEDOR</option>
													<option value="2">CLIENTE</option>
												</select> 
											</div>
										</div>
									</div>
									<div class="span6">
										<div class="control-group row-fluid">
											<div class="control-label span4">Estado:</div>
											<div class="span8">
												<select class="span12" id="estado" name="estado">
													<option value="">Seleccionar</option>
													<option value="1">ACTIVO</option>
													<option value="0">INACTIVO</option>
												</select> 
											</div>
										</div>
									</div>
								</div>	
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
	
					<!-- <div class="accordion-group">
						<div class="accordion-heading">
							<a href="#bandaSalarial" data-parent="#datosRol" data-toggle="collapse" class="accordion-toggle collapsed">
								Informaci&oacute;n Banda Salarial
							</a>
						</div>
	
						<div class="accordion-body collapse" id="bandaSalarial">
							<div class="accordion-inner">	-->							
								<!-- <div class="row-fluid">
									<div class="span4"></div>
									<div class="span8">
									<div class="span4">
										<a id="btnAgregarContactoCliente" class="btn btn-small btn-primary">
											<i class="icon-plus"></i>
											Agregar
										</a>
									</div>
									<div class="span4">
										<a class="btn btn-small btn-primary" onclick="EditarContactoCliente();">
											<i class="icon-edit"></i>
											Editar &nbsp;&nbsp;
										</a>
									</div>
									<div class="span4">
										<a class="btn btn-small btn-primary" onclick="EliminarContactoCliente();"> 
											<i class="icon-trash"></i>
											Eliminar
										</a>
									</div>
									</div>
								</div>  -->
							<!-- <br>
								<div class="row-fluid">
									<div class="table-header">Tabla Banda Salarial</div>
									<table id="tablaContEmpresaProyecto" class="table table-striped table-bordered table-hover" style="width: 100%;">
									</table>
								</div>
							</div>
						</div>
					</div> -->
<!-- 				</div> -->
			</div>
			<div class="modal-footer">
				<button class="btn btn-small" data-dismiss="modal">
					<i class="icon-remove"></i>
					Cancelar
				</button>
	
				<button type="submit" class="btn btn-small btn-primary">
					<i class="icon-save"></i>
					Guardar
				</button>
			</div>
		</div>
	</form>
	<!-- [FIN] MODAL -->
</div>