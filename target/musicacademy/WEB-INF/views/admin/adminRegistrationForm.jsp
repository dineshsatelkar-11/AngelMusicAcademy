<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admins | A M A</title>


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

.image-preview-input {
    position: relative;
	overflow: hidden;
	margin: 0px;    
    color: #333;
    background-color: #fff;
    border-color: #ccc;    
}
.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity=0);
}
.image-preview-input-title {
    margin-left:2px;
}
</style>
</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	<section>
			
		<!-- Admin Left sidebar and header -->
		<%@include file="../comman_files/adminHeaderFile.jsp"%>

			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container">
		                <form:form id="addAdminForm" cssClass="form-horizontal col-md-7" modelAttribute="admin" method="post" action="saveAdmin">
    						
    						   <div class="text-center"><h1><label>Create Admin</label></h1></div>
			                    <div class="form-group">
			                        <div class="control-label col-md-3"> <form:label path="adminName" >Admin Name</form:label> </div>
			                        <div class="col-md-7">
			                            <form:input cssClass="form-control" path="adminName" value="${admin.adminName}"/>
			                        </div>
			                    </div>
			                
				                 <div class="form-group">
			                        <div class="control-label col-md-3"> <form:label path="adminPassword" >Admin Password</form:label> </div>
			                        <div class="col-md-7">
			                            <form:password cssClass="form-control" path="adminPassword" value="${admin.adminPassword}" readonly='true'/>
			                        </div>
			                    </div>
			                  
		                    <div class="form-group"><br/><br/>
		                        <div class="row">
		                            <div class="col-xs-3 col-xs-offset-3">
		                            	<input type="submit" class="btn btn-success btn-block" value="Create"/>
		                            </div>
		                            <div class="col-xs-3">
		                                <input type="reset" class="btn btn-primary btn-block" value="Clear"/>
		                            </div>
		                            <div class="col-xs-4">
		                            </div>
		                        </div>
		                    </div>
    
                </form:form>
                <div class="col-md-5">
	                <div class="panel panel-success">
				      <div class="panel-heading text-center">Existing Admins</div>
				      <div class="panel-body">
				      	<c:choose>
						      <c:when test="${not empty adminList}">
							    <ul>
									<c:forEach var="admin" items="${admin}">
										<li>${admin.branchName}</li>
									</c:forEach>
								</ul>
							  </c:when>
							  <c:otherwise>
							    <div class="text-center"><h3>No Admin Added ...!!!</h3></div>
							  </c:otherwise>
					      </c:choose>
				      	
				      </div>
				    </div>
			    </div>
        		</div> <!-- ./container -->
			</div>
			
	</div>
			<div class="clearfix"></div>
		
		<!-- All required js files -->
<%@include file="../comman_files/scriptFile.jsp"%>

</section>

</body>
</html>