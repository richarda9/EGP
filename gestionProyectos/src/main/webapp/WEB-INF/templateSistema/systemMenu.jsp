<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<div class="sidebar" id="sidebar">

	<ul class="nav nav-list">
		<!-- INICIO -->
		<li id="inicio">
			<a href="#" class="dropdown-toggle"> 
				<i class="icon-home"></i> <span class="menu-text"> Inicio </span> <b class="arrow icon-angle-down"></b>
			</a>
			<ul class="submenu">
				<li id="inicio_bienvenida">
					<a href="../home/bienvenida.htm">
						<i class="icon-double-angle-right"></i> Bienvenida 
					</a>
				</li>
				<li id="inicio_perfil">
					<a href="../home/perfil.htm">
						<i class="icon-double-angle-right"></i> Perfil 
					</a>
				</li>
				<li id="inicio_configuracion">
					<a href="../home/configuracion.htm">
						<i class="icon-double-angle-right"></i> Configuraci&oacute;n 
					</a>
				</li>
			</ul>
		</li>

		<!-- -----------------------MENU GESTION PROYECTO ------------------------>
		<%-- <security:authorize access="hasAnyRole('ROLE_BIENESTAR_JEFE','ROLE_BIENESTAR_ASISTENTA','ROLE_ALUMNO','ROLE_COMEDOR','ROLE_MEDICO','ROLE_DEPORTES')"> --%>
			<li id="bienestar">
				<a href="#" class="dropdown-toggle">
					<i class="icon-edit"></i> 
						<span class="menu-text"> Gesti&oacute;n de Proyectos </span> <b class="arrow icon-angle-down"></b>
				</a>

				<ul class="submenu">
					<%-- <security:authorize access="hasAnyRole('ROLE_BIENESTAR_JEFE','ROLE_BIENESTAR_ASISTENTA','ROLE_ALUMNO')"> --%>
						<!-- ANTEPROYECTO  -->
						<li id="idAnteproyecto">
							<a href="#" class="dropdown-toggle">
								<i class="icon-double-angle-right"></i> Anteproyecto<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">								
								<!-- ------------------------------------------------------ -->
								<%-- <security:authorize access="hasAnyRole('ROLE_BIENESTAR_JEFE')"> --%>
									<li id="bienestar_historial">
										<a href="../bienestar/historiaSocial.htm">
											<i class="icon-align-justify"></i> Paso 1 
										</a>
									</li>
								<%-- </security:authorize> --%>
								<!-- ------------------------------------------------------ -->
							</ul></li>
					<%-- </security:authorize> --%>
					<%-- <security:authorize access="hasAnyRole('ROLE_BIENESTAR_JEFE','ROLE_BIENESTAR_ASISTENTA','ROLE_ALUMNO')"> --%>
						<!-- PLANIFICACION  -->
						<li id="idPlanificacion">
							<a href="#" class="dropdown-toggle">
								<i class="icon-double-angle-right"></i> Planificaci&oacute;n<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">								
								<!-- ------------------------------------------------------ -->
								<%-- <security:authorize access="hasAnyRole('ROLE_BIENESTAR_JEFE')"> --%>
									<li id="bienestar_historial">
										<a href="../bienestar/historiaSocial.htm">
											<i class="icon-align-justify"></i> Paso 1 
										</a>
									</li>
								<%-- </security:authorize> --%>
								<!-- ------------------------------------------------------ -->
							</ul></li>
					<%-- </security:authorize> --%>
					<%-- <security:authorize access="hasAnyRole('ROLE_BIENESTAR_JEFE','ROLE_BIENESTAR_ASISTENTA','ROLE_ALUMNO')"> --%>
						<!-- EJECUCION  -->
						<li id="idEjecucion">
							<a href="#" class="dropdown-toggle">
								<i class="icon-double-angle-right"></i> Ejecuci&oacute;n<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">								
								<!-- ------------------------------------------------------ -->
								<%-- <security:authorize access="hasAnyRole('ROLE_BIENESTAR_JEFE')"> --%>
									<li id="bienestar_historial">
										<a href="../bienestar/historiaSocial.htm">
											<i class="icon-align-justify"></i> Paso 1
										</a>
									</li>
								<%-- </security:authorize> --%>
								<!-- ------------------------------------------------------ -->
							</ul></li>
					<%-- </security:authorize> --%>
					<%-- <security:authorize access="hasAnyRole('ROLE_BIENESTAR_JEFE','ROLE_BIENESTAR_ASISTENTA','ROLE_ALUMNO')"> --%>
						<!-- CIERRE  -->
						<li id="idCierre">
							<a href="#" class="dropdown-toggle">
								<i class="icon-double-angle-right"></i> Cierre<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">								
								<!-- ------------------------------------------------------ -->
								<%-- <security:authorize access="hasAnyRole('ROLE_BIENESTAR_JEFE')"> --%>
									<li id="bienestar_historial">
										<a href="../bienestar/historiaSocial.htm">
											<i class="icon-align-justify"></i> Paso 1
										</a>
									</li>
								<%-- </security:authorize> --%>
								<!-- ------------------------------------------------------ -->
							</ul></li>
					<%-- </security:authorize> --%>


				</ul></li>
		<%-- </security:authorize> --%>

	</ul>

	<div class="sidebar-collapse" id="sidebar-collapse">
		<i class="icon-double-angle-left"></i>
	</div>
</div>