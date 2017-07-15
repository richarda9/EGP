<%@ include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8" />
		<title>SigcomtGP</title>
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Expires" content="0" /> 
		<meta http-equiv="Pragma" content="no-cache" />
		<link rel="shortcut icon" href="<c:url value="/assets/images/sigcomt.ico"/>">

		<!-- ##########################  HEAD ######################  -->
		<tiles:insertAttribute name="css"/>
		<tiles:insertAttribute name="css2"/>
		<!-- ########################  END HEAD ######################  -->
		
</head>

<body>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
					
			<!-- ##########################  HEAD ######################  -->
			<tiles:insertAttribute name="sidebar"/>
			<!-- ########################  END HEAD ######################  -->
										
			</div>
		</div>
	</div>

	<div class="main-container container-fluid">
		<a class="menu-toggler" id="menu-toggler" href="#">
			<span class="menu-text"></span>
		</a>

		<!-- ##########################  MENU ######################  -->
		<tiles:insertAttribute name="menu"/>
		<!-- ########################  END MENU ######################  -->

		<div class="main-content">
			<tiles:insertAttribute name="barraHorizontal"/>
			<div class="page-content">
				<!-- ##########################  CONTENIDO ######################  -->
				<tiles:insertAttribute name="contenido"/>
				<!-- ########################  END CONTENIDO ######################  -->
				<%@ include file="/WEB-INF/templateSistema/avisos_modal.jsp"%>
			</div>

		</div><!--/.main-content-->
	</div><!--/.main-container-->

	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
		<i class="icon-double-angle-up icon-only bigger-110"></i>
	</a>

	<!-- ############################### SCRIPT  ################################ -->
	<tiles:insertAttribute name="js"/>
	<tiles:insertAttribute name="js2"/>
	<!-- ############################# END SCRIPT ############################### -->

</body>
</html>
