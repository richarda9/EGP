$('document').ready(function(){
	$('#envioEntregableCertificacion').ace_file_input({ 
		no_file:'Sin archivo ...',
		btn_choose:'Elegir',
		btn_change:'Cambiar',
		droppable:false,
		onchange:null,
		thumbnail:false, //| true | large
// 		whitelist:"'gif|png|jpg|jpeg'",
// 		blacklist:'exe|php'
		//onchange:''
		//
		maxSize: 110000,//bytes
		allowExt: ["jpeg", "jpg", "png", "gif"],
		allowMime: ["image/jpg", "image/jpeg", "image/png", "image/gif"],
	}).on('file.error.ace', function(event, info) {
		if(info.error_count['ext'] || info.error_count['mime']) alert('Invalid file type! Please select an image!');
		if(info.error_count['size']) alert('Invalid file size! Maximum 100KB');
		
		//you can reset previous selection on error
		//ev.preventDefault();
		//file_input.ace_file_input('reset_input');
	});	
	
	
	$('#registrarEnvioCertificacion').validate({
		errorClass: 'help-block',
		rules: {
			idDestinoCertificacion: {
				required: true
			},
			destinoCertificacion: {
				required: true
			},
			ccdestinoCertificacion: {
				required: false,
				maxlength 	: 100
			},
			asuntoDestinoCertificacion: {
				required: true
			},
			observacionCertificacion: {
				required: true
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
			envioCertificacion();
			//true;
		}
	});
	
	function envioCertificacion(){
		$('#modal-EnviarCertificacion').modal('hide');
		loadModalCargando();
		var objetoCtrol = $('#registrarEnvioCertificacion').serializeObject();
			objetoCtrol.idproyecto = $("#idProyectoGeneral").val();
		 var oMyForm = new FormData();
         oMyForm.append("file", $('#envioEntregableCertificacion').data('ace_input_files')[0]);
         oMyForm.append("objeto",JSON.stringify(objetoCtrol));
         		
		jQuery.ajax({
	        'type': 'POST',
	        'url': 'mnt_EnvioCertificacion.htm',
	        'data': oMyForm,
	        'processData': false, 
            'contentType':false,
	        'success': function(data) {
				if(data == 0){
					listarEnvioCertificacion();
					closeModalCargando();
					$.gritter.add({
						title: 'Info!',
						text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
						sticky: false,
						time: '1200',
						class_name: 'gritter-info gritter-light'
					});
				}else if(data == 1){
					closeModalCargando();
					$.gritter.add({
						title: 'Error!',
						text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n.',
						sticky: false,
						time: '1200',
						class_name: 'gritter-error'
					});				
				}
	        }
	    }).fail(function() {
			closeModalCargando();
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});				
		});
	}
});