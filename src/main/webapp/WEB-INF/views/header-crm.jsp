<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>
<body>

	<div class="header_design container-fluid bg-primary">
		<div class="container">
			<div class="row">
				<div class="col-3">
					<a href="home" class="navbar-brand text-light"> CRM Application </a>
				</div>
				<div class="col-6"></div>
				<div class="col-3">
					<button type="button" class="btn btn-info dropdown-toggle"
						data-bs-toggle="dropdown">More</button>
						
					<ul class="dropdown-menu">
					
						<!-- <li><a href="#" class="dropdown-item bg-secondary text-light"> Home </a></li> -->
						<li><a href="home" class="dropdown-item"> Home </a></li>
						<li><a href="login" class="dropdown-item">Login </a></li>
						<li><a href="#" class="dropdown-item"> About Us </a></li>
						<li><a href="#" class="dropdown-item"> Contact Us </a></li>
						
					</ul>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>