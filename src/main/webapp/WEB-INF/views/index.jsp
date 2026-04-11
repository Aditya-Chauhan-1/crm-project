<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
  

<!DOCTYPE html>
<html>
	<head>
		<title>Index Page</title>
		<meta charset="UTF-8">
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- bootstrap 5 links starts -->
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<!-- bootstrap 5 links ends -->
		
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		
	</head>
	<body>
		
		<jsp:include page="header-crm.jsp"/>
		
		<h3 style="color:red" > <c:out value="${'Smart Programming'}"></c:out> </h3>
		
		<div class="container-fluid">
			<div class="row main_page_banner">
				<div class="col-8" style="padding:50px">
					<span class="main_page_title">CRM Application a true journey-enabled customer engagement suite. Reimagine legacy systems and rev up automated workflows with the AI-powered platform for enterprise-grade transformation.</span>
				</div>
				<div class="col-4" style="padding: 50px;">
					<img src="images/CRM.png" height = "200" />
				</div>
			</div>
		</div>
		
		<div class="container-fluid">
			<div class="container">
				<div class="row" style="padding-top:40px;">
					<div class="col-6">
						<span>US Bank, who has $678 billion in assets and over 70,000 employees across 2,100+ branches, faced a critical challenge in their contact center operations. As digital self-service channels handled routine inquiries, their contact centers were left dealing with increasingly complex and emotionally charged customer interactions.The bank needed to enhance employee experiences for their customer service representatives (CSRs), who were handling difficult situations like fraud cases, identity theft, and complex financial disputes. New CSRs with just two weeks of training were expected to deliver the same quality of service as 10-year veterans, while managing up to 70 different case types and maintaining strict regulatory compliance in a highly regulated banking environment.</span>
					</div>
					<div class="col-6">
						<span>US Bank used Pega Voice AI solution to transform their approach by providing intelligent, real-time assistance that augments rather than replaces human capabilities. The solution combines conversational AI with workflow automation to guide CSRs through complex interactions while maintaining the human touch that's essential in financial services. Key capabilities deployed include case suggestions that automatically direct CSRs to appropriate workflows, auto form fill that captures customer information in real time, knowledge suggestions that surface relevant articles and policies, and interaction summaries that eliminate manual note taking. The solution also provides conversational analytics with coaching insights and compliance monitoring.</span>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>