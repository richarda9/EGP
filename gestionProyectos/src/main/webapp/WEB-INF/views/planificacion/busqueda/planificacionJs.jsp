<script src="../assets/js/cancelarProyecto/cancelarProyecto.js"></script>
<script>
$(document).ready(function() {
	
	$('#fechaInicio').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaInicio').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});

	$('#fechafin').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechafin').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});

	$('#tablaBuscarPlanificacion').dataTable({
		"paging"     : true,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		//"bLengthChange": false,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       }
	});	
});


function buscarPlanificacion(){
		
	loadModalCargando();
	var t = $('#tablaBuscarPlanificacion').DataTable();
	t.clear().draw();
		
	var form=$('#formBuscarPlanificacion').serializeObject();
	var buscarAnteproyectoModel = {};
	buscarAnteproyectoModel.idProyecto = form.idProyecto;
	buscarAnteproyectoModel.idEmpresa = form.idEmpresa;
	buscarAnteproyectoModel.idTipoProyecto = form.idTipoProyecto;
	buscarAnteproyectoModel.idResponsableProyecto = form.idResponsableProyecto;
	buscarAnteproyectoModel.fechaInicio = form.fechaInicio;
	buscarAnteproyectoModel.fechaFin = form.fechaFin;
	
	$.postJSON('${pageContext.request.contextPath}/planificacion/buscarPlanificacion.htm',buscarAnteproyectoModel, function(data) { 
			closeModalCargando();
			/* var t = $('#tablaBuscarAnteproyecto').DataTable(); */
			for(i in data)
			{			
				var nombreProyecto = data[i].nombreProyecto;
				var nombreEmpresa = data[i].nombreEmpresa;
				var descripcionTipoProyecto =data[i].descripcionTipoProyecto;				
				var fechaContacto = data[i].fechaContactoString;
				var nombreResponsable = data[i].nombreResponsable;
				var opciones = '<a href="../planificacion/mntPlanificacion.htm?idPlanificacion='+data[i].idProyecto+'" class="abrir-eliminarEproyecto tooltip-error" data-rel="tooltip" title="Editar" data-toggle="modal"> <span class="red"> <i class="icon-edit bigger-120"></i> </span> </a>'+
							   '<a class="red tooltip-error" onclick = \"cancelarProyecto('+data[i].idProyecto+')\" data-rel="tooltip" title="Cancelar"><i class="icon-remove-sign bigger-130"></i></a>';;
						       
						       /* <div class="hidden-desktop visible-phone">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle"
										data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>
		
									<ul
										class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li><a href="../anteproyecto/mntAnteproyecto.htm?idAnteproyecto=1"
											class="abrir-eliminarEproyecto tooltip-error"
											data-rel="tooltip" title="Editar" data-toggle="modal"
											data-id="${estadoProyecto.id}"> <span class="red">
													<i class="icon-edit bigger-120"></i>
											</span>
										</a></li>
									</ul>
								</div>
							</div> */
						       
						       				
				t.row.add([    
					nombreProyecto,
					nombreEmpresa,         
					descripcionTipoProyecto,
					fechaContacto,
					nombreResponsable,
					opciones				   
				]).draw();


			}
			return false;
		}).fail(function() {
			closeModalCargando();
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n solicitada',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		});
}

function cancelarProyecto(id){
	$("#idCancelarProyecto").val(id);
	$('#modalCancelarProyecto').modal('show');
}
</script>