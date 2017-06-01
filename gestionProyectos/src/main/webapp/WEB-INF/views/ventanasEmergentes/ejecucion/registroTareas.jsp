<!-- [INI] MODAL TAREA-->
<form id="registrarTarea">
	<div id="modal-Tarea" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Registro de Tareas</h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<div class="row-fluid">
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">ID:</div>
						<div class="span8"><input type="text" class="span8" id="idTarea" readonly="readonly"/></div>
					</div>
				</div>
				<div class="span6">				
					<div class="control-group row-fluid">
						<div class="control-label span4">Estado:</div>
						<div class="span8"><select class="span12" id="estadoTarea" ></select></div>
					</div>
				</div>
			</div>
			<div class="control-group row-fluid">
				<div class="control-label span2">Descripci&oacute;n:</div>
				<div class="span10"><textarea rows="5" class="span12" id="descripcionTarea"></textarea></div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Fecha de Inicio:</div>
						<div class="span8">
							<div class="row-fluid input-append">
								<input class="date-picker span10" id="fecIniTarea" type="text" />
								<span class="add-on">
									<i class="icon-calendar"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Fecha de Fin:</div>
						<div class="span8">
							<div class="row-fluid input-append">
								<input class="date-picker span10" id="fecFinTarea" type="text" />
								<span class="add-on">
									<i class="icon-calendar"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>	
			<div class="row-fluid">
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Horas:</div>
						<div class="span8"><input type="text" class="span12" id="horasTarea"/></div>
					</div>
				</div>
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Recursos:</div>
						<div class="span8">
							<div class="row-fluid">
								<div class="span10">
									<input type="text" class="span12" id="recursoTarea" readonly="readonly"/>
								</div>
								<div class="span2">
									<a href="#mostrarRecurso" class="blue tooltip-info" role="button" data-rel="tooltip" data-toggle="modal" title="Elegir Recurso" data-placement="left">
										<i class="icon-search bigger-130"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	
			<div class="row-fluid">
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Responsable:</div>
						<div class="span8"><select class="span12" id="responsableTarea"></select></div>
					</div>
				</div>
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Complejidad:</div>
						<div class="span8"><select class="span12" id="complejidadTarea"></select></div>
					</div>
				</div>			
			</div>
			<div class="control-group row-fluid">
				<div class="control-label span2">Justificaci&oacute;n:</div>
				<div class="span10"><textarea rows="5" class="span12" id="justificacionTarea"></textarea></div>
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
<!-- [FIN] MODAL TAREA -->