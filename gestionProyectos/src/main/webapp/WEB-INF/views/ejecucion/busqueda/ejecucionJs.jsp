<script src="../assets/js/cancelarProyecto/cancelarProyecto.js"></script>

<script>
$(function() 
{	
	$('#tablaProyectoEjecucion').DataTable({
		"paging"    : true,
		"autoWidth" : true,
		"pageLength": 10,
		"searching" : false,
		"bInfo"     : false, 
		//"bLengthChange": false,
		"language"  : {
			            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
			          }
	});	
	
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
	
	//[INI] BUSQUEDA
	$("#formBsqEjecucion").submit(function() 
	{
		var objeto = $("#formBsqEjecucion").serializeObject();
			objeto.estado = 14;
		console.log(objeto);
		
// 		var bsqProyectoEjecucion = {};
// 		bsqProyectoEjecucion.idProyecto = objeto.idProyecto;
// 		bsqProyectoEjecucion.idCliente = objeto.idcliente;
// 		bsqProyectoEjecucion.idTipoProyecto = objeto.idTipoProyecto;
// 		bsqProyectoEjecucion.idResponsableProyecto = objeto.idResponsableProyecto;
// 		bsqProyectoEjecucion.fechaInicio = objeto.fechaInicio;
// 		bsqProyectoEjecucion.fechaFin = objeto.fechaFin;
// 		bsqProyectoEjecucion.estado = objeto.estado;
// 		console.log(bsqProyectoEjecucion);
		$.postJSON('${pageContext.request.contextPath}/ejecucion/listar_proyectoEjecucion.htm', objeto /*bsqProyectoEjecucion*/, function(data) {
			console.log("data: " + data); 

			var t = $("#tablaProyectoEjecucion").DataTable();
			t.clear().draw();

			for (i in data) {
				var accion = '<!-- [INI] BOTON EDITAR -->'+
								'<div class="hidden-phone visible-desktop action-buttons">'+
									'<a class="abrir-eliminarEproyecto blue tooltip-info" href="../ejecucion/mntEjecucion.htm?idEjecucion='+data[i].idProyecto+'" data-toggle="modal"'+
										'data-id="${estadoProyecto.id}" data-rel="tooltip" title="Editar">'+ 
											'<i class="icon-edit bigger-130"></i>'+
									'</a></div>'+
								'<div class="hidden-desktop visible-phone">'+
									'<div class="inline position-relative">'+
										'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
											'<i class="icon-caret-down icon-only bigger-120"></i>'+
										'</button>'+
										'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
											'<li>'+
												'<a href="../ejecucion/mntEjecucion.htm?idEjecucion='+data[i].idProyecto+'" class="abrir-eliminarEproyecto tooltip-info"'+
												   'data-rel="tooltip" title="Editar" data-toggle="modal" data-id="${estadoProyecto.id}">'+ 
													'<span class="blue"><i class="icon-edit bigger-120"></i></span>'+
												'</a>'+
											'</li>'+
										'</ul>'+
									'</div>'+
								'</div>'+
								'<!-- [FIN] BOTON EDITAR --><!-- [INI] BOTON CANCELAR -->'+
								'<div class="hidden-phone visible-desktop action-buttons">'+
									'<a class="abrir-eliminarEproyecto red tooltip-error" href="#modalCancelarProyecto" data-toggle="modal"'+
									   'data-id="'+data[i].idProyecto+'" data-rel="tooltip" title="Cancelar">'+
										'<i class="icon-remove-sign bigger-130"></i>'+
									'</a>'+
								'</div>'+
	
								'<div class="hidden-desktop visible-phone">'+
									'<div class="inline position-relative">'+
										'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
											'<i class="icon-caret-down icon-only bigger-120"></i>'+
										'</button>'+
	
										'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
											'<li>'+
												'<a href="#modalCancelarProyecto" class="abrir-eliminarEproyecto tooltip-error" data-rel="tooltip"'+ 
													'title="Cancelar" data-toggle="modal" data-id="'+data[i].idProyecto+'">'+
												   		'<span class="red"><i class="icon-remove-sign bigger-120"></i></span>'+
												'</a>'+
											'</li>'+
										'</ul>'+
									'</div>'+
								'</div>'+
								'<!-- [FIN] BOTON CANCELAR  -->';	

			    t.row.add([data[i].dscProyecto, data[i].dscCliente, data[i].dscTipoProyecto, data[i].fechaInicio, data[i].dscResponsable, accion ]).draw();	

			}
		
			
		});
		
		return false;		
	});
	//[INI] BUSQUEDA 
	
});
</script>