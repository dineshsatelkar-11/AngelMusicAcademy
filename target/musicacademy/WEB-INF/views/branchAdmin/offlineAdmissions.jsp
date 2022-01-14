<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Offline Admission Form | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	<section>

<%@include file="../comman_files/branchAdminHeaderFiles.jsp"%>
			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container text-center">
			            <form:form id="offlineAdmissionForm" cssClass="form-horizontal text-center" modelAttribute="user" method="post" action="addUserOffline">
    
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="userName" >Name</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:hidden path="userId" value="${userObject.userId}"/>
		                            <form:input cssClass="form-control" path="userName" value="${userObject.userName}"/>
		                        </div>
		                    </div>
		    				<div class="form-group">
		                        <form:label path="userMobileNo" cssClass="control-label col-xs-3">Contact Number</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="userMobileNo" value="${userObject.userMobileNo}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="userEmail" cssClass="control-label col-xs-3">Email</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="userEmail" value="${userObject.userEmail}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="userDOB" cssClass="control-label col-xs-3">Date Of Birth</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" id="datetimepicker1" path="userDOB" value="${userObject.userDOB}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="userAge" cssClass="control-label col-xs-3">Age</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" type="number" id="userAge" path="userAge" value="${userObject.userAge}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="userAddress" cssClass="control-label col-xs-3">Address</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="userAddress" value="${userObject.userAddress}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="userSubject" cssClass="control-label col-xs-3">Subjects</form:label>
		                        <div class="col-xs-6">
		                            <form:select multiple="true" cssClass="form-control" path="userSubject" value="${userObject.userSubject}">
		                            		<c:forEach var="subject" items="${subjects}">
												<form:option value="${subject.subjectName}">${subject.subjectName}</form:option>
											</c:forEach>
		                            	   	
                       				</form:select>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="userBranch.branchId" cssClass="control-label col-xs-3">Branch</form:label>
		                        <div class="col-xs-6">
		                            <form:select cssClass="form-control" path="userBranch.branchId" value="${userObject.userBranch.branchId}">
		                            	 <c:forEach var="branch" items="${branchs}">
											<form:option value="${branch.branchId}">${branch.branchName}</form:option>
										</c:forEach>
                       				</form:select>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="userAttendingDays" cssClass="control-label col-xs-3">Attending Day</form:label>
		                        <div class="col-xs-6">
		                           <form:select multiple="true" cssClass="form-control" path="userAttendingDays" value="${userObject.userAttendingDays}">
		                            	<form:options items="${days}" />
                       				</form:select>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="userAttendingTime" cssClass="control-label col-xs-3">AttendingTime</form:label>
		                        <div class="col-xs-6">
		                            <form:select cssClass="form-control" path="userAttendingTime" value="${userObject.userAttendingTime}">
		                            	<c:forEach var="t" items="${time}">
											<form:option value="${t.batchTiming}">${t.batchTiming}</form:option>
										</c:forEach>
                       				</form:select>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <form:label path="userPassword" cssClass="control-label col-xs-3">Password</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" type="password" path="userPassword" value="${userObject.userPassword}"/>
		                        </div>
		                    </div>
		                            
		                    <div class="form-group"><br/><br/>
		                        <div class="row">
		                            <div class="col-xs-3 col-xs-offset-3">
		                            	<input type="submit" id="saveUser" class="btn btn-success btn-block" value="Save"/>
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
		<!--body wrapper end-->
		
	</section>
	
<script type="text/javascript">
	$(document).ready(function() {
	    $('#datetimepicker1').datetimepicker({
	    	 format: 'DD/MM/YYYY',
	    	 viewMode: "years" 
	     });
	    $("#datetimepicker1").on("dp.change", function (e) {
	       var year = new Date(e.date).getFullYear();
	       var month = new Date(e.date).getMonth()+1;
	       var currentYear = new Date().getFullYear();
	       var currentMonth = new Date().getMonth()+1;
	       var age = currentYear-year;
	       if((currentMonth-month) < 0)
	    	   age--;
	       $('#userAge').val(age);
	   });
	});
	
	</script>

</body>
</html>