<%@ include file="/WEB-INF/views/include.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<a href="#" class="brand">
	<small>
		<img src="../assets/images/sigcomt.png" style="max-width: 7%; border-radius: 24px 24px 24px 24px;
-moz-border-radius: 24px 24px 24px 24px;
-webkit-border-radius: 24px 24px 24px 24px;
border: 0px solid #000000;">
		GESTI&Oacute;N DE PROYECTOS
	</small>
</a>

<ul class="nav ace-nav pull-right">

<!-- 	<li class="grey"> -->
<!-- 		<a data-toggle="dropdown" class="dropdown-toggle" href="#">  -->
<!-- 			<i class="icon-tasks"></i>  -->
<!-- 			<span class="badge badge-grey">4</span> -->
<!-- 		</a> -->

<!-- 		<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer"> -->
<!-- 			<li class="nav-header"> -->
<!-- 				<i class="icon-ok"></i> 4 Tasks to complete -->
<!-- 			</li> -->

<!-- 			<li> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="clearfix"> -->
<!-- 						<span class="pull-left">Software Update</span> <span class="pull-right">65%</span> -->
<!-- 					</div> -->

<!-- 					<div class="progress progress-mini"> -->
<!-- 						<div style="width: 65%" class="bar"></div> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</li> -->

<!-- 			<li><a href="#"> -->
<!-- 					<div class="clearfix"> -->
<!-- 						<span class="pull-left">Hardware Upgrade</span>  -->
<!-- 						<span class="pull-right">35%</span> -->
<!-- 					</div> -->

<!-- 					<div class="progress progress-mini progress-danger"> -->
<!-- 						<div style="width: 35%" class="bar"></div> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</li> -->

<!-- 			<li> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="clearfix"> -->
<!-- 						<span class="pull-left">Unit Testing</span>  -->
<!-- 						<span class="pull-right">15%</span> -->
<!-- 					</div> -->

<!-- 					<div class="progress progress-mini progress-warning"> -->
<!-- 						<div style="width: 15%" class="bar"></div> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</li> -->

<!-- 			<li> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="clearfix"> -->
<!-- 						<span class="pull-left">Bug Fixes</span>  -->
<!-- 						<span class="pull-right">90%</span> -->
<!-- 					</div> -->

<!-- 					<div class="progress progress-mini progress-success progress-striped active"> -->
<!-- 						<div style="width: 90%;" class="bar"></div> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</li> -->

<!-- 			<li> -->
<!-- 				<a href="#"> See tasks with details  -->
<!-- 					<i class="icon-arrow-right"></i> -->
<!-- 				</a> -->
<!-- 			</li> -->
<!-- 		</ul> -->
<!-- 	</li> -->

<!-- 	<li class="purple"> -->
<!-- 		<a data-toggle="dropdown" class="dropdown-toggle" href="#">  -->
<!-- 			<i class="icon-bell-alt icon-animated-bell"></i>  -->
<!-- 			<span class="badge badge-important">8</span> -->
<!-- 		</a> -->

<!-- 		<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-closer"> -->
<!-- 			<li class="nav-header"> -->
<!-- 				<i class="icon-warning-sign"></i> 8 Notifications -->
<!-- 			</li> -->

<!-- 			<li> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="clearfix"> -->
<!-- 						<span class="pull-left">  -->
<!-- 							<i class="btn btn-mini no-hover btn-pink icon-comment"></i> New Comments -->
<!-- 						</span>  -->
<!-- 						<span class="pull-right badge badge-info">+12</span> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</li> -->

<!-- 			<li> -->
<!-- 				<a href="#">  -->
<!-- 					<i class="btn btn-mini btn-primary icon-user"></i> Bob just signed up as an editor ... -->
<!-- 				</a> -->
<!-- 			</li> -->

<!-- 			<li> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="clearfix"> -->
<!-- 						<span class="pull-left">  -->
<!-- 							<i class="btn btn-mini no-hover btn-success icon-shopping-cart"></i> New Orders -->
<!-- 						</span>  -->
<!-- 						<span class="pull-right badge badge-success">+8</span> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</li> -->

<!-- 			<li> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="clearfix"> -->
<!-- 						<span class="pull-left"> -->
<!-- 							<i class="btn btn-mini no-hover btn-info icon-twitter"></i> Followers -->
<!-- 						</span>  -->
<!-- 						<span class="pull-right badge badge-info">+11</span> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</li> -->

<!-- 			<li> -->
<!-- 				<a href="#"> See all notifications -->
<!-- 				<i class="icon-arrow-right"></i> -->
<!-- 				</a> -->
<!-- 			</li> -->
<!-- 		</ul> -->
<!-- 	</li> -->

	<li class="green">
		<a data-toggle="dropdown" class="dropdown-toggle" href="#"> 
			<i class="icon-envelope icon-animated-vertical"></i> 
			<span class="badge badge-success">5</span>
		</a>

		<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
			<li class="nav-header">
				<i class="icon-envelope-alt"></i> 5 Mensajes
			</li>

			<li>
				<a href="#"> 
					<img src="../assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" /> 
					<span class="msg-body"> 
						<span class="msg-title"> 
							<span class="blue">Alex:</span> Ciao sociis natoque	penatibus et auctor ...
						</span> 
						<span class="msg-time"> 
							<i class="icon-time"></i> 
							<span>a moment ago</span>
						</span>
					</span>
				</a>
			</li>

			<li>
				<a href="#"> 
					<img src="../assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" /> 
					<span class="msg-body"> 
						<span class="msg-title"> 
							<span class="blue">Susan:</span> Vestibulum id ligula porta felis euismod ...
						</span> 
						<span class="msg-time"> 
							<i class="icon-time"></i> 
							<span>20 minutes ago</span>
						</span>
					</span>
				</a>
			</li>

			<li>
				<a href="#"> 
					<img src="../assets/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar" /> 
					<span class="msg-body"> 
						<span class="msg-title"> 
							<span class="blue">Bob:</span> Nullam quis risus eget urna mollis ornare ...
						</span> 
						<span class="msg-time"> 
							<i class="icon-time"></i> 
							<span>3:15 pm</span>
						</span>
					</span>
				</a>
			</li>

			<li>
				<a href="#"> Ver todos los mensajes
					<i class="icon-arrow-right"></i>
				</a>
			</li>
		</ul>
	</li>

	<li class="light-blue">
		<a data-toggle="dropdown" href="#" class="dropdown-toggle"> 
			<img class="nav-user-photo" src="../assets/avatars/user.jpg" alt="Jason's Photo" /> 
			<span class="user-info"> 
				<small>Bienvenido,</small>	<%-- <security:authentication property="principal.nombre" /> --%>
			</span> 
			<i class="icon-caret-down"></i>
		</a>

		<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
			<li>
				<a href="<c:out value="../home/configuracion.htm" />"> 
					<i class="icon-cog"></i> Configuraci�n
				</a>
			</li>

			<li>
				<a href="../home/perfil.htm" > 
					<i class="icon-user"></i> Perfil
				</a>
			</li>

			<li class="divider"></li>

			<li>
				<a href="#cerrar" data-toggle="modal"> 
					<i class="icon-off"></i> Cerrar Sesi�n
				</a>
			</li>
		</ul>
	</li>
</ul>
<div id="cerrar" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		

		<div class="modal-body">
			<h4>�Est�s seguro que desea cerrar sesi�n?</h4>


		</div>
		<div class="modal-footer">
			<c:url value="/logout.htm" var="logoutUrl" />
			<a href="${logoutUrl}" class="btn btn-primary" >Aceptar</a>
			<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
		</div>

	</div>