<script>
$(function() 
{
	$('#tablaEmpresaProyecto').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		//"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	$('#tablaContEmpresaProyecto').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		//"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#logoEmpresa').ace_file_input({ 
		no_file:'Sin archivo ...',
		btn_choose:'Elegir',
		btn_change:'Cambiar',
		droppable:false,
		onchange:null,
		thumbnail:false, //| true | large
		whitelist:"'gif|png|jpg|jpeg'",
		blacklist:'exe|php'
		//onchange:''
		//
	});	
	
	$('#formatoEmpresa').ace_file_input({ 
		no_file:'Sin archivo ...',
		btn_choose:'Elegir',
		btn_change:'Cambiar',
		droppable:false,
		onchange:null,
		thumbnail:false 
	});	
});
</script>