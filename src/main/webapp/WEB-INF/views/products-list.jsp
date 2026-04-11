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
	
	function courseDetails(courseName){
		window.location.href="courseDetails?courseName="+encodeURIComponent(courseName);
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
		<h2>Product`s List</h2>
		<p>Blow Table Displays Only 5 Product`s List</p>
		<table class="table table-light table-borderd table-striped">
			<thead>
				<tr>
					<th>Course Name</th>
					<th>Course Validity</th>
					<th>Course Price</th>
					<th>Course Image</th>
					<th>Trainer`s Name</th>
					<th style="text-align:center;">Full Details</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${model_products_list}">
					<tr>
						<td>${product.getCoursename()}</td>
						<td>${product.getCoursevalidity()}</td>
						<td><del style="color:red;" >${product.getOriginalprice()}</del> <b> &nbsp;&nbsp; Rs. ${product.getDiscountedprice()} </b></td>
						<td> <img src="${product.getCourseimage()}" alt="" height="120" /> </td>
						<td>${product.getTrainersname()}</td>
						<td style="text-align:center;"> 
							<button class="btn btn-secondary" onclick="courseDetails('${product.getCoursename()}')"><i class="bi bi-arrows-move"></i></button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
			<%-- <c:if test="${model_current_page>1}">
				<a href="/b?page=${model_current_page-1}">Previous</a>
			</c:if>
			
			<c:forEach begin="1" end="${model_total_pages}" var="pageNumber">
				<a href="/b?page=${pageNumber}">${pageNumber}</a>
			</c:forEach>
			
			<c:if test="${model_current_page<model_total_pages}">
				<a href="/b?page=${model_current_page+1}">Next</a>
			</c:if> --%>
	</div>

</body>
</html>