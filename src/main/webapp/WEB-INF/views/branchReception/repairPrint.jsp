<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Repair  Invoice | A M A</title>
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
                        <div class="panel-heading"><strong>Instrument Repair Invoice</strong><div class="pull-right"></div></div>
                        <div class="panel-body">
                        		<div class="col-xs-6">
	                            <strong>Repair No. :</strong> ${repair.repairNo}<br><br>
	                            <strong>Counsellor Name :</strong> ${repair.counsellorName}<br><br>
	                            <strong>Name :</strong> ${repair.customerFirstName}&nbsp;&nbsp;&nbsp;${repair.customerMiddleName}&nbsp;&nbsp;&nbsp;${repair.customerLastName}<br><br>
	                            <strong>Address :</strong> ${repair.customerAddress}<br><br>
	                            <strong>Mobile No :</strong> ${repair.customerMobileNo}<br><br>
	                            <strong>Alternate No. :</strong> ${repair.customerAlternateNo}<br><br>
	  	                    <strong>Instrument :</strong> ${repair.instrumentName.instrumentName}<br><br>
                                      
                            </div>
                            <div class="col-xs-6">
                            <strong>Defect/ Problem For Repair :</strong> ${repair.problem}<br><br>
                                        <strong>Return Date :</strong> ${repair.returnDate}<br><br>
	                            <strong>Repairing Cost :</strong> ${repair.repairingCost}<br><br>
                                      <strong>Discount :</strong> ${repair.discount}<br><br>
                                        <strong>Paid Amount :</strong> ${repair.advancePaid}<br><br>
                                          <strong>Balance Amount :</strong> ${repair.balanceAmount}<br>
	                           
	                           
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
       	     <div class="col-xs-4"><strong>Customer&apos;s &nbsp;Signature</strong></div>
       	    <div class="col-xs-4"><strong></strong></div>
       	     <div class="col-xs-4"><strong>Manager&apos;s &nbsp;Signature</strong></div>
        </div>
    </div>
</div>


</body>
</html>