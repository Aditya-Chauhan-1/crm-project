<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Enquiry History</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap 5 links starts -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap 5 links ends -->

<link rel="stylesheet" type="text/css" href="css/style.css" />

<script src="https://code.jquery.com/jquery-4.0.0.min.js"></script>
<script type="text/javascript"> 
	
function handleOption(){
	var statusOption = document.getElementById('statusInput').value;
	if(statusOption === "1"){
		$('#followUpInput').prop('readonly',false);
	}
	else{
		$('#followUpInput').prop('readonly',true);
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
				<div class="col-6 bg-light login_div_design">

					<h2>Customer History</h2>
					<p>Below is the history of customer : ${model_custenq.get(0).getName()} (${model_custenq.get(0).getPhoneno()})</p>
					<br/>
					
					<table class="table table-light table-borderd table-striped">
			<thead>
				<tr>
					<th>Discussion</th>
					<th>Interested Course</th>
					<th>Enquiry Date / Time</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="custenq" items="${model_custenq}">
					<tr>
						<td>${custenq.getDiscussion()}</td>
						<td>${custenq.getInterestedcourse()}</td>
						<td>${custenq.getEnquirydate()} (${custenq.getEnquirytime()})</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
					

				</div>
				<div class="col-6 bg-light login_div_design">
					<h3>Customer Enquiry Form</h3>
					<form:form action="custEnquiryForm" method="post" modelAttribute="modelCustEnquiryAttr">
						
						<form:hidden path="phoneno" value="${model_custenq.get(0).getPhoneno()}"/>
						<form:hidden path="custEnquiry.name" value="${model_custenq.get(0).getName()}"/>
						
					<div class="mb-3">
							<label class="form-label">Interested Course</label> 
							<form:select path="custEnquiry.interestedcourse" id="intrestedCourseInput" cssClass="form-select">
								<form:option value="">Select Course</form:option>
								<form:options items="${model_coursename_list}" />
							</form:select>
 							<form:errors path="custEnquiry.interestedcourse" cssClass="error_message_design" />
 						</div>
						<div class="mb-3">
							<label class="form-label">Discussion</label> 
							<form:textarea path="custEnquiry.discussion" id="discussionInput" cssClass="form-control" />
 							<form:errors path="custEnquiry.discussion" cssClass="error_message_design" />
 						</div>
 						<div class="mb-3">
							<label class="form-label">Enquiry Type</label>
							<form:select path="custEnquiry.enquirytype" id="enquiryInput" cssClass="form-select">
								<form:option value="">Select Enquiry Type</form:option>
								<form:option value="Call">Call</form:option>
								<form:option value="Mail">Mail</form:option>
								<form:option value="Website">Website</form:option>
								<form:option value="Social Networking">Social Networking</form:option>
							</form:select>
 							<form:errors path="custEnquiry.enquirytype" cssClass="error_message_design" />
		 				</div>
						<div class="mb-3">
							<label class="form-label">Status</label> 
							<form:select path="custEnquiry.status" id="statusInput" onchange="handleOption()" cssClass="form-select">
									<form:option value="">Select Status</form:option>
									<form:option value="1">Open (1)</form:option>
									<form:option value="2">Interested - Closed (2)</form:option>
									<form:option value="3">Not - Interested - Closed (3)</form:option>
									<form:option value="4">Purchased - Closed (4)</form:option>
							</form:select>
    						<form:errors path="custEnquiry.status" cssClass="error_message_design" />
						</div>
						<div class="mb-3">
							<label class="form-label">Follow Up Date</label> 
							<form:input type="date" path="custFollowUp.followupdate" id="followUpInput" cssClass="form-control" />
 							<form:errors path="custFollowUp.followupdate" cssClass="error_message_design" />
 						</div>
						<div class="mb-3">
							<label class="form-label">Call To</label> 
							<form:select path="custEnquiry.callto" id="callTOInput" cssClass="form-select">
								<form:option value="">Call To</form:option>
								<form:option value="Customer to Company">Customer to Company</form:option>
								<form:option value="Company To Customer">Company To Customer</form:option>
							</form:select>
 							<form:errors path="custEnquiry.callto" cssClass="error_message_design" />
 						</div>
						<input type="submit" value="Add Enquiry" id="addEnquiryBtnId" class="btn btn-primary">
					</form:form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>