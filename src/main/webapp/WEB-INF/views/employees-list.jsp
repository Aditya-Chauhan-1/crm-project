<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap 5 links starts -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap 5 links ends -->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<link rel="stylesheet" type="text/css" href="css/style.css" />

<script src="https://code.jquery.com/jquery-4.0.0.min.js"></script>

<script type="text/javascript">
	function confirmEmpDelete(empEmail){
	//	alert("hi : "+empEmail);
	$('#deleteEmpConfirmationModal').modal('show');
	$('#deleteButton').attr('href','/deleteEmployee?empEmail='+empEmail);
	}
	
	function editEmployee(empEmail){
		window.location.href="editEmployee?empEmail="+encodeURIComponent(empEmail);
	}
</script>

</head>
<body>

	<jsp:include page="header-admin.jsp"/>
	
	<c:if test="${not empty model_success}">
				${model_success}
			</c:if>
			<c:if test="${not empty model_error}">
				${model_error}
			</c:if>

	<div class="container mt-3">
		<h2>Employee`s List</h2>
		<p>Blow Table Displays Only Employee`s List</p>
		<table class="table table-light table-borderd table-striped">
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Phone No.</th>
					<th style="text-align:center;">Update</th>
					<th style="text-align:center;">Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="employee" items="${model_emplist}">
					<tr>
						<td>${employee.getName()}</td>
						<td>${employee.getEmail()}</td>
						<td>${employee.getPhoneno()}</td>
						<td style="text-align:center;"> 
							<button class="btn btn-secondary" onclick="editEmployee('${employee.getEmail()}')"><i class="bi bi-pencil-fill"></i></button>
						</td>
						<td style="text-align:center;">
							<button class="btn btn-danger" onclick="confirmEmpDelete('${employee.getEmail()}')"><i class="bi bi-trash3-fill"></i></button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
			<c:if test="${model_current_page>1}">
				<a href="/b?page=${model_current_page-1}">Previous</a>
			</c:if>
			
			<c:forEach begin="1" end="${model_total_pages}" var="pageNumber">
				<a href="/b?page=${pageNumber}">${pageNumber}</a>
			</c:forEach>
			
			<c:if test="${model_current_page<model_total_pages}">
				<a href="/b?page=${model_current_page+1}">Next</a>
			</c:if>
	</div>

	<!-- The Modal -->
	<div class="modal" id="deleteEmpConfirmationModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Delete Employee</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">are you sure you want to delete this employee ?</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-bs-dismiss="modal">No</button>
					<a type="button" class="btn btn-danger" id = "deleteButton" >Yes</a>
				</div>

			</div>
		</div>
	</div>

</body>
</html>