<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Contact Us | A M A</title>


<!-- All required css files -->
<%@include file="comman_files/csslinks.jsp"%>

</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
	<section>
			

		<%@include file="comman_files/nullSessionHeaderFile.jsp"%>

			<div id="page-wrapper">
							
								<div class="inner-content">
								<div class="tittle-head">
											<h3 class="tittle">Find Us </h3>
											<div class="clearfix"> </div>
										</div>
									<!-- /contact-->
									<div class="contact">
									 <div class="contact-left">
										<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d555.7442289158719!2d73.87784062271987!3d18.572847905644092!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c0d2394303db%3A0x3401d1d210fe99e0!2sAngel+Music+Classes!5e0!3m2!1sen!2sin!4v1477560983877" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>

									</div>
									<div class="contact-right">
 									
										<p class="phn">02030629338 / 9049976912 / 9762465737</p>
										<p class="phn-bottom">
										<p class="phn">Vishrantwadi Branch</p>
										      <span>Flat No:04, Sr.No.A/24,<br>
												    Nakoda Corner, Near Alandi Police Chowki,<br>
										 			Vishrantwadi, Pune-14.
										 	  </span>
										 </p>
										 <p class="phn-bottom">
										 <p class="phn">Chinchwad Branch</p>
										      <span>Shop No. 36,kakade Corner,<br>
												    Juna Jakat Naka,Below Indian Overseas Bank,<br>
										 			Chinchwad, Pune-33.
										 	  </span>
										 </p>
									</div>
									<div class="clearfix"> </div>
									<div class="contact-left1" style="margin-left: 240px;">
										<h3 style="margin-left: 95px;">Contact Us With <span>Any questions</span></h3>
										<div class="in-left">
										<form action="#" method="post">
												<p class="your-para">Your Name :</p>
														<input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" required="">
											
														<p class="your-para">Your Mail :</p>
														<input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" required="">
														<p class="your-para">Phone Number:</p>
														<input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" required="">

											</form>
										</div>
										<div class="in-right">
											<form>
												<textarea placeholder="" onfocus="this.value='';" onblur="if (this.value == '') {this.value = '';}" required=""></textarea>
												<input type="submit" value="Submit">
											</form>
										</div>
										<div class="clearfix"> </div>
									</div>
<!-- 													<div class="contact-right1"> -->
<!-- 														<h3><span>Title </span></h3> -->
<!-- 														<h4>I hope you enjoy browsing our website, a comprehensive and colourful resource for both current and prospective pupils and parents. Our musical life is vibrant and ambitious - rich in diversity and outstanding in quality and we aim to reflect</h4> -->
<!-- 															 <ul class=" side-icons con"> -->
<!-- 																		<li><a class="fb" href="#"></a></li> -->
<!-- 																		<li><a class="twitt" href="#"></a></li> -->
<!-- 																		<li><a class="goog" href="#"></a></li> -->
<!-- 																		<li><a class="drib" href="#"></a></li> -->
<!-- 																   </ul> -->
<!-- 													</div> -->
													<div class="clearfix"> </div>
											<!-- //contact -->
											 	 <!-- /wthree-agile -->
														</div>
								</div>
							<div class="clearfix"></div>
						<!--body wrapper end-->

					</div>
			  <!--body wrapper end-->
<%@include file="comman_files/scriptFile.jsp"%>

		<!--body wrapper end-->
		
	</section>

</body>
</html>