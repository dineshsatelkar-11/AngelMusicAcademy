<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Event Applications | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>


</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	<section>
		
		<!-- Admin Left sidebar and header -->
		<%@include file="../comman_files/adminHeaderFile.jsp"%>
		
			<div id="page-wrapper">
				<div class="inner-content  text-center">
					<div class="container">
					<div class="col-md-12">
			            <table id="example" class="table table-hover table-inverse table-bordered table-responsive">
					        <thead>
					            <tr>
					                <th>Name</th>
					                <th>Contact No</th>
					                <th>Email</th>
					                <th>Age Category</th>
					                <th>Applied For Event</th>
					                <th>Applied On</th>
					                					                
					            </tr>
					        </thead>
					        <tbody>
								<c:forEach items="${applicantList}" var="al">
			                        <tr>
			                            <th><c:out value="${al.applicantName}"/></th>
			                            <th><c:out value="${al.applicantMobileNo}"/></th> 
			                            <th><c:out value="${al.applicantEmail}"/></th>
			                            <th><c:out value="${al.applicantAgeCategory}"/></th>
			                            <th><c:out value="${al.event.eventName}"/></th>
			                            <th><c:out value="${al.appliedOn}"/></th>            
			                        </tr>
			                    </c:forEach>
					            
					        </tbody>
					    </table>
	        		</div>
	        		</div> <!-- ./container -->
				</div>
			</div>
		
			<div class="clearfix"></div>
			<!--body wrapper end-->
</div>
			<div class="clearfix"></div>
			<!--body wrapper end-->
	</div>
			<div class="clearfix"></div>
			<!--body wrapper end-->
			<!-- /w3l-agile -->
		</div>
		<!-- All required js files -->
<%@include file="../comman_files/scriptFile.jsp"%>
		<!--body wrapper end-->
		
	</section>
	<script>
	$(document).ready(function() {
	    $('#example').DataTable();
	} );
	</script>
</body>
</html>