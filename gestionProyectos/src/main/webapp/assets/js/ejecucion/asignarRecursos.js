$('document').ready(function(){
//	$("#asignarRecursoTarea").click(function(){
//	       $('#mostrarRecurso').modal('hide');
//	});

	$('#registrarRecursoTarea').validate({
		errorClass: 'help-block',
		rules: {
			rolesAsignarTarea: {
				required: true
			},
			idrecursoAsignadoTarea: {
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
			mntAsignarRecurso();
		}
	});

	function mntAsignarRecurso(){
		var objeto = $("#registrarRecursoTarea").serializeObject();

		console.log(objeto);
		
		var texto = "";
		if(objeto.idrecursoAsignadoTarea instanceof Array){

			for (var i = 0; i < objeto.idrecursoAsignadoTarea.length; i++) {
				texto += objeto.idrecursoAsignadoTarea[i] +";"; 
			};

			texto = texto.substring(0, texto.length - 1);

			$("#recursoTarea").val(texto);
		}else
			$("#recursoTarea").val(objeto.idrecursoAsignadoTarea);

		$('#mostrarRecurso').modal('hide');


	}
});