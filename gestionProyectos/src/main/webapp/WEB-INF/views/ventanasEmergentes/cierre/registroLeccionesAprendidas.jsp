<!-- [INI] AGREGAR Y/O EDITAR LECCION APRENDIDA -->
<form id="formMntLeccionAprendida">
	<div id="mntLeccionAprendida" class="modal hide fade" tabindex="-1">
		<div class="modal-header padding">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Mantenimiento Lecciones Aprendidas</h4>
		</div>

		<div class="modal-body padding">
			<input id="idProyectoLecAprendida" name="idProyecto" type="hidden" />
			<input id="idLeccionAprendida" name="idLeccionAprendida" type="hidden" />
			<div class="control-group row-fluid">
				<label class="control-label span3" for="dscEntregableAfectado">Entregable Afectado:</label>
				<div class="controls span9">
					<select id="idEntregableAfectado" name="idEntregableAfectado">
						<option value="">Seleccionar</option>
						<c:forEach var="entregable" items="${model.listaEntregable}" varStatus="contador">
						   <option value="${entregable.identregable}">${entregable.nombre}</option>
						</c:forEach>
					</select>	
				</div>
			</div>
			<div class="control-group row-fluid">
				<label class="control-label span3" for="dscproblema">Descripci&oacute;n del problema:</label>

				<div class="controls span9">
					<textarea id="dscproblema" name="dscproblema" class="span12" rows="5"></textarea>
				</div>
			</div>
			<div class="control-group row-fluid">
				<label class="control-label span3" for="dsccausa">Causa</label>

				<div class="controls span9">
					<textarea id="dsccausa" name="dsccausa" class="span12" rows="5" class="span12"></textarea>
				</div>
			</div>
			<div class="control-group row-fluid">
				<label class="control-label span3" for="dsccorrelativa">Acci&oacute;n Correlativa</label>

				<div class="controls span9">
					<textarea id="dsccorrelativa" name="dsccorrelativa" class="span12" rows="5"></textarea>
				</div>
			</div>
			<div class="control-group row-fluid">
				<label class="control-label span3" for="dscobtenido">Resultado Obtenido</label>

				<div class="controls span9">
					<textarea id="dscobtenido" name="dscobtenido" class="span12" rows="5"></textarea>
				</div>
			</div>
			<div class="control-group row-fluid">
				<label class="control-label span3" for="dscaprendida">Lecci&oacute;n Aprendida</label>

				<div class="controls span9">
					<textarea id="dscaprendida" name="dscaprendida" class="span12" rows="5"></textarea>
				</div>
			</div>
		</div>

		<div class="modal-footer">
			<button class="btn btn-small btn-primary" type="submit">
				<i class="icon-save"></i> Confirmar
			</button>
			<button class="btn btn-small btn-light" data-dismiss="modal">
				<i class="icon-remove"></i> Salir
			</button>
		</div>

	</div>
</form>
<!-- [FIN] AGREGAR Y/O EDITAR LECCION APRENDIDA -->