<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Products | A M A</title>


<!-- All required css files -->
<%@include file="comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	<section>
			

		<%@include file="comman_files/nullSessionHeaderFile.jsp"%>

			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container">
					<div class="text-center" style="margin-bottom: -7%;"><h2>Products</h2></div>
		                		<div class="row">
			<div class="albums">
					
					<c:choose>
					      <c:when test="${not empty instruments}">
						   <div class="browse">
								<c:forEach var="instrument" items="${instruments}">
								
								<div class="col-md-3 browse-grid">
								    <a class="sing" href="#">${instrument.instrumentName}</a>
									<a  href="#"><img src="instruments/${instrument.instrumentImgName}"
										alt="${instrument.instrumentName}" /></a>
									<a class="sing" href="#">Offer & Price</a>
								</div>
								
								</c:forEach>
						  <div class="clearfix"> </div>
									</div>
						  </c:when>
						  <c:otherwise>
						    <div class="text-center"><h3>No Products Added...!!!</h3></div>
						  </c:otherwise>
				    </c:choose>
						<!--/music-right-->
						   
				<!--//discover-view-->
			</div>
		</div>
		
		<div class="clearfix"></div>
        		</div> <!-- ./container -->
			</div>
		<!--body wrapper start-->
		<!--//discover-view-->

						<!--body wrapper end-->
	</div>
			<div class="clearfix"></div>
		
		<!-- All required js files -->
<%@include file="comman_files/scriptFile.jsp"%>

		<!--body wrapper end-->
		
	</section>

</body>
</html>