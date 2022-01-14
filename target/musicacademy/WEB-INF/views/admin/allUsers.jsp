<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>All Users | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>


</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	<section>
		
		<!-- Admin Left sidebar and header -->
		<jsp:include page="${headerFile}"></jsp:include>
		
			<div id="page-wrapper">
<!-- 				<div class="inner-content"> -->
<!-- 					<div class="container"> -->
					<div class="panel panel-default">
                        <div class="panel-heading text-center"><strong>Active Students</strong></div>
                        <div class="panel-body">
			            <table id="example" class="table table-striped table-bordered table-responsive">
					        <thead>
					            <tr>
					                <th class="text-center">Jr No</th>
					                <th class="text-center">Name</th>
					                <th class="text-center">Contact No</th>
					                <th class="text-center">Email</th>
					                <th class="text-center" width="28px">Age</th>
					                <th class="text-center">Branch</th>
					                <th class="text-center">Registered On</th>
					                <th class="text-center">Details</th>				                
					            </tr>
					        </thead>
					        <tbody>
								<c:forEach items="${userList}" var="u">
			                        <tr>
			                        	
			                            <th class="text-center"><c:out value="${u.jrno}"/></th>
			                            <th class="text-center"><c:out value="${u.userName}"/></th>
			                            <th class="text-center"><c:out value="${u.userMobileNo}"/></th> 
			                            <th class="text-center"><c:out value="${u.userEmail}"/></th>
			                            <th class="text-center"><c:out value="${u.userAge}"/></th>
			                            <th class="text-center"><c:out value="${u.userBranch.branchName}"/></th>
			                            <th class="text-center"><fmt:formatDate type="date" pattern="dd-MMM-yyyy"  value="${u.userRegisteredDate}" /></th>  
			                            <th class="text-center"><a href="#" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-plus"></span>Details</a></th>                       
			                        </tr>
			                    </c:forEach>
					            
					        </tbody>
					    </table>
					    </div>
					    </div>
	        		
	        		</div> <!-- ./container -->
<!-- 				</DIV> -->
<!-- 			</DIV> -->
		
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