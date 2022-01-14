<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Instrument Rent Form | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
 <c:if test="${not empty rentno}">
<script>
    window.open("InstrumentRentPrint/${rentno}");
</script>
</c:if>
	<section>

<%@include file="../comman_files/branchReceptionHeader.jsp"%>
			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container text-center">
			            <form:form id="instrumentRentForm" cssClass="form-horizontal text-center" modelAttribute="rent" method="post" action="addInstrumentRent">
                                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerName" >Customer Name</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:hidden path="rentId" value="${rent.rentId}"/>
		                            <form:input cssClass="form-control" path="customerName" value="${rent.customerName}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerContactNo" >Customer Contact No.</form:label> </div>
		                        <div class="col-xs-6">
		                           <form:input cssClass="form-control" path="customerContactNo" value="${rent.customerContactNo}"/>
		                        </div>
		                    </div>
                                        <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerAlternateNo" >Customer Alternate No.</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="customerAlternateNo" value="${rent.customerAlternateNo}"/>
		                        </div>
		                    </div>
                                          <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerAddress" >Customer Address</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="customerAddress" value="${rent.customerAddress}"/>
		                        </div>
		                    </div>
                                           <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerIdProof" >Customer ID Proof</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="customerIdProof" value="${rent.customerIdProof}"/>
		                        </div>
		                    </div>
		    		      <div class="form-group">
		                        <form:label path="instrumentName" cssClass="control-label col-xs-3">Instrument Name</form:label>
		                        <div class="col-xs-6">
		                            <form:select  cssClass="form-control" path="instrumentName" value="${rent.instrumentName}">
		                            		<c:forEach var="instrument" items="${instruments}">
												<form:option value="${instrument.instrumentName}">${instrument.instrumentName}</form:option>
											</c:forEach>
		                            	   	
                       				</form:select>
		                        </div>
		                    </div>
                                         
		                   <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="fromDate" >From Date</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" id="datetimepicker2" path="fromDate" value="${rent.fromDate}"/>
		                        </div>
		                    </div>
                                         <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="toDate" >To Date</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" id="datetimepicker1" path="toDate" value="${rent.toDate}"/>
		                        </div>
		                    </div>
                                         <div class="form-group">
		                        <form:label path="noOfDays" cssClass="control-label col-xs-3">Number of Days</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control"  path="noOfDays" value="${rent.noOfDays}"/>
		                        </div>
		                    </div>
		                  <div class="form-group">
		                        <form:label path="amount" cssClass="control-label col-xs-3">Amount</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="amount" value="${rent.amount}"/>
		                        </div>
		                    </div>
                                        <div class="form-group">
		                        <form:label path="quantity" cssClass="control-label col-xs-3">Quantity</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="quantity" value="${rent.quantity}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="discount" cssClass="control-label col-xs-3">Discount</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="discount"  value="${rent.discount}" id="discount"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
		                        </div>
		                    </div>
                                    <div class="form-group">
		                        <form:label path="totalAmount" cssClass="control-label col-xs-3">Total Amount</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="totalAmount" value="${rent.totalAmount}" id="totalAmount"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
		                        </div>
		                    </div>
                                      <div class="form-group">
		                        <form:label path="advancedPaid" cssClass="control-label col-xs-3">Advanced Paid</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="advancedPaid" value="${rent.advancedPaid}" id="advancedPaid"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
		                        </div>
		                    </div>    
                                       
                                        <div class="form-group">
			                        <form:label path="balanceAmount" class="control-label col-xs-3">Balance Amount</form:label>
			                        <div class="col-xs-6">
			                            <form:input path="balanceAmount" class="form-control" id="balanceAmount" readonly="true"/>
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
	    	  format: 'DD-MMMM-YYYY hh:mm A',
	    	 defaultDate: new Date(),
	    	 //autoClose: true,
	        sideBySide: true
	     });
	  
	});
	
	</script>
                <script type="text/javascript">
	$(document).ready(function() {
	    $('#datetimepicker2').datetimepicker({
	    	 format: 'DD-MMMM-YYYY hh:mm A',
	    	 defaultDate: new Date(),
	    	 //autoClose: true,
	        sideBySide: true
	     });
	});
	</script>
<script type="text/javascript">
	$(document).ready(function() {
//		var today = new Date();
//		var currMonth = today.getMonth()+1;
//		var fromDate = new Date(today.setMonth(currMonth));
//		var toDate = new Date(today.setMonth(currMonth+1));
	   
	    

		$(".hideAll").hide();
                
		$('#discount').on('keyup change', function () {
                    var amt = $('#amount').val();
                    var qty = $('#quantity').val();
                    var dis = $('#discount').val();
                    
                    var total=amt*qty;
                     var discount = ((total * dis) / 100);
                     var totalamt=total-discount;
                    $('#totalAmount').val(totalamt);
                 });
                 
	$('#advancedPaid').on('keyup change', function () {
		var tf = $('#totalAmount').val();
	    var fi = $('#advancedPaid').val();
	    var balance = tf-fi;
	    if(balance<=0 || balance>=tf)
	    	{
//	    		$(".fromdate").hide();
	    		$('#balanceAmount').val(tf);
//	    		$('#fromDate').val("");
	    		
	    		if(balance==0)
	    			$('#balance').val(balance);
	    	}
	    else
	    	{
	    	    $('#balanceAmount').val(balance);
//	    		$(".fromdate").show();
//	    		
//	    		$('#fromDate').datetimepicker({
//	    	    	 format: 'DD/MM/YYYY',
//	    	    	 defaultDate: fromDate
//	    	    });
                   
	    	}
		});
                });
	</script>
</body>
</html>