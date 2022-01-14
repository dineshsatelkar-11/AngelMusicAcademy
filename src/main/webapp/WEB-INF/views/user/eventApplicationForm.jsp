<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Event Application Form | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>
<style>
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

input[type=checkbox] { display:none; } /* to hide the checkbox itself */
input[type=checkbox] + label:before {
  font-family: FontAwesome;
  display: inline-block;
}

input[type=checkbox] + label:before { content: "\f096"; } /* unchecked icon */
input[type=checkbox] + label:before { letter-spacing: 10px; } /* space between checkbox and label */

input[type=checkbox]:checked + label:before { content: "\f046"; } /* checked icon */
input[type=checkbox]:checked + label:before { letter-spacing: 5px; } /* allow space for check mark */
</style>
</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	
<section>
			
		<!-- Admin Left sidebar and header -->
		<%@include file="../comman_files/nullSessionHeaderFile.jsp"%>

			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container">
						<form:form id="eventApplicationForm" cssClass="form-horizontal text-center" modelAttribute="eventApplication" method="post" action="../saveEventApplication"  enctype="multipart/form-data">
    						<input type="hidden" name="eventID" value="${event.eventId}"/>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="applicantName" >Name</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="applicantName" value="${eventApplication.applicantName}"/>
		                        </div>
		                    </div>
		    				<div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="applicantMobileNo" >Mobile Number</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="applicantMobileNo" value="${eventApplication.applicantMobileNo}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="applicantEmail" >Email ID</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="applicantEmail" value="${eventApplication.applicantEmail}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="applicantGender" >Gender</form:label> </div>
		                        <div class="col-xs-6" style="margin-left:-18%;">
		                            <form:radiobutton path="applicantGender" value="Male" label="Male"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                            <form:radiobutton path="applicantGender" value="Female" label="Female"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="applicantDOB" >Date Of Birth</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" id="datetimepicker1" path="applicantDOB" value="${eventApplication.applicantDOB}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="applicantSchoolName" >School/Institute Name</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="applicantSchoolName" value="${eventApplication.applicantSchoolName}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="applicantMusicTeacherName" >Teacher Name</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="applicantMusicTeacherName" value="${eventApplication.applicantMusicTeacherName}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="applicantAddress" >Address</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="applicantAddress" value="${eventApplication.applicantAddress}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="applicantAgeCategory" >Age Category</form:label> </div>
		                        <div class="col-xs-6">
<%-- 		                            <form:input cssClass="form-control" path="applicantAgeCategory" value="${eventApplication.applicantAgeCategory}"/> --%>
		                            <form:select cssClass="form-control" path="applicantAgeCategory" items="${ageCategories}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="applicantPerformanceForm" >Form</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:select cssClass="form-control" path="applicantPerformanceForm">
		             				        <c:forEach items="${subs}" var="subs1">
		             				        	<optgroup label="${subs1.key}">
				             				        <c:forEach items="${subs1.value}" var="one_sub">
				             				             <option value="${one_sub}">${one_sub}</option>
											        </c:forEach>
										        </optgroup>
									        </c:forEach>

		                            </form:select>
		                        </div>
		                    </div>
		                    <div class="form-group">
                                <label class="control-label col-xs-3" for="photoID">Photo</label>
		                        <div class="col-md-6">
		                           <div class="input-group image-preview">
						                <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
						                <span class="input-group-btn">
						                    <!-- image-preview-clear button -->
						                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
						                        <span class="glyphicon glyphicon-remove"></span> Clear
						                    </button>
						                    <!-- image-preview-input -->
						                    <div class="btn btn-default image-preview-input">
						                        <span class="glyphicon glyphicon-folder-open"></span>
						                        <span class="image-preview-input-title">Browse</span>
						                        <input type="file" id="photoID" accept="image/png, image/jpeg, image/gif" name="applicantPhoto"/> <!-- rename it -->
						                    </div>
						                </span>
						            </div><!-- /input-group image-preview [TO HERE]--> 
		                       </div>
				             </div>
				                            
		                    <div class="form-group"><br/><br/>
		                        <div class="row">
		                            <div class="col-xs-3 col-xs-offset-3">
		                            	<input type="submit" class="btn btn-success btn-block" value="Save"/>
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

</section>
<script type="text/javascript">
	$(document).ready(function() {
	    $('#datetimepicker1').datetimepicker({
	    	 format: 'DD/MM/YYYY',
	    	 viewMode: "years"
	     });
	});
	</script>
</body>
</html>