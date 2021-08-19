<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="baseUrl" value="/" />

<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Team Capstone Columbus Tech Start">

	<title>Capstone Project - Dashboard</title>

	<!-- Custom fonts for this template-->
	<link href="${baseUrl}vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="${baseUrl}css/sb-admin-2.min.css" rel="stylesheet"/>

	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.3/css/select.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/datetime/1.1.0/css/dataTables.dateTime.min.css">


	<!-- Custom styles for this project-->
	<link href="${baseUrl}css/site.css" rel="stylesheet"/>

</head>

<body id="page-top" class="bg-dark">

<!-- Page Wrapper -->
<div id="wrapper">

	<!-- Sidebar -->
	<ul class="navbar-nav bg-dark sidebar sidebar-dark accordion" id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="${baseUrl}">
			<div class="sidebar-brand-icon">
				<c:url var="logoImageUrl" value="/img/logo.png" />
				<img src="${logoImageUrl}" width="50px"/>
			</div>
			<div class="sidebar-brand-text mx-3 " style="color: #a5cfab; font-size: 120%">Prep Thyme</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Divider -->
		<c:if test="${LOGGED_USER == null}">
			<hr class="sidebar-divider">

			<!-- Heading -->
			<!-- Nav Item - Pages Collapse Menu -->

		</c:if>
		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<c:if test="${LOGGED_USER != null}">
			<div class="sidebar-heading" style="font-size: 20px; color:#EE964B;">

					${LOGGED_USER}
			</div>

			<!-- Nav Item - Tables -->


			<li class="nav-item">
				<a class="nav-link" href="${baseUrl}">
					<i class="fas fa-fw fa-home" style="color:#a5cfab;"></i>
					<span>Home</span></a>
			</li>

			<li class="nav-item">
				<a class="nav-link" href="${baseUrl}user/viewallrecipes">
					<i class="fas fa-fw fa-cookie-bite" style="color: #EE964B"></i>
					<span>All Recipes</span></a>
			</li>

			<li class="nav-item">
				<a class="nav-link" href="${baseUrl}user/viewmealplans">
					<i class="fas fa-fw fa-fish" style="color: #EE964B"></i>
					<span>My Meal Plans</span></a>
			</li>

			<li class="nav-item">
				<a class="nav-link" href="${baseUrl}user/viewrecipe">
					<i class="fas fa-fw fa-utensils" style="color: #EE964B"></i>
					<span>My Recipes</span></a>
			</li>


		</c:if>

		<!-- Divider -->

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>
	<!-- End of Sidebar -->

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>

				<!-- Topbar Search -->
				<c:if test="${LOGGED_USER != null}">
				<form  method="GET" action="${baseUrl}user/search" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" name="searchText" class="form-control bg-light border-0 small" placeholder="Search for recipe by..." aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn" style="background-color: #a5cfab; color: white;" type="submit">
								<i class="fa fa-search"></i>
							</button>
							<div>
								<select class="form-control" id="filterBy" name="filterBy">
									<option value="ingredient">Ingredient</option>
									<option value="category">Category</option>
								</select>
							</div>
						</div>
					</div>
				</form>
				</c:if>


				<c:if test="${LOGGED_USER == null}">
					<form  method="GET" action="${baseUrl}publicsearchresults" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" name="searchText" class="form-control bg-light border-0 small" placeholder="Search for recipe by..." aria-label="Search" aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn" style="background-color: #a5cfab; color: white;" type="submit">
									<i class="fa fa-search"></i>
								</button>
								<div>
									<select class="form-control" id="filterBy" name="filterBy">
										<option value="ingredient">Ingredient</option>
										<option value="category">Category</option>
									</select>
								</div>
							</div>
						</div>
					</form>
				</c:if>



					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow">
						<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="mr-2 d-none d-lg-inline text-gray-600 small">
								${LOGGED_USER != null ? LOGGED_USER : 'Anonymous'}
							</span>
							<img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
						</a>
						<!-- Dropdown - User Information -->
						<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
							<a class="dropdown-item" href="#">
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
								Profile
							</a>
							<a class="dropdown-item" href="#">
								<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
								Settings
							</a>
							<a class="dropdown-item" href="#">
								<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
								Activity Log
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								Logout
							</a>
						</div>
					</li>

				</ul>

			</nav>
			<!-- End of Topbar -->
