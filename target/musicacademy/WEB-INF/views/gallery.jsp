<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Gallery | A M A</title>


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
		                		<div class="row">
			<div class="albums fourth">
					<div class="tittle-head two">
						<h3 class="tittle">Photos</h3>
						<div class="clearfix"> </div>
					</div>
					<c:choose>
					      <c:when test="${not empty photosVideos}">
						   
								<c:forEach var="photosVideo" items="${photosVideos}">
								
								<c:if test="${fn:startsWith(photosVideo.type, 'image')}">
										<div class="col-md-3 artist-grid">
											<a href="single.html"><img src="${photosVideo.fileName}" alt="${photosVideo.name}"/></a>
											<div class="inner-info"><h5>${photosVideo.name}</h5></div>
										</div>
								</c:if>
								</c:forEach>
								
						  </c:when>
						  <c:otherwise>
						    <div class="text-center"><h3>No Photos Added...!!!</h3></div>
						  </c:otherwise>
				    </c:choose>
						<!--/music-right-->
						   
				<!--//discover-view-->
			</div>
		</div>
		<div class="row">
			<div class="albums fourth">
					<div class="tittle-head two">
						<h3 class="tittle">Videos</h3>
						<div class="clearfix"> </div>
					</div>
					<c:choose>
					      <c:when test="${not empty photosVideos}">
						   
								<c:forEach var="photosVideo" items="${photosVideos}">
								
								<c:if test="${fn:startsWith(photosVideo.type, 'video')}">
										<div class="col-md-3 artist-grid">
											<a href="single.html"><img src="${photosVideo.fileName}" alt="${photosVideo.name}"/></a>
											<div class="inner-info"><h5>${photosVideo.name}</h5></div>
										</div>
								</c:if>
								</c:forEach>
								
						  </c:when>
						  <c:otherwise>
						    <div class="text-center"><h3>No Videos Added...!!!</h3></div>
						  </c:otherwise>
				    </c:choose>
						<!--/music-right-->
						   <div class="music-right">
								
								 <div class="video-main">
									<div class="video-record-list">
										<div id="jp_container_1" class="jp-video jp-video-270p" role="application" aria-label="media player">
											<div class="jp-type-playlist">
												<div id="jquery_jplayer_1" class="jp-jplayer" style="width: 480px; height: 270px;"><img id="jp_poster_0" src="video/play1.png" style="width: 480px; height: 270px; display: inline;"><video id="jp_video_0" preload="metadata" src="<c:url value="/gallery/Ellie-Goulding.mp4"/>" title="1. Ellie-Goulding" style="width: 0px; height: 0px;"></video></div>
												<div class="jp-gui">
													<div class="jp-video-play" style="display: block;">
														<button class="jp-video-play-icon" role="button" tabindex="0">play</button>
													</div>
													<div class="jp-interface">
														<div class="jp-progress">
															<div class="jp-seek-bar" style="width: 100%;">
																<div class="jp-play-bar" style="width: 0%;"></div>
															</div>
														</div>
														<div class="jp-current-time" role="timer" aria-label="time">00:00</div>
														<div class="jp-duration" role="timer" aria-label="duration">00:18</div>
														<div class="jp-controls-holder">
															<div class="jp-controls">
																<button class="jp-previous" role="button" tabindex="0">previous</button>
																<button class="jp-play" role="button" tabindex="0">play</button>
															</div>
															<div class="jp-volume-controls">
																<button class="jp-mute" role="button" tabindex="0">mute</button>
																<button class="jp-volume-max" role="button" tabindex="0">max volume</button>
																<div class="jp-volume-bar">
																	<div class="jp-volume-bar-value" style="width: 100%;"></div>
																</div>
															</div>
															<div class="jp-toggles">
															
																<button class="jp-full-screen" role="button" tabindex="0">full screen</button>
															</div>
														</div>
														<div class="jp-details" style="display: none;">
															<div class="jp-title" aria-label="title">1. Ellie-Goulding</div>
														</div>
													</div>
												</div>
												
											</div>
										</div>
									</div>
								</div>
								
				<script type="text/javascript">
				//<![CDATA[
				$(document).ready(function(){
					var path = "\"<c:url value="/gallery/Ellie-Goulding.mp4"/>\"";
					new jPlayerPlaylist({
						jPlayer: "#jquery_jplayer_1",
						cssSelectorAncestor: "#jp_container_1"
					}, [
						
						{
							title:"1. Ellie-Goulding",
							artist:"",
							mp4: "<c:url value="/gallery/Ellie-Goulding.mp4"/>"
						}
					], {
						swfPath: "../../dist/jplayer",
						supplied: "webmv,ogv,mp4",
						useStateClassSkin: true,
						autoBlur: false,
						smoothPlayBar: true,
						keyEnabled: true
					});

				});
				//]]>
					</script>
				
					</div>
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