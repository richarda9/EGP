<!-- [INI] MODAL EDITAR SEGUIMIENTO DE ENTREGABLE-->
<form id="editarSegEntregable" class="form-horizontal">
	<div id="modal-editarEntregable" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Seguimiento de Entregable</h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<div class="control-group">
				<label class="control-label" for="editEstadoSegEntregable">Estado:</label>
				<div class="controls">
					<select name="" id="editEstadoSegEntregable"></select>
				</div>
			</div>	
			<div class="control-group">
				<label class="control-label" for="editfecRespSegEntregable">Fecha de Respuesta:</label>
				<div class="controls">
					<div class="row-fluid input-append">
						<input class="date-picker" id="editfecRespSegEntregable" type="text"/>
						<span class="add-on"><i class="icon-calendar"></i></span>
					</div>
				</div>
			</div>	
			<div class="control-group">
				<label class="control-label" for="editResponsableSegEntregable">Responsable:</label>
				<div class="controls">
					<select name="" id="editResponsableSegEntregable"></select>
				</div>
			</div>	
			<div class="control-group">
				<label class="control-label" for="editComRespSegEntregable">Comentario de Respuesta:</label>
				<div class="controls">
					<textarea rows="5" name="" id="editComRespSegEntregable"></textarea>
				</div>
			</div>		
		</div>
		<div class="modal-footer">
			<button class="btn btn-small" data-dismiss="modal">
				<i class="icon-undo"></i>
				Salir
			</button>

			<button id="asignarRecursoTarea" class="btn btn-small btn-primary">
				<i class="icon-save"></i>
				Guardar
			</button>
		</div>
	</div>
</form>
<!-- [FIN] MODAL EDITAR SEGUIMIENTO DE ENTREGABLE -->