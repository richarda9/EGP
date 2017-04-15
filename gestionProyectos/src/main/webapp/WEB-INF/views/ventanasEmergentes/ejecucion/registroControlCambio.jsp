<!-- [INI] MODAL CONTROL DE CAMBIOS-->
<form id="registrarCtrolCambios">
	<div id="modal-ctrolCambios" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Registro de Control de Cambios</h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<div class="row-fluid">
				<div class="span2">ID:</div>
				<div class="span4"><input type="text" class="span6" id="idCtrolCambios" readonly="readonly"/></div>
				<div class="span2">Solicitante:</div>
				<div class="span4"><select class="span12" id="solicitanteCtrolCambios"></select></div>
			</div>
			<div class="row-fluid">
				<div class="span2">Descripci&oacute;n:</div>
				<div class="span10"><textarea rows="5" class="span12" id="descripcionCtrolCambios"></textarea></div>
			</div>
			<div class="row-fluid">
				<div class="span2">Fecha de Solicitud:</div>
				<div class="span4">
					<div class="row-fluid input-append">
						<input class="date-picker span10" id="fecSolCtrolCambios" type="text" />
						<span class="add-on">
							<i class="icon-calendar"></i>
						</span>
					</div>
				</div>
				<div class="span2">Complejidad:</div>
				<div class="span4">
					<select class="span12" id="complejidadCtrolCambios"></select>
				</div>
			</div>	
			<div class="row-fluid">
				<div class="span2">Horas Estimadas:</div>
				<div class="span4"><input type="text" class="span12" id="horasCtrolCambios"/></div>
<!-- 					<div class="span2">Costo Unitario:</div> -->
<!-- 					<div class="span4"> -->
<!-- 						<input type="text" class="span12" id="costUniAdquisiciones"/> -->
<!-- 					</div> -->
			</div>
			<div class="row-fluid">
				<div class="span2">Comentarios:</div>
				<div class="span10"><textarea rows="5" class="span12" id="comentariosCtrolCambios"></textarea></div>
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
<!-- [FIN] MODAL CONTROL DE CAMBIOS -->