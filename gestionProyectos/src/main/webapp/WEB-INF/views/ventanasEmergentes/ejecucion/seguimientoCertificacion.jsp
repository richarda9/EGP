<form id="formSeguiCertificacion" class="form-horizontal">
<div id="modalSeguiCertificacion" class="modal hide" tabindex="-1">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="blue bigger">Seguimiento Certificaci&oacute;n</h4>
	</div>

	<div class="modal-body overflow-visible">
		<div class="row-fluid">
			<input type="hidden" id="idEntregableSeguimiento" name="id">
			<input type="hidden" id="idSegEntregableProyecto" name="idproyecto">
			<div class="control-group">
				<label class="control-label" for="fecCancelacion">Estado:</label>

				<div class="controls">
					<select class="span12" id="estadoTarea" name="idestadoEntregable">
						<option value="">Seleccionar</option>
						<c:forEach var="lista" items="${model.EstadoSeguimientoCertificacion}" varStatus="contador">
						   <option value="${lista.id}">${lista.descripcion}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="comentariosSeguiCertificacion">Comentarios</label>
				<div class="controls">
					<textarea class="span12" rows="5" cols="20" id="comentariosSeguiCertificacion" name="observacionCertificacion" maxlength="500"></textarea>
				</div>
			</div>
		</div>
	</div>

	<div class="modal-footer">
		<button class="btn btn-small" data-dismiss="modal">
			<i class="icon-remove"></i> Cancelar
		</button>

		<button type="submit" class="btn btn-small btn-primary">
			<i class="icon-save"></i> Guardar
		</button>
	</div>
</div>
</form>