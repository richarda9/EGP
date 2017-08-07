<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="row-fluid">
        <div class="span12">
            <div class="span5">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="span12 " style="float: left;">
                            <b><h4 id="idHeaderCodigoPy" class="smaller lighter blue">${model.codigoProyecto} - ${model.nombreProyecto}</h4></b>
                        </div>
                    </div>
                </div>
            
            </div>
            <div class="span7">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="span3" style="float: left;">
                            <a class="btn btn-small btn-info span12" onclick = "ejecutarProyecto()">
                                <i class="icon-save"></i>
                                Ejecutar Proyecto
                            </a>
                        </div>
                        <div class="span3" style="float: left;">
                            <button class="btn btn-small btn-info span12">
                                <i class="icon-print"></i>
                                Imprimir
                            </button>
                        </div>
                        <div class="span3" style="float: left;">
                            <a class="btn btn-small btn-info span12" href="#modalCancelarProyecto" data-toggle="modal">
                                <i class="icon-remove-sign"></i>
                                Cancelar
                            </a>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
        
        <div class="space-20"></div>
        <div class="space-20"></div>
    </div>
	<div class="row-fluid">
		<div class="span12">
			<div class="tabbable tabs-left">
				<ul class="nav nav-tabs" id="myTab3">
                    <li class="active">
                        <a data-toggle="tab" href="#dscProducto">
                            <i class="red icon-lightbulb bigger-110"></i>
                            Descripci&oacute;n del Producto
                            <input id = "codigoPy" type="hidden" value="${model.codigoPy}"/>
                        </a>
                    </li>
 
                    <li>
                        <a data-toggle="tab" href="#alcance">
                            <i class="blue icon-rocket bigger-110"></i>
                            Alcance
                        </a>
                    </li>
 
                    <li>
                        <a data-toggle="tab" href="#recursoHumanos">
                            <i class="orange icon-group"></i>
                            Recursos Humanos
                        </a>
                    </li>
 
                    <li>
                        <a data-toggle="tab" href="#cronograma">
                            <i class="blue icon-calendar"></i>
                            Cronograma
                        </a>
                    </li>
 
                    <li>
                        <a data-toggle="tab" href="#entregable">
                            <i class="pink icon-bookmark"></i>
                            Entregables
                        </a>
                    </li>
 
                    <li>
                        <a data-toggle="tab" href="#riesgos">
                            <i class="red icon-bolt"></i>
                            Riesgos
                        </a>
                    </li>
 
                    <li>
                        <a data-toggle="tab" href="#adquisiciones">
                            <i class="purple icon-gift "></i>
                            Adquisiciones
                        </a>
                    </li>
 
                    <li>
                        <a data-toggle="tab" href="#costos">
                            <i class="green icon-asterisk"></i>
                            Costos
                        </a>
                    </li>
 
                    <li>
                        <a data-toggle="tab" href="#costosOperativos">
                            <i class="grey icon-laptop"></i>
                            Costos Operativos
                        </a>
                    </li>
 
                    <li>
                        <a data-toggle="tab" href="#presupuesto">
                            <i class="pink icon-bar-chart"></i>
                            Presupuesto
                        </a>
                    </li>
 
                    <li>
                        <a data-toggle="tab" href="#formasdePago">
                            <i class="blue icon-credit-card"></i>
                            Formas de Pago
                        </a>
                    </li>
 
                    <li>
                        <a data-toggle="tab" href="#contrato">
                            <i class="brown icon-book"></i>
                            Contrato
                        </a>
                    </li>
                </ul>
				
				<div class="tab-content">
					<!-- INI - PLANIFICACION - DESCRIPCION PRODUCTO  -->
					<div id="dscProducto" class="tab-pane in active">
						<div class="row-fluid">
							<div class="span12">
								<div class="page-header position-relative"><h1>Descripci&oacute;n del Producto del Proyecto</h1></div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<div class="span6"></div>
								<div class="span3" style="float:left;">
									<a class="btn btn-small btn-info span12" onclick="guardarDescripcion()">
										<i class="icon-save bigger-125"></i>
										Guardar
									</a>
								</div>
								<div class="span3" style="float:left;">
									<button class="btn btn-small btn-info span12">
										<i class="icon-undo bigger-125"></i>
										Limpiar
									</button>
								</div>
								<!-- <div class="span3" style="float:left;">
									<button class="btn btn-info span12">
										<i class="icon-download bigger-125"></i>
										Importar Plantilla
									</button>
								</div> -->
							</div>
						</div>
						<br>
						<form  name="formPlanDescripcion" id="formPlanDescripcion" method="post">
							<textarea class="span12" id="descripcion" name="descripcion" >${model.descripcionProductoProyecto}</textarea>
						</form>
					</div>
					<!-- FIN - PLANIFICACION - DESCRIPCION PRODUCTO  -->

					<!-- INI - PLANIFICACION - ALCANCE  -->
					<div id="alcance" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="page-header position-relative"><h1>Alcance</h1></div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<div class="span9"></div>
								<div class="span3" style="float:left;">
									<a class="btn btn-small btn-info span12" onclick="guardarAlcance()">
										<i class="icon-save bigger-125"></i>
										Guardar
									</a>
								</div>
							</div>
						</div>
						<br>
						<div id="accordion2" class="accordion">
						<form  name="formPlanAlcance" id="formPlanAlcance" method="post">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#definicionAlcance" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">
										Definici&oacute;n del Alcance
									</a>
								</div>

								<div class="accordion-body in collapse" id="definicionAlcance">
									<div class="accordion-inner">
										<br>
										<div class="control-group">
											<textarea class="span12" id="txtdefinicionAlcance" name="definicionAlcance">${model.alcanceInicial}</textarea>
										</div>
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
											<div class="span12">
												<div class="control-group">
													<label class="control-label" for="tipo">Tipo</label>	
													<div class="controls">
														<select id="idTipoRequisito" title="tipo">
															<option value="">Seleccionar</option>
															<c:forEach var="tipoRequisito" items="${model.listaTipoRequisito}" varStatus="contador">
															   <option value="${tipoRequisito.id}">${tipoRequisito.descripcion}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<div class="span6">
													<div class="control-group">
														<label class="control-label" for="descripcion">Descripción</label>	
														<div class="controls">
															<input type="text" id="idDescripcionAlcance" class="span12" placeholder="Descripción"/>															
														</div>
													</div>
												</div>
												<div class="span6">
													<div class="control-group">
														<label class="control-label" for="observacion">Observación</label>	
														<div class="controls">
															<input type="text" id="idObservacionAlcance" class="span12" placeholder="Observación"/>															
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span9"></div>
											<div class="span3">
												<a class="btn btn-small btn-info span12" onclick="agregarPlanificacionRequisito()">
													<i class="icon-plus-sign bigger-125"></i>
													Agregar Requisito
												</a>
											</div>										
										</div>
										<br>
										<table id="tablaReqProyecto" class="table table-striped table-bordered table-hover" style = "width : 100%">
											<thead>
												<tr>
													<th>Tipo</th>
													<!-- <th>Codigo</th> -->
													<th>Descripci&oacute;n</th>
													<th>Observaciones</th>
<!-- 													<th>Mockups</th> -->
													<th>Opciones</th>
												</tr>
											</thead>
				
											<tbody>
												<!-- <tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>													
												</tr> -->
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
											<div class="control-group">
												<label class="control-label" for="descripcion">Descripción</label>	
												<div class="controls">
													<input type="text" id="idDescripcionExlclusion" class="span12" placeholder="Descripción"/>															
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span9"></div>
											<div class="span3">
												<a class="btn btn-small btn-info span12" onclick="agregarPlanificacionExclusion()">
													<i class="icon-plus-sign bigger-125"></i>
													Agregar Exclusi&oacute;n
												</a>
											</div>										
										</div>
										<br>
										<table id="tablaExclProyecto" class="table table-striped table-bordered table-hover" style= "width:100%">
											<thead>
												<tr>
													<!-- <th>Codigo</th> -->
													<th>Descripci&oacute;n</th>
													<th>Opciones</th>
												</tr>
											</thead>
				
											<tbody>
												<!-- <tr>
													<td></td>
													<td></td>
													<td></td>													
												</tr> -->
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
											<div class="span12">
												<div class="control-group">
													<label class="control-label" for="tipo">Tipo</label>	
													<div class="controls">
														<select id="idTipoSupuesto" title="tipo">
															<option value="">Seleccionar</option>
															<c:forEach var="tipoSupuesto" items="${model.listaTipoSupuesto}" varStatus="contador">
															   <option value="${tipoSupuesto.id}">${tipoSupuesto.descripcion}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<div class="control-group">
													<label class="control-label" for="descripcion">Descripción</label>	
													<div class="controls">
														<input type="text" id="idDescripcionSupuesto" class="span12" placeholder="Descripción"/>															
													</div>
												</div>											
											</div>
										</div>
										<div class="row-fluid">
											<div class="span9"></div>
											<div class="span3">
												<a class="btn btn-small btn-info span12" onclick="agregarPlanificacionSupuesto()">
													<i class="icon-plus-sign bigger-125"></i>
													Agregar Supuesto
												</a>
											</div>										
										</div>
										<br>									
										<table id="tablaSupuestoProyecto" class="table table-striped table-bordered table-hover" style = "width: 100%">
											<thead>
												<tr>
													<th>Tipo</th>
													<th>Descripci&oacute;n</th>
													<th>Opciones</th>
												</tr>
											</thead>
				
											<tbody>
												<!-- <tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>													
												</tr> -->
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
											<div class="span12">
												<div class="control-group">
													<label class="control-label" for="tipo">Tipo</label>	
													<div class="controls">
														<select id="idTipoDependencia" title="tipo">
															<option value="">Seleccionar</option>
															<c:forEach var="tipoDependencia" items="${model.listaTipoDependencia}" varStatus="contador">
															   <option value="${tipoDependencia.id}">${tipoDependencia.descripcion}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<div class="control-group">
													<label class="control-label" for="descripcion">Descripción</label>	
													<div class="controls">
														<input type="text" id="idDescripcionDependencia" class="span12" placeholder="Descripción"/>															
													</div>
												</div>											
											</div>
										</div>
										<div class="row-fluid">
											<div class="span9"></div>
											<div class="span3">
												<a class="btn btn-small btn-info span12" onclick="agregarPlanificacionDependencia()">
													<i class="icon-plus-sign bigger-125"></i>
													Agregar Dependencia
												</a>
											</div>										
										</div>
										<br>
										<table id="tablaDependenciaProyecto" class="table table-striped table-bordered table-hover" style ="width:100%">
											<thead>
												<tr>
													<th>Tipo</th>
													<th>Descripci&oacute;n</th>
													<th>Opciones</th>
												</tr>
											</thead>
				
											<tbody>
												<!-- <tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>													
												</tr> -->
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
											<div class="control-group">
												<label class="control-label" for="descripcion">Descripción</label>	
												<div class="controls">
													<input type="text" id="idDescripcionFactorExito" class="span12" placeholder="Descripción"/>															
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span9"></div>
											<div class="span3">
												<a class="btn btn-small btn-info span12" onclick="agregarPlanificacionFactorExito()">
													<i class="icon-plus-sign bigger-125"></i>
													Agregar Factor
												</a>
											</div>										
										</div>
										<br>
										<table id="tablafactExitoProyecto" class="table table-striped table-bordered table-hover" style="width: 100%">
											<thead>
												<tr>
													<!-- <th>Codigo</th> -->
													<th>Descripci&oacute;n</th>
													<th>Opciones</th>
												</tr>
											</thead>
				
											<tbody>
												<!-- <tr>
													<td></td>
													<td></td>
													<td></td>													
												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</form>
						</div>
					</div>
					<!-- FIN - PLANIFICACION - ALCANCE  -->

					<div id="recursoHumanos" class="tab-pane">
                        <div id="accordion3" class="accordion">
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a href="#OrgEquipo" data-parent="#accordion3" data-toggle="collapse" class="accordion-toggle collapsed">
                                        Equipos
                                    </a>
                                </div>
 
                                <div class="accordion-body in collapse" id="OrgEquipo">
                                    <div class="accordion-inner">
                                        <form  name="formTipoRolProveedor" id="formTipoRolProveedor" method="post">
                                        <div class="row-fluid">
                                            <div class="span12">                                                
                                                <h4 class="lighter smaller" style = "color: #2679b5 !important">Proveedor</h4>  
                                                <hr width="100%" style = "border-bottom: 1px dotted #e2e2e2">                                                                                             
                                                <div class="row-fluid">
                                                    <div class="span12">
                                                        <div class="span6">
                                                            <div class="control-group">
                                                                <label class="control-label" for="tipoRolProveedor">Tipo de Rol</label> 
                                                                <div class="controls">
                                                                    <select id="idTipoRolProveedor" name="idTipoRolProveedor" title="tipoRolProveedor">
                                                                        <option value="">Seleccionar</option>
                                                                        <c:forEach var="tipoRol" items="${model.listaTipoRolProveedor}" varStatus="contador">
                                                                           <option value="${tipoRol.id}">${tipoRol.nombreRol}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>                                                            
                                                        </div>
                                                        <div class="span6">
                                                            <div class="control-group">
                                                                <label class="control-label" for="cantidadTipoRolProveedor">Cantidad</label>    
                                                                <div class="controls">
                                                                    <input type="text" id="idCantidadTipoRolProveedor" name="idCantidadTipoRolProveedor" class="span12" placeholder="Cantidad"/>                                                            
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>                                                            
                                                <div class="row-fluid">
                                                    <div class="span9"></div>
                                                    <div class="span3">
                                                        <a class="btn btn-small btn-info span12" onclick="guardarRolProveedor()">
                                                            <i class="icon-save bigger-125"></i>
                                                            Guardar Rol Proveedor
                                                        </a>
                                                    </div>                                        
                                                </div>
                                                <br>
                                                <table id="tablaTipoRolProveedor" class="table table-striped table-bordered table-hover" style = "width : 100%">
                                                    <thead>
                                                        <tr>
                                                            <th>Id</th>     
                                                            <th>Rol Proveedor</th>
                                                            <th>Cantidad</th>
                                                            <th>Opciones</th>
                                                        </tr>
                                                    </thead>
                        
                                                    <tbody>
                                                        <!-- <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>                                                   
                                                        </tr> -->
                                                    </tbody>
                                                </table>                                                                                                                           
                                            </div>
                                        </div>    
                                        </form>
                                        <hr width="100%" style = "border-bottom: 1px dotted #e2e2e2">
                                        <hr width="100%" style = "border-bottom: 1px dotted #e2e2e2"> 
                                        <form  name="formTipoRolCliente" id="formTipoRolCliente" method="post">                                     
                                        <div class="row-fluid">
                                            <div class="span12">                                                
                                                <h4 class="lighter smaller" style = "color: #2679b5 !important">Cliente</h4>    
                                                <hr width="100%" style = "border-bottom: 1px dotted #e2e2e2">                                                                                             
                                                <div class="row-fluid">
                                                    <div class="span12">
                                                        <div class="span6">
                                                            <div class="control-group">
                                                                <label class="control-label" for="tipoRolCliente">Tipo de Rol</label>   
                                                                <div class="controls">
                                                                    <select id="idTipoRolCliente" name="idTipoRolCliente" title="tipoRolCliente">
                                                                        <option value="">Seleccionar</option>
                                                                        <c:forEach var="tipoRol" items="${model.listaTipoRolCliente}" varStatus="contador">
                                                                           <option value="${tipoRol.id}">${tipoRol.nombreRol}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>                                                            
                                                        </div>
                                                        <div class="span6">
                                                            <div class="control-group">
                                                                <label class="control-label" for="cantidadTipoRolCliente">Cantidad</label>  
                                                                <div class="controls">
                                                                    <input type="text" id="idCantidadTipoRolCliente" name="idCantidadTipoRolCliente" class="span12" placeholder="Cantidad"/>                                                            
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>                                                            
                                                <div class="row-fluid">
                                                    <div class="span9"></div>
                                                    <div class="span3">
                                                        <a class="btn btn-small btn-info span12" onclick="guardarRolCliente()">
                                                            <i class="icon-save bigger-125"></i>
                                                            Guardar Rol Cliente
                                                        </a>
                                                    </div>                                        
                                                </div>
                                                <br>
                                                <table id="tablaTipoRolCliente" class="table table-striped table-bordered table-hover" style = "width : 100%">
                                                    <thead>
                                                        <tr>
                                                            <th>Id</th>     
                                                            <th>Rol Cliente</th>
                                                            <th>Cantidad</th>
                                                            <th>Opciones</th>
                                                        </tr>
                                                    </thead>
                        
                                                    <tbody>
                                                        <!-- <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>                                                   
                                                        </tr> -->
                                                    </tbody>
                                                </table>                                                                                                                                                                  
                                            </div>
                                        </div>    
                                        </form>                                                                   
                                    </div>
                                </div>
                            </div>
							
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#responsabilidades" data-parent="#accordion3" data-toggle="collapse" class="accordion-toggle collapsed">
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
						<div class="row-fluid">
							<div class="span12">
								<div class="page-header position-relative"><h1>Riesgos del Proyecto</h1></div>
							</div>
						</div>						
										
					<div class="row-fluid">
						<div class="span12">
							<div class="span9"></div>
								<div class="span3" style="float:left;">
									<a class="btn btn-small btn-info span12" onclick="guardarDetalleRiesgos()">
										<i class="icon-save bigger-125"></i>
										Guardar
									</a>
								</div>
						</div>
					</div>
					<div class="space-10"></div>	
					
					<form  name="formDetalleRiesgos" id="formDetalleRiesgos" method="post">					
						<div class="row-fluid">
							<div class="span12">
							<div class="span6">
							<div class="control-group">
								<label class="control-label" for="valRiesgo">Riesgo:</label>
								<div class="controls">
									<div class="span6">
										<input type="text" class="span12" id="valRiesgo" name="valRiesgo"  />
									</div>
								</div>
							</div>
							</div>
				
							<div class="span6">
							<div class="control-group">
								<label class="control-label" for="valResponsable">Responsable:</label>
								<div class="controls">
									<div class="span6">
										<input type="text" class="span12" id="valResponsable" name="valResponsable"  />
									</div>
								</div>
							</div>							
							</div>
							</div>
						</div>
						
						<div class="row-fluid">
							<div class="span12">
							<div class="span6">
							<div class="control-group">
								<label class="control-label" for="valImpacto">Impacto:</label>
								<div class="controls">
									<div class="span6">
										<input type="text" class="span12" id="valImpacto" name="valImpacto"  />
									</div>
								</div>
							</div>
							</div>
				
							<div class="span6">
							<div class="control-group">
								<label class="control-label" for="valProbabilidad">Probabilidad:</label>
								<div class="controls">
									<div class="span6">
										<input type="text" class="span12" id="valProbabilidad" name="valProbabilidad"  />
									</div>
								</div>
							</div>							
							</div>
							</div>
						</div>
						
						<div class="row-fluid">
							<div class="span12">
							<div class="span6">
							<div class="control-group">
								<label class="control-label" for="valContigencia">Contigencia:</label>
								<div class="controls">
									<div class="span6">
										<input type="text" class="span12" id="valContigencia" name="valContigencia"  />
									</div>
								</div>
							</div>
							</div>
				
							<div class="span6">
							<div class="control-group">
								<label class="control-label" for="valMitigacion">Mitigaci&oacute;n:</label>
								<div class="controls">
									<div class="span6">
										<input type="text" class="span12" id="valMitigacion" name="valMitigacion"  />
									</div>
								</div>
							</div>							
							</div>
							</div>
						</div>								
					</form>								
						
					<div class="space-20"></div>					
						<div class="row-fluid">
							<table id="tablaRiesgosProyecto" class="table table-striped table-bordered table-hover" style = "width : 100%">
								<thead>
									<tr>
										<th>Id</th>
										<th>Riesgo</th>
										<th>Responsable</th>
										<th>Impacto</th>
										<th>Probabilidad</th>
										<th>Contingencia</th>
										<th>Mitigaci&oacute;n</th>
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
										<td></td>		
										<td></td>
										<td></td>											
									</tr>
								</tbody>
							</table>
						</div>
<!-- 						<div class="space-20"></div> -->
						<br>
						<div class="row-fluid">
							<div class="span12">
								<fieldset>
								  <legend style="font-size: 10px;margin-bottom: 0px;">LEYENDA IMPACTO</legend>
								
								  <div class="span1"></div>
								  <div class="span2"><label class="leyendaClass">5 - Muy bajo.</label></div>
								  <div class="span2"><label class="leyendaClass">10 - Bajo.</label></div>
								  <div class="span2"><label class="leyendaClass">20 - Moderado.</label></div>
								  <div class="span2"><label class="leyendaClass">40 - Alto.</label></div>
								  <div class="span2"><label class="leyendaClass">80 - Muy alto.</label></div>
									  <div class="span1"></div>
								</fieldset>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<fieldset>
								  <legend style="font-size: 10px;margin-bottom: 0px;">LEYENDA PROBABILIDAD</legend>
								
								  <div class="span1"></div>
								  <div class="span2"><label class="leyendaClass">10 - Muy bajo.</label></div>
								  <div class="span2"><label class="leyendaClass">30 - Bajo.</label></div>
								  <div class="span2"><label class="leyendaClass">50 - Moderado.</label></div>
								  <div class="span2"><label class="leyendaClass">70 - Alto.</label></div>
								  <div class="span2"><label class="leyendaClass">90 - Muy alto.</label></div>
								  <div class="span1"></div>
								</fieldset>
							</div>
						</div>
					</div>

					<div id="adquisiciones" class="tab-pane">
					<div class="row-fluid">
							<div class="span12">
								<div class="page-header position-relative"><h1>Adquisiciones para el Proyecto</h1></div>
							</div>
						</div>						
										
					<div class="row-fluid">
						<div class="span12">
							<div class="span9"></div>
								<div class="span3" style="float:left;">
									<a class="btn btn-small btn-info span12" onclick="guardarDetalleAdquisicion()">
										<i class="icon-save bigger-125"></i>
										Guardar
									</a>
								</div>
						</div>
					</div>
					<div class="space-10"></div>
					
					<form  name="formDetalleAdquisicion" id="formDetalleAdquisicion" method="post">						
						<div class="row-fluid">
							<div class="span12">
								<div class="span6">
								<div class="control-group">
									<label class="control-label" for="valProductoAD">Producto:</label>
									<div class="controls">
									<div class="span6">
										<input type="text" class="span12" id="valProductoAD" name="valProductoAD" />
									</div>
									</div>
								</div>	
								</div>
				
								<div class="span6">
								<div class="control-group">
									<label class="control-label" for="idCategoriaAD">Categor&iacute;a:</label>
									<div class="controls">
										<div class="span6">
											<select id="idCategoriaAD" name="idCategoriaAD" >
											<option value="">Seleccionar</option>
											<c:forEach var="listCategoriaAdqui" items="${model.listaCategoriaAdquisicion}" varStatus="pago">
												<option value="${listCategoriaAdqui.id}">${listCategoriaAdqui.descripcion}</option>
											</c:forEach>
											</select>
										</div> 
									</div>
								</div>
								</div>
								</div>
							</div>
							
						<div class="row-fluid">
							<div class="span12">
							<div class="span6">
							<div class="control-group">
								<label class="control-label" for="valCantidadAD">Cantidad:</label>
								<div class="controls">
									<div class="span6">
										<input type="text" class="span12" id="valCantidadAD" name="valCantidadAD"  />
									</div>
								</div>
							</div>
							</div>
				
							<div class="span6">
							<div class="control-group">
								<label class="control-label" for="valCostoUnitAD">Costo Unitario:</label>
								<div class="controls">
									<div class="span6">
										<input type="text" class="span12" id="valCostoUnitAD" name="valCostoUnitAD"  />
									</div>
								</div>
							</div>							
							</div>
							</div>
						</div>
						
						<div class="row-fluid">
							<div class="span12">
								<div class="span6">
								<div class="control-group">
									<label class="control-label" for="fechaAdquirirAD">Fecha Adquisici&oacute;n:</label>
									<div class="controls">
										<div class="row-fluid input-append">
											<input id="fechaAdquirirAD" name="fechaAdquirirAD" type="text" data-date-format="dd-mm-yyyy" />
											<span class="add-on">
											<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
								</div>
				
								<div class="span6">								
								</div>
								</div>
						</div>
					</form>
						
						
						
						
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaAdquisicionesProyecto" class="table table-striped table-bordered table-hover" style = "width : 100%">
								<thead>
									<tr>
										<th>Id</th>
										<th>Producto</th>
										<th>Categor&iacute;a</th>
										<th>Cantidad</th>
										<th>Costo Un.</th>
										<th>Fecha de Adquisici&oacute;n</th>
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
										<td></td>
										<td></td>												
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div id="costos" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="span9">Costos del Proyecto</div>
								<div class="span3">
									<label>TOTAL COSTOS: S/. xxx.xx</label>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaCostosProyecto" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Rol</th>
										<th>Tipo</th>
										<th>Banda Salarial</th>
										<th>Costo</th>
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

					<div id="costosOperativos" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="span8">Costos Operativos</div>
								<div class="span4">
									<button class="btn btn-info span12">
										<i class="icon-plus bigger-125"></i>
										Agregar Costo operativo
									</button>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaCostosProyecto" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Tipo</th>
										<th>Descripci&oacute;n</th>
										<th>Fecha</th>
										<th>Monto</th>
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

					<div id="presupuesto" class="tab-pane">
						<p>"presupuesto"	.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
					</div>

					<div id="formasdePago" class="tab-pane">
						<div class="row-fluid">
							<div class="span12">
								<div class="page-header position-relative"><h1>Formas de Pago</h1></div>
							</div>
						</div>
						
						<div class="row-fluid">
							<div class="span12">
								<div class="span9"></div>
								<div class="span3" style="float:left;">
									<a class="btn btn-small btn-info span12" onclick="guardarFormaPago()">
										<i class="icon-save bigger-125"></i>
										Guardar
									</a>
								</div>
							</div>
						</div>	
						<div class="space-20"></div>
						
					<form  name="formFormasPago" id="formFormasPago" method="post">						
						<div class="row-fluid">
								<div class="span12">
								<div class="span6">
								<div class="control-group">
									<label class="control-label" for="fechaInicio">Fecha Facturaci&oacute;n:</label>
									<div class="controls">
										<div class="row-fluid input-append">
											<input id="fechaFacturaFP" name="fechaFacturaFP" type="text" data-date-format="dd-mm-yyyy" />
											<span class="add-on">
											<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
								</div>
				
								<div class="span6">
								<div class="control-group">
									<label class="control-label" for="idFormaPago">Forma Pago:</label>
									<div class="controls">
										<div class="span6">
											<select id="idFormaPago" name="idFormaPago" >
											<option value="">Seleccionar</option>
											<c:forEach var="listFormaPago" items="${model.listaFormaPago}" varStatus="pago">
												<option value="${listFormaPago.id}">${listFormaPago.descripcion}</option>
											</c:forEach>
											</select>
										</div> 
									</div>
								</div>
								</div>
								</div>
							</div>
								
							<div class="row-fluid">
							<div class="span12">
								<div class="span6">
								<div class="control-group">
									<label class="control-label" for="fechaInicio">Fecha Cobranza:</label>
									<div class="controls">
										<div class="row-fluid input-append">
											<input id="fechaCobranzaFP" name="fechaCobranzaFP" type="text" data-date-format="dd-mm-yyyy" />
											<span class="add-on">
											<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
								</div>
								
								<div class="span6">
								<div class="control-group">
									<label class="control-label" for="idEntregableFP">Entregables:</label>
									<div class="controls">
										<div class="span6">
											<select id="idEntregableFP" name="idEntregableFP" >
											<option value="">Seleccionar</option>
											<c:forEach var="listEntregable" items="${model.listaEntregable}" varStatus="contador">
												<option value="${listEntregable.identregable}">${listEntregable.nombre}</option>
											</c:forEach>
											</select>
										</div> 
									</div>
								</div>
								</div>								
								</div>
								</div>
							
							<div class="row-fluid">
							<div class="span12">
								<div class="span6">
								<div class="control-group">
									<label class="control-label" for="valPorcPago">% Pago:</label>
										<div class="controls">
											<div class="span6">
												<input type="text" class="span12" id="valPorcPago" name="valPorcPago" placeholder="% Pago" />
											</div>
										</div>
								</div>
								</div>
							</div>
							</div>
							</form>														
							
						<div class="space-20"></div>
						<div class="row-fluid">
							<table id="tablaFormasPago" class="table table-striped table-bordered table-hover" style = "width : 100%">
								<thead>
									<tr>
										<th>Id</th>										
										<th>Fecha Facturaci&oacute;n</th>
										<th>Forma Pago</th>
										<th>Fecha Cobranza</th>
										<th>Entregables</th>
										<th>% Pago</th>
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
										<td></td>
										<td></td>												
									</tr>
								</tbody>
							</table>
						</div>
								
								
													
					</div>

					<div id="contrato" class="tab-pane">
                        <div class="row-fluid">
                            <div class="span12">
                                <div class="page-header position-relative"><h1>Propuesta de Servicio</h1></div>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div class="span12">
                                <div class="span9"></div>
                                <div class="span3" style="float:left;">
                                    <a class="btn btn-small btn-info span12" onclick="generarPDFPropuesta()">
                                        <i class="icon-save bigger-125"></i>
                                        Generar PDF
                                    </a>
                                </div>                                
                            </div>
                        </div>
                        <hr width="100%" style = "border-bottom: 1px dotted #e2e2e2">
                        <form  name="formPropuestaServicio" id="formPropuestaServicio" method="post">
                            <div class="row-fluid">
                                <div class="span12">
                                    <label class="control-label" for="fechaInicio">Contrato del Proyecto:</label>
                                    <div class="control-group">
                                        <div class="controls">
                                            <input type="file" id="archContrato" />
                                        </div>
                                    </div>                                                                
                                </div>    
                                </div>
                            <div class="row-fluid"> 
                                <div class="span12">
                                    <div class="span9"></div>
                                    <div class="span3">
                                        <a class="btn btn-small btn-info span12" onclick="guardarContrato()">
                                            <i class="icon-save bigger-125"></i>
                                                Guardar contrato
                                        </a>
                                    </div>                                
                                </div>            
                            </div>                            
                        </form>
                    </div>
				</div>
			</div>
		</div>
	</div>
<!-- 	<div class="space-20"></div> -->
<!-- 	Jr. Leon Velarde -->

	<!-- INI - MODAL ELIMINAR REQUISITO PROYECTO TABLA-->
	<div id="modalEliminarRequisitoProyecto" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar requisito?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarRequisitoProyecto" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>

	</div>
	<!-- FIN - MODAL ELIMINAR REQUISITO PROYECTO TABLA-->
	
	<!-- INICIO - MODAL ELIMINAR FORMAS PAGO -->
	<div id="modalEliminarFormasPago" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar Forma de Pago?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarFormasPago" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>
	</div>	
	<!-- FIN - MODAL ELIMINAR FORMAS PAGO -->
	
	<!-- INICIO - MODAL DETALLE RIESGO -->
	<div id="modalEliminarDetalleRiesgo" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar Riesgo?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarDetalleRiesgo" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>
	</div>
	<!-- FIN - MODAL DETALLE RIESGO -->
	
	<!-- INICIO - MODAL DETALLE ADQUISICION -->
	<div id="modalEliminarDetalleAdquisicion" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar Adquisición?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarDetalleAdquisicion" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>
	</div>	
	<!-- FIN - MODAL DETALLE ADQUISICION -->	
	
	<!-- INI - MODAL ELIMINAR EXCLUSIONES TABLA-->
	<div id="modalEliminarExclusiones" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar exclusión?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarExclusion" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>

	</div>
	<!-- FIN - MODAL ELIMINAR EXCLUSIONES TABLA-->
	
	<!-- INI - MODAL ELIMINAR SUPUESTO TABLA-->
	<div id="modalEliminarSupuesto" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar supuesto?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarSupuesto" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>

	</div>
	<!-- FIN - MODAL ELIMINAR SUPUESTO TABLA-->
	
	<!-- INI - MODAL ELIMINAR DEPENDENCIA TABLA-->
	<div id="modalEliminarDependencia" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar dependencia?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarDependencia" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>

	</div>
	<!-- FIN - MODAL ELIMINAR DEPENDENCIA TABLA-->	
	
	<!-- INI - MODAL ELIMINAR FACTOR EXITO TABLA-->
	<div id="modalEliminarFactorExito" class="modal hide fade" tabindex="-1" data-attr-index="" >
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿Est&aacute; seguro que desea eliminar factor de éxito?</b> 	
		</div>

		<div class="modal-footer">
			<a id ="confirmarEliminarFactorExito" class="btn btn-small btn-primary">
				<i class="icon-ok"></i> Confirmar
			</a>
			<a class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</a>
		</div>		
	</div>
	<!-- FIN - MODAL ELIMINAR FACTOR EXITO TABLA-->	
	
	<!-- INI - MODAL ELIMINAR TIPO ROL PROVEEDOR -->
    <div id="modalEliminarTipoRolProveedor" class="modal hide fade" tabindex="-1" data-attr-index="" >
        <div class="modal-header no-padding">
            <div class="table-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        </div>
 
        <div class="modal-body padding">
            <b style="text-align: center">¿Est&aacute; seguro que desea eliminar tipo de rol?</b>     
        </div>
 
        <div class="modal-footer">
            <a id ="confirmarEliminarTipoRolProveedor" class="btn btn-small btn-primary">
                <i class="icon-ok"></i> Confirmar
            </a>
            <a class="btn btn-small btn-light" data-dismiss="modal">
                <i class="icon-remove"></i> Salir
            </a>
        </div>
 
    </div>
    <!-- FIN - MODAL ELIMINAR TIPO ROL PROVEEDOR -->
    
    <!-- INI - MODAL ELIMINAR TIPO ROL CLIENTE -->
    <div id="modalEliminarTipoRolCliente" class="modal hide fade" tabindex="-1" data-attr-index="" >
        <div class="modal-header no-padding">
            <div class="table-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        </div>
 
        <div class="modal-body padding">
            <b style="text-align: center">¿Est&aacute; seguro que desea eliminar tipo de rol?</b>     
        </div>
 
        <div class="modal-footer">
            <a id ="confirmarEliminarTipoRolCliente" class="btn btn-small btn-primary">
                <i class="icon-ok"></i> Confirmar
            </a>
            <a class="btn btn-small btn-light" data-dismiss="modal">
                <i class="icon-remove"></i> Salir
            </a>
        </div>
 
    </div>
    <!-- FIN - MODAL ELIMINAR TIPO ROL CLIENTE --> 
	
<script type="text/javascript">
	var datosGrillas={};
	datosGrillas = {"listaTipoRequisitoBD":'${model.listaTipoRequisitoBD}',
			"listaExclusionBD":'${model.listaExclusionBD}',
			"listaSupuestoBD":'${model.listaSupuestoBD}',
			"listaDependenciaBD":'${model.listaDependenciaBD}',
			"listaFactorExitoBD":'${model.listaFactorExitoBD}',
			"listaDetalleFormaPagoBD":'${model.listaDetalleFormaPagoBD}',
		 	"listaDetalleRiesgoBD":'${model.listaDetalleRiesgoBD}',
		 	"listaDetalleAdquisicionBD":'${model.listaDetalleAdquisicionBD}',
		 	"listaTipoRolProveedorBD":'${model.listaTipoRolProveedorBD}',
	        "listaTipoRolClienteBD":'${model.listaTipoRolClienteBD}',
	        "listaDetalleRolProyectoProveedorBD":'${model.listaDetalleRolProyectoProveedorBD}',
	        "listaDetalleRolProyectoClienteBD":'${model.listaDetalleRolProyectoClienteBD}'};
</script>

	

</div>	