<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Instrument Sell Invoice | A M A</title>
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
                        <div class="panel-heading"><strong>Instrument Sold Invoice</strong><div class="pull-right"></div></div>
                        <div class="panel-body">
                        		<div class="col-xs-6">
	                            <strong>Sell No. :</strong> ${sell.sellNo}<br><br>
	                            
	                            <strong>Customer Name :</strong> ${sell.customerFirstName}&nbsp;&nbsp;&nbsp;${sell.customerMiddleName}&nbsp;&nbsp;&nbsp;${sell.customerLastName}<br><br>
	                           
	                            <strong>Mobile No :</strong> ${sell.customerMobileNo}<br><br>
	                            <strong>Alternate No. :</strong> ${sell.customerAlternateNo}<br><br>
	                            <strong>Product Name :</strong> ${sell.productId.productName}<br><br>
	                            <strong>Brand/Company Name :</strong> ${sell.productId.brand}<br><br>
	                            <strong>Model No :</strong> ${sell.productId.modelNo}<br><br>
	                            <strong>Color :</strong> ${sell.productId.color}
	                           
                            </div>
                            <div class="col-xs-6">
                            <strong>Counsellor Name :</strong> ${sell.counsellorName}<br><br>
                             <strong>Address :</strong> ${sell.customerAddress}<br><br>
                             <strong>Selling Price :</strong> ${sell.sellPrice}<br><br>
                              <strong>Quantity :</strong> ${sell.quentity}<br><br>
                               <strong>Discount :</strong> ${sell.discount}<br><br>
                                <strong>Total Price :</strong> ${sell.totalPrice}<br><br>
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