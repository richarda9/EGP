<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="page-header position-relative">
		<h1>Empresa</h1>
	</div>
	<div class="row-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="span10"></div>
				<div class="span2">
					<a href="#modal-Empresa" role="button" class="btn btn-small btn-primary" data-toggle="modal">
						<i class="icon-plus"></i>Agregar 
					</a>
				</div>
			</div>
		</div>
		<br>
		<div class="row-fluid">
			<div class="table-header">Lista de Empresas</div>
			<table id="tablaEmpresaProyecto" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>Raz&oacute;n Social</th>
						<th>Pa&iacute;s</th>
						<th>Fecha de Registro</th>
						<th>Tel&eacute;fono</th>
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
	<!-- [INI] MODAL -->
	<form id="registrarEmpresa">
		<div id="modal-Empresa" class="modal hide" tabindex="-1">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">Registro Empresa</h4>
			</div>
			<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
				<div id="datosEmpresa" class="accordion">
					<div class="accordion-group">
						<div class="accordion-heading">
							<a href="#infoGeneral" data-parent="#datosEmpresa" data-toggle="collapse" class="accordion-toggle">
								Informaci&oacute;n General
							</a>
						</div>
	
						<div class="accordion-body in collapse" id="infoGeneral">
							<div class="accordion-inner">
								<div class="row-fluid">
									<div class="span3">Raz&oacute;n Social</div>
									<div class="span9"><input type="text" class="span12" id="rasonSocialEmpresa" /></div>
								</div>
								<div class="row-fluid">
									<div class="span3">Ruc</div>
									<div class="span4"><input type="text" class="span12" id="rucEmpresa" /></div>
									<div class="span1">Pa&iacute;s</div>
									<div class="span4"><select class="span12" id="paisEmpresa" ></select></div>
								</div>
								<div class="row-fluid">
									<div class="span3">P&aacute;gina Web</div>
									<div class="span9"><input type="text" class="span12" id="paginawebEmpresa" /></div>
								</div>
								<div class="row-fluid">
									<div class="span3">Direcci&oacute;n</div>
									<div class="span9"><input type="text" class="span12" id="direccionEmpresa" /></div>
								</div>
								<div class="row-fluid">
									<div class="span3">Redes Sociales</div>
									<div class="span4">
										<span class="span12 input-icon input-icon-left">
											<input type="text" class="span12" id="twitterEmpresa" />
											<i class="icon-twitter-sign"></i>
										</span>
									</div>
									<div class="span5">
										<span class="span12 input-icon input-icon-left">
											<input type="text" class="span12" id="fecebookEmpresa" />
											<i class="icon-facebook-sign"></i>
										</span>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span3"></div>
									<div class="span4">
										<span class="span12 input-icon input-icon-left">
											<input type="text" class="span12" id="linkedinEmpresa" />
											<i class="icon-linkedin-sign"></i>
										</span>
									</div>
									<div class="span5">
										<span class="span12 input-icon input-icon-left">
											<input type="text" class="span12" id="gmailEmpresa" />
											<i class="icon-google-plus-sign"></i>
										</span>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span3">Tel&eacute;no</div>
									<div class="span4"><input type="text" class="span12" id="teleEmpresa" /></div>
									<div class="span1">Anexo</div>
									<div class="span4"><input type="text" class="span12" id="anexoEmpresa"/></div>
								</div>
								<div class="row-fluid">
									<div class="span3">Correo</div>
									<div class="span9"><input type="text" class="span12" id="correoEmpresa" /></div>
								</div>
								<div class="row-fluid">
									<div class="span3">C&oacute;mo se contacto?</div>
									<div class="span9"><textarea class="span12" id="contactoEmpresa"></textarea></div>
								</div>
							</div>
						</div>
					</div>
	
					<div class="accordion-group">
						<div class="accordion-heading">
							<a href="#contactoCliente" data-parent="#datosEmpresa" data-toggle="collapse" class="accordion-toggle collapsed">
								Contactos del Cliente
							</a>
						</div>
	
						<div class="accordion-body collapse" id="contactoCliente">
							<div class="accordion-inner">
								<div class="row-fluid">
									<div class="span3">Nombres</div>
									<div class="span9"><input type="text" class="span12" id="nomContEmpresa" /></div>
								</div>
								<div class="row-fluid">
									<div class="span3">Apellidos</div>
									<div class="span9"><input type="text" class="span12" id="apeContEmpresa" /></div>
								</div>
								<div class="row-fluid">
									<div class="span3">Tel&eacute;no</div>
									<div class="span4"><input type="text" class="span12" id="teleContEmpresa" /></div>
									<div class="span1">Anexo</div>
									<div class="span4"><input type="text" class="span12" id="anexoContEmpresa"/></div>
								</div>
								<div class="row-fluid">
									<div class="span3">Correo Electr&oacute;nico</div>
									<div class="span9"><input type="text" class="span12" id="emailContEmpresa" /></div>
								</div>
								<div class="row-fluid">
									<div class="span3">Cargo</div>
									<div class="span4"><select class="span12" id="cargoContEmpresa"></select></div>
									<div class="span1">&Aacute;rea</div>
									<div class="span4"><input type="text" class="span12" id="areaContEmpresa"/></div>
								</div>
								<div class="row-fluid">
									<div class="span9"></div>
									<div class="span3">
										<button class="btn btn-small btn-primary" style="float: right;">
											<i class="icon-plus"></i>
											Agregar
										</button>
									</div>
								</div>
								<br>
								<div class="row-fluid">
									<div class="table-header">Tabla Contacto de Cliente</div>
									<table id="tablaContEmpresaProyecto" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>Raz&oacute;n Social</th>
												<th>Pa&iacute;s</th>
												<th>Fecha de Registro</th>
												<th>Tel&eacute;fono</th>
												<th>Opciones</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
	
					<div class="accordion-group">
						<div class="accordion-heading">
							<a href="#AdicionalEmp" data-parent="#datosEmpresa" data-toggle="collapse" class="accordion-toggle collapsed">
								Adicionales
							</a>
						</div>
	
						<div class="accordion-body collapse" id="AdicionalEmp">
						<br>
							<div class="row-fluid">
								<div class="span3">Logo</div>
								<div class="span8"><input type="file" id="logoEmpresa" /></div>
							</div>
							<div class="row-fluid">
								<div class="span3">Formato</div>
								<div class="span8"><input type="file" id="formatoEmpresa" /></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-small" data-dismiss="modal">
					<i class="icon-remove"></i>
					Cancelar
				</button>
	
				<button class="btn btn-small btn-primary">
					<i class="icon-save"></i>
					Guardar
				</button>
			</div>
		</div>
	</form>
	<!-- [FIN] MODAL -->
</div>