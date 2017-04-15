<!-- [INI] MODAL ENVIAR A CERTIFICACION-->
<form id="registrarEnvioCertificacion">
	<div id="modal-EnviarCertificacion" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Env&iacute;o para Certificaci&oacute;n</h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<div class="row-fluid">
				<div class="span3">
					<button class="btn btn-app btn-primary no-radius">
						<i class="icon-envelope bigger-230"></i>Enviar
					</button>
				</div>
				<div class="span9">
					<div class="row-fluid">
						<div class="span2">Para:</div>
						<div class="span10"><input type="text" class="span12" id="destinoCertificacion"/></div>
					</div>
					<div class="row-fluid">
						<div class="span2">CC:</div>
						<div class="span10"><input type="text" class="span12" id="ccdestinoCertificacion"/></div>
					</div>
					<div class="row-fluid">
						<div class="span2">Asunto:</div>
						<div class="span10"><input type="text" class="span12" id="asuntoDestinoCertificacion"/></div>
					</div>
					<div class="row-fluid">
						<div class="span2">Entregable:</div>
						<div class="span10"><input type="file" id="envioEntregableCertificacion" /></div>
					</div>
				</div>
			</div>	
			<div class="row-fluid">
				<div class="span3">Observaciones:</div>
				<div class="span9"><textarea rows="5" class="span12" id="observacionCertificacion"></textarea></div>
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