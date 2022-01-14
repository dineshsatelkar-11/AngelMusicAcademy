<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add Branch | A M A</title>


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
			            <form:form id="addBranchForm" cssClass="form-horizontal col-md-8" modelAttribute="branch" method="post" action="saveBranch">
    
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="branchName" >Branch Name</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:hidden path="branchId" value="${branch.branchId}"/>
		                            <form:input cssClass="form-control" path="branchName" value="${branch.branchName}"/>
		                        </div>
		                    </div>
		    				<div class="form-group">
		                        <form:label path="branchAddress" cssClass="control-label col-xs-3">Branch Address</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="branchAddress" value="${branch.branchAddress}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="admin.adminName" cssClass="control-label col-xs-3">Admin Name</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="admin.adminName" value="${branch.admin.adminName}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="admin.adminEmail" cssClass="control-label col-xs-3">Admin Email ID</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="admin.adminEmail" value="${branch.admin.adminEmail}"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <form:label path="admin.adminMobileNo" cssClass="control-label col-xs-3">Admin Mobile Number</form:label>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="admin.adminMobileNo" value="${branch.admin.adminMobileNo}"/>
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
				      <div class="panel-heading text-center">Existing Branches</div>
				      <div class="panel-body">
				      	<c:choose>
						      <c:when test="${not empty branches}">
							    <ul>
									<c:forEach var="brnch" items="${branches}">
										<li>${brnch.branchName} - ${brnch.admin.adminName}</li>
									</c:forEach>
								</ul>
							  </c:when>
							  <c:otherwise>
							    <div class="text-center"><h3>No Branch Added...!!!</h3></div>
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
		
		<!-- All required js files -->
<%@include file="../comman_files/scriptFile.jsp"%>
		<!--body wrapper end-->
		
	</section>
</body>
</html>