<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add Batch Timing | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	<section>
			
		<!-- Admin Left sidebar and header -->
		<%@include file="../comman_files/adminHeaderFile.jsp"%>

			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container">
			            <form:form id="addBatchTimingForm" cssClass="form-horizontal col-md-8" modelAttribute="BT" method="post" action="saveBatchTiming">
    
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="batchTiming" >Batch Time</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:hidden path="batchTimeId" value="${BT.batchTimeId}"/>
		                            <form:input cssClass="form-control" path="batchTiming" value="${BT.batchTiming}"/>
		                        </div>
		                    </div>
		    						                    		                            
		                    <div class="form-group"><br/><br/>
		                        <div class="row">
		                            <div class="col-xs-3 col-xs-offset-3">
		                            	<input type="submit" id="saveUser" class="btn btn-success btn-block" value="Add"/>
		                            </div>
		                            <div class="col-xs-3">
		                                <input type="reset" class="btn btn-primary btn-block" value="Clear"/>
		                            </div>
		                            <div class="col-xs-4">
		                            </div>
		                        </div>
		                    </div>
    
                </form:form>
                <div class="col-md-4">
	                <div class="panel panel-success">
				      <div class="panel-heading text-center">Existing Batch Timing</div>
				      <div class="panel-body">
				      <c:choose>
					      <c:when test="${not empty BTS}">
						    <ul>
								<c:forEach var="timing" items="${BTS}">
									<li>${timing.batchTiming}</li>
								</c:forEach>
							</ul>
						  </c:when>
						  <c:otherwise>
						    <div class="text-center"><h3>No Batch Time Added...!!!</h3></div>
						  </c:otherwise>
				      </c:choose>
				      </div>
				    </div>
			    </div>
                
        		</div> <!-- ./container -->
			</div>
		<!--body wrapper start-->
	</div>
			<div class="clearfix"></div>
			<!--body wrapper end-->
	</div>
			<div class="clearfix"></div>
			<!--body wrapper end-->
			<!-- /w3l-agile -->
		
		<!-- All required js files -->
<%@include file="../comman_files/scriptFile.jsp"%>
		<!--body wrapper end-->
		
	</section>

	<script>
		$(document).ready(function() {
		    $('#datepicker').datepicker({
			    inline: true,
		        showOtherMonths: true,
		        dateFormat: 'dd/mm/yy',
		        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		        yearRange: '1950:+0' ,
		        maxDate: new Date(), 
			    changeYear: true,
			    changeMonth: true,
			    
			    onSelect: function(value, ui) {
			        var currentYear = new Date().getFullYear();
			        var dob = new Date(value);
			        var dobYear = dob.getFullYear();
			        var age = currentYear - dobYear;
			        $('#userAge').val(age);
			    }

		    });
		    $("#datepicker").datepicker("setDate", new Date());
			});
				    
	</script>

</body>
</html>