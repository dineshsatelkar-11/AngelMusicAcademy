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
</head>
<!-- /w3layouts-agile -->
<body class="sticky-header left-side-collapsed" onload="initMap()">
 <c:if test="${not empty eventno}">
<script>
    window.open("EventHallTicket/${eventno}");
</script>
</c:if>
	<section>
			
		<!-- Admin Left sidebar and header -->
	<%@include file="../comman_files/userHeaderFile.jsp"%>
       
			<div id="page-wrapper">
				<div class="inner-content">
					<div class="container">
		                <div class="music-left">
					<div class="tittle-head">
						<h3 class="tittle">Upcoming Events</h3>
						<div class="clearfix"></div>
					</div>
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
												<a href="<c:url value='applyForEvent/${e.eventId}'/>" class="btn btn-success btn-block">Apply</a>
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
        		</div> <!-- ./container -->
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
	        sideBySide: true
	     });
	});
	</script>
	
</section>

</body>
</html>