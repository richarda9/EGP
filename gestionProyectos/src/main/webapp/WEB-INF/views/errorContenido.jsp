<%@ include file="/WEB-INF/views/include.jsp"%>

<div class="row-fluid">
	<div class="span12">
	<!--PAGE CONTENT BEGINS-->
		<div class="error-container">
			<div class="well">
				<h1 class="grey lighter smaller">
					<span class="blue bigger-125">											
						ERROR DEL SISTEMA
					</span>
				</h1>				
				<hr />									
				<div class="space"></div>
				<div>
					<h4 class="lighter smaller">${model.mensajeError}</h4>
				</div>
				<hr />
				<div class="space"></div>				
			</div>
		</div>
	<!--PAGE CONTENT ENDS-->
	</div><!--/.span-->
</div><!--/.row-fluid-->