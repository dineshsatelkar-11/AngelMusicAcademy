<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
          <!-- left side start-->
		<div class="left-side sticky-left-side">

			<div class="logo">
				<h1><a href="${contextPath}/index">Angel<span> MA</span></a></h1>
			</div>
			<div class="logo-icon text-center">
				<a href="${contextPath}/index"><span>AM</span> </a>
			</div>
 	 <!-- /w3l-agile -->
			<!--logo and iconic logo end-->
			<div class="left-side-inner">

				<!--sidebar nav start-->
					<ul class="nav nav-pills nav-stacked custom-nav">
						<li class="active"><a href="${contextPath}/adminIndex"><i class="lnr lnr-home"></i><span>Home</span></a></li>
						<li class="menu-list"><a href="#"><i class="lnr lnr-users"></i> <span>Admissions</span></a>
							<ul class="sub-menu-list">
								<li><a href="${contextPath}/newAdmissions">New Admissions</a></li>
								<li><a href="${contextPath}/allUsers">Approved Admissions</a></li>
							</ul>
						</li>
						<li class="menu-list"><a href="#"><i class="lnr lnr-indent-increase"></i> <span>Events</span></a>
							<ul class="sub-menu-list">
								<li><a href="${contextPath}/addEvent">Add Event</a></li>
								<li><a href="${contextPath}/getAllEventApplicationList">Event Applications</a></li>
							</ul></li>
						<li class="menu-list"><a href="#"><i class="lnr lnr-graduation-hat"></i> <span>Exam</span></a>
							<ul class="sub-menu-list">
								<li><a href="${contextPath}/addExam">Add Exam</a></li>
								<li><a href="${contextPath}/getAllExamApplicationList">Exam Applications</a></li>
							</ul></li>
							<li class="menu-list"><a href="#"><i class="lnr lnr-graduation-hat"></i> <span>Purchase</span></a>
							<ul class="sub-menu-list">
								<li><a href="${contextPath}/addPurchaseOrder">Purchase Order</a></li>
								
							</ul></li>
						<li class="menu-list"><a href="#"><i class="lnr lnr-database"></i> <span>Add Details</span></a>
							<ul class="sub-menu-list">
								<li><a href="${contextPath}/addBranch">Branches</a></li>
								<li><a href="${contextPath}/addSubject">Subjects</a></li>
                                <li><a href="${contextPath}/addCourse">Course</a></li>
								<li><a href="${contextPath}/addBatchTiming">Batch Time</a></li>
								<li><a href="${contextPath}/addInstrument">Instruments</a></li>
								<li><a href="${contextPath}/addInstrumentSubcategory">Instruments Subcategory</a></li>
								<li><a href="${contextPath}/addProduct">Product</a></li>
								<li><a href="${contextPath}/addGallery">Gallery</a></li>
							</ul>
						</li>
						<li><a href="${contextPath}/adminLogout"><i class="fa fa-sign-out"></i> <span>Logout</span></a></li>
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