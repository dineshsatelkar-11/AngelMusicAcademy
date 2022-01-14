


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<form:form  cssClass="form-horizontal text-center" modelAttribute="sell" method="post" >

                               <div class="form-group">
		                        <div class="control-label col-xs-3"> <label  >Instrument <label> </div>
		                        <div class="col-xs-6">
		                           <input Class="form-control"  value="${pd.instrumentName.instrumentName}"/>
		                        </div>
		                    </div>
                                    
		                    
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <label  >Instrument Sub-Category <label> </div>
		                        <div class="col-xs-6">
		                           <input Class="form-control"  value="${pd.instrumentSubcategory.instrumentSubcategoryName}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <label  >Model No.<label> </div>
		                        <div class="col-xs-6">
		                           <input Class="form-control"  value="${pd.modelNo}"/>
		                        </div>
		                    </div>
                                        <div class="form-group">
		                        <div class="control-label col-xs-3"> <label  >Brand Name<label> </div>
		                        <div class="col-xs-6">
		                             <input Class="form-control"  value="${pd.brand}"/>
		                        </div>
		                    </div>
                                          <div class="form-group">
		                        <div class="control-label col-xs-3"> <label  >Color<label> </div>
		                        <div class="col-xs-6">
		                             <input Class="form-control" value="${pd.color}"/>
		                        </div>
		                    </div>
                                                             <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="sellPrice" >Unit Price</form:label> </div>
		                        <div class="col-xs-6">
		                             <form:input cssClass="form-control" readonly="" path="sellPrice" id="unitPrice1"  value="${pd.sellPrice}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
		                        </div>
		                    </div>
		                     
		                     
		                 
                       
		            </form:form>
		              
		              
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
		              
		          