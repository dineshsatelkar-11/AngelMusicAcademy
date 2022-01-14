<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  </div>
<div class="footer">
	<div class="footer-grid">
		<h3>Navigation</h3>
		<ul class="list1">
		  <li><a href="#">Home</a></li>
		  <li><a href="#">Events</a></li>
		  <li><a href="#">About Us</a></li>
		  <li><a href="#">Gallery</a></li>
		  <li><a href="#">Instruments</a></li>
	   </ul>
	</div>
	<div class="footer-grid">
		<h3>Our Account</h3>
	    <ul class="list1">
		  <li><a href="#" data-toggle="modal" data-target="#myModal5">Your Account</a></li>
		  <li><a href="#">Personal information</a></li>
		  <li><a href="#">Addresses</a></li>
		  <li><a href="#">Discount</a></li>
		  <li><a href="#">Orders history</a></li>
		  <li><a href="#">Addresses</a></li>
		  <li><a href="#">Search Terms</a></li>
	    </ul>
	</div>
	<div class="footer-grid">
		<h3>Our Support</h3>
		<ul class="list1">
		  <li><a href="contact.html">Site Map</a></li>
		  <li><a href="#">Search Terms</a></li>
		  <li><a href="#">Advanced Search</a></li>
		  <li><a href="#">Mobile</a></li>
		  <li><a href="contact.html">Contact Us</a></li>
		  <li><a href="#">Mobile</a></li>
		  <li><a href="#">Addresses</a></li>
	    </ul>
	  </div>
		  <div class="footer-grid">
			<h3>Newsletter</h3>
			<p class="footer_desc">Nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat</p>
			<div class="search_footer">
			 <form>
			   <input type="text" placeholder="Email...." required="">
			  <input type="submit" value="Submit">
			  </form>
			</div>
		 </div>
		 <div class="footer-grid footer-grid_last">
			<h3>Contact Us</h3>
			<p class="footer_desc">Flat No:04, Sr.No.A/24, Nakoda Corner, Near Alandi Police Chowki, Vishrantwadi, Pune-14.</p>
			<p class="f_text">Phone:&nbsp;&nbsp;02030629338</p>
			<p class="f_text">Mob:&nbsp;&nbsp;9049976912 / 9762465737</p>
			<p class="email">Email : &nbsp;<span><a href="mailto:dalvir94@yahoo.com">dalvir94@yahoo.com</a></span></p>	
		 </div>
		 <div class="clearfix"> </div>
</div>

      
<footer>
	<p style="color:#1a75ff">
		&copy 2016 Angel Music Academy. All Rights Reserved | Design by <a
			href="http://www.accedesoftwaresolutions.com/">Accede Software Solutions.</a>
	</p>
</footer>
	 
	<script src="<c:url value="/resources/js/jquery.nicescroll.js"/>"></script>
	<script src="<c:url value="/resources/js/scripts.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>

   <script src="<c:url value="/resources/js/jquery-ui.js"/>"></script>
   <script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>
   <script src="<c:url value="/resources/js/dataTables.bootstrap.min.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/jquery.flexisel.js"/>"></script>	
   <script type="text/javascript" src="<c:url value="/resources/js/jquery.jplayer.min.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/jplayer.playlist.min.js"/>"></script>
   
   <script type="text/javascript" src="<c:url value="/resources/js/moment.min.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/bootstrap-datetimepicker.min.js"/>"></script> 
   
   
   
   
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
   