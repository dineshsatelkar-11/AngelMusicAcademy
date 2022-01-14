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
															  <img src="gallery/${e.eventImgName}" alt="${e.eventName}" class="img-responsive"/>
														 </div>
														<div class="banner-info">
														              <a class="trend" href="events">View Details</a>
																	  <h3>${e.eventName}</h3>
																	  <p><span><i class="fa fa-map-marker">&nbsp;&nbsp;</i>${e.eventVenue}</span></p>
														 </div>

													</li>

												</c:forEach>
											</ul>
										  </c:when>
										  <c:otherwise>
										    <div class="text-center"><h3>No Events Added...!!!</h3></div>
										  </c:otherwise>
								    </c:choose>

										</div>
										<!--banner-->
									<script src="<c:url value="/resources/js/responsiveslides.min.js"/>"></script>
									
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
								<div class="clearfix"> </div>
							</div>
						</div>	
				<!--//End-banner-->
					<!--albums-->
					<!-- pop-up-box --> 
							<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all">
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
					<!--//pop-up-box -->
<!-- 						<div class="albums"> -->
<!-- 							<div class="tittle-head"> -->
<!-- 								<h3 class="tittle">ABOUT MUSIC ASSOCIATION OF INDIA</span></h3> -->
								
<!-- 								<div class="clearfix"> </div> -->
<!-- 							</div> -->
<!-- 							<h3> -->
<!-- 							   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Music association of India from 2010 are a popular organization in the industry for wholesaler, trader and retailer a wide variety of Bongo Drum, Conga Drum, Musical Flute, Electric Guitar, Tabla Jodi, Musical Tambourine, Musical Harmonium, Musical Violin, Musical Synthesizers and Drum Set.</h3> -->
<!-- 							<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We are service provider of Training Service. Music association of India is helping the students who are having financial problems and also started to serve free for Medically handcrafted even also they are making stage availability for those students because of this they can reach their goals easily -->
<!-- 							</h3> -->
<!-- 						</div> -->
					<!--//End-albums-->
						<!--//discover-view-->
				
					</div>
					<!--//music-left-->
<!-- 			             <div class="music-right"> -->
<!-- 								/video-main -->
<!-- 								 <div class="video-main"> -->
<!-- 									<div class="video-record-list"> -->
<!-- 										<div id="jp_container_1" class="jp-video jp-video-270p" role="application" aria-label="media player"> -->
<!-- 											<div class="jp-type-playlist"> -->
<!-- 												<div id="jquery_jplayer_1" class="jp-jplayer" style="width: 480px; height: 270px;"><img id="jp_poster_0" src="gallery/play1.png" style="width: 480px; height: 270px; display: inline;"><video id="jp_video_0" preload="metadata" src="gallery/Mark-Ronson-Uptown.webm" title="1. Ellie-Goulding" style="width: 0px; height: 0px;"></video></div> -->
<!-- 												<div class="jp-gui"> -->
<!-- 													<div class="jp-video-play" style="display: block;"> -->
<!-- 														<button class="jp-video-play-icon" role="button" tabindex="0">play</button> -->
<!-- 													</div> -->
<!-- 													<div class="jp-interface"> -->
<!-- 														<div class="jp-progress"> -->
<!-- 															<div class="jp-seek-bar" style="width: 100%;"> -->
<!-- 																<div class="jp-play-bar" style="width: 0%;"></div> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="jp-current-time" role="timer" aria-label="time">00:00</div> -->
<!-- 														<div class="jp-duration" role="timer" aria-label="duration">00:18</div> -->
<!-- 														<div class="jp-controls-holder"> -->
<!-- 															<div class="jp-controls"> -->
<!-- 																<button class="jp-previous" role="button" tabindex="0">previous</button> -->
<!-- 																<button class="jp-play" role="button" tabindex="0">play</button> -->
<!-- 															</div> -->
<!-- 															<div class="jp-volume-controls"> -->
<!-- 																<button class="jp-mute" role="button" tabindex="0">mute</button> -->
<!-- 																<button class="jp-volume-max" role="button" tabindex="0">max volume</button> -->
<!-- 																<div class="jp-volume-bar"> -->
<!-- 																	<div class="jp-volume-bar-value" style="width: 100%;"></div> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="jp-toggles"> -->
															
<!-- 																<button class="jp-full-screen" role="button" tabindex="0">full screen</button> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="jp-details" style="display: none;"> -->
<!-- 															<div class="jp-title" aria-label="title">1. Ellie-Goulding</div> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="jp-playlist"> -->
<!-- 													<ul style="display: block;"><li class="jp-playlist-current"><div><a href="javascript:;" class="jp-playlist-item-remove" style="display: none;">�</a><a href="javascript:;" class="jp-playlist-item jp-playlist-current" tabindex="0">1. Ellie-Goulding <span class="jp-artist">by Pixar</span></a></div></li><li><div><a href="javascript:;" class="jp-playlist-item-remove" style="display: none;">�</a><a href="javascript:;" class="jp-playlist-item" tabindex="0">2. Mark-Ronson-Uptown <span class="jp-artist">by Pixar</span></a></div></li><li><div><a href="javascript:;" class="jp-playlist-item-remove" style="display: none;">�</a><a href="javascript:;" class="jp-playlist-item" tabindex="0">3. Ellie-Goulding <span class="jp-artist">by Pixar</span></a></div></li><li><div><a href="javascript:;" class="jp-playlist-item-remove" style="display: none;">�</a><a href="javascript:;" class="jp-playlist-item" tabindex="0">4. Maroon-Sugar <span class="jp-artist">by Pixar</span></a></div></li><li><div><a href="javascript:;" class="jp-playlist-item-remove" style="display: none;">�</a><a href="javascript:;" class="jp-playlist-item" tabindex="0">5. Pharrell-Williams <span class="jp-artist">by Pixar</span></a></div></li><li><div><a href="javascript:;" class="jp-playlist-item-remove" style="display: none;">�</a><a href="javascript:;" class="jp-playlist-item" tabindex="0">6. Ellie-Goulding <span class="jp-artist">by Pixar</span></a></div></li><li><div><a href="javascript:;" class="jp-playlist-item-remove" style="display: none;">�</a><a href="javascript:;" class="jp-playlist-item" tabindex="0">7. Pharrell-Williams <span class="jp-artist">by Pixar</span></a></div></li></ul> -->
<!-- 												</div> -->
<!-- 												<div class="jp-no-solution" style="display: none;"> -->
<!-- 													<span>Update Required</span> -->
<!-- 													To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>. -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								script for play-list -->
			
<!-- 				<script type="text/javascript"> -->
// 				//<![CDATA[
// 				$(document).ready(function(){

// 					new jPlayerPlaylist({
// 						jPlayer: "#jquery_jplayer_1",
// 						cssSelectorAncestor: "#jp_container_1"
// 					}, [
						
// 						{
// 							title:"1. Ellie-Goulding",
// 							artist:"",
// 							mp4: "gallery/Mark-Ronson-Uptown.webm",
// 							ogv: "gallery/Ellie-Goulding.ogv",
// 							webmv: "gallery/Ellie-Goulding.webm",
// 							poster:"gallery/play1.png"
// 						},
// 						{
// 							title:"2. Mark-Ronson-Uptown",
// 							artist:"",
// 							mp4: "gallery/Mark-Ronson-Uptown.mp4",
// 							ogv: "gallery/Mark-Ronson-Uptown.ogv",
// 							webmv: "gallery/Mark-Ronson-Uptown.webm",
// 							poster:"gallery/play2.png"
// 						},
// 						{
// 							title:"3. Ellie-Goulding",
// 							artist:"",
// 							mp4: "gallery/Ellie-Goulding.mp4",
// 							ogv: "gallery/Ellie-Goulding.ogv",
// 							webmv: "gallery/Ellie-Goulding.webm",
// 							poster:"gallery/play1.png"
// 						},
// 						{
// 							title:"4. Maroon-Sugar",
// 							artist:"",
// 							mp4: "gallery/Maroon-Sugar.mp4",
// 							ogv: "gallery/Maroon-Sugar.ogv",
// 							webmv: "gallery/Maroon-Sugar.webm",
// 							poster:"gallery/play4.png"
// 						},
// 						{
// 							title:"5. Pharrell-Williams",
// 							artist:"",
// 							mp4: "gallery/Pharrell-Williams.mp4",
// 							ogv: "gallery/Pharrell-Williams.ogv",
// 							webmv: "gallery/Pharrell-Williams.webm",
// 							poster:"gallery/play5.png"
// 						},
// 						{
// 							title:"6. Ellie-Goulding",
// 							artist:"",
// 							mp4: "gallery/Ellie-Goulding.mp4",
// 							ogv: "gallery/Ellie-Goulding.ogv",
// 							webmv: "gallery/Ellie-Goulding.webm",
// 							poster:"gallery/play1.png"
// 						},
// 						{
// 							title:"7. Pharrell-Williams",
// 							artist:"",
// 							mp4: "gallery/Pharrell-Williams.mp4",
// 							ogv: "gallery/Pharrell-Williams.ogv",
// 							webmv: "gallery/Pharrell-Williams.webm",
// 							poster:"gallery/play5.png"
// 						}
// 					], {
// 						swfPath: "../../dist/jplayer",
// 						supplied: "webmv,ogv,mp4",
// 						useStateClassSkin: true,
// 						autoBlur: false,
// 						smoothPlayBar: true,
// 						keyEnabled: true
// 					});

// 				});
// 				//]]>
<!-- 					</script> -->
<!-- 			<!-- //script for play-list --> -->

<!-- 								//video-main -->
<!-- 								<br> -->
<!-- 						         /start-paricing-tables -->
<!-- 									<div class="price-section"> -->
<!-- 											<div class="pricing-inner"> -->
<!-- 												<h3 class="hd-tittle">Offers</h3> -->
<!-- 												<div class="pricing"> -->
<!-- 													<div class="price-top"> -->
<!-- 														<h3><span>$20</span></h3> -->
<!-- 														<h4>per year</h4> -->
<!-- 													</div> -->
<!-- 													<div class="price-bottom"> -->
<!-- 														<ul> -->
<!-- 															<li><a class="icon" href="#"><i class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">Download unlimited songs</a><div class="clearfix"></div></li> -->
<!-- 															<li><a class="icon" href="#"><i class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">Stream songs in High Definition</a><div class="clearfix"></div></li> -->
<!-- 															<li><a class="icon" href="#"><i class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">No ads unlimited Devices</a><div class="clearfix"></div></li> -->
<!-- 															<li><a class="icon" href="#"><i class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">Stream songs in High Definition</a><div class="clearfix"></div></li> -->
<!-- 														</ul> -->
<!-- 														<a href="#" class="price">Upgrade</a> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="pricing two"> -->
<!-- 													<div class="price-top"> -->
<!-- 														<h3><span>$30</span></h3> -->
<!-- 														<h4>per year</h4> -->
<!-- 													</div> -->
<!-- 													<div class="price-bottom"> -->
<!-- 														<ul> -->
<!-- 															<li><a class="icon" href="#"><i class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">Download unlimited songs</a><div class="clearfix"></div></li> -->
<!-- 															<li><a class="icon" href="#"><i class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">Stream songs in High Definition</a><div class="clearfix"></div></li> -->
<!-- 															<li><a class="icon" href="#"><i class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">No ads unlimited Devices</a><div class="clearfix"></div></li> -->
<!-- 															<li><a class="icon" href="#"><i class="glyphicon glyphicon-ok"></i></a><a class="text" href="#">Stream songs in High Definition</a><div class="clearfix"></div></li> -->
<!-- 														</ul> -->
<!-- 														<a href="#" class="price">Upgrade</a> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 													<div class="clearfix"></div> -->
<!-- 												</div> -->
<!-- 												//end-pricing-tables -->
<!-- 												</div> -->
<!-- 											</div> -->
													 <!--//music-right-->
											<div class="clearfix"></div>
					<div class="clearfix"></div>
        		</div> <!-- ./container -->
			</div>
		<!--body wrapper start-->
			<div class="review-slider">
								<div class="tittle-head">
									<h3 class="tittle">Instruments </h3>
									<div class="clearfix"> </div>
								</div>
								
								 <c:choose>
								      <c:when test="${not empty instruments}">
									    <ul id="flexiselDemo1">
											<c:forEach var="instrument" items="${instruments}">
												<li>
													<a href="single.html"><img src="instruments/${instrument.instrumentImgName}" alt="${instrument.instrumentName}"/></a>
													<div class="slide-title"><h4>${instrument.instrumentName}</h4> </div>
													<div class="date-city">
														<div class="buy-tickets">
															<a href="single.html">READ MORE</a>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									  </c:when>
									  <c:otherwise>
									    <div class="text-center"><h3>No Instrument Added...!!!</h3></div>
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