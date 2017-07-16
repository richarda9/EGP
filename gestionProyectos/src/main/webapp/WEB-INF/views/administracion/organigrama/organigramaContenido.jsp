<%@ include file="/WEB-INF/views/include.jsp"%>
<div>
	<div class="page-header position-relative">
		<h1>Organigrama para el Proyecto</h1>
	</div>
	<div class="row-fluid">
		<div class="row-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="span10"></div>
					<div class="span2">
						<a id="btnAgregarOrganigrama" href="#modal-Organigrama" role="button" class="btn btn-small btn-primary" data-toggle="modal">
							<i class="icon-plus"></i>Agregar 
						</a>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="row-fluid">
			<div class="table-header">Lista de Recursos</div>
			<table id="tablaOrganigramaProyecto" class="table table-striped table-bordered table-hover" style="width: 100%;">
				<thead>
					<tr>
						<th>Rol</th>
						<th>Descripci&oacute;n</th>
						<th>Opciones</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>