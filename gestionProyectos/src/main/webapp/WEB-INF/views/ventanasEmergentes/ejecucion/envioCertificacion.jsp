<!-- [INI] MODAL ENVIAR A CERTIFICACION-->
<form id="registrarEnvioCertificacion" enctype="multipart/form-data" method="post" action="mnt_EnvioCertificacion.htm">
	<div id="modal-EnviarCertificacion" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Env&iacute;o para Certificaci&oacute;n</h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<div class="row-fluid">
				<div class="span3">
					<button class="btn btn-app btn-primary no-radius" type="submit">
						<i class="icon-envelope bigger-230"></i>Enviar
					</button>
				</div>
				<div class="span9">
					<div class="control-group row-fluid">
						<div class="control-label span2">Para:</div>
						<div class="span10">
							<input type="hidden" id="idEnvioEntregable" name="id"/>
							<input type="hidden" name="idproyecto"/>
							<select id="idDestinoCertificacion" name="idDestinoCertificacion" class="span12" onchange="mostrarCorreoCertificador();"> 
								<option value="">Seleccionar</option>
								<c:forEach var="lista" items="${model.listaCertificador}" varStatus="contador">
								   <option value="${lista.id}" data-correo = "${lista.correo}">${lista.nombres}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="control-group row-fluid">
						<div class="control-label span2">Correo:</div>
						<div class="span10"><input type="text" class="span12" id="destinoCertificacion" name="destinoCertificacion" readonly="readonly"/></div>
					</div>
					<div class="control-group row-fluid">
						<div class="control-label span2">CC:</div>
						<div class="span10"><input type="text" class="span12" id="ccdestinoCertificacion" name="ccdestinoCertificacion"/></div>
					</div>
					<div class="control-group row-fluid">
						<div class="control-label span2">Asunto:</div>
						<div class="span10"><input type="text" class="span12" id="asuntoDestinoCertificacion" name="asuntoDestinoCertificacion"/></div>
					</div>
					<div class="control-group row-fluid">
						<div class="control-label span2">Entregable:</div>
						<div class="span10"><input type="file" id="envioEntregableCertificacion"/></div>
					</div>
				</div>
			</div>	
			<div class="control-group row-fluid">
				<div class="control-label span3">Observaciones:</div>
				<div class="span9"><textarea rows="5" class="span12" id="observacionCertificacion" name="observacionCertificacion"></textarea></div>
			</div>
		</div>
		<div class="modal-footer">
			<button class="btn btn-small" data-dismiss="modal">
				<i class="icon-undo"></i>
				Salir
			</button>	
		</div>
	</div>
</form>
<!-- [FIN] MODAL ENVIAR A CERTIFICACION -->