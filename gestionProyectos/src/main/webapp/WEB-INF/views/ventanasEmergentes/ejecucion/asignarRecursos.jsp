<!-- [INI] MODAL ASIGNAR RECURSO-->
<form id="registrarRecursoTarea">
	<div id="mostrarRecurso" class="modal hide" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="blue bigger">Recursos por Asignar</h4>
		</div>
		<div class="modal-body overflow-visible" style="height: auto; overflow: auto;">
			<div class="control-group row-fluid">
				<div class="control-label span2">Roles:</div>
				<div class="span10">
					<select class="span12" id="rolesAsignarTarea" name="rolesAsignarTarea" onchange="mostrarRecursoProyecto(this)">
						<option value="">Seleccionar</option>
						<c:forEach var="listaProveedor" items="${model.listaRolProveedor}" varStatus="contador">
						   <option value="${listaProveedor.id}">${listaProveedor.nombre}</option>
						</c:forEach>
					</select>
				</div>
			</div>	
			
			<div class="control-group row-fluid">
				<select id="idrecursoAsignadoTarea" name="idrecursoAsignadoTarea" class="span12" multiple="multiple" size="20">
				</select>
			</div>			
		</div>
		<div class="modal-footer">
			<button class="btn btn-small" data-dismiss="modal">
				<i class="icon-undo"></i>
				Salir
			</button>

			<button id="asignarRecursoTarea" type="submit" class="btn btn-small btn-primary">
				<i class="icon-ok"></i>
				Asignar
			</button>
		</div>
	</div>
</form>
<!-- [FIN] MODAL ASIGNAR RECURSO -->