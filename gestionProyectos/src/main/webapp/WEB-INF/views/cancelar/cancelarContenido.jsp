<form id="formCancelarProyecto" class="form-horizontal">
<div id="modalCancelarProyecto" class="modal hide" tabindex="-1">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="blue bigger">Cancelar Proyecto</h4>
	</div>

	<div class="modal-body overflow-visible">
		<div class="row-fluid">
			<input type="hidden" id="idCancelarProyecto" name="idproyecto">
			<div class="control-group">
				<label class="control-label" for="fecCancelacion">Fecha de Cancelaci&oacute;n</label>

				<div class="controls">
					<div class="row-fluid">
						<input id="fecCancelacion" name="fecCancelacion" type="text" readonly="readonly"/>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="cancelarJustificacionProyecto">Justificaci&oacute;n</label>

				<div class="controls">
					<textarea rows="5" cols="20" id="cancelarJustificacionProyecto" name="cancelarJustificacionProyecto"></textarea>
				</div>
			</div>
		</div>
	</div>

	<div class="modal-footer">
		<button class="btn btn-small btn-primary" type="submit">
			<i class="icon-remove-sign"></i> Cancelar
		</button>
		
		<button class="btn btn-small" data-dismiss="modal">
			<i class="icon-undo"></i> Regresar
		</button>		
	</div>
</div>
</form>