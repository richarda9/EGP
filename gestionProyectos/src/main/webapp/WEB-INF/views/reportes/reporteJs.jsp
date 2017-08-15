<script>
$(function() 
{	
	$('#fechaInicio').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaInicio').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#fechafin').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechafin').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});

	$('#fechaInicioProyecto').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaInicioProyecto').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#fechafinProyecto').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechafinProyecto').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});

	$('#fechaInicioTareaProyecto').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaInicioTareaProyecto').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#fechafinTareaProyecto').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechafinTareaProyecto').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
});

function descargarRptProyectosPDf()
{
	var objeto = $("#formRptProyectos").serializeObject();
	
	window.open('${pageContext.request.contextPath}/reportes/emitirRptPdfProyecto.htm?idparam1=' + objeto.idCliente + '&idparam2=' + 
			   objeto.idTipoProyecto + '&idparam3=' + objeto.idEstadoProyecto + '&idparam4=' + 
               objeto.estadoRegistro + '&idparam5=' + objeto.fechaInicioProyecto + '&idparam6=' + objeto.fechafinProyecto);
}

function descargarExcel(){
	
}

function descargarRptTareasxProyectoPDF(){
	var objeto = $("#formRptTareasxProyectos").serializeObject();
	
	window.open('${pageContext.request.contextPath}/reportes/emitirRptPdfTareasxProyecto.htm?idparam1=' + objeto.idProyecto + '&idparam2=' + 
			   objeto.idEstadoTarea + '&idparam3=' + objeto.fechaInicio + '&idparam4=' + 
               objeto.fechaFin);
}

function descargarRptEntregablesxProyectoPDF(){	
	var objeto = $("#formRptEntregablesxProyectos").serializeObject();
	
	window.open('${pageContext.request.contextPath}/reportes/emitirRptPdfEntregablesxProyecto.htm?idparam1=' + objeto.idProyecto + '&idparam2=' + 
			   objeto.idEstadoEntregable);
}
</script>