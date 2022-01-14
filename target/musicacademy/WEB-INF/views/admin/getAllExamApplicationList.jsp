<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Exam Applications | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>


</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	<section>
		
		<!-- Admin Left sidebar and header -->
		<jsp:include page="${headerFile}"></jsp:include>
				
			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container">
					<div class="panel panel-success ">
							  <div class="panel-heading text-bold text-center"><h2>Exams</h2></div>
							  <div class="panel-body">
			            <table id="example" class="table table-hover table-inverse table-bordered table-responsive">
					        <thead>
					            <tr>
					                <th class="text-center">Student Name</th>
					                <th class="text-center">Exam</th>
					                <th class="text-center">Teacher NAme</th>                
					            </tr>
					        </thead>
					        <tbody>
								<c:forEach items="${examApplications}" var="ea">
			                        <tr>
			                            <th class="text-center"><c:out value="${ea.user.userName}"/></th>
			                            <th class="text-center"><c:out value="${ea.exam.examName}"/></th> 
			                            <th class="text-center"><c:out value="${ea.teacherName}"/></th>
			                        </tr>
			                    </c:forEach>
					            
					        </tbody>
					    </table>
					   </div>
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