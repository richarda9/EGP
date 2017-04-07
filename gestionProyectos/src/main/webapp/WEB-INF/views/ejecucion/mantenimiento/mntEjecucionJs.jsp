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
	
	$('#tablaRecProveedor').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		//"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#tablaRecCliente').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		//"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#tablaSegTareas').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		//"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#tablacertiEntregables').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		//"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#tablasegEntregables').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		//"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#tablasegAdquisiciones').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		//"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#tablaControlCambios').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		//"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#tablainfAvance').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		//"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});				
});
</script>