<!-- [INI] MODAL ACTA CIERRE-->
<form id="registrarActaCierre">
	<div id="modal-ActaCierre" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Registro de Acta de Cierre</h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<div class="row-fluid">
				<input id="idProyectoActaCierre" name="idProyecto" type="hidden" value="${model.idProyecto}"/>
				<input id="idActaCierre" name="idActaCierre" type="hidden" />
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Sponsor:</div>
						<div class="span8">
							<select class="span12" id="sponsor" name="idSponsor" >
								<option value="">Seleccionar</option>
								<c:forEach var="sponsor" items="${model.listaSponsor}" varStatus="contador">
								   <option value="${sponsor.id}">${sponsor.descripcion}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="control-group row-fluid">
				<div class="control-label span2">Declaraci&oacute;n de Aceptaci&oacute;n:</div>
				<div class="span10"><textarea rows="5" class="span12" id="declaAceptacion" name="declAceptacion"></textarea></div>
			</div>
			<div class="row-fluid">
				<div class="span4">
					<div class="control-group row-fluid">
						<div class="control-label span12">Incluir:</div>
						<div class="span12">
							<label>
								<input id="tipoLeccionEntregbale" name="tipoLeccionEntregbale" value="1" type="checkbox" />
								<span class="lbl" style="font-size: 13px;"> Entregables</span>
							</label>
							<label>
								<input id="tipoLeccionAdquisiciones" name="tipoLeccionAdquisiciones" value="1" type="checkbox" />
								<span class="lbl" style="font-size: 13px;"> Adquisiciones</span>
							</label>
							<label>
								<input id="tipoLeccionLecAprendida" name="tipoLeccionLecAprendida" value="1" type="checkbox" />
								<span class="lbl" style="font-size: 13px;"> Lecciones Aprendidas</span>
							</label>
							<label>
								<input id="tipoLeccionEncuesta" name="tipoLeccionEncuesta" value="1" type="checkbox" />
								<span class="lbl" style="font-size: 13px;"> Encuesta de Satisfacci&oacute;n</span>
							</label>
						</div>
					</div>
				</div>
				<div class="span8">
					<div class="control-group row-fluid">
						<div class="control-label span12">Vista Previa (editable):</div>
						<div class="span12">
							<textarea rows="5" class="span12" id="descripcionTarea" name="vistaPrevia"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="control-group row-fluid">
				<div class="control-label span2">Observacion:</div>
				<div class="span10"><textarea rows="5" class="span12" id="observaciones" name="observacion"></textarea></div>
			</div>	
			<div class="control-group row-fluid">
				<div class="control-label span2">Firmas:</div>
				<div class="span10"><textarea rows="5" class="span12" id="firmas" name="firmas"></textarea></div>
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
<!-- [FIN] MODAL ACTA CIERRE -->