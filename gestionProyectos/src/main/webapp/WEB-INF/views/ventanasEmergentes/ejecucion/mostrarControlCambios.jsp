<form id="form-GuardarCtrolTarea" class="form-horizontal">
<div id="modal-mostrarCtrolCambio" class="modal hide" tabindex="-1">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="blue bigger">Control de Cambios</h4>
	</div>

	<div class="modal-body overflow-visible">
		<div class="row-fluid">
			<div class="control-group">
				<label class="control-label" for="ctrolCambiosTarea">Control de Cambios</label>
				<div class="controls">
					<select id="ctrolCambiosTarea" name="idCtrolCambioTarea">
						<option value="">Seleccionar</option>
						<c:forEach var="listaCtrolCambios" items="${model.listaCtrolCambios}" varStatus="contador">
							<option value="${listaCtrolCambios.idCtrolCambios}">${listaCtrolCambios.descripcionCtrolCambios}</option>
						</c:forEach>
					</select>
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