<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add Subject | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	<section>
			
		<!-- Admin Left sidebar and header -->
		<%@include file="../comman_files/adminHeaderFile.jsp"%>
		
		
			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container">
			            <form:form id="addCourseForm" cssClass="form-horizontal col-md-8" modelAttribute="course" method="post" action="saveCourse">
                                    
                                        <div class="form-group">
		                        <form:label path="subject.subjectId" cssClass="control-label col-xs-3">Subject</form:label>
		                        <div class="col-xs-6">
		                            <form:select cssClass="form-control" path="subject.subjectId" value="${course.subject.subjectId}">
		                            	 <c:forEach var="subject" items="${subjects}">
											<form:option value="${subject.subjectId}">${subject.subjectName}</form:option>
										</c:forEach>
                       				</form:select>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="courseName" >Course Name</form:label> </div>
		                        <div class="col-xs-6">
		                           
		                            <form:input cssClass="form-control" path="courseName" value="${course.courseName}"/>
		                        </div>
		                    </div>
		    				
		                    		                            
		                    <div class="form-group"><br/><br/>
		                        <div class="row">
		                            <div class="col-xs-3 col-xs-offset-3">
		                            	<input type="submit" id="saveUser" class="btn btn-success btn-block" value="Add"/>
		                            </div>
		                            <div class="col-xs-3">
		                                <input type="reset" class="btn btn-primary btn-block" value="Clear"/>
		                            </div>
		                            <div class="col-xs-4">
		                            </div>
		                        </div>
		                    </div>
    
                </form:form>
                <div class="col-md-4">
	                <div class="panel panel-success">
				      <div class="panel-heading text-center">Existing Subjects</div>
					    <div class="panel-body">
					      <c:choose>
						      <c:when test="${not empty subjects}">
							    <ul>
									<c:forEach var="subject" items="${subjects}">
										<li>${subject.subjectName}</li>
									</c:forEach>
								</ul>
							  </c:when>
							  <c:otherwise>
							    <div class="text-center"><h3>No Subject Added...!!!</h3></div>
							  </c:otherwise>
					      </c:choose>
				      	</div>
				    </div>
			    </div>
                
        		</div> <!-- ./container -->
			</div>
		<!--body wrapper start-->
</div>
			<div class="clearfix"></div>
			<!--body wrapper end-->
	</div>
			<div class="clearfix"></div>
			
		<!-- All required js files -->
<%@include file="../comman_files/scriptFile.jsp"%>
		<!--body wrapper end-->
		
	</section>
	<script>
		$(document).ready(function() {
		    $('#datepicker').datepicker({
			    inline: true,
		        showOtherMonths: true,
		        dateFormat: 'dd/mm/yy',
		        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		        yearRange: '1950:+0' ,
		        maxDate: new Date(), 
			    changeYear: true,
			    changeMonth: true,
			    
			    onSelect: function(value, ui) {
			        var currentYear = new Date().getFullYear();
			        var dob = new Date(value);
			        var dobYear = dob.getFullYear();
			        var age = currentYear - dobYear;
			        $('#userAge').val(age);
			    }

		    });
		    $("#datepicker").datepicker("setDate", new Date());
			});
				    
	</script>

</body>
</html>