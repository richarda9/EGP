<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<div class="page-header position-relative">
	<h1>
		Bienvenido
		<!-- small> <i class="icon-double-angle-right"></i> Reporte de Tickets
		</small -->
	</h1>

</div>

<div class="row-fluid">
	<div class="span12">
		<!--PAGE CONTENT BEGINS-->

		<!-- --------------- ALERTA ----------- -->
		<div class="alert alert-block alert-success">
			<button type="button" class="close" data-dismiss="alert">
				<i class="icon-remove"></i>
			</button>

			<i class="icon-ok green"></i> Bienvenido al <strong class="green">Sistema de Gestión de Proyectos </strong> <security:authentication property="principal.nombres" /></a>.
		</div>
		<!-- ------------- FIN ALERTA ------------- -->



		<!-- --------------- ACCESOS DIRECTOS ---------------- -->
		<%-- <div class="row-fluid">

			<div class="span2 center" style="padding: 10px;">
				<a href="editarperfil.htm"> <img alt="Editar Perfil" src="../assets/img/icons/Edit-Male-User64.png"><br />Editar
					Perfil
				</a>
			</div>

			<div class="span2 center" style="padding: 10px;">
				<a href="configuracion.htm"><img alt="Editar Perfil" src="../assets/img/icons/configure64.png"><br />Configuración
				</a>
			</div>
			
			<security:authorize access="hasAnyRole('ROLE_ALUMNO')">
			<div class="span2 center" style="padding: 10px;">
				<a href="../bienestar/buscar_paso.htm"> <img alt="Editar Perfil" src="../assets/img/icons/checklist64.png"><br />Ficha
					Servicio Social
				</a>
			</div>
			</security:authorize>



		</div> --%>

		<!--/row-->
		<!-- ------------- FIN ACCESOS DIRECTOS ------------- -->

		<!--PAGE CONTENT ENDS-->
	</div>
	<!--/.span-->
</div>
<!--/.row-fluid-->