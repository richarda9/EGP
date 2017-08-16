<form id="registrarEntregables">
	<div id="modal-Entregable" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Entregables del Proyecto</h4>
		</div>

		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<input type="hidden" id="idEntregableProyecto" name="idEntregableProyecto">
			<div class="control-group row-fluid">
				<div class="control-label span3">Entregable:</div>
				<div class="span9">
					<input type="text" class="span12" id="valorET" name="valorET" />
				</div>
			</div>

			<div class="control-group row-fluid">
				<div class="span3">Descripci&oacute;n</div>
				<div class="span9">
					<textarea class="span12" id="valDescripcionET" name="valDescripcionET"></textarea>
				</div>
			</div>

			<div class="control-group row-fluid">
				<div class="control-label span3">Fecha Programada:</div>
				<div class="span9 input-append">
					<input id="fechaProgramadaET" name="fechaProgramadaET" type="text" class="span6" data-date-format="dd-mm-yyyy" /> 
						<span class="add-on"><i class="icon-calendar"></i></span>
				</div>
			</div>

			<div class="hr hr32 hr-dotted"></div>
			<div class="control-group row-fluid">
			    <input type="hidden" id="idDetProductoProyecto" name="idDetProductoProyecto">
				<div class="control-label span3">Producto:</div>
				<div class="span9">
					<input type="text" class="span8" id="valProductoET" name="valProductoET" />
				</div>
			</div>

			<div class="row-fluid">
				<div class="span4"></div>
				<div class="span8">					
					<div class="span6">
						<a onclick="agregarProductoEntregable()"
							class="btn btn-small btn-primary"> <i class="icon-plus"></i>
							Agregar Producto
						</a>
					</div>
					<div class="span6">
						<a onclick="eliminarProductoEntregable()"
							class="btn btn-small btn-primary"> <i class="icon-trash"></i>
							Eliminar Producto
						</a>
					
					</div>
				</div>
			</div>

			<div class="space-20"></div>
			<div class="row-fluid">
				<div class="table-header">Tabla Productos</div>
				<table id="tablaProductoEntregable" class="table table-striped table-bordered table-hover" style="width: 100%;">
					<thead>
						<tr>
							<th>Descripci&oacute;n Producto</th>
							<th>Opciones</th>
						</tr>
					</thead>
				</table>
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