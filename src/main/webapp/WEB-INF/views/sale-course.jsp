<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sale Course</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap 5 links starts -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap 5 links ends -->

<link rel="stylesheet" type="text/css" href="css/style.css" />

<script src="https://code.jquery.com/jquery-4.0.0.min.js"></script>
<script type="text/javascript">
	function getSelectedCourse(){
		var SelectedCourese = document.getElementById('intrestedCourseInput').value;
		
		if(SelectedCourese !== ""){
			var xhr = new XMLHttpRequest();
			xhr.open("GET","/getCoursePrices?SelectedCourese="+SelectedCourese,true);
			xhr.onreadystatechange = function() {
				if(xhr.readyState === 4 && xhr.status === 200){
					var response = JSON.parse(xhr.responseText);
					var product = response;
					var discontedprice = product.discountedprice;
					var orignalprice = product.originalprice;
					
					document.getElementById("originalpriceid").textContent = orignalprice;
					document.getElementById("discountedpriceid").textContent = discontedprice;
					
					$("#priceDivId").css("visibility","visible")
					
				}
			};
			xhr.send();
		}
		else{
			$("#priceDivId").css("visibility","hidden")
			
		}
	}
</script>

</head>
<body>

	<jsp:include page="header-employee.jsp" />


	<div class="container-fluid">
		<div class="container">
			
			<c:if test="${not empty model_success}">
				${model_success}
			</c:if>
			<c:if test="${not empty model_error}">
				${model_error}
			</c:if>
			
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6 bg-light login_div_design">

					<h2>Sale Course</h2>
					<form:form action="saleCourseForm" method="post" modelAttribute="modelSaleCourseAttr">
					
						<div class="mb-3">
							<label class="form-label">Customer Phone no</label>
							<form:input path="custphoneno" cssClass="form-control" />
 							<form:errors path="custphoneno" cssClass="error_message_design" />
		 				</div>
		 				<div class="mb-3">
							<label class="form-label">Interested Course</label> 
							<form:select path="interestedcourse" id="intrestedCourseInput" onchange="getSelectedCourse()" cssClass="form-select">
								<form:option value="">Select Course</form:option>
								<form:options items="${model_coursename_list}" />
							</form:select>
 							<form:errors path="interestedcourse" cssClass="error_message_design" />
 						</div>
 						<div class="mb-3" id="priceDivId" style="visibility : hidden;">
 							Price to Pay : <strong><del>Rs. <span id="originalpriceid" style="color:red"></span></del></strong> &nbsp;&nbsp;&nbsp;  Rs. <span id="discountedpriceid" class="text-primary"></span>
 						</div>
 						
						<input type="submit" value="Sell Course" class="btn btn-primary">
					</form:form>

				</div>
				<div class="col-3"></div>
			</div>
		</div>
	</div>

</body>
</html>