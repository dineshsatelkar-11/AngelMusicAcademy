

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>View Repaired Instruments | A M A</title>


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
                        <div class="panel-heading text-center"><strong>Repaired Instruments</strong></div>
                        <div class="panel-body">
					<div class="col-md-12">
			            <table id="example" class="table table-striped table-bordered table-responsive" style="overflow:scroll; display:block;">
					        <thead>
					            <tr>
					                <th class="text-center">Counsellors Name</th>
					                <th class="text-center">Customer Name</th>
					                <th class="text-center">Customer Address</th>
					                <th class="text-center">Customer Mobile No.</th>
					                <th class="text-center">Alternate Contact No.</th>
					                <th class="text-center">Instrument Name</th>
					                <th class="text-center">Defect/Problem</th>
					                <th class="text-center">Return Date</th>
					                <th class="text-center">Repairing Cost</th>
					                <th class="text-center">Discount</th>
					                <th class="text-center">Advance Payment</th>
					                <th class="text-center">Balance Amount</th>
					            </tr>
					        </thead>
					        <tbody>
								<c:forEach items="${repairList}" var="r">
			                        <tr>
			                            <th class="text-center"><c:out value="${r.counsellorName}"/></th>
			                            <th class="text-center"><c:out value="${r.customerFirstName}"/>&nbsp;&nbsp;&nbsp;<c:out value="${r.customerMiddleName}"/>&nbsp;&nbsp;&nbsp;<c:out value="${r.customerLastName}"/></th> 
			                           
			                            <th class="text-center"><c:out value="${r.customerAddress}"/></th>
			                            <th class="text-center"><c:out value="${r.customerMobileNo}"/></th>
			                            <th class="text-center"><c:out value="${r.customerAlternateNo}"/></th>
			                            <th class="text-center"><c:out value="${r.instrumentName.instrumentName}"/></th>
			                            <th class="text-center"><c:out value="${r.problem}"/></th>
			                            <th class="text-center"><c:out value="${r.returnDate}"/></th>
			                            <th class="text-center"><c:out value="${r.repairingCost}"/></th>
			                            <th class="text-center"><c:out value="${r.discount}"/></th>
			                            <th class="text-center"><c:out value="${r.advancePaid}"/></th>
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