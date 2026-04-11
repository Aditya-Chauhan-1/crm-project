<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header Admin</title>
</head>
<body>
	
	<div class="header_design container-fluid bg-primary">
		<div class="container">
			<div class="row">
				<div class="col-3">
					<a href="homeemployee" class="navbar-brand text-light"> CRM Application </a>
				</div>
				<div class="col-6"></div>
				<div class="col-3">
					<a class="navbar-brand text-light" href="profileEmployee"> 
					<img src="images/profile.png" alt="" style="width: 50px;" class="rounded-pill"> ${session_employee.getName()} </a> 
					<a href="logout" class="text-light">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<nav
		class="navbar navbar-expand-sm bg-dark navbar-dark container-fluid">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar"
				style="display: flex; justify-content: center">
				<ul class="navbar-nav">
				
					<li class="nav-item"><a class="nav-link" href="homeemployee">Home</a>
					</li>
					
					<li class="nav-item"><a class="nav-link" href="customerEnquiryPage">Costomer's Enquiry</a>
					</li>
					
					<li class="nav-item"><a class="nav-link" href="customerFollowUpPage">Follow ups</a>
					</li>
					
					<li class="nav-item"><a class="nav-link" href="saleCourse">Sale Course</a>
					</li>

				</ul>
			</div>
		</div>
	</nav>
	
</body>
</html>