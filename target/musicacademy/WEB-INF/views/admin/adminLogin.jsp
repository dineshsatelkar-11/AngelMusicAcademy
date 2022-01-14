<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin Login | A M A</title>


<!-- All required css files -->
<%@include file="../comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	<section>
			
		<!-- Admin Left sidebar and header -->
		<%@include file="../comman_files/nullSessionHeaderFile.jsp"%>
		
		
			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container">
			            <form:form id="adminLoginForm" cssClass="form-horizontal" modelAttribute="admin" method="post" action="authonticateAdmin">
		                    <c:if test="${not empty msg}">
		                    <div class="form-group">
		                    	<div class="col-xs-offset-3 col-xs-6 text-center alert alert-danger fade in">
								    <a href="#" class="close" data-dismiss="alert">&times;</a>
								    <strong>${msg}</strong>
								</div>
							</div>
		                    </c:if>
		                    <div class="form-group">
		                        <div class="control-label col-xs-3"> <form:label path="adminEmail" >Email</form:label> </div>
		                        <div class="col-xs-6">
		                            <form:input cssClass="form-control" path="adminEmail" value="${admin.adminEmail}"/>
		                        </div>
		                    </div>
		    				<div class="form-group">
		                        <form:label path="adminPassword" cssClass="control-label col-xs-3">Password</form:label>
		                        <div class="col-xs-6">
		                            <form:password cssClass="form-control" path="adminPassword" value="${admin.adminPassword}"/>
		                        </div>
		                    </div>
		                    		                            
		                    <div class="form-group"><br/><br/>
		                        <div class="row">
		                            <div class="col-xs-3 col-xs-offset-3">
		                            	<input type="submit" class="btn btn-success btn-block" value="Login"/>
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
	</div>
			<div class="clearfix"></div>
			
		<!-- All required js files -->
<%@include file="../comman_files/scriptFile.jsp"%>
		<!--body wrapper end-->
		
	</section>

</body>
</html>