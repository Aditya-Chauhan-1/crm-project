<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add-Products</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap 5 links starts -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap 5 links ends -->

<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>

	<jsp:include page="header-admin.jsp" />


	<div class="container-fluid">
		<div class="container">
			
			<c:if test="${not empty model_succes}">
				${model_succes}
			</c:if>
			<c:if test="${not empty model_errors}">
				${model_errors}
			</c:if>
			
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6 bg-light login_div_design">

					<h2>Add Course Details</h2>
					<form:form action="addCourseForm" method="post" enctype="multipart/form-data" modelAttribute="productAttr">
					
						<div class="mb-3">
							<label class="form-label">Course Name</label>
							<form:input path="coursename" cssClass="form-control" />
 							<form:errors path="coursename" cssClass="error_message_design" />
		 				</div>
						<div class="mb-3">
							<label class="form-label">Course Syllabus</label> 
							<form:textarea path="syllabus" cssClass="form-control" />
    					    <form:errors path="syllabus" cssClass="error_message_design" /> 
						</div>
						<div class="mb-3">
							<label class="form-label">Course Qriginal Price</label> 
							<form:input path="originalprice" cssClass="form-control" />
 						    <form:errors path="originalprice" cssClass="error_message_design" /> 
 						</div>
 						<div class="mb-3">
							<label class="form-label">Course Discount Price</label> 
							<form:input path="discountedprice" cssClass="form-control" />
 							<form:errors path="discountedprice" cssClass="error_message_design" /> 
 						</div>
 						<div class="mb-3">
							<label class="form-label">Course Validity</label> 
							<form:input path="coursevalidity" cssClass="form-control" />
 							<form:errors path="coursevalidity" cssClass="error_message_design" /> 
 						</div>
						<div class="mb-3">
							<label class="form-label">Course Image</label> 
							<form:input type="file" path="courseimage" cssClass="form-control" />
 							<form:errors path="courseimage" cssClass="error_message_design" />
 						</div>
 						<div class="mb-3">
							<label class="form-label">Trainer`s Name</label> 
							<form:input path="trainersname" cssClass="form-control" />
 							<form:errors path="trainersname" cssClass="error_message_design" />
 						</div>
 						<div class="mb-3">
							<label class="form-label">Trainer`s Details</label> 
							<form:textarea path="trainersdetails" cssClass="form-control" />
 							<form:errors path="trainersdetails" cssClass="error_message_design" />
 						</div>
 						<div class="mb-3">
							<label class="form-label">Trainer`s Image</label> 
							<form:input type="file" path="trainersimage" cssClass="form-control" />
 						    <form:errors path="trainersimage" cssClass="error_message_design" />
 						</div>
 						<div class="mb-3">
							<label class="form-label">Other Details</label> 
							<form:textarea path="otherdetails" cssClass="form-control" />
 						<form:errors path="otherdetails" cssClass="error_message_design" /> 
 						</div>
 						
						<input type="submit" value="Add Course" class="btn btn-primary">
					</form:form>

				</div>
				<div class="col-3"></div>
			</div>
		</div>
	</div>

</body>
</html>