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
	
	$('#editor1').ace_wysiwyg({
		toolbar:
		[
			'font',
			null,
			'fontSize',
			null,
			{name:'bold', className:'btn-info'},
			{name:'italic', className:'btn-info'},
			{name:'strikethrough', className:'btn-info'},
			{name:'underline', className:'btn-info'},
			null,
			{name:'insertunorderedlist', className:'btn-success'},
			{name:'insertorderedlist', className:'btn-success'},
			{name:'outdent', className:'btn-purple'},
			{name:'indent', className:'btn-purple'},
			null,
			{name:'justifyleft', className:'btn-primary'},
			{name:'justifycenter', className:'btn-primary'},
			{name:'justifyright', className:'btn-primary'},
			{name:'justifyfull', className:'btn-inverse'},
			null,
			{name:'createLink', className:'btn-pink'},
			{name:'unlink', className:'btn-pink'},
			null,
			{name:'insertImage', className:'btn-success'},
			null,
			'foreColor',
			null,
			{name:'undo', className:'btn-grey'},
			{name:'redo', className:'btn-grey'}
		],
		'wysiwyg': {
			fileUploadError: showErrorAlert
		}
	}).prev().addClass('wysiwyg-style2');
	
	
	
	$('#archObservacion').ace_file_input({
						no_file:'No File ...',
						btn_choose:'Choose',
						btn_change:'Change',
						droppable:false,
						onchange:null,
						thumbnail:false
					});
					
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	}
	
	$('#editor2').ace_wysiwyg({
		toolbar:
		[
			'font',
			null,
			'fontSize',
			null,
			{name:'bold', className:'btn-info'},
			{name:'italic', className:'btn-info'},
			{name:'strikethrough', className:'btn-info'},
			{name:'underline', className:'btn-info'},
			null,
			{name:'insertunorderedlist', className:'btn-success'},
			{name:'insertorderedlist', className:'btn-success'},
			{name:'outdent', className:'btn-purple'},
			{name:'indent', className:'btn-purple'},
			null,
			{name:'justifyleft', className:'btn-primary'},
			{name:'justifycenter', className:'btn-primary'},
			{name:'justifyright', className:'btn-primary'},
			{name:'justifyfull', className:'btn-inverse'},
			null,
			{name:'createLink', className:'btn-pink'},
			{name:'unlink', className:'btn-pink'},
			null,
			{name:'insertImage', className:'btn-success'},
			null,
			'foreColor',
			null,
			{name:'undo', className:'btn-grey'},
			{name:'redo', className:'btn-grey'}
		],
		'wysiwyg': {
			fileUploadError: showErrorAlert
		}
	}).prev().addClass('wysiwyg-style2');
	
	$('#tablaReqProyecto').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#tablaExclProyecto').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#tablaSupuestoProyecto').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#tablaDependenciaProyecto').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#tablafactExitoProyecto').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
	
	$('#arbolProveedor').ace_tree({
		dataSource: treeDataSource ,
		//multiSelect:true,
		loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
		'open-icon' : 'icon-minus',
		'close-icon' : 'icon-plus',
		'selectable' : true,
		'selected-icon' : 'icon-ok',
		'unselected-icon' : 'icon-remove'
	});
	
	$('#arbolCliente').ace_tree({
		dataSource: treeDataSource ,
		//multiSelect:true,
		loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
		'open-icon' : 'icon-minus',
		'close-icon' : 'icon-plus',
		'selectable' : true,
		'selected-icon' : 'icon-ok',
		'unselected-icon' : 'icon-remove'
	});
	
	$('#tablaEntregableProyecto').DataTable({
		"paging" : true,
		"autoWidth": true,
		"pageLength": 10,
		"searching": false,
		"bLengthChange": false,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
				
});
</script>