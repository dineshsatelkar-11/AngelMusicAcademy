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

	<section>

<%@include file="../comman_files/adminHeaderFile.jsp"%>
			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container text-center">
			            <form:form id="addPurchaseForm" cssClass="form-horizontal text-center" modelAttribute="purchase" method="post" action="savePurchase">
                                  
                                    <div class="form-group">
		                      <form:label path="productId.productName" cssClass="control-label col-xs-3">Product Name</form:label> 
		                        <div class="col-xs-6">
		                           <form:hidden path="purchaseId" value="${purchase.purchaseId}"/>
		                       
		                             <form:select  cssClass="form-control" path="productId.productId" id="producct" value="${purchase.productId.productId}">
		                            		<c:forEach var="prod" items="${productlist}">
												<form:option value="${prod.productId}">${prod.productName}</form:option>
											</c:forEach>
		                            	   	
                       				</form:select>
		                       
		                        </div>
		                    </div>
		                      <div id="productdetails"> </div>
		                      
		                     
<!--                               <div id="productdetails">       -->
<!-- 		                    <div class="form-group"> -->
<%-- 		                        <div class="control-label col-xs-3"> <form:label path="instrumentName.instrumentId" >Instrument  .</form:label> </div> --%>
<!-- 		                        <div class="col-xs-6"> -->
<%-- 		                           <form:input cssClass="form-control" path="instrumentName.instrumentId" value="${product.instrumentName.instrumentName}"/> --%>
<!-- 		                        </div> -->
<!-- 		                    </div> -->
<!-- 		                    <div class="form-group"> -->
<%-- 		                        <div class="control-label col-xs-3"> <form:label path="instrumentSubcategory" >Instrument Sub-Category .</form:label> </div> --%>
<!-- 		                        <div class="col-xs-6"> -->
<%-- 		                           <form:input cssClass="form-control" path="instrumentSubcategory" value="${product.instrumentSubcategory}"/> --%>
<!-- 		                        </div> -->
<!-- 		                    </div> -->
<!-- 		                    <div class="form-group"> -->
<%-- 		                        <div class="control-label col-xs-3"> <form:label path="modelNo" >Model No.</form:label> </div> --%>
<!-- 		                        <div class="col-xs-6"> -->
<%-- 		                           <form:input cssClass="form-control" path="modelNo" value="${product.modelNo}"/> --%>
<!-- 		                        </div> -->
<!-- 		                    </div> -->
<!--                                         <div class="form-group"> -->
<%-- 		                        <div class="control-label col-xs-3"> <form:label path="brand" >Brand Name</form:label> </div> --%>
<!-- 		                        <div class="col-xs-6"> -->
<%-- 		                             <form:input cssClass="form-control" path="brand" value="${product.brand}"/> --%>
<!-- 		                        </div> -->
<!-- 		                    </div> -->
<!--                                           <div class="form-group"> -->
<%-- 		                        <div class="control-label col-xs-3"> <form:label path="color" >Color</form:label> </div> --%>
<!-- 		                        <div class="col-xs-6"> -->
<%-- 		                             <form:input cssClass="form-control" path="color" value="${product.color}"/> --%>
<!-- 		                        </div> -->
<!-- 		                    </div> -->
<!--                                            <div class="form-group"> -->
<%-- 		                        <div class="control-label col-xs-3"> <form:label path="unitPrice" >Unit Price</form:label> </div> --%>
<!-- 		                        <div class="col-xs-6"> -->
<%-- 		                             <form:input cssClass="form-control" path="unitPrice" value="${product.unitPrice}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/> --%>
<!-- 		                        </div> -->
<!-- 		                    </div> -->
		    		  
<!--                            <div class="form-group"> -->
<%-- 		                        <form:label path="transportCharge" cssClass="control-label col-xs-3">Transport Charges</form:label> --%>
<!-- 		                        <div class="col-xs-6"> -->
<%-- 		                            <form:input cssClass="form-control"  path="transportCharge" value="${product.transportCharge}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/> --%>
<!-- 		                        </div> -->
<!-- 		                    </div> -->
<!-- 		                  <div class="form-group"> -->
<%-- 		                        <form:label path="sellPrice" cssClass="control-label col-xs-3">Sell Price</form:label> --%>
<!-- 		                        <div class="col-xs-6"> -->
<%-- 		                            <form:input cssClass="form-control" path="sellPrice" value="${product.sellPrice}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/> --%>
<!-- 		                        </div> -->
<!-- 		                    </div> -->
<!--                            <div class="form-group"> -->
<%-- 		                        <form:label path="quentity" cssClass="control-label col-xs-3">Quantity</form:label> --%>
<!-- 		                        <div class="col-xs-6"> -->
<%-- 		                            <form:input cssClass="form-control" path="quentity" value="${product.quentity}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/> --%>
<!-- 		                        </div> -->
<!-- 		                    </div> -->
<!-- 		                   </div> -->
                             
                             <div class="form-group">
		                        <form:label path="quentity" cssClass="control-label col-xs-3"> Quantity</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control"  id="quant" path="quentity" value="${purchase.quentity}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
		                        </div>
		                    </div>
		                    
		                         <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="totalPrice" >Total Price</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="totalPrice" id="total" value="${purchase.totalPrice}"/>
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
<script>
    $(document).ready(function()
    { 
        $("#producct").change(function()
        {
        	 
            var productid = $("#producct").val();
         
            $.ajax({
                url: "./ajax/fetchproduct",
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
                   
    	    var fi = $('#transportCharge1').val();
                
    	    var total = (parseFloat (tf * rd) + parseFloat(fi));
              
               
              
    	    
                      
    	    	    $('#total').val(total);
    	    		
    	    		
    	    		
    	    		
    	    	
    		});
    });
</script>	

</body>
</html>