<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admission Form | A M A</title>
<%@include file="../comman_files/csslinks.jsp"%> 
   <style>
   img {
        width: 180px !important;
	    height: 150px !important;
	    border: 2px solid grey;
	    border-radius: 8px;
	    padding: 1px;
	}
   .marg
   {
    margin-bottom: 18px;
   	border-bottom: 1px solid #eee;
   }
.height {
    min-height: 200px;
}

.icon {
    font-size: 47px;
    color: #5CB85C;
}

.iconbig {
    font-size: 77px;
    color: #5CB85C;
}

.table > tbody > tr > .emptyrow {
    border-top: none;
}

.table > thead > tr > .emptyrow {
    border-bottom: none;
}

.table > tbody > tr > .highrow {
    border-top: 3px solid;
}
</style>
</head>
<!-- <body> -->
<body onload="window.print();">
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="text-center">
                <strong>Angel Music &amp; Education Association&apos;s</strong>
                <h1><strong>Angel Music Academy</strong></h1>
                <div class="col-xs-12 marg">
	                <div class="col-xs-8 col-xs-offset-2">
		                <span><strong>Head Office</strong> : flat no 4,sr no. A/24,nakoda corner,near aalandi road police chwki, vishrantwadi, pune, Maharashtra 411015</span><br>
		                <span><strong>Mobile</strong> :020 30629338 / 9049976912 / 9762465737</span><br>
		                <span><strong>Email</strong> : dalvir94@yahoo.com</span><br><br>
	                </div>
                </div>
            </div>
             
            <div class="row">
                <div class="col-xs-12 pull-left">
                    <div class="panel panel-default height">
                        <div class="panel-heading"><strong>Admission Details</strong><div class="pull-right">${user.firstInstallmentDate}</div></div>
                        <div class="panel-body">
                        	<div class="col-xs-6">
	                            <strong>Jr No. :</strong> ${user.jrno}<br><br>
	                            <strong>Name :</strong> ${user.userName}<br><br>
	                            <strong>Address :</strong> ${user.userAddress}<br><br>
	                            <strong>Mobile No :</strong> ${user.userMobileNo}<br><br>
	                            <strong>Email :</strong> ${user.userEmail}<br><br>
	                            <strong>Date Of Birth :</strong> ${user.userDOB}<br><br>
	                            <strong>Age :</strong> ${user.userAge}<br><br>
	                            <strong>Subjects :</strong> ${user.userSubject}
	                           
                            </div>
                            <div class="col-xs-4">
                                <img src="../gallery/a2.jpg"/><br><br>
			                     <strong>Days :</strong> ${user.userAttendingDays}<br><br>
	                            <strong>Time :</strong> ${user.userAttendingTime}<br><br>
	                            <strong>Branch :</strong> ${user.userBranch.branchName}
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="panel panel-default height">
                        <div class="panel-heading"><strong>Fee Details</strong></div>
                        <div class="panel-body">
                            <div class="row">
	                            <div class="col-xs-4"><strong>Total Fees :</strong> ${user.totalFees} &nbsp;&#8377;</div>
	                            <div class="col-xs-4"><strong>Paid Amount :</strong> ${user.firstInstallment}&nbsp;&#8377;</div>
	                            <div class="col-xs-4"><strong>Due : ${user.balance}&nbsp;&#8377;</strong></div>
							</div><br>
							<div class="row">
	                            <div class="col-xs-6"><strong>Second Installment Date :</strong> ${user.secondInstallmentDate}</div>
	                            <div class="col-xs-6"><strong>Second Installment Amount :</strong> ${user.secondInstallment}&nbsp;&#8377;</div>
                            </div><br>
                            <div class="row">
	                            <div class="col-xs-6"><strong>Last Installment Date :</strong> ${user.lastInstallmentDate}</div>
	                            <div class="col-xs-6"><strong>Last Installment Amount :</strong> ${user.lastInstallment}&nbsp;&#8377;</div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-xs-12 text-center">
       	     <div class="col-xs-4"><strong>Student&apos;s &nbsp;Signature</strong></div>
       	     <div class="col-xs-4"><strong>Parent&apos;s &nbsp;Signature</strong></div>
       	     <div class="col-xs-4"><strong>Manager</strong></div>
        </div>
    </div>
</div>


</body>
</html>