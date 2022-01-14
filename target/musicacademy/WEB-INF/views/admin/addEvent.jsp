<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Events | A M A</title>


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
		                <form:form id="addEventForm" cssClass="form-horizontal col-md-11" modelAttribute="event" method="post" action="saveEvent" enctype="multipart/form-data">
    						<div class="row">
    										<div class="text-center"><h1><label>Create Event</label></h1></div>
			                    <div class="form-group">
			                        <div class="control-label col-md-3"> <form:label path="eventName" >Event Title</form:label> </div>
			                        <div class="col-md-7">
			                            <form:hidden path="eventId" value="${event.eventId}"/>
			                            <form:input cssClass="form-control" path="eventName" value="${event.eventName}"/>
			                        </div>
			                    </div>
			               		<div class="form-group">
				                        <label class="control-label col-md-3">Event Image</label>
				                        <div class="col-md-7">
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
								                        <input type="file" accept="image/*" name="eventImg"/> <!-- rename it -->
								                    </div>
								                </span>
								            </div><!-- /input-group image-preview [TO HERE]--> 
								       </div>
				                 </div>
				                 <div class="form-group">
			                        <div class="control-label col-md-3"> <form:label path="eventVenue" >Event Venue </form:label> </div>
			                        <div class="col-md-7">
			                            <form:input cssClass="form-control" path="eventVenue" value="${event.eventVenue}"/>
			                        </div>
			                    </div>
			                    <div class="form-group">
			                        <div class="control-label col-md-3"> <form:label path="eventDate" >Date & Time</form:label> </div>
			                        <div class="col-md-7">
			                            <form:input cssClass="form-control" id="datetimepicker1" path="eventDate" value="${event.eventDate}"/>
			                        </div>
			                    </div>
			                    <div class="form-group">
			                        <div class="control-label col-md-3"> <form:label path="eventRules" >Event Rules</form:label> </div>
			                        <div class="col-md-7">
			                            <form:textarea rows="7" cssClass="form-control" path="eventRules" value="${event.eventRules}"/>
			                        </div>
			                    </div>
			                    <div class="form-group">
			                        <div class="control-label col-md-3"> <form:label path="eventAgeCategory" >Age Category</form:label> </div>
			                        <div class="col-md-7">
			                        	<div class="col-md-4"><input id="all" class="all" type="checkbox"><label for="all">All</label></div>
			                        	<div class="col-md-4"><form:checkbox cssClass="cb" id="cb1" path="eventAgeCategory" value="PETITE - (4-7)" label="PETITE - (4-7)"/></div>
			                            <div class="col-md-4"><form:checkbox cssClass="cb" id="cb2" path="eventAgeCategory" value="JUNIOR - (8-11)" label="JUNIOR - (8-11)"/></div>
			                            <div class="col-md-4"><form:checkbox cssClass="cb" id="cb3" path="eventAgeCategory" value="TEEN - (12-14)" label="TEEN - (12-14)"/></div>
			                            <div class="col-md-4"><form:checkbox cssClass="cb" id="cb4" path="eventAgeCategory" value="SENIOR - (15-18)" label="SENIOR - (15-18)"/></div>
			                            <div class="col-md-4"><form:checkbox cssClass="cb" id="cb5" path="eventAgeCategory" value="ADULT - (19-25)" label="ADULT - (19-25)"/></div>
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
			
			<div class="inner-content">
				<!-- /blog -->
				
					<div class="tittle-head">
						<h3 class="tittle">Upcoming Events</h3>
						<div class="clearfix"> </div>
					</div>
					<!-- /music-left -->
					<div class="music-left">
					
					<c:choose>
				      <c:when test="${not empty events}">
					    	<c:forEach var="e" items="${events}">
							  <div class="post-media text-uppercase">
								  <img src="gallery/${e.eventImgName}" alt="${e.eventName}" class="img-responsive"/>
								  <div class="blog-text">
										<h3 class="h-t">${e.eventName}</h3>
								      <div class="entry-meta">
											<h6 class="btn btn-info"><i class="fa fa-clock-o">&nbsp;&nbsp;</i>${e.eventDate}</h6>&nbsp;&nbsp;&nbsp;&nbsp;
											<h6 class="btn btn-info"><i class="fa fa-map-marker">&nbsp;&nbsp;</i>${e.eventVenue}</h6>
											<div class="icons">
												<i class="fa fa-users"></i> <span class="badge">${e.applications.size()} Applied</span>
												
											</div>
												<div class="clearfix"></div>
											<p>
												${e.eventRules}
											</p>
									  </div>
								  </div>
							</div>
							</c:forEach>
						
					  </c:when>
					  <c:otherwise>
					    <div class="text-center"><h3>No Events Added...!!!</h3></div>
					  </c:otherwise>
			      </c:choose>
			      			
						
					</div>
					<!-- //music-left-->
					<!-- /music-right-->
					<div class="music-right">
						<!-- //widget -->
						  <div class="widget-side">
							<h4 class="widget-title">Events Performed</h4>
								<ul>
									<li>
										<a href="single.html">Taylor Swift – Shake It Off</a>
										<span class="post-date">Feb 13, 2016</span>
									</li>
									<li>
										<a href="single.html">Love Me Like You Do – Ellie Goulding (Fifty Shades of Grey Soundtrack) HQ</a>
										<span class="post-date">Feb 14, 2016</span>
									</li>
									<li>
										<a href="single.html">Jessie J – Flashlight (from Pitch Perfect 2)</a>
										<span class="post-date">Feb 16, 2016</span>
									</li>
									<li>
										<a href="single.html">Sol – “Ain’t Gon’ Stop”</a>
										<span class="post-date">Feb 18, 2016</span>
									</li>
									<li>
										<a href="single.html">Eminem – No Love (Explicit Version) ft. Lil Wayne</a>
										<span class="post-date">Feb 19, 2016</span>
									</li>
								</ul>
							 </div>
							 <div class="widget-side second">
							<h4 class="widget-title">Top Songs</h4>
								<ul>
									<li>
										<div class="song-img">
										  <a href="single.html"><img src="images/play1.png" class="img-responsive" alt="" /></a>
										</div>
										<div class="song-text">
											<a href="single.html">Ellie-Goulding</a>
											<span class="post-date">Feb 13, 2016</span>
										</div>
										<div class="clearfix"></div>
									</li>
									<li>
										<div class="song-img">
										  <a href="single.html"><img src="images/play2.png" class="img-responsive" alt="" /></a>
										</div>
										<div class="song-text">
											<a href="single.html">Mark-Ronson-Uptown</a>
											<span class="post-date">Feb 14, 2016</span>
										</div>
										<div class="clearfix"></div>
									</li>
									<li>
										<div class="song-img">
										  <a href="single.html"><img src="images/play4.png" class="img-responsive" alt="" /></a>
										</div>
										<div class="song-text">
											<a href="single.html">Pharrell-Williams</a>
											<span class="post-date">Feb 16, 2016</span>
										</div>
										<div class="clearfix"></div>
									</li>
									<li>
										<div class="song-img">
										  <a href="single.html"><img src="images/play5.png" class="img-responsive" alt="" /></a>
										</div>
										<div class="song-text">
											<a href="single.html">Taylor Swift – Shake It Off</a>
											<span class="post-date">Feb 18, 2016</span>
										</div>
										<div class="clearfix"></div>
									</li>
									
								</ul>
							 </div>
						  <!-- //widget -->
					</div>
					<div class="clearfix"></div>
				<!-- //blog -->
			</div>
		<div class="clearfix"></div>
	
	</div>
			<div class="clearfix"></div>
		
		<!-- All required js files -->
<%@include file="../comman_files/scriptFile.jsp"%>
<script>
$("#all").change(function(){  //"select all" change 
    var status = this.checked; // "select all" checked status
    $('.cb').each(function(){ //iterate all listed checkbox items
        this.checked = status; //change ".checkbox" checked status
    });
});
$(".cb").change(function(){  //"select all" change
	
	if($('.cb:checked').length == $('.cb').length)
		   $("#all").prop('checked', true);
	else
		    $("#all").prop('checked', false);
});


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
            alert(e.target.result);
        }        
        reader.readAsDataURL(file);
    });  
});

</script>

	<script type="text/javascript">
	$(document).ready(function() {
	    $('#datetimepicker1').datetimepicker({
	    	 format: 'DD-MMMM-YYYY hh:mm A',
	    	 defaultDate: new Date(),
	    	 //autoClose: true,
	        sideBySide: true
	     });
	});
	</script>
	
</section>

</body>
</html>