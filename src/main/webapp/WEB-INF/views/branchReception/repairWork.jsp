<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Repair Work Form | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
 <c:if test="${not empty repairNo}">
<script>
    window.open("RepairPrint/${repairNo}");
</script>
</c:if>
	<section>

<%@include file="../comman_files/branchReceptionHeader.jsp"%>
			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container text-center">
			            <form:form id="instrumentRepairForm" cssClass="form-horizontal text-center" modelAttribute="repair" method="post" action="addInstrumentRepair">
                                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="counsellorName" >Counsellor Name</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:hidden path="repairId" value="${repair.repairId}"/>
		                            <form:input cssClass="form-control" path="counsellorName" value="${repair.counsellorName}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerFirstName" >Customer First Name</form:label> </div>
		                        <div class="col-xs-6">
		                           <form:input cssClass="form-control" path="customerFirstName" value="${repair.customerFirstName}"/>
		                        </div>
		                    </div>
                                        <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerMiddleName" >Customer Middle Name</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="customerMiddleName" value="${repair.customerMiddleName}"/>
		                        </div>
		                    </div>
                                          <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerLastName" >Customer Last Name</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="customerLastName" value="${repair.customerLastName}"/>
		                        </div>
		                    </div>
                                           <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerAddress" >Customer Address</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="customerAddress" value="${repair.customerAddress}"/>
		                        </div>
		                    </div>
		    				<div class="form-group">
		                        <form:label path="customerMobileNo" cssClass="control-label col-xs-3">Customer Mobile Number</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="customerMobileNo" value="${repair.customerMobileNo}"/>
		                        </div>
		                    </div>
                                        <div class="form-group">
		                        <form:label path="customerAlternateNo" cssClass="control-label col-xs-3">Alternate Contact Number</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="customerAlternateNo" value="${repair.customerAlternateNo}"/>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <form:label path="instrumentName.instrumentId" cssClass="control-label col-xs-3">Instrument Name</form:label>
		                        <div class="col-xs-6">
		                            <form:select  cssClass="form-control" path="instrumentName.instrumentId" value="${repair.instrumentName.instrumentId}">
		                            		<c:forEach var="instrument" items="${instruments}">
												<form:option value="${instrument.instrumentId}">${instrument.instrumentName}</form:option>
											</c:forEach>
		                            	   	
                       				</form:select>
		                        </div>
		                    </div>
                                        <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="problem" >Defect/ Problem For Repair</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="problem" value="${repair.problem}"/>
		                        </div>
		                    </div>
                                       
		                
		                      <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="returnDate" >Return Date</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" id="datetimepicker2" path="returnDate" value="${repair.returnDate}"/>
		                        </div>
		                    </div>
                                    <div class="form-group">
		                        <form:label path="repairingCost" cssClass="control-label col-xs-3">Repairing Cost</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="repairingCost" id="RepairingAmount" value="${repair.repairingCost}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
		                        </div>
		                    </div>
                                       
                                          <div class="form-group">
		                        <form:label path="discount" cssClass="control-label col-xs-3">Discount </form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="discount" id="RepairingDiscount" value="${repair.discount}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
		                        </div>
		                    </div>
                                         <div class="form-group discamoun">
                                            <label class="control-label col-xs-3">Discount Amount</label>
                                            <div class="col-xs-6">
                                                <input class="form-control" type="text" id="dicountamount">
                                            </div>
                                         
                                            </div>
                                          <div class="form-group">
		                        <form:label path="advancePaid" cssClass="control-label col-xs-3">Advance Payment</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="advancePaid" id="payingAmount" value="${repair.advancePaid}" onkeypress='return event.charCode >= 48 && event.charCode <= 57' />
		                        </div>
		                    </div>
                                          <div class="form-group second hideAll">
		                        <form:label path="balanceAmount" cssClass="control-label col-xs-3">Balance Amount</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="balanceAmount" id="balance" value="${repair.balanceAmount}"/>
		                        </div>
		                    </div>
<!--                                         <div class="form-group">
		                        <%--<form:label path="userNextVisitReminder" cssClass="control-label col-xs-3">Next Visit/Reminder</form:label>--%>
		                        <div class="col-xs-6">
		                            <%--<form:input cssClass="form-control" id="datetimepicker2" path="userNextVisitReminder" value="${userObject.userNextVisitReminder}"/>--%>
		                        </div>
		                    </div>-->
		                            
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
		
	    

		$(".hideAll").hide();
                $(".discamoun").hide();
                
                
                $('#RepairingDiscount').on('keyup change', function () {
		var tf = $('#RepairingAmount').val();
              
                var rd = $('#RepairingDiscount').val();
               
	    
            
	    var discount = ((tf * rd) / 100);
          
           
          
	    if(discount  > tf)
	    	{
	    		alert('Enter Correct Discount');
	    	}
	    else
	    	{
                    $(".discamoun").show();
	    	    $('#dicountamount').val(discount);
	    		
	    		
	    		
	    		
	    	}
		});
                
                
		
	$('#payingAmount').on('keyup change', function () {
		var tf = $('#RepairingAmount').val();
              
                var rd = $('#RepairingDiscount').val();
               
	    var fi = $('#payingAmount').val();
            
	    var discount = ((tf * rd) / 100);
          
            var balance=tf-fi-discount;
          
	    if(balance < 0 || balance > tf)
	    	{
	    		alert('Enter Correct Paid Amount');
	    	}
	    else
	    	{
                    $(".second").show();
	    	    $('#balance').val(balance);
	    		
	    		
	    		
	    		
	    	}
		});
	
	});
	</script>
</body>
</html>