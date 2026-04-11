<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course Details</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap 5 links starts -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap 5 links ends -->

<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	
	<jsp:include page="header-admin.jsp" />
	
	<div class="container mt-3 bg-light">
		<h2>Course Details</h2>
		<div class="row">
			<div class="col-4">
				<img src="${model_product.getCourseimage()}" alt="" height="120" />
			</div>
			<div class="col-8">
				<p><strong>Course Name : ${model_product.getCoursename()}</strong></p> 
				<p><strong>Course Price : <del style="color:red;" >${model_product.getOriginalprice()}</del> &nbsp;&nbsp; Rs. ${model_product.getDiscountedprice()} </strong></p> 
				<p><strong>Course Validity : ${model_product.getCoursevalidity()}</strong></p> 
				<p><strong>Course Syllabus : ${model_product.getSyllabus()}</strong></p> 
			</div>
		</div>
		<div class="row">
			<h6>Trainer`s Details</h6>
			<div class="col-4">
				<img src="${model_product.getTrainersimage()}" alt="" height="120" />
			</div>
			<div class="col-8">
				<p><strong>Trainer`s Name : ${model_product.getTrainersname()}</strong></p> 
				<p><strong>Trainer`s Details : ${model_product.getTrainersdetails()}</strong></p> 
			</div>
		</div>
		<div class="row">
			<h6>Important Instructions </h6>
			<div class="col-8">
				<p class="text-danger" ><strong>${model_product.getOtherdetails()}</strong></p> 
			</div>
		</div>
	</div>

</body>
</html>