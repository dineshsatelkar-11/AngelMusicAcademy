<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admission Approval Form | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	<section>
				
		<!-- Admin Left sidebar and header -->
		<jsp:include page="${headerFile}"></jsp:include>

			<div id="page-wrapper">
			<div class="text-center"><h1><label>Admission Approval Form</label></h1></div><br>
				<div class="inner-content">
					<div class="container">
					
			            <form:form id="userRegisterForm" cssClass="form-horizontal col-xs-12" modelAttribute="user" method="post" action="../confirmAdmission">
			            <form:hidden path="userId" value="${user.userId}"/>
			            <form:hidden path="jrno" value="${user.jrno}"/>
    						<hr>
    						<div class="row">
    						<div class="col-xs-4 col-xs-offset-2">
		                    <div class="form-group">
		                        <label>Student Name &nbsp;:&nbsp;&nbsp;${user.userName}</label>
		                    </div>
		    				<div class="form-group">
		    					<label>Contact Number &nbsp;:&nbsp;&nbsp;${user.userMobileNo}</label>
		                    </div>
		                    <div class="form-group">
		                    	<label>Email &nbsp;:&nbsp;&nbsp;${user.userEmail}</label>
		                    </div>
		                    <div class="form-group">
		                    	<label>Date Of Birth &nbsp;:&nbsp;&nbsp;${user.userDOB}</label>
		                    </div>
		                    <div class="form-group">
		                    	<label>Age &nbsp;:&nbsp;&nbsp;${user.userAge}</label>
		                    </div>
		                    </div>
		                    <div class="col-xs-6">
		                    <div class="form-group">
		                    	<label>Address &nbsp;:&nbsp;&nbsp;${user.userAddress}</label>
		                    </div>
		                    <div class="form-group">
		                    	<label>Subjects &nbsp;:&nbsp;&nbsp;${user.userSubject}</label>
		                    </div>
		                    <div class="form-group">
		                    	<label>Branch &nbsp;:&nbsp;&nbsp;${user.userBranch.branchName}</label>		                    </div>
		                    <div class="form-group">
		                    	<label>Attending Days &nbsp;:&nbsp;&nbsp;${user.userAttendingDays}</label>
		                    </div>
		                    <div class="form-group">
		                    	<label>Attending Time &nbsp;:&nbsp;&nbsp;${user.userAttendingTime}</label>
		                    </div>
		                   </div>
		                   </div>
		                   <br/>
		                   <hr>
		                   <br/>
		                   
		                   <div class="row">
		                    <div class="col-xs-6">
		                       <div class="form-group">
			                        <form:label path="totalFees" class="control-label col-xs-6">Total Fees</form:label>
			                        <div class="col-xs-6">
			                            <form:input path="totalFees" class="form-control" id="totalFees"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
			                        </div>
			                   </div>
			                   <div class="form-group">
			                        <form:label path="firstInstallment" class="control-label col-xs-6">Paying Amount</form:label>
			                        <div class="col-xs-6">
			                            <form:input path="firstInstallment" class="form-control" id="payingAmount"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
			                        </div>
			                   </div>
			                   <div class="form-group second hideAll">
			                        <label for="secondInstallmentDate" class="control-label col-xs-6">Second Installment On</label>
			                        <div class="col-xs-6">
			                            <input type="text" name="d1" class="form-control" id="secondInstallmentDate"/>
			                        </div>
			                   </div>
			                   <div class="form-group second hideAll">
			                        <form:label path="secondInstallment" class="control-label col-xs-6">Second Installment Amount</form:label>
			                        <div class="col-xs-6">
			                            <form:input path="secondInstallment" class="form-control" id="secondInstallment" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
			                        </div>
			                   </div>
			                   <div class="form-group third hideAll">
			                        <label for="lastInstallmentDate" class="control-label col-xs-6">Last Installment On</label>
			                        <div class="col-xs-6">
			                            <input type="text" name="d2" class="form-control" id="lastInstallmentDate"/>
			                        </div>
			                   </div>
			                   <div class="form-group third hideAll">
			                        <form:label path="lastInstallment" class="control-label col-xs-6">Last Installment Amount</form:label>
			                        <div class="col-xs-6">
			                            <form:input path="lastInstallment" class="form-control" id="thirdInstallment" readonly="true"/>
			                        </div>
			                   </div>
			                  
		                     </div>
		                     <div class="col-xs-6">
		                     	<div class="form-group">
			                        <form:label path="balance" class="control-label col-xs-3">Balance</form:label>
			                        <div class="col-xs-6">
			                            <form:input path="balance" class="form-control" id="balance" readonly="true"/>
			                        </div>
			                   </div>
		                     </div>
							</div>
							<br/>
		                   <hr>
		                   <br/>
		                   <div class="row">
		                        <div class="form-group"><br/><br/>
		                            <div class="col-xs-3 col-xs-offset-3">
		                            	<input type="submit" class="btn btn-success btn-block" value="Confirm Admission"/>
		                            </div>
		                            <div class="col-xs-3">
		                                <input type="button" class="btn btn-primary btn-block" onClick="window.location.reload()" value="Clear"/>
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
		var today = new Date();
		var currMonth = today.getMonth()+1;
		var secondInstallmentDate = new Date(today.setMonth(currMonth));
		var lastInstallmentDate = new Date(today.setMonth(currMonth+1));
	   
	    

		$(".hideAll").hide();
		
	$('#payingAmount').on('keyup change', function () {
		var tf = $('#totalFees').val();
	    var fi = $('#payingAmount').val();
	    var balance = tf-fi;
	    if(balance<=0 || balance>=tf)
	    	{
	    		$(".second").hide();
	    		$('#balance').val(tf);
	    		$('#secondInstallmentDate').val("");
	    		$('#secondInstallment').val("");
	    		if(balance==0)
	    			$('#balance').val(balance);
	    	}
	    else
	    	{
	    	    $('#balance').val(balance);
	    		$(".second").show();
	    		$('#secondInstallment').val(balance);
	    		$('#secondInstallmentDate').datetimepicker({
	    	    	 format: 'DD/MM/YYYY',
	    	    	 defaultDate: secondInstallmentDate
	    	    });
	    		
	    	}
		});
	$('#secondInstallment').on('keyup change', function () {
		var tf = $('#totalFees').val();
	    var fi = $('#payingAmount').val();
	    var si = $('#secondInstallment').val();
	    var fi_si = parseInt(fi)+parseInt(si);
	    var ti = tf-fi_si;
	    if(ti<=0)
	    	{
	    		$(".third").hide();
	    		$('#lastInstallmentDate').val("");
	    		$('#lastInstallment').val("");
	    	}
	    else
	    	{
	    	    $(".third").show();
	    		$('#thirdInstallment').val(ti);
	    		$('#lastInstallmentDate').datetimepicker({
	   	    	 format: 'DD/MM/YYYY',
	   	    	 defaultDate: lastInstallmentDate
	   	     });
	    	}
		});
	});
	</script>
</body>
</html>