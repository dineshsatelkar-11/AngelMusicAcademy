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
<%@include file="../comman_files/csslinks.jsp"%>
<style>
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
		                <form:form id="addGalleryForm" cssClass="form-horizontal col-md-11" modelAttribute="photosVideo" method="post" action="saveGallery" enctype="multipart/form-data">
    						<div class="row">
    						
			                    <div class="form-group">
			                        <div class="control-label col-md-3"> <form:label path="name" > Name</form:label> </div>
			                        <div class="col-md-8">
			                            <form:hidden path="galleryId" value="${photosVideo.galleryId}"/>
			                            <form:input cssClass="form-control" path="name" value="${photosVideo.name}"/>
			                        </div>
			                    </div>
			               		<div class="form-group">
				                        <label class="control-label col-md-3">Image / Video</label>
				                        <div class="col-md-8">
				                            <div class="input-group image-preview">
								                <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
								                <span class="input-group-btn">
								                    <!-- image-preview-clear button -->
								                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
								                        <span class="glyphicon glyphicon-remove"></span> Clear
								                    </button>
								                    <!-- image-preview-input -->
								                    <div class="btn btn-default image-preview-input">
								                        <span class="glyphicon glyphicon-folder-open"></span>
								                        <span class="image-preview-input-title">Browse</span>
								                        <input type="file" accept="image/*,video/*" name="photoVideo"/> <!-- rename it -->
								                    </div>
								                </span>
								            </div><!-- /input-group image-preview [TO HERE]--> 
								       </div>
				                 </div>
           		             </div>    
		                    <div class="form-group"><br/><br/>
		                        <div class="row">
		                            <div class="col-xs-3 col-xs-offset-3">
		                            	<input type="submit" class="btn btn-success btn-block" value="Add"/>
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
		<!--//discover-view-->
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
											<a href="single.html"><img src="gallery/${photosVideo.fileName}" alt="${photosVideo.name}"/></a>
											<div class="inner-info"><h5>${photosVideo.name}</h5></div>
										</div>
								</c:if>
								</c:forEach>
								
						  </c:when>
						  <c:otherwise>
						    <div class="text-center"><h3>No Instrument Added...!!!</h3></div>
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
											<a href="single.html"><img src="gallery/${photosVideo.fileName}" alt="${photosVideo.name}"/></a>
											<div class="inner-info"><h5>${photosVideo.name}</h5></div>
										</div>
								</c:if>
								</c:forEach>
								
						  </c:when>
						  <c:otherwise>
						    <div class="text-center"><h3>No Instrument Added...!!!</h3></div>
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
						<!--body wrapper end-->
	</div>
			<div class="clearfix"></div>
		
		<!-- All required js files -->
<%@include file="../comman_files/scriptFile.jsp"%>
<script>
$(document).on('click', '#close-preview', function(){ 
    $('.image-preview').popover('hide');
    // Hover befor close the preview
    $('.image-preview').hover(
        function () {
           $('.image-preview').popover('show');
        }, 
         function () {
           $('.image-preview').popover('hide');
        }
    );    
});

$(function() {
    // Create the close button
    var closebtn = $('<button/>', {
        type:"button",
        text: 'x',
        id: 'close-preview',
        style: 'font-size: initial;',
    });
    closebtn.attr("class","close pull-right");
    // Set the popover default content
    $('.image-preview').popover({
        trigger:'manual',
        html:true,
        title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
        content: "There's no image",
        placement:'bottom'
    });
    // Clear event
    $('.image-preview-clear').click(function(){
        $('.image-preview').attr("data-content","").popover('hide');
        $('.image-preview-filename').val("");
        $('.image-preview-clear').hide();
        $('.image-preview-input input:file').val("");
        $(".image-preview-input-title").text("Browse"); 
    }); 
    // Create the preview image
    $(".image-preview-input input:file").change(function (){     
        var img = $('<img/>', {
            id: 'dynamic',
            width:250,
            height:200
        });      
        var file = this.files[0];
        var reader = new FileReader();
        // Set preview image into the popover data-content
        reader.onload = function (e) {
            $(".image-preview-input-title").text("Change");
            $(".image-preview-clear").show();
            $(".image-preview-filename").val(file.name);            
            img.attr('src', e.target.result);
            $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
        }        
        reader.readAsDataURL(file);
    });  
});
</script>
		<!--body wrapper end-->
		
	</section>

</body>
</html>