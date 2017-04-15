<script src="../assets/js/bootstrap-wysiwyg.min.js"></script>
<script src="../assets/js/jquery.hotkeys.min.js"></script>
<script src="../assets/js/fuelux/data/fuelux.tree-sampledata.js"></script>
<script src="../assets/js/fuelux/fuelux.tree.min.js"></script>

<script>
$(function() 
{	
	$('#fechaContacto').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaContacto').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#fecIniTarea').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fecIniTarea').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#fecFinTarea').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fecFinTarea').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#tablaRecProveedor').DataTable({
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
	
	$('#tablaRecCliente').DataTable({
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
	
	$('#tablaSegTareas').DataTable({
		"paging"     : true,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		"scrollCollapse": true,
		//"bLengthChange": false,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       }
	});
	
	$('#tablacertiEntregables').DataTable({
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
	
	$('#tablasegEntregables').DataTable({
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
	
	$('#tablasegAdquisiciones').DataTable({
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
	
	$('#tablaControlCambios').DataTable({
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
	
	$('#tablainfAvance').DataTable({
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
	
	$("#asignarRecursoTarea").click(function(){
	       $('#mostrarRecurso').modal('hide');
	});
	
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

// function asignarRecursoTarea(){
// 	$('#mostrarRecurso').modal('hide');
	
// 	return false;
// };
</script>