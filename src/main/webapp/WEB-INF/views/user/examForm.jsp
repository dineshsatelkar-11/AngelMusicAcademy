<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Exam Application Form | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	<section>
			
		<!-- Admin Left sidebar and header -->
		<%@include file="../comman_files/nullSessionHeaderFile.jsp"%>

			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container">
						<form:form id="examForm" cssClass="form-horizontal text-center" modelAttribute="examApplication" method="post" action="../saveExamApplicationForm">
					      <input type="hidden" name="userID" value="${user.userId}"/>
						  <input type="hidden" name="examID" value="${exam.examId}"/>
    						<div class="form-group">
		                        <div class="control-label col-xs-3"> <label for="userName" >Name</label> </div>
		                        <div class="col-xs-6">
		                            <input class="form-control" name="userName" value="${user.userName}" readonly/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <label for="examination" >Examination</label> </div>
		                        <div class="col-xs-6">
		                            <input class="form-control" name="examination" value="${exam.examName}" readonly/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <label for="examDate" >Exam Date</label> </div>
		                        <div class="col-xs-6">
		                            <input class="form-control" name="examDate" value="${exam.examDate}" readonly/>
		                        </div>
		                    </div>
		    				<div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="teacherName" >Teacher Name</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="teacherName" value="${examApplication.teacherName}"/>
		                        </div>
		                    </div>
		                    
				                            
		                    <div class="form-group"><br/><br/>
		                        <div class="row">
		                            <div class="col-xs-3 col-xs-offset-3">
		                            	<input type="submit" class="btn btn-success btn-block" value="Apply"/>
		                            </div>
		                            <div class="col-xs-3">
		                                <input type="reset" class="btn btn-primary btn-block" value="Clear"/>
		                            </div>
		                            <div class="col-xs-4">
		                            </div>
		                        </div>
		                    </div>
    
                </form:form>
        		</div> <!-- ./container -->
			</div>
		<!--body wrapper start-->
	</div>
			<div class="clearfix"></div>
			<!--body wrapper end-->
			<!-- /w3l-agile -->
		</div>
		<!-- All required js files -->
<%@include file="../comman_files/scriptFile.jsp"%>

</section>
<script type="text/javascript">
	$(document).ready(function() {
	    $('#datetimepicker1').datetimepicker({
	    	 format: 'DD/MM/YYYY',
	    	 viewMode: "years"
	     });
	});
	</script>
</body>
</html>