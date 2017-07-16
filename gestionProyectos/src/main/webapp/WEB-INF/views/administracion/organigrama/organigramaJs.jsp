<script src="../assets/js/bootbox.min.js"></script>
<script>
var dataOrganigrama = eval('${model.listaOrganigrama}');
$(function() 
{
	$('#tablaOrganigramaProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataOrganigrama } );
					   },	
		"paging" 	 : true,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
});
</script>