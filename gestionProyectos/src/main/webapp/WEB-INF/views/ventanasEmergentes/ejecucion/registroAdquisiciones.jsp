<!-- [INI] MODAL ADQUISICIONES-->
<form id="registrarAdquisiciones">
	<div id="modal-Adquisiciones" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Registro de Adquisiciones</h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<input type="hidden" id="idProyectoAdquisicion" name="idproyecto">
			<div class="row-fluid">
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">ID:</div>
						<div class="span8"><input type="text" class="span8" id="idAdquisiciones" name="id" readonly="readonly"/></div>
					</div>
				</div>
				<div class="span6">				
					<div class="control-group row-fluid">
						<div class="control-label span4">Estado:</div>
						<div class="span8">
							<select class="span12" id="estadoRegAdquisicion" name="estado">
								<option value="">Seleccionar</option>
								<option value="1">ACTIVO</option>
								<option value="0">INACTIVO</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Categor&iacute;a Adquisici&oacute;n:</div>
						<div class="span8">
							<select class="span12" id="categoriaAdquisiciones" name="idcatadquisicion">
								<option value="">Seleccionar</option>
								<c:forEach var="lista" items="${model.listaCategoriaAdquisicion}" varStatus="contador">
								   <option value="${lista.id}">${lista.descripcion}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="span6">				
					<div class="control-group row-fluid">
						<div class="control-label span4">Estado Adquisici&oacute;n:</div>
						<div class="span8">
							<select class="span12" id="estadoAdquisiciones" name="idestadoadquisicion">
								<option value="">Seleccionar</option>
								<c:forEach var="lista" items="${model.listaEstadoAdquisicion}" varStatus="contador">
								   <option value="${lista.id}">${lista.descripcion}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="control-group row-fluid">
				<div class="control-label span2">Descripci&oacute;n:</div>
				<div class="span10">
					<textarea rows="5" class="span12" id="descripcionAdquisiciones" name="producto"></textarea>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Fecha de Compra:</div>
						<div class="span8">
							<div class="row-fluid input-append">
								<input class="date-picker span10" id="fecCompAdquisiciones" name="fechaAdquisicion" type="text" />
								<span class="add-on">
									<i class="icon-calendar"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Responsable:</div>
						<div class="span8">
							<select class="span12" id="responsableAdquisiciones" name="idresponsable">
								<option value="">Seleccionar</option>
								<c:forEach var="lista" items="${model.listaResponsableProyecto}" varStatus="contador">
								   <option value="${lista.id}">${lista.nombreCompleto}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>	
			<div class="row-fluid">
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Cantidad:</div>
						<div class="span8"><input type="text" class="span12" id="cantAdquisiciones" name="cantidad"/></div>
					</div>
				</div>
				<div class="span6">
					<div class="control-group row-fluid">
						<div class="control-label span4">Costo Unitario:</div>
						<div class="span8">
							<input type="text" class="span12" id="costUniAdquisiciones" name="costoUnitario"/>
						</div>
					</div>
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