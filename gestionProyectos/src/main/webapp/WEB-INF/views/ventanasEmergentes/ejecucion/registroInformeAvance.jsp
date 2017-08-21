<!-- [INI] MODAL ACTA CIERRE-->
<form id="registrarInformeAvance">
	<div id="modal-infoAvance" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Registro de Informe de Avance</h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<input id="idProyectoInformeAvance" name="idProyecto" type="hidden" value="${model.idProyecto}"/>
			<input id="idInformeAvance" name="id" type="hidden" />
			<input id="correoDirigidoInfAvance" name="correoDirigido" type="hidden" />
			<div class="row-fluid">				
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Dirigido a:</div>
						<div class="span8">
							<select class="span12" id="idDirigido" name="dirigido" >
								<option value="">Seleccionar</option>
								<c:forEach var="sponsor" items="${model.listaInteresado}" varStatus="contador">
								   <option value="${sponsor.idPersona}">${sponsor.nombreInteresado}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="control-group row-fluid">
				<div class="control-label span2">Descripci&oacute;n:</div>
				<div class="span10"><textarea rows="5" class="span12" id="dscInfAvance" name="descripcion"></textarea></div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Tipo:</div>
						<div class="span8">
							<select class="span12" id="idTipoInfAvance" name="idTipoAvance" >
								<option value="">Seleccionar</option>
								<c:forEach var="lista" items="${model.listaTipoAvance}" varStatus="contador">
								   <option value="${lista.id}">${lista.descripcion}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
			
<!-- 			<div class="row-fluid"> -->
<!-- 				<div class="span6"> -->
<!-- 					<div class="control-group row-fluid"> -->
<!-- 						<div class="control-label span4">Desde:</div> -->
<!-- 						<div class="span8"> -->
<!-- 							<div class="row-fluid input-append"> -->
<!-- 								<input class="date-picker span10" id="fechaInicioInfAvance" name="fechaInicio" type="text" /> -->
<!-- 								<span class="add-on"> -->
<!-- 									<i class="icon-calendar"></i> -->
<!-- 								</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="span6"> -->
<!-- 					<div class="control-group row-fluid"> -->
<!-- 						<div class="control-label span4">Hasta:</div> -->
<!-- 						<div class="span8"> -->
<!-- 							<div class="row-fluid input-append"> -->
<!-- 								<input class="date-picker span10" id="fechaFinInfAvance" name="fechaFin" type="text" /> -->
<!-- 								<span class="add-on"> -->
<!-- 									<i class="icon-calendar"></i> -->
<!-- 								</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="row-fluid">
				<div class="span12">
					<div class="control-group row-fluid">
						<div class="control-label span2">Incluir:</div>
						<div class="span5">
							<label>
								<input id="incluirAdquisicionesInfAvance" name="incluirAdquisiciones" value="1" type="checkbox" />
								<span class="lbl" style="font-size: 13px;"> Adquisiciones</span>
							</label>
							<label>
								<input id="incluirCtrolCambiosInfAvance" name="incluirCtrolCambios" value="1" type="checkbox" />
								<span class="lbl" style="font-size: 13px;"> Control de Cambios</span>
							</label>
							<label>
								<input id="incluirTareaTerminadaInfAvance" name="incluirTareaTerminada" value="1" type="checkbox" />
								<span class="lbl" style="font-size: 13px;"> Tareas Terminadas</span>
							</label>
						</div>
						<div class="span5">
							<label>
								<input id="incluirTareaAtrasadaInfAvance" name="incluirTareaAtrasada" value="1" type="checkbox" />
								<span class="lbl" style="font-size: 13px;"> tareas Atrasadas</span>
							</label>
<!-- 							<label> -->
<!-- 								<input id="incluirReunionesInfAvance" name="incluirReuniones" value="1" type="checkbox" /> -->
<!-- 								<span class="lbl" style="font-size: 13px;"> Reuniones Agendadas</span> -->
<!-- 							</label> -->
						</div>
					</div>
				</div>
<!-- 				<div class="span8"> -->
<!-- 					<div class="control-group row-fluid"> -->
<!-- 						<div class="control-label span12">Vista Previa (editable):</div> -->
<!-- 						<div class="span12"> -->
<!-- 							<textarea rows="7" class="span12" id="descripcionTarea" name="vistaPrevia"></textarea> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
<!-- 			<div class="control-group row-fluid"> -->
<!-- 				<div class="control-label span2">Observacion:</div> -->
<!-- 				<div class="span10"><textarea rows="5" class="span12" id="observaciones" name="observacion"></textarea></div> -->
<!-- 			</div>	 -->
<!-- 			<div class="control-group row-fluid"> -->
<!-- 				<div class="control-label span2">Firmas:</div> -->
<!-- 				<div class="span10"><textarea rows="5" class="span12" id="firmas" name="firmas"></textarea></div> -->
<!-- 			</div>	 -->
		</div>
		<div class="modal-footer">
			<button class="btn btn-small" data-dismiss="modal">
				<i class="icon-remove"></i>
				Cancelar
			</button>
			
			<a id="btnEnviarInfoAvance" class="btn btn-small btn-primary">
				<i class="icon-envelope"></i>
				Enviar
			</a>

			<button class="btn btn-small btn-primary">
				<i class="icon-save"></i>
				Guardar
			</button>
		</div>
	</div>
</form>
<!-- [FIN] MODAL ACTA CIERRE -->