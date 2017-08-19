<script>

$('#tablaCierreProyecto').DataTable({
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
$("#formBsqCierre").submit(function() 
{
	loadModalCargando();
	var objeto = $("#formBsqCierre").serializeObject();
		//objeto.estado = 15;
	console.log(objeto);
	
	$.postJSON('${pageContext.request.contextPath}/cierre/listar_proyectoCierre.htm', objeto, function(data) { 
		console.log("data: " + data); 

		var t = $("#tablaCierreProyecto").DataTable();
		t.clear().draw();

		for (i in data) {
			var accion =  '';

			if(data[i].estado.toUpperCase() != 'CERRADO'){

				accion = '<!-- [INI] BOTON EDITAR -->'+
						 '<div class="hidden-phone visible-desktop action-buttons">'+ 
						 		'<a class="abrir-eliminarEproyecto blue tooltip-info" href="../cierre/mntCierre.htm?idcierre='+data[i].idProyecto+'" data-toggle="modal"' +
									'data-id="${estadoProyecto.id}" data-rel="tooltip" title="Cerrar">'+ 
										'<i class="icon-remove-sign bigger-130"> </i>'+
								'</a></div>'+
							'<div class="hidden-desktop visible-phone">'+ 
								'<div class="inline position-relative">'+ 
									'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+ 
										'<i class="icon-caret-down icon-only bigger-120"></i>'+
									'</button>'+
									'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
										'<li>'+
											'<a href="../cierre/mntCierre.htm?idcierre='+data[i].idProyecto+'" class="abrir-eliminarEproyecto tooltip-info"' +
											   'data-rel="tooltip" title="Cerrar" data-toggle="modal" data-id="${estadoProyecto.id}"> '+ 
												'<span class="blue"><i class="icon-remove-sign bigger-120"></i></span>'+
											'</a>'+
										'</li>'+
									'</ul>'+
								'</div>'+
							'</div>'+
							'<!-- [FIN] BOTON EDITAR -->';	
			}

		    t.row.add([data[i].dscProyecto, data[i].dscCliente, data[i].dscTipoProyecto, data[i].fechaInicio, data[i].estado, accion ]).draw();	

		}
	
		$('[data-rel=tooltip]').tooltip();

		closeModalCargando();
	});
	
	return false;		
});
//[INI] BUSQUEDA
</script>