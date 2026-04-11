<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Follow Ups</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap 5 links starts -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap 5 links ends -->

<link rel="stylesheet" type="text/css" href="css/style.css" />

<script src="https://code.jquery.com/jquery-4.0.0.min.js"></script>
<script type="text/javascript">

	function getSelectedDate(){
		var selectedDate = $("#datePickerId").val();
		
		$.ajax({
			type:"GET",
			url:"/customerFollowUpPage",
			data:{selectedDate : selectedDate},
			success:function(data){
				var tableBody = $(data).find("tbody");
				$("#followupTable tbody").html(tableBody.html());
				},
			error:function(xhr, status, error){
				alert("Error : "+error);
			}
		});
	}
	function custEnquiryHistory(phoneNumber){
		if(phoneNumber !== ''){
			window.location.href="custEnquiryHistoryPage?phno="+encodeURIComponent(phoneNumber);
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

					<h2>Customer Follow Ups</h2>
					<p>Below are details of customer`s to be called</p>
					<p> OR You Can Choose Any Date : <input type="date" class="form-control" id="datePickerId" onchange="getSelectedDate()" /></p>
					<br/>
					
					<table id="followupTable" class="table table-light table-borderd table-striped">
			<thead>
				<tr>
					<th>Sr. No</th>
					<th>Phone No.</th>
					<th style="text-align:center;">Get History</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="followup" items="${model_followups}" varStatus="loop">
					<tr>
						<td>${loop.index+1}</td>
						<td>${followup.phoneno}</td>
						<td style="text-align:center;"> 
							<button class="btn btn-success" onclick="custEnquiryHistory('${followup.phoneno}')"> Get History </button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
					

				</div>
				<div class="col-3"></div>
			</div>
		</div>
	</div>

</body>
</html>