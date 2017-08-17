<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
		<div class="span12">
			<div class="span5">
				<div class="row-fluid">
					<div class="span12">
						<div class="span12 " style="float: left;">
							<b><h4 id="idHeaderCodigoPy" class="smaller lighter blue">${model.datosPy.codigoPy} - ${model.datosPy.tituloProyecto}</h4></b>
						</div>
					</div>
				</div>
			
			</div>
			<div class="span7">
				<div class="row-fluid">
					<div class="span12">
						<div class="span3" style="float: left;">
							<a class="btn btn-small btn-primary span12" onclick = "planificarAnteproyecto()">
								<i class="icon-save"></i>
								Planificar
							</a>
						</div>						
						<div class="span3" style="float: left;">
							<a class="btn btn-small btn-primary span12" href="#modalCancelarProyecto" data-toggle="modal">
								<i class="icon-remove-sign"></i>
								Cancelar
							</a>
						</div>
						<div class="span2" style="float: left;">
							<a class="btn btn-small btn-primary span12" onclick = "guardarAnteproyecto()">
								<i class="icon-save"></i>
								Guardar
							</a>
						</div>
						<!--  <div class="span1" style="float: left;">
							<a class="btn btn-small btn-info span12" href="#mntLeccionAprendida" data-toggle="modal">
								<i class="icon-undo"></i>
							</a>
						</div>-->
					</div>
				</div>
			</div>
		</div>
		
		<div class="space-20"></div>
		<div class="space-20"></div>
		<div class="space-20"></div>
	</div>
		
	<div class="row-fluid">
		<div id="user-profile-2" class="user-profile row-fluid">
			<div class="tabbable">					
				<ul class="nav nav-tabs padding-18">
					<li class="active">
						<a data-toggle="tab" href="#generalEmpresa"> 
							General
						</a>
					</li>
					<li>
						<a data-toggle="tab" href="#empresaProyecto"> 
							Empresa
						</a>
					</li>
					<li>
						<a data-toggle="tab" href="#observaciones"> 
							Observaciones
						</a>
					</li>
					<li>
						<a data-toggle="tab" href="#anexos"> 
							Anexo
						</a>
					</li>
				</ul>
				<form name="formAgregarAnteproyecto" id="formAgregarAnteproyecto" enctype="multipart/form-data">
				<input id="idCodigoPy" type="hidden" name="codigoPy" value = "${model.datosPy.codigoPy}"></input>
				<div class="tab-content no-border padding-24">
					<!-- [INI] GENERALIDADES -->
					<div id="generalEmpresa" class="tab-pane in active">
						<div class="row-fluid">
							<!-- <form id="registrarTipoProyecto"> -->
							<div class="row-fluid">
								<div class="span12">								
									<%-- <div class="span4">
										<div class="control-group">
											<label class="control-label" for="dscAsocProyecto">Asociado a Proyecto</label>
											<div class="controls">
												<select id="idAsociadoProyecto" name="idAsociadoProyecto">
													<option value="">Seleccionar</option>
													<c:forEach var="asociadoProyecto" items="${model.listaAsociadoProyecto}" varStatus="contador">
													   <option value="${asociadoProyecto.idProyecto}" ${(model.modoEdicion) and (model.datosPy.idAsociadoProyecto eq asociadoProyecto.idProyecto)?'selected':''}>${asociadoProyecto.nombreProyecto}</option>
													</c:forEach>
												</select>
											</div>
										</div>							    
									</div>	 --%>
									<div class="span4">
										<div class="control-group">
											<label class="control-label" for="idTipoProyecto">Tipo de Proyecto</label>
											<div class="controls">
												<select id="idTipoProyecto" name="idTipoProyecto">
													<option value="">Seleccionar</option>
													<c:forEach var="tipoProyecto" items="${model.listaTipoProyecto}" varStatus="contador" >
													   <option value="${tipoProyecto.id}" ${model.modoEdicion and (model.datosPy.idTipoProyecto eq tipoProyecto.id)?'selected':''}>${tipoProyecto.descripcion}</option>
													</c:forEach>
												</select>	
											</div>
										</div>							    
									</div>			
									<div class="span4">
										<div class="control-group">
											<label class="control-label" for="fechaContacto">Fecha de Contacto</label>
											<div class="controls">
												<div class="row-fluid input-append">
												<input id="fechaContacto" name="fechaContacto" type="text" value = "${model.datosPy.fechaContacto}"/>
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
											</div>
										</div>							    
									</div>
								</div>
								</div>
								<div class="row-fluid">
									<div class="span12">																											
										<div class="span4">
											<div class="control-group">
												<label class="control-label" for="dscEjecutivoCuenta">Ejecutivo de Cuenta</label>
												<div class="controls">
													<select id="idEjecutivoCuenta" name="idEjecutivoCuenta">
														<option value="">Seleccionar</option>
														<c:forEach var="ejecutivoCuenta" items="${model.listaEjecutivoCuenta}" varStatus="contador">
														   <option value="${ejecutivoCuenta.iddetalle}" ${model.modoEdicion and (model.datosPy.idEjecutivoCuenta eq ejecutivoCuenta.iddetalle)?'selected':''}>${ejecutivoCuenta.nombres}</option>
														</c:forEach>
													</select>
												</div>
											</div>							    
										</div>											
										<div class="span4">
											<div class="control-group">
												<label class="control-label" for="dscResponsable">Responsable</label>
												<div class="controls">
													<select id="idResponsableProyecto" name="idResponsable">
														<option value="">Seleccionar</option>
														<c:forEach var="responsableProyecto" items="${model.listaResponsableProyecto}" varStatus="contador">
														   <option value="${responsableProyecto.iddetalle}" ${model.modoEdicion and (model.datosPy.idResponsable eq responsableProyecto.iddetalle)?'selected':''} data-correo = "${responsableProyecto.correo}" data-nombre ="${responsableProyecto.nombres}">${responsableProyecto.nombres}</option>
														</c:forEach>
													</select>
												</div>
											</div>							    
										</div>		
									</div>	
									</div>
									<div class="row-fluid">
									<div class="span12">
										<div class="control-group">
											<label class="control-label" for="dscEjecutivoCuenta">Titulo o nombre del Proyecto</label>
											<div class="controls">
												<textarea id="tituloProyecto" name="tituloProyecto" rows="5" class="span10">${model.datosPy.tituloProyecto}</textarea>
											</div>
										</div>
									</div>	
									</div>
									<div class="row-fluid">
									<div class="span12">
										<div class="control-group">
											<label class="control-label" for="dscAlcanceInicial">Alcance Inicial</label>
											<div class="controls">
												<textarea id="alcanceInicialProyecto" name="alcanceInicialProyecto" rows="5" class="span10">${model.datosPy.alcanceInicialProyecto}</textarea>
											</div>
										</div>
									</div>
									</div>
									<div class="row-fluid">	
									<div class="span12">
										<div class="control-group">
											<label class="control-label" for="dscObjetivo">Objetivo</label>
											<div class="controls">
												<textarea id="objetivo" name="objetivo" rows="5" class="span10">${model.datosPy.objetivo}</textarea>
											</div>
										</div>
									</div>
								</div>					
							<!-- </form> -->
							<!-- <hr/> -->
							<div class="space-20"></div>
						</div>
						<!--/row-fluid-->
		
						<div class="space-20"></div>
					</div>
					<!-- [FIN] GENERALIDADES -->
					
					<!-- [INI] EMPRESA -->
					<div id="empresaProyecto" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<!-- <form class="form-horizontal"> -->
									<div class="control-group">
										<label class="control-label" for="idEmpresa">Empresa</label>
					
										<div class="controls">
											<select id="empresa" title="empresa" onchange="listarInteresado(this)">
												<option value="">Seleccionar</option>
												<c:forEach var="empresa" items="${model.listaEmpresa}" varStatus="contador">
												   <option value="${empresa.idEmpresa}">${empresa.razonSocial}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								<!-- </form> -->
							</div>
						</div>
											
						<fieldset>
							<legend>Interesados</legend>
								<div class="row-fluid">
									<div class="span12">
										<div class="span4">
											<div class="control-group">
												<div class="controls">
													<select id="idContacto" class="span12" title="Contacto" >
														<option value="" >Seleccionar</option>														
													</select>	
												</div>
											</div>
										</div>
										<div class="span5">
											<div class="control-group">
												<div class="controls">
													<input type="text" id="idInteres" class="span12" placeholder="Interes"/>
												</div>
											</div>
										</div>
										<div class="span3">
											<a class="btn btn-small btn-primary span12" onclick="agregarInteresados()">
												<i class="icon-plus-sign bigger-125"></i>
												Agregar interesados
											</a>
										</div>	
									</div>	
								</div>															
						</fieldset>				
						
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaInteresadoEmpresa"
								class="table table-striped table-bordered table-hover" style = "width : 100%">
								<thead>
									<tr>
										<th>Interesado</th>
										<th>Cargo</th>
										<th>Inter&eacute;s</th>
										<th>Opciones</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<!-- [FIN] EMPRESA -->
					
					<!-- [INI] OBSERVACIONES -->
					<div id="observaciones" class="tab-pane">
						<div class="row-fluid">						
							<div class="span12">								
								<div class="control-group">
									<div class="controls">
										<textarea rows="5" id="dscObservacion" class="span12" placeholder="Ingresar observacion"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<div class="span6">
									<!-- <div class="control-group">
										<div class="controls">
											<input type="file" id="archObservacion" />
										</div>
									</div> -->
								</div>
								<div class="span6">
									<a class="btn btn-small btn-primary span12" onclick="agregarObservacion()">
										<i class="icon-plus-sign bigger-125"></i>
											Agregar observaci&oacute;n
									</a>
								</div>								
 							</div>			
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaObservacion"
								class="table table-striped table-bordered table-hover" style = "width : 100%">
								<thead>
									<tr>
										<th>Observaci&oacute;n</th>
										<!-- <th>Archivo</th> -->
										<th>Opciones</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>	
			<!-- [FIN] OBSERVACIONES -->
			
			<!-- [INI] ANEXOS -->
			<div id="anexos" class="tab-pane">
						<div class="row-fluid">						
							<div class="span12">								
								<div class="control-group">
									<div class="controls">
										<textarea rows="5" id="dscAnexo" class="span12" placeholder="Ingresar anexo"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<div class="span6">
									<!-- <div class="control-group">
										<div class="controls">
											<input type="file" id="archAnexo" />											
										</div>
									</div> -->
								</div>
								<div class="span6">
									<a class="btn btn-small btn-primary span12" onclick="agregarAnexos()">
										<i class="icon-plus-sign bigger-125"></i>
											Agregar anexo
									</a>
								</div>								
 							<div>			
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaAnexo"
								class="table table-striped table-bordered table-hover" style = "width : 100%">
								<thead>
									<tr>
										<th>Anexo</th>
										<!-- <th>Archivo</th> -->
										<th>Opciones</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>					
				</div>
			</div>
			<!-- [FIN] ANEXOS -->			
		</div>
		</form>
	</div>
	
	<%@ include file="/WEB-INF/views/cancelar/cancelarContenido.jsp"%>
</div>
</div>

	<!-- INI - MODAL ELIMINAR INTERESADO TABLA-->
	<div id="modalEliminarInteresado" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar interesado?</b> 
			<!-- <input type="hidden" name="idTipoProyecto" id="idTipoProyecto" /> -->
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarInteresado" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>

	</div>
	<!-- FIN - MODAL ELIMINAR INTERESADO TABLA-->
	
	<!-- INI - MODAL ELIMINAR OBSERVACION TABLA-->
	<div id="modalEliminarObservacion" class="modal hide fade" tabindex="-1" data-attr-index="">
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar observaci&oacute;n?</b> 
			<!-- <input type="hidden" name="idTipoProyecto" id="idTipoProyecto" /> -->
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarObservacion" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>

	</div>
	<!-- FIN - MODAL ELIMINAR OBSERVACION TABLA-->
	
	<!-- INI - MODAL ELIMINAR ANEXO TABLA-->
	<div id="modalEliminarAnexo" class="modal hide fade" tabindex="-1" data-attr-index="">
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar anexo?</b> 
			<!-- <input type="hidden" name="idTipoProyecto" id="idTipoProyecto" /> -->
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarAnexo" class="btn btn-small btn-primary" type="submit">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>

	</div>
	<!-- FIN - MODAL ELIMINAR ANEXO TABLA-->

</div>

<script type="text/javascript">
	var datosGrillas={};
	datosGrillas = {"modoEdicion":"${model.modoEdicion}",
			"listaInteresado":'${model.listaInteresado}',
			"listaObservaciones":'${model.listaObservaciones}',
			"listaAnexo":'${model.listaAnexo}',
			"idEmpresa" : '${model.datosPy.idEmpresa}'};
</script>
