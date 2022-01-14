

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>View Sold Instruments | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">

	<section>
		
		<!-- Admin Left sidebar and header -->
		<%@include file="../comman_files/branchReceptionHeader.jsp"%>
		
			<div id="page-wrapper">
<!-- 				<div class="inner-content"> -->
<!-- 					<div class="container"> -->
					<div class="panel panel-default">
                        <div class="panel-heading text-center"><strong>Sold Instruments</strong></div>
                        <div class="panel-body">
					<div class="col-md-12">
			            <table id="example" class="table table-striped table-bordered table-responsive" style="overflow:scroll; display:block;">
					        <thead>
					            <tr>
					                <th class="text-center">Sell Date</th>
					                <th class="text-center">Counsellor Name</th>
					                <th class="text-center">Customer Name</th>
					             	<th class="text-center">Customer Address</th>
					                <th class="text-center">Customer Mobile Number</th>
					           		<th class="text-center">Alternate Contact Number</th>
					           		<th class="text-center">Product Name</th>
					           		
					                <th class="text-center">Brand/Company Name</th>
					                <th class="text-center">Model Number</th>
					                 
					                <th class="text-center">Selling Price</th>
					                 <th class="text-center">Quantity</th>
					                 <th class="text-center">Discount</th>
					                 <th class="text-center">Total Price</th>
					                
					            </tr>
					        </thead>
					        <tbody>
								<c:forEach items="${sellList}" var="r">
			                        <tr>
			                            <th class="text-center"><c:out value="${r.sellDate}"/></th>
			                            <th class="text-center"><c:out value="${r.counsellorName}"/></th>
			                            <th class="text-center"><c:out value="${r.customerFirstName}"/>&nbsp;&nbsp;&nbsp;<c:out value="${r.customerMiddleName}"/>&nbsp;&nbsp;&nbsp;<c:out value="${r.customerLastName}"/></th> 
			                            <th class="text-center"><c:out value="${r.customerAddress}"/></th>
			                            <th class="text-center"><c:out value="${r.customerMobileNo}"/></th>
			                            <th class="text-center"><c:out value="${r.customerAlternateNo}"/></th>
			                            <th class="text-center"><c:out value="${r.productId.productName}"/></th>
			                            <th class="text-center"><c:out value="${r.productId.brand}"/></th>
			                            <th class="text-center"><c:out value="${r.productId.modelNo}"/></th>
			                            <th class="text-center"><c:out value="${r.sellPrice}"/></th>
			                               <th class="text-center"><c:out value="${r.quentity}"/></th>
			                                  <th class="text-center"><c:out value="${r.discount}"/></th>
			                                     <th class="text-center"><c:out value="${r.totalPrice}"/></th>
			                          
			                           
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