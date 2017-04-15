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
});