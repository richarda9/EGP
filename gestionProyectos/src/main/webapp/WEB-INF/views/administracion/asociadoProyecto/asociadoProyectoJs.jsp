<script type="text/javascript">

//[INI] CARGA DE TABLAS
$(function() {
		 $('#tablaTipoProyecto').DataTable({
				"paging" : true,
				"autoWidth": true
			});
		
// 		$("#tablaTipoProyecto").dataTable({
// 			   "paging" : true,
// 			    "scrollX" : true,
// 				"autoWidth": true,
// 			   "language": {
// 			    	"lengthMenu": 'Display <select>'+ 	
// 					'<option value="10">10</option>'+
// 					'<option value="20">20</option>'+
// 					'<option value="50">50</option>'+				            
// 					'<option value="100">100</option>'+	
// 					'<option value="-1">Todo</option>'+
// 					'</select> records'
// 					},
// 				"columnDefs": [
// 		    		{ "width": "50%", "targets": 2 }
// 		  			]
// 			   });
// 		var oTable1 = $('#tablaTipoProyecto').dataTable({
// 			"aoColumns" : [ {
// 				"bSortable" : false
// 			}, null, null, {
// 				"bSortable" : false
// 			} ]
// 		});

// 		$('table th input:checkbox').on(
// 				'click',
// 				function() {
// 					var that = this;
// 					$(this).closest('table').find(
// 							'tr > td:first-child input:checkbox').each(
// 							function() {
// 								this.checked = that.checked;
// 								$(this).closest('tr').toggleClass('selected');
// 							});

// 				});

// 		$('[data-rel="tooltip"]').tooltip({
// 			placement : tooltip_placement
// 		});
// 		function tooltip_placement(context, source) {
// 			var $source = $(source);
// 			var $parent = $source.closest('table')
// 			var off1 = $parent.offset();
// 			var w1 = $parent.width();

// 			var off2 = $source.offset();
// 			var w2 = $source.width();

// 			if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2))
// 				return 'right';
// 			return 'left';
// 		}
	});
	
//[FIN] CARGA DE TABLAS

//[INI] TIPO PROYECTO
//Registrar tipo proyecto
$("#registrarTipoProyecto").submit(
		function() {
			var objeto = $(this).serializeObject();
			objeto.estado = 1;
			console.log(objeto);
			$
					.postJSON(
							'${pageContext.request.contextPath}/administracion/registrar_tipoProyecto.htm', objeto, 
							function(data) {
								if(data == 0){
								$.gritter.add({
									title: 'Info!',
									text: 'Se registro con éxito.',
									sticky: false,
									time: '1200',
									class_name: 'gritter-info gritter-light'
								});
								
								listarTipoProyecto();
								}else if(data == 1){
									$.gritter.add({
										title: 'Advertencia!',
										text: 'Existe un registro con los mismos datos.',
										sticky: false,
										time: '1200',
										class_name: 'gritter-warning gritter-light'
									});
								}
							})
					.fail(
							function() {

								$.gritter.add({
									title: 'Error!',
									text: 'Ocurrio un error al tratar de realizar el registro',
									sticky: false,
									time: '1200',
									class_name: 'gritter-error'
								});
							});
			return false;
});

//Listar tipo proyectos
function listarTipoProyecto() {
	var t = $("#tablaTipoProyecto").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_tipoProyecto.htm',dato,
		function(data) {
			console.log(data);
			for (i in data) {
				var descripcion = data[i].descripcion;
				var activado = '';
				if (data[i].estado == 1) {
					activado = '<span class="label label-info"><b>ACTIVO</b></span>';
				} else {
					activado = '<span class="label label-danger"><b>INACTIVO</b></span>';
				}
				var accion = '<td class="td-actions">'+'<div class="hidden-phone visible-desktop action-buttons">'+
							 '<a class="abrir-eliminarTproyecto red" href="#eliminarTipoProyecto" data-toggle="modal" data-id="'+data[i].id+'">'+
							 '<i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
							 '<div class="hidden-desktop visible-phone"><div class="inline position-relative">'+
							 '<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
							 '<i class="icon-caret-down icon-only bigger-120"></i></button>'+
							 '<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
							 '<li><a href="##eliminarTipoProyecto" class="abrir-eliminarTproyecto tooltip-error" data-rel="tooltip" '+
							 'itle="Eliminar" data-toggle="modal" data-id="'+data[i].id+'">'+'<span class="red">'+
							 '<i class="icon-trash bigger-120"></i></span></a></li></ul></div></div></td>';

				t.row.add([++i, descripcion, activado, accion ]).draw();
			}
		});
};

//Pasar parametro eliminar tipo proyecto
$(document).on("click", ".abrir-eliminarTproyecto", function () {
     var id = $(this).data('id');
     $(".modal-body #idTipoProyecto").val(id);
});

//Eliminar Tipo Proyecto
$("#formEliminarTipoProyecto").submit(
		function() {
			var objeto = document.getElementById("idTipoProyecto").value;  //$(this).serializeObject();
			console.log(objeto);
			$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_tipoProyecto.htm',objeto, 
					function(data) {
								$('#eliminarTipoProyecto').modal('hide');
								$.gritter.add({
									title: 'Info!',
									text: 'Se eliminó correctamente.',
									sticky: false,
									time: '1200',
									class_name: 'gritter-info gritter-light'
								});
								
								listarTipoProyecto();
					}).fail(
							function() {
							});
			return false;
});


//[FIN] TIPO PROYECTO
</script>