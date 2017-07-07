<!-- [INI] MODAL CONTROL DE CAMBIOS-->
<form id="registrarCtrolCambios">
	<div id="modal-ctrolCambios" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Registro de Control de Cambios</h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<input type="hidden" name="idproyecto" value="${model.idProyecto}"/>
			<input type="hidden" id="idCtrolCambios" name="idCtrolCambios"/>
			<div class="row-fluid">
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">ID:</div>
						<div class="span8">
							<input type="text" class="span6" id="codctrolcambios" name="codctrolcambios" readonly="readonly"/>
						</div>
					</div>
				</div>
				<div class="span6">				
					<div class="control-group row-fluid">
						<div class="control-label span4">Solicitante:</div>
						<div class="span8">
							<select class="span12" id="solicitanteCtrolCambios" name="solicitanteCtrolCambios">
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="control-group row-fluid">
				<div class="control-label span2">Descripci&oacute;n:</div>
				<div class="span10">
					<textarea rows="5" class="span12" id="descripcionCtrolCambios" name="descripcionCtrolCambios"></textarea>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Fecha de Solicitud:</div>
						<div class="span8">
							<div class="row-fluid input-append">
								<input class="date-picker span10" id="fecSolCtrolCambios" name="fecSolCtrolCambios" 
									   type="text" data-date-end-date="0d"/>
								<span class="add-on">
									<i class="icon-calendar"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Complejidad:</div>
						<div class="span8">
							<select class="span12" id="complejidadCtrolCambios" name="complejidadCtrolCambios">							
								<option value="">Seleccionar</option>
								<c:forEach var="lista" items="${model.listaComplejidad}" varStatus="contador">
								   <option value="${lista.id}">${lista.descripcion}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>	
			<div class="control-group row-fluid">
				<div class="control-label span2">Horas Estimadas:</div>
				<div class="span4"><input type="text" class="span12" id="horasCtrolCambios" name="horasCtrolCambios"/></div>
			</div>
			<div class="control-group row-fluid">
				<div class="control-label span2">Comentarios:</div>
				<div class="span10"><textarea rows="5" class="span12" id="comentariosCtrolCambios" name="comentariosCtrolCambios"></textarea></div>
			</div>	
		</div>
		<div class="modal-footer">
			<button class="btn btn-small" data-dismiss="modal">
				<i class="icon-remove"></i>
				Cancelar
			</button>

			<button class="btn btn-small btn-primary" type="submit">
				<i class="icon-save"></i>
				Guardar
			</button>
		</div>
	</div>
</form>
<!-- [FIN] MODAL CONTROL DE CAMBIOS -->
<!-- [INI] ELIMINAR CONTROL DE CAMBIOS -->
<form id="formEliminarCtrolCambios">
	<div id="modal-eliminarCtrolCambios" class="modal hide fade" tabindex="-1">
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		</div>

		<div class="modal-body padding">
			<b style="text-align: center">¿SEGURO DE ELIMINAR? </b> <input
				type="hidden" name="idCtrolCambios" id="idCtrolCambiosEliminar" />
		</div>

		<div class="modal-footer">
			<button class="btn btn-small btn-primary" type="submit">
				<i class="icon-ok"></i> Confirmar
			</button>
			<button class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</button>
		</div>

	</div>
</form>
<!-- [FIN] ELIMINAR CONTROL DE CAMBIOS -->