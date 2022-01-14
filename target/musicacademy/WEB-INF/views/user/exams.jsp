<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Exams | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
    <c:if test="${not empty examno}">
<script>
    window.open("ExamHallTicketPrint/${examno}");
</script>
</c:if>
	
	<section>
			

		<%@include file="../comman_files/userHeaderFile.jsp"%>

			<div id="page-wrapper">
							
				<div class="inner-content text-center">
					<div class="col-xs-6">
							<div class="panel panel-success ">
							  <div class="panel-heading text-bold"><h2>Exams</h2></div>
							  <div class="panel-body">
								<c:choose>
								      <c:when test="${not empty exams}">
								      <table class="table table-striped table-bordered table-responsive">
									        <thead>
									            <tr>
									                <th class="text-center">Exam Name</th>
									                <th class="text-center">Held No</th>
									                <th class="text-center">Apply</th>
									            </tr>
									        </thead>
									        <tbody>
									        <c:forEach var="exam" items="${exams}">
									        
									        	<tr>
						                            <th class="text-center"><c:out value="${exam.examName}"/></th>
						                            <th class="text-center"><c:out value="${exam.examDate}"/></th> 
						                            <th class="text-center"><a href="${contextPath}/getExamForm/${exam.examId}" class="btn btn-block btn-success">Apply</a></th>
						                        </tr>
												
											</c:forEach>
												
									        </tbody>
									    </table>
									  	
									  </c:when>
									  <c:otherwise>
									    <div class="text-center"><h3>No Exam Sheduled...!!!</h3></div>
									  </c:otherwise>
							      </c:choose>
							  		
							  </div>
							</div>
					</div>
					<div class="col-xs-6">
							<div class="panel panel-success ">
							  <div class="panel-heading text-bold"><h2>Exam Result</h2></div>
							  <div class="panel-body">
								<h3 class="text-red">No Result Found...!!!</h3>
							  </div>
							</div>
					</div>
				</div>
			<div class="clearfix"></div>
		<!--body wrapper end-->

			</div>
			  <!--body wrapper end-->
<%@include file="../comman_files/scriptFile.jsp"%>

		<!--body wrapper end-->
		
	</section>

</body>
</html>