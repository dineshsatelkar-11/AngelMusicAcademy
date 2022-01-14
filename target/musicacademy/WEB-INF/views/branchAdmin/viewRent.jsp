

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>View Rent Instruments | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">

	<section>
		
		<!-- Admin Left sidebar and header -->
	<%@include file="../comman_files/branchAdminHeaderFiles.jsp"%>
		
			<div id="page-wrapper">
<!-- 				<div class="inner-content"> -->
<!-- 					<div class="container"> -->
					<div class="panel panel-default">
                        <div class="panel-heading text-center"><strong>Rented Instruments</strong></div>
                        <div class="panel-body">
					<div class="col-md-12">
			            <table id="example" class="table table-striped table-bordered table-responsive" style="overflow:scroll; display:block;">
					        <thead>
					            <tr>
					                <th class="text-center">Customer Name</th>
					                <th class="text-center">Customer Contact No.</th>
					                <th class="text-center">Customer Alternate No.</th>
					                <th class="text-center">Customer Address</th>
					                <th class="text-center">Customer ID Proof</th>
					                <th class="text-center">Instrument Name</th>
					           		<th class="text-center">Rented From Date</th>
					                <th class="text-center">Rented To Date</th>
					                <th class="text-center">No of Days</th>
					                <th class="text-center">Amount</th>
					                <th class="text-center">Quantity</th>
					                <th class="text-center">Discount</th>
					                <th class="text-center">Total Amount</th>
					                <th class="text-center">Advanced Paid</th>
					                <th class="text-center">Balance Amount</th>
					            </tr>
					        </thead>
					        <tbody>
								<c:forEach items="${rentList}" var="r">
			                        <tr>
			                            <th class="text-center"><c:out value="${r.customerName}"/></th>
			                            <th class="text-center"><c:out value="${r.customerContactNo}"/></th> 
			                            <th class="text-center"><c:out value="${r.customerAlternateNo}"/></th>
			                            <th class="text-center"><c:out value="${r.customerAddress}"/></th>
			                            <th class="text-center"><c:out value="${r.customerIdProof}"/></th>
			                            <th class="text-center"><c:out value="${r.instrumentName}"/></th>
			                            <th class="text-center"><c:out value="${r.fromDate}"/></th>
			                            <th class="text-center"><c:out value="${r.toDate}"/></th>
			                            <th class="text-center"><c:out value="${r.noOfDays}"/></th>
			                            <th class="text-center"><c:out value="${r.amount}"/></th>
			                            <th class="text-center"><c:out value="${r.quantity}"/></th>
			                            <th class="text-center"><c:out value="${r.discount}"/></th>
			                            <th class="text-center"><c:out value="${r.totalAmount}"/></th>
			                            <th class="text-center"><c:out value="${r.advancedPaid}"/></th>
			                            <th class="text-center"><c:out value="${r.balanceAmount}"/></th>
			                           
			                        </tr>
			                    </c:forEach>
					            
					        </tbody>
					    </table>
	        		</div>
	        		</div> 
	        		</div>
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