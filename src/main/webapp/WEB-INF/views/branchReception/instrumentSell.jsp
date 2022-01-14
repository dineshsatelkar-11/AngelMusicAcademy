<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Instrument Sell Form | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
 <c:if test="${not empty sellno}">
<script>
    window.open("InstrumentSellPrint/${sellno}");
</script>
</c:if>
	<section>

<%@include file="../comman_files/branchReceptionHeader.jsp"%>
			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container text-center">
			            <form:form id="instrumentSellForm" cssClass="form-horizontal text-center" modelAttribute="sell" method="post" action="addInstrumentSell">
                                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="counsellorName" >Counsellor Name</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:hidden path="sellId" value="${sell.sellId}"/>
		                            <form:input cssClass="form-control" path="counsellorName" value="${sell.counsellorName}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerFirstName" >Customer First Name</form:label> </div>
		                        <div class="col-xs-6">
		                           <form:input cssClass="form-control" path="customerFirstName" value="${sell.customerFirstName}"/>
		                        </div>
		                    </div>
                                        <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerMiddleName" >Customer Middle Name</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="customerMiddleName" value="${sell.customerMiddleName}"/>
		                        </div>
		                    </div>
                                          <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerLastName" >Customer Last Name</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="customerLastName" value="${sell.customerLastName}"/>
		                        </div>
		                    </div>
                                           <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="customerAddress" >Customer Address</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="customerAddress" value="${sell.customerAddress}"/>
		                        </div>
		                    </div>
		    				<div class="form-group">
		                        <form:label path="customerMobileNo" cssClass="control-label col-xs-3">Customer Mobile Number</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="customerMobileNo" value="${sell.customerMobileNo}"/>
		                        </div>
		                    </div>
                                        <div class="form-group">
		                        <form:label path="customerAlternateNo" cssClass="control-label col-xs-3">Alternate Contact Number</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="customerAlternateNo" value="${sell.customerAlternateNo}"/>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                      <form:label path="productId.productName" cssClass="control-label col-xs-3">Product Name</form:label> 
		                        <div class="col-xs-6">
		                           
		                       
		                             <form:select  cssClass="form-control" path="productId.productId" id="producct" value="${sell.productId.productId}">
		                            		<c:forEach var="pr" items="${prod}">
												<form:option value="${pr.productId}">${pr.productName}</form:option>
											</c:forEach>
		                            	   	
                       				</form:select>
		                       
		                        </div>
		                    </div>
		                 
                             <div id="productdetails"> 
                               
                         
                                      
		    		  </div>
		                        <div class="form-group">
		                        <form:label path="discount" cssClass="control-label col-xs-3"> Discount</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control"  id="discou" path="discount"  value="${sell.discount}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="quentity" cssClass="control-label col-xs-3"> Quantity</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control"  id="quant" path="quentity" value="${sell.quentity}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
		                        </div>
		                    </div>
		                    
		                         <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="totalPrice" >Total Price</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="totalPrice" id="total" value="${sell.totalPrice}"/>
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
	    <script>
    $(document).ready(function()
    {
    
     $('#quant').on('keyup change', function () {
    		var tf = $('#quant').val();
    		
                    var rd = $('#unitPrice1').val();
                 
    	  var fd=$('#discou').val();
    	   
    	    var total = parseFloat (tf * rd) ;
    	  
               
    	    var discount = ((total * fd) / 100);
    	   
    	     total=parseFloat(total)-parseFloat(discount);
    	    
                      
    	    	    $('#total').val(total);
    	    		
    	    		
    	    		
    	    		
    	    	
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
<script>
    $(document).ready(function()
    { 
        $("#producct").change(function()
        {
        	 
            var productid = $("#producct").val();
       
            $.ajax({
                url: "./ajax/fetchsell",
                type: "post",
                data: {
                	Productid: productid

                },
                success: function(response) {
                  
                    $("#productdetails").html(response);

                },
                error: function(jqXHR, textStatus, errorThrown)
                {
                    console.log(jqXHR, textStatus, errorThrown);
                    alert("Something Went Wrong...!!!");
                }
            });


        });
        
        
        $('#quant').on('keyup change', function () {
    		var tf = $('#quant').val();
             
                    var rd = $('#unitPrice1').val();
                   
    	  var fd=$('#discou').val();
                
    	    var total = parseFloat (tf * rd) ;
              
               
    	    var discount = ((total * fd) / 100);
    	     total=parseFloat(total)-parseFloat
                      
    	    	    $('#total').val(total);
    	    		
    	    		
    	    		
    	    		
    	    	
    		});
    });
</script>
</body>
</html>