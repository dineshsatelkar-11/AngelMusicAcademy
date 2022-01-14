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
			            <form:form id="addProductForm" cssClass="form-horizontal text-center" modelAttribute="product" method="post" action="saveProduct">
                               
                               
                                 <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="productName" >Product Name .</form:label> </div>
		                        <div class="col-xs-6">
		                           <form:input cssClass="form-control" path="productName" value="${product.productName}"/>
		                        </div>
		                    </div> 
		                     
                                    <div class="form-group">
		                      <form:label path="instrumentName.instrumentId" cssClass="control-label col-xs-3">Product Name</form:label> 
		                        <div class="col-xs-6">
		                            <form:hidden path="productId" value="${product.productId}"/>
		                       
		                             <form:select  cssClass="form-control" path="instrumentName.instrumentId" id="productid" value="${product.instrumentName.instrumentId}">
		                            		<c:forEach var="instrument" items="${instruments}">
												<form:option value="${instrument.instrumentId}">${instrument.instrumentName}</form:option>
											</c:forEach>
		                            	   	
                       				</form:select>
		                       
		                        </div>
		                    </div>
		                    
		                      
		                     <div class="form-group">
		                        <form:label path="instrumentSubcategory" cssClass="control-label col-xs-3">Instrument Subcategory</form:label>
		                        <div class="col-xs-6">
		                        <div id="subcategortfetch">
		                            <form:select  cssClass="form-control" path="instrumentSubcategory.instrumentSubcategoryId" value="${product.instrumentSubcategory.instrumentSubcategoryId}">
		                            		<c:forEach var="instrument" items="${instrumentSubcategory}">
												<form:option value="${instrument.instrumentSubcategoryId}">${instrument.instrumentSubcategoryName}</form:option>
											</c:forEach>
		                            	   	
                       				</form:select>
		                        </div>
		                         </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="modelNo" >Model No.</form:label> </div>
		                        <div class="col-xs-6">
		                           <form:input cssClass="form-control" path="modelNo" value="${product.modelNo}"/>
		                        </div>
		                    </div>
                                        <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="brand" >Brand Name</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="brand" value="${product.brand}"/>
		                        </div>
		                    </div>
                                          <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="color" >Color</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" path="color" value="${product.color}"/>
		                        </div>
		                    </div>
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
        $("#productid").change(function()
        {
        	
            var productid = $("#productid").val();
            alert(productid);
            $.ajax({
                url: "./ajax/listofsubcategory",
                type: "post",
                data: {
                	instrumentId: productid

                },
                success: function(response) {
                  
                    $("#subcategortfetch").html(response);

                },
                error: function(jqXHR, textStatus, errorThrown)
                {
                    console.log(jqXHR, textStatus, errorThrown);
                    alert("Something Went Wrong...!!!");
                }
            });


        });
    });
</script>	

</body>
</html>