<!-- [INI] MODAL ASIGNAR RECURSO-->
<form id="registrarRecursoTarea">
	<div id="mostrarRecurso" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Recursos por Asignar</h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<div class="row-fluid">
				<div class="span2">Roles:</div>
				<div class="span10"><select class="span12" id="rolesAsignarTarea"></select></div>
			</div>	
			
			<div class="row-fluid">
				<select id="idrecursoAsignadoTarea" class="span12" multiple="multiple" size="15">
					<option value="AL">Alabama</option>
					<option value="AK">Alaska</option>
				</select>
			</div>			
		</div>
		<div class="modal-footer">
			<button class="btn btn-small" data-dismiss="modal">
				<i class="icon-undo"></i>
				Salir
			</button>

			<button id="asignarRecursoTarea" class="btn btn-small btn-primary" data-dismiss="modal">
				<i class="icon-ok"></i>
				Asignar
			</button>
		</div>
	</div>
</form>
<!-- [FIN] MODAL ASIGNAR RECURSO -->