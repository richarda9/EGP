$('document').ready(function(){
	$('#envioEntregableAprobacion').ace_file_input({ 
		no_file:'Sin archivo ...',
		btn_choose:'Elegir',
		btn_change:'Cambiar',
		droppable:false,
		onchange:null,
		thumbnail:false, 
		maxSize: 110000,
		allowExt: ["jpeg", "jpg", "png", "gif"],
		allowMime: ["image/jpg", "image/jpeg", "image/png", "image/gif"],
	});
});