<script>
$(function() 
{
	$('#tablaRecursosProyecto').DataTable({
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