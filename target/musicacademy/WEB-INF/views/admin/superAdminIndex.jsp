<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin Home | A M A</title>


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
				<div class="music-left">
					<!--banner-section-->
					<div class="banner-section">
						<div class="banner">
							<div class="callbacks_container">
								<c:choose>
									<c:when test="${not empty events}">
										<ul class="rslides callbacks callbacks1" id="slider4">
											<c:forEach var="e" items="${events}">
												<li>
													<div class="banner-img">
														<img src="gallery/${e.eventImgName}" alt="${e.eventName}"
															class="img-responsive" />
													</div>
													<div class="banner-info">
														<a class="trend" href="events">View Details</a>
														<h3>${e.eventName}</h3>
														<p>
															<span><i class="fa fa-map-marker">&nbsp;&nbsp;</i>${e.eventVenue}</span>
														</p>
													</div>

												</li>

											</c:forEach>
										</ul>
									</c:when>
									<c:otherwise>
										<div class="text-center">
											<h3>No Events Added...!!!</h3>
										</div>
									</c:otherwise>
								</c:choose>

							</div>
							<!--banner-->
							<script
								src="<c:url value="/resources/js/responsiveslides.min.js"/>"></script>

							<script>
									// You can also use "$(window).load(function() {"
									$(function () {
									  // Slideshow 4
									  $("#slider4").responsiveSlides({
										auto: true,
										pager:true,
										nav:true,
										speed: 500,
										namespace: "callbacks",
										before: function () {
										  $('.events').append("<li>before event fired.</li>");
										},
										after: function () {
										  $('.events').append("<li>after event fired.</li>");
										}
									  });
								
									});
								  </script>
							<div class="clearfix"></div>
						</div>
					</div>
					<!--//End-banner-->
					<!--albums-->
					<!-- pop-up-box -->
					<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
						media="all">
					<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
					<script>
									$(document).ready(function() {
									$('.popup-with-zoom-anim').magnificPopup({
										type: 'inline',
										fixedContentPos: false,
										fixedBgPos: true,
										overflowY: 'auto',
										closeBtnInside: true,
										preloader: false,
										midClick: true,
										removalDelay: 300,
										mainClass: 'my-mfp-zoom-in'
									});
									});
							</script>
					

				</div>
				<!--//music-left-->
				<div class="music-right">
					<!--/video-main-->
					<!-- 								 
								<br>
						         <!--/start-paricing-tables-->
					<div class="price-section">
						<div class="pricing-inner">
							<div class="pricing">
								<div class="price-top">
									<h3>
										<span>Offers</span>
									</h3>
								</div>
								<div class="price-bottom">
									<ul>
										<li><a class="icon" href="#"><i
												class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">Register Today & get 10% Off</a>
										<div class="clearfix"></div></li>
										<li><a class="icon" href="#"><i
												class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">20% Off on participation fees for our Events</a>
										<div class="clearfix"></div></li>
										<li><a class="icon" href="#"><i
												class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">Get Certification on any of our Exams</a>
										<div class="clearfix"></div></li>
<!-- 										<li><a class="icon" href="#"><i -->
<!-- 												class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">Offer-4</a> -->
<!-- 										<div class="clearfix"></div></li> -->
<!-- 										<li><a class="icon" href="#"><i -->
<!-- 												class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">Offer-3</a> -->
<!-- 										<div class="clearfix"></div></li> -->

									</ul>
								</div>
							</div>
<!-- 							<div class="pricing two"> -->
<!-- 								<div class="price-top"> -->
<!-- 									<h3> -->
<!-- 										<span>MTTS</span> -->
<!-- 									</h3> -->
<!-- 								</div> -->
<!-- 								<div class="price-bottom"> -->
<!-- 									<ul> -->
<!-- 										<li><a class="icon" href="#"><i -->
<!-- 												class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">MTTS-1</a> -->
<!-- 										<div class="clearfix"></div></li> -->
<!-- 										<li><a class="icon" href="#"><i -->
<!-- 												class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">MTTS-2</a> -->
<!-- 										<div class="clearfix"></div></li> -->
<!-- 										<li><a class="icon" href="#"><i -->
<!-- 												class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">MTTS-3</a> -->
<!-- 										<div class="clearfix"></div></li> -->
<!-- 										<li><a class="icon" href="#"><i -->
<!-- 												class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">MTTS-4</a> -->
<!-- 										<div class="clearfix"></div></li> -->
<!-- 										<li><a class="icon" href="#"><i -->
<!-- 												class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">MTTS-3</a> -->
<!-- 										<div class="clearfix"></div></li> -->

<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="clearfix"></div>
						</div>
						<!--//end-pricing-tables-->
					</div>
				</div>
				
			</div>
<!-- 			<div class="row" style="margin-top: 51px;"> -->
<!-- 					<div class="col-xs-3" style="padding:2px"> -->
<!-- 						<div class="panel panel-success "> -->
<!-- 							  <div class="panel-heading text-center text-bold">AT MUSIC ASSOCIATION OF INDIA</div> -->
<!-- 							  <div class="panel-body"> -->
<!-- 								<p style="color: #479ACF;font-size: 16px;text-align: justify;text-justify: inter-word;">I hope you enjoy browsing our website, a comprehensive and colourful resource for both current and prospective pupils and parents. Our musical life is vibrant and ambitious - rich in diversity and outstanding in quality and we aim to reflect something of these flavours on our website.</p> -->
<!-- 						      </div> -->
<!-- 						</div> -->
<!-- 						<div class="panel panel-success "> -->
<!-- 							  <div class="panel-heading text-center text-bold">WE OFFER LESSONS IN</div> -->
<!-- 							  <div class="panel-body text-danger"> -->
<!-- 								<ul class="lessons" style="list-style-type: none;"> -->
<!-- 									<li> &#10004;&nbsp;&nbsp;&nbsp;Harmonium</li> -->
<!-- 									<li> &#10004;&nbsp;&nbsp;&nbsp;Vocal</li> -->
<!-- 									<li> &#10004;&nbsp;&nbsp;&nbsp;Tabla</li> -->
<!-- 									<li> &#10004;&nbsp;&nbsp;&nbsp;Drumset and Guitar</li> -->
<!-- 									<li> &#10004;&nbsp;&nbsp;&nbsp;Saxphone,Trumpet,Bugle</li> -->
<!-- 									<li> &#10004;&nbsp;&nbsp;&nbsp;Flute,Keyboard,Violin</li> -->
<!-- 									<li> &#10004;&nbsp;&nbsp;&nbsp;cornett,Bass Drum</li> -->
<!-- 									<li> &#10004;&nbsp;&nbsp;&nbsp;Side Drum, MTTC</li> -->
<!-- 									<li> &#10004;&nbsp;&nbsp;&nbsp;classical singing and drum kit</li> -->
<!-- 								 </ul> -->
<!-- 						      </div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-xs-6" style="padding:2px"> -->
<!-- 						<div class="panel panel-success "> -->
<!-- 							  <div class="panel-heading text-center text-red text-bold">OUR STAFF</div> -->
<!-- 							  <div class="panel-body"> -->
<!-- 							  	<p style="font-size: 16px;color:Black;text-align: justify; ">MUSIC ASSOCIATION OF INDIA  provides a challenging academic program follows the traditional Indian Gurukula form of Indian classical music pedagogy to teach varied genres of music from across the globe. The Academy seeks to provide music education that builds character and personality, preparing students to enter the music industry as performers, arrangers, songwriters, composers, producers, teachers and more.</p> -->
<%-- 							  	<img style="height: 411px; margin-top: 12px;margin-bottom: 12px;" src="<c:url value="/resources/keys.png"/>" alt=""/> --%>
<!-- 							  	<p style="font-size: 16px;color:Black;text-align: justify; ">With the knowledge, experience, and expertise of over 20 qualified graduate, master and doctoral teachers, the Music Academy provides a rich assortment of musical programs and activities using innovative teaching tools, various curriculums for our students, and tools to help parents at home. -->
<!-- 							  </div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-xs-3" style="padding:2px"> -->
<!-- 						<div class="panel panel-success "> -->
<!-- 							  <div class="panel-heading text-bold">MORE INFORMATION</div> -->
<!-- 							  <div class="panel-body"> -->
<!-- 								    <p style="color: #479ACF;font-size: 16px;text-align: justify;text-justify: inter-word;">Welcome to the music association of India. Our goal is to inspire musicians from all walks of life with encouragement and care. </p> -->
<!-- 									<p style="color: #479ACF;font-size: 16px;text-align: justify;text-justify: inter-word;">Whether you are a beginner looking to start a dedicated journey into music, or a hobbyist broadening your horizons, we aim to cater to your musical desires with a fun, smart, safe, and educated approach to music.</p> -->
<!-- 									<p style="color: #479ACF;font-size: 16px;text-align: justify;text-justify: inter-word;">We accept students of all ages, ability levels and needs, from toddler to adult, beginner to advanced musician. </p> -->
<!-- 									<p style="color: #479ACF;font-size: 16px;text-align: justify;text-justify: inter-word;">We are here to educate, motivate, and mentor you every step of the way. Let us help you learn the joy of music!</p> -->
<!-- 							  </div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			<!-- ./container -->
		</div>
		<!--body wrapper start-->
		<div class="review-slider">
			<div class="tittle-head">
				<h3 class="tittle">Instruments</h3>
				<div class="clearfix"></div>
			</div>

			<c:choose>
				<c:when test="${not empty instruments}">
					<ul id="flexiselDemo1">
						<c:forEach var="instrument" items="${instruments}">
							<li><a href="single.html"><img
									src="instruments/${instrument.instrumentImgName}"
									alt="${instrument.instrumentName}" /></a>
								<div class="slide-title">
									<h4>${instrument.instrumentName}</h4>
								</div>
								<div class="date-city">
									<div class="buy-tickets">
										<a href="single.html">READ MORE</a>
									</div>
								</div></li>
						</c:forEach>
					</ul>
				</c:when>
				<c:otherwise>
					<div class="text-center">
						<h3>No Instrument Added...!!!</h3>
					</div>
				</c:otherwise>
			</c:choose>

			<script type="text/javascript">
						$(window).load(function() {
							
						  $("#flexiselDemo1").flexisel({
								visibleItems: 5,
								animationSpeed: 1000,
								autoPlay: true,
								autoPlaySpeed: 3000,    		
								pauseOnHover: false,
								enableResponsiveBreakpoints: true,
								responsiveBreakpoints: { 
									portrait: { 
										changePoint:480,
										visibleItems: 2
									}, 
									landscape: { 
										changePoint:640,
										visibleItems: 3
									},
									tablet: { 
										changePoint:800,
										visibleItems: 4
									}
								}
							});
							});
						</script>

		</div>
	</div>
	<div class="clearfix"></div>	
		<!-- All required js files -->
<%@include file="../comman_files/scriptFile.jsp"%>
		<!--body wrapper end-->
		
	</section>


</body>
</html>