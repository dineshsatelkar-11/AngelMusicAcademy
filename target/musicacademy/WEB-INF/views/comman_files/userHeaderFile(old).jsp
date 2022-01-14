<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  
          <!-- left side start-->
		<div class="left-side sticky-left-side">
		<!--logo and iconic logo start-->
			<div class="logo">
				<h1><a href="${contextPath}/index">Angel<span> MA</span></a></h1>
			</div>
			<div class="logo-icon text-center">
				<a href="${contextPath}/index">AM </a>
			</div>
 	 <!-- /w3l-agile -->
			<!--logo and iconic logo end-->
			<div class="left-side-inner">

				<!--sidebar nav start-->
					<ul class="nav nav-pills nav-stacked custom-nav">
						<li class="active"><a href="${contextPath}/index"><i class="lnr lnr-home"></i><span>Home</span></a></li>
						<li><a href="${contextPath}/events"><i class="fa fa-trophy"></i> <span>Events</span></a></li>
						<li><a href="#"><i class="lnr lnr-direction-ltr"></i> <span>Products</span></a></li>
						<li><a href="${contextPath}/gallery"><i class="lnr lnr-picture"></i> <span>Gallery</span></a></li>
						<li><a href="${contextPath}/aboutus"><i class="lnr lnr-magnifier"></i> <span>About Us</span></a></li>
						<li><a href="${contextPath}/contactus"><i class="fa fa-thumb-tack"></i> <span>Contact Us</span></a></li>
						<li><a href="${contextPath}/exams"><i class="lnr lnr-graduation-hat"></i> <span>Exams</span></a></li>
                                                <li><a href="${contextPath}/userLogout"><i class="fa fa-sign-out"></i> <span>Logout</span></a></li>
						
					</ul>
				<!--sidebar nav end-->
			</div>
		</div>
<!--notification menu start -->
<div class="main-content">
			<!-- header-starts -->
			<div class="header-section">
				<!--toggle button start-->
				<a class="toggle-btn  menu-collapsed"><i class="fa fa-bars"></i></a>
				<!--toggle button end-->
				<!--notification menu start -->
				
				<div class="clearfix"></div>
			</div>
			<!--notification menu end -->
			<!-- //header-ends -->
			<!-- /w3l-agileits -->
			<!-- //header-ends -->
	