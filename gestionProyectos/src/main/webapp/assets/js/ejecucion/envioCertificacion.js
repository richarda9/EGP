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
		
		var objetoCtrol = $('#registrarEnvioCertificacion').serializeObject();
		 var oMyForm = new FormData();
         oMyForm.append("file", $('#envioEntregableCertificacion').data('ace_input_files')[0]);
         oMyForm.append("objeto",JSON.stringify(objetoCtrol));
         //objetoCtrol.fichero = $('#envioEntregableCertificacion').data('ace_input_files')[0];//oMyForm;
         
         console.log(oMyForm);
		
		jQuery.ajax({
	        'type': 'POST',
	        'url': 'mnt_EnvioCertificacion.htm',
	        //'contentType': 'application/json; charset=utf-8',
	        //'enctype': 'multipart/form-data',
	        'data': oMyForm, //{dato  : objetoCtrol}, //, file: oMyForm}, //JSON.stringify(data),
	        //'dataType': 'json',
	        'processData': false, 
            'contentType':false,
            
//            'contentType': 'application/json; charset=utf-8',
//            'data': JSON.stringify(objetoCtrol),
//            'dataType': 'json',
            
	        'success': function(data) {
				if(data){
					console.log('paso');
				}
	        }
	    });
	}
});