<!-- [INI] MODAL ADQUISICIONES-->
<form id="registrarAdquisiciones">
	<div id="modal-Adquisiciones" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Registro de Adquisiciones</h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<div class="row-fluid">
				<div class="span2">ID:</div>
				<div class="span4"><input type="text" class="span6" id="idAdquisiciones" readonly="readonly"/></div>
				<div class="span2">Estado:</div>
				<div class="span4"><select class="span12" id="estadoAdquisiciones"></select></div>
			</div>
			<div class="row-fluid">
				<div class="span2">Categor&iacute;a:</div>
				<div class="span10"><select class="span5" id="categoriaAdquisiciones"></select></div>
			</div>
			<div class="row-fluid">
				<div class="span2">Descripci&oacute;n:</div>
				<div class="span10"><textarea rows="5" class="span12" id="descripcionAdquisiciones"></textarea></div>
			</div>
			<div class="row-fluid">
				<div class="span2">Fecha de Compra:</div>
				<div class="span4">
					<div class="row-fluid input-append">
						<input class="date-picker span10" id="fecCompAdquisiciones" type="text" />
						<span class="add-on">
							<i class="icon-calendar"></i>
						</span>
					</div>
				</div>
				<div class="span2">Responsable:</div>
				<div class="span4">
					<select class="span12" id="responsableAdquisiciones"></select>
				</div>
			</div>	
			<div class="row-fluid">
				<div class="span2">Cantidad:</div>
				<div class="span4"><input type="text" class="span12" id="cantAdquisiciones"/></div>
				<div class="span2">Costo Unitario:</div>
				<div class="span4">
					<input type="text" class="span12" id="costUniAdquisiciones"/>
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
<!-- [FIN] MODAL ADQUISICIONES -->