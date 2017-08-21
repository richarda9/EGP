<script src="../assets/js/bootbox.min.js"></script>
<script>
var dataContEmpresa = [];
$(function() 
{
	$('#tablaEmpresaProyecto').DataTable({
		"paging"     : true,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       }
	});
	
	var tablaContEmpresaProyecto = $('#tablaContEmpresaProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataContEmpresa } );
					   },	
		"paging"     : true,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		"columnDefs" :
				    	[
							{	"targets": [ 0 ], "visible": true, "searchable": false, "width": "25%"},
							{	"targets": [ 1 ], "visible": true, "searchable": false, "width": "25%"},
							{	"targets": [ 2 ], "visible": true, "searchable": false, "width": "25%"},
							{	"targets": [ 3 ], "visible": true, "searchable": false, "width": "25%"},
					    	{	"targets": [ 4 ], "visible": false, "searchable": false, "width": "0%"},
					    	{	"targets": [ 5 ], "visible": false, "searchable": false, "width": "0%"},
					    	{	"targets": [ 6 ], "visible": false, "searchable": false, "width": "0%"},
					    	{	"targets": [ 7 ], "visible": false, "searchable": false, "width": "0%"},
					    	{	"targets": [ 8 ], "visible": false, "searchable": false, "width": "0%"},
					        {	"targets": [ 9 ], "visible": false, "searchable": false, "width": "0%"}
				    	],
	    "columns"	 : [
	             		   {"data": "contacto"},  
	             		   {"data": "dscarea"},  
					       {"data": "telefono"},                      
					       {"data": "correo"},                     
					       {"data": "idDetEmpPersona"},  
					       {"data": "nombre"},
					       {"data": "apellido"},
					       {"data": "anexo"},
					       {"data": "idcargo"},
					       {"data": "idPersona"}
						  ],
	    "destroy"	 : true,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       }
	});
	
	$('#tablaContEmpresaProyecto tbody').on( 'click', 'tr', function () {
		var texto = this.innerText; 		
		if(!texto.endsWith("dato disponible en esta tabla")){
	        if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	        }
	        else {
	        	tablaContEmpresaProyecto.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	        }
    	}
    });
	
	$('#logoEmpresa').ace_file_input({ 
		no_file:'Sin archivo ...',
		btn_choose:'Elegir',
		btn_change:'Cambiar',
		droppable:false,
		onchange:null,
		thumbnail:false, //| true | large
		//whitelist:"'gif|png|jpg|jpeg'",
		//blacklist:'exe|php'
		//onchange:''
		//
		allowExt: ['jpg', 'jpeg', 'png', 'gif']
	}).on('file.error.ace', function(event, info) {
		//info.file_count > number of files selected
		//info.invalid_count > number of invalid files
		
		alert(info.error_count['ext']); //> number of files with invalid extension (only if allowExt or denyExt is set)
		//info.error_count['mime'] > number of files with invalid mime type (only if allowMime or denyMime is set)
		//info.error_count['size'] > number of files with invalid size (only if maxSize option is set)

		//info.error_list['ext'] > list of file names with invalid extension
		//info.error_list['mime'] > ...
		//info.error_list['size'] > ...
		
		//info.dropped > true if files have been selected by drag & drop
		
		
		//if you do this
		event.preventDefault();
		//it will reset (empty) file input, i.e. no files selected
	 }); ;	
	
	$('#formatoEmpresa').ace_file_input({ 
		no_file:'Sin archivo ...',
		btn_choose:'Elegir',
		btn_change:'Cambiar',
		droppable:false,
		onchange:null,
		thumbnail:false 
	});	

	$('#registrarEmpresa').validate({
		errorClass: 'help-block',
		rules: {
			razonSocialEmpresa: {
				required: false
			}
		},

		highlight: function (e) {
			$(e).closest('.control-group').removeClass('info').addClass('error');
		},

		success: function (e) {
			$(e).closest('.control-group').removeClass('error');
			$(e).remove();
		},
		
		submitHandler: function (form) {
			return false;
		}
	});
});

$('#btnAgregarContactoCliente').click( function () {
	$("#tipoOperacion").val($("#tipoOperacion").val() == "EDITAR" ? $("#tipoOperacion").val("EDITAR") : "AGREGAR");
	agregarValidacionesContCliente();
	agregarContactoCliente();

});

function agregarContactoCliente(){
	
	var form = $("#registrarEmpresa");

	if(form.valid())
	{
		$('#contactoCliente .control-group').removeClass('error');
		
		var t = $("#tablaContEmpresaProyecto").DataTable();
		var objeto = $("#registrarEmpresa").serializeObject();
		
		if($("#tipoOperacion").val() == "AGREGAR"){
			t.row.add({
			           "contacto" : objeto.nomContEmpresa + " " + objeto.apeContEmpresa,
			           "dscarea"  : objeto.areaContEmpresa,
				       "telefono" : objeto.teleContEmpresa,                      
				       "correo"	  : objeto.emailContEmpresa,                     
				       "idDetEmpPersona" : objeto.idDetEmpPersona,  
				       "nombre" : objeto.nomContEmpresa,
				       "apellido" : objeto.apeContEmpresa,
				       "anexo" : objeto.anexoContEmpresa,
				       "idcargo" : objeto.cargoContEmpresa,
				       "idPersona" : objeto.idPersona  
			}).draw();
		}else{
			var objetoSelec = $("#tablaContEmpresaProyecto").DataTable().row('.selected');
			objetoSelec.cell('.selected', 0).data(objeto.nomContEmpresa + " " + objeto.apeContEmpresa);
			objetoSelec.cell('.selected', 1).data(objeto.areaContEmpresa);
			objetoSelec.cell('.selected', 2).data(objeto.teleContEmpresa);
			objetoSelec.cell('.selected', 3).data(objeto.emailContEmpresa);
			objetoSelec.cell('.selected', 4).data(objeto.idDetEmpPersona);
			objetoSelec.cell('.selected', 5).data(objeto.nomContEmpresa);
			objetoSelec.cell('.selected', 6).data(objeto.apeContEmpresa);
			objetoSelec.cell('.selected', 7).data(objeto.anexoContEmpresa);
			objetoSelec.cell('.selected', 8).data(objeto.cargoContEmpresa);
			objetoSelec.cell('.selected', 9).data(objeto.idPersona);
		}
		
		quitarValidacionesContCliente();
		limpiarContactoCliente();
	}
} 

function agregarValidacionesContCliente(){
	$( "#nomContEmpresa" ).rules( "add", {required: true});
	$( "#apeContEmpresa" ).rules( "add", {required: true}); 
	$( "#teleContEmpresa" ).rules( "add", {required: function(element) {	
			if($("#emailContEmpresa").val() != '')
				return false;
			else
			    return true;
		}, digits: true, maxlength : 9
	});
	
	$( "#emailContEmpresa" ).rules( "add", {required: function(element) {	
			if($("#teleContEmpresa").val() != '')
				return false;
			else
			    return true;
		}, email: true
	});
	$( "#cargoContEmpresa" ).rules( "add", {required: true});
	$( "#areaContEmpresa" ).rules( "add", {required: true});
	$("#anexoContEmpresa").rules( "add", {digits: true, maxlength : 6});
}

function quitarValidacionesContCliente(){
	$( "#nomContEmpresa" ).rules( "add", {required: false});
	$( "#apeContEmpresa" ).rules( "add", {required: false}); 
	$( "#teleContEmpresa" ).rules( "add", {required: false});
	$( "#emailContEmpresa" ).rules( "add", {required: false});
	$( "#cargoContEmpresa" ).rules( "add", {required: false});
	$( "#areaContEmpresa" ).rules( "add", {required: false});
}

function agregarValidacionesEmpresa(){
	$("#razonSocialEmpresa").rules( "add", {required: true, maxlength : 100});
	$("#rucEmpresa").rules( "add", {required: true, digits: true, maxlength : 11, minlength: 11});
	$("#paisEmpresa").rules( "add", {required: true});
	$("#teleEmpresa").rules( "add", {required: function(element) {	
			if($("#correoEmpresa").val() != '')
				return false;
			else
			    return true;
		}, digits: true, maxlength : 9
	});
	$("#correoEmpresa").rules( "add", {required: function(element) {	
			if($("#teleEmpresa").val() != '')
				return false;
			else
			    return true;
		}, email: true, maxlength : 100
	});
	
	$("#anexoEmpresa").rules( "add", {digits: true, maxlength : 6});
}

function quitarValidacionesEmpresa(){
	$("#razonSocialEmpresa").rules( "add", {required: false});
	$("#rucEmpresa").rules( "add", {required: false});
	$("#paisEmpresa").rules( "add", {required: false});
	$("#teleEmpresa").rules( "add", {required: false});
	$("#correoEmpresa").rules( "add", {required: false});
}

function limpiarContactoCliente(){
	//$("#registrarEmpresa").validate().resetForm();
	$('#contactoCliente .control-group').removeClass('error');
	$("#idDetEmpPersona").val("");
	$("#nomContEmpresa").val("");
	$("#apeContEmpresa").val("");
	$("#teleContEmpresa").val("");
	$("#anexoContEmpresa").val("");
	$("#emailContEmpresa").val("");
	$("#cargoContEmpresa").val("");
	$("#areaContEmpresa").val("");
}

function EditarContactoCliente(){
	var datos = $("#tablaContEmpresaProyecto").DataTable().row('.selected').length;
	var data = $("#tablaContEmpresaProyecto").DataTable().row('.selected').data();

	$("#tipoOperacion").val("EDITAR");
	
	if(datos == 0){
		$.gritter.add({
				title: 'Advertencia!',
				text: 'Seleccion un registro de la grilla.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-warning gritter-light'
			});
	}else{
		$("#idPersona").val(data.idPersona);
		$("#idDetEmpPersona").val(data.idDetEmpPersona);
		$("#nomContEmpresa").val(data.nombre);
		$("#apeContEmpresa").val(data.apellido);
		$("#teleContEmpresa").val(data.telefono);
		$("#anexoContEmpresa").val(data.anexo);
		$("#emailContEmpresa").val(data.correo);
		$("#cargoContEmpresa").val(data.idcargo);
		$("#areaContEmpresa").val(data.dscarea);
		$("#cargoContEmpresa").val(data.idcargo);
	}
}

function EliminarContactoCliente(){
	var datos = $("#tablaContEmpresaProyecto").DataTable().row('.selected').length;
	var data = $("#tablaContEmpresaProyecto").DataTable().row('.selected').data();

	if(datos > 0){
		if(datos == 1){
			$.gritter.add({
					title: 'Advertencia!',
					text: 'No es posible eliminar cuando solo existe un contacto Registrado.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-warning gritter-light'
			});
		}else{
			$.postJSON('${pageContext.request.contextPath}/administracion/mnt_EliminarContCliente.htm', data, function(data) {
				$("#tablaContEmpresaProyecto").DataTable().row('.selected').remove().draw(false);

				$.gritter.add({
					title: 'Info!',
					text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
			});
		}
	}else{
		$.gritter.add({
				title: 'Advertencia!',
				text: 'Seleccione un registro.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-warning gritter-light'
		});
	}
}

$('#btnAgregarEmpresa').click( function () {
	limpiarMntEmpresa();
});

function limpiarMntEmpresa(){
	//$("#registrarEmpresa").validate().resetForm();
	$('#registrarEmpresa .control-group').removeClass('error');
	document.getElementById("registrarEmpresa").reset();
	var t = $("#tablaContEmpresaProyecto").DataTable();
	t.clear().draw();
	$('#logoEmpresa').val(""); //data('ace_input_files')[0];
	$('#formatoEmpresa').val(""); //data('ace_input_files')[0];
}

$('#registrarEmpresa').submit(function()
{
	var form = $("#registrarEmpresa");
	var datos = $("#tablaContEmpresaProyecto").DataTable().row().length;
	
	agregarValidacionesEmpresa();

	if(form.valid() && datos > 0){

		$('#modal-Empresa').modal('hide');
		loadModalCargando();
		
		var objetoEmpresa = $('#registrarEmpresa').serializeObject();
		objetoEmpresa["lista"] =  obtenerContEmpresaJson();
		 var data = new FormData();
		 if($('#logoEmpresa').val() != null && $('#logoEmpresa').val() != "")
			 data.append("logoEmpresa", $('#logoEmpresa').data('ace_input_files')[0]);
		 if($('#formatoEmpresa').val() != null && $('#formatoEmpresa').val() != "")
			 data.append("formatoEmpresa", $('#formatoEmpresa').data('ace_input_files')[0]);
		 data.append("objeto",JSON.stringify(objetoEmpresa));
		 	
		jQuery.ajax({
	        'type': 'POST',
	        'url': '${pageContext.request.contextPath}/administracion/mnt_Empresa.htm',
	        'data': data, 
	        'processData': false, 
	        'contentType':false,
	        'success': function(data) {
				if(data){
					if(data == "1"){					
						listarEmpresa();
						closeModalCargando();
						
						$.gritter.add({
							title: 'Info!',
							text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
							sticky: false,
							time: '1200',
							class_name: 'gritter-info gritter-light'
						});
					}else{
						closeModalCargando();
				    	
						$.gritter.add({
							title: 'Error!',
							text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n',
							sticky: false,
							time: '1200',
							class_name: 'gritter-error'
						});					
					}
				}
	        }
	    }).fail(function() {
	    	closeModalCargando();
	    	
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		});
	}else{
		$.gritter.add({
			title: 'Advertencia!',
			text: 'Falta ingresar algunos campos y/o llenar alg&uacute;n contacto para la empresa, favor de verificar.',
			sticky: false,
			time: '1200',
			class_name: 'gritter-warning gritter-light'
		});
	}
	
	return false;
});

function obtenerContEmpresaJson() {
	var jsonObjTareas = [];		
	var data = $("#tablaContEmpresaProyecto").DataTable().rows().data();

	if (data.length > 0){
		$.each( data, function( i, l ){
			jsonObjTareas.push(l);	
		});
	}
	
	return jsonObjTareas;
}

function listarEmpresa(){
	var t = $("#tablaEmpresaProyecto").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_Empresa.htm', dato,
		function(data) {
			for (i in data) {
				var accion = '<!-- [INI] BOTON EDITAR -->'+
					'<div class="hidden-phone visible-desktop action-buttons">'+
				'<a class="blue tooltip-info" onclick="editarEmpresa('+ data[i].idEmpresa +')" data-rel="tooltip" title="Editar">'+
					'<i class="icon-edit bigger-130"></i>'+
				'</a>'+
			'</div>'+
			'<div class="hidden-desktop visible-phone">'+
				'<div class="inline position-relative">'+
					'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
						'<i class="icon-caret-down icon-only bigger-120"></i>'+
					'</button>'+
					'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
						'<li>'+
							'<a onclick="editarEmpresa('+ data[i].idEmpresa +')" class="tooltip-info" data-rel="tooltip" title="Editar">'+
								'<span class="blue">'+
									'<i class="icon-edit bigger-120"></i>'+
								'</span></a></li></ul></div></div>'+
			'<!-- [FIN] BOTON EDITAR -->'+
		    '<!-- [INI] ELIMINAR -->'+
			'<div class="hidden-phone visible-desktop action-buttons">'+
				'<a class="red tooltip-error" onclick="eliminarEmpresa('+ data[i].idEmpresa +')" data-rel="tooltip" title="Eliminar">'+
					'<i class="icon-trash bigger-130"> </i>'+
				'</a></div>'+
			'<div class="hidden-desktop visible-phone">'+
				'<div class="inline position-relative">'+
					'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
						'<i class="icon-caret-down icon-only bigger-120"></i>'+
					'</button>'+
					'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
						'<li>'+
							'<a class="tooltip-error" data-rel="tooltip" title="Eliminar" onclick="eliminarEmpresa(' + data[i].idEmpresa +')" >'+
								'<span class="red">'+
									'<i class="icon-trash bigger-120"></i>'+
								'</span>'+
							'</a>'+
						'</li>'+
					'</ul>'+
				'</div>'+
			'</div>'+
			'<!-- [FIN] ELIMINAR -->'; 

				t.row.add([data[i].razonSocial,
						   data[i].dscpais,
						   data[i].fechaRegistro,
						   data[i].telefono,
				           accion ]).draw();
			};
		});	
}

function editarEmpresa(idEmpresa){
	loadModalCargando();
	$.postJSON('${pageContext.request.contextPath}/administracion/obtener_Empresa.htm', idEmpresa,
			function(data) {
				$("#idEmpresaModal").val(data.idEmpresa);
				$("#razonSocialEmpresa").val(data.razonSocial);
				$("#rucEmpresa").val(data.ruc);
				$("#paisEmpresa").val(data.idpais);
				$("#paginawebEmpresa").val(data.paginaWeb);
				$("#direccionEmpresa").val(data.direccion);
				$("#twitterEmpresa").val(data.redSocialTwitter);
				$("#fecebookEmpresa").val(data.redSocialFacebook);
				$("#linkedinEmpresa").val(data.redSocialLinkedin);
				$("#gmailEmpresa").val(data.redSocialGmail);
				$("#teleEmpresa").val(data.telefono);
				$("#anexoEmpresa").val(data.anexo);
				$("#correoEmpresa").val(data.correo);
				$("#contactoEmpresa").val(data.comoContacto);
				
				$.postJSON('${pageContext.request.contextPath}/administracion/listar_ContactoEmpresa.htm', idEmpresa,
						function(data) {
							dataContEmpresa = eval(data);
							$("#tablaContEmpresaProyecto").DataTable().ajax.reload();
							closeModalCargando();
							$('#modal-Empresa').modal('show');
						}
				);
			}
	);	
}

function eliminarEmpresa(idEmpresa){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_Empresa.htm', idEmpresa,
							function(data) {					
								listarEmpresa();
								closeModalCargando();
								$.gritter.add({
									title: 'Info!',
									text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
									sticky: false,
									time: '1200',
									class_name: 'gritter-info gritter-light'
								});
							}
					).fail(function() {
				    	closeModalCargando();
				    	
						$.gritter.add({
							title: 'Error!',
							text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n',
							sticky: false,
							time: '1200',
							class_name: 'gritter-error'
						});
					});	
				}
			}
	);
}
</script>