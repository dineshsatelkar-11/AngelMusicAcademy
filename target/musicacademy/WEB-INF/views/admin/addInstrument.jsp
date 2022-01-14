<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Instruments | A M A</title>


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
		                <form:form id="addInstrumentForm" cssClass="form-horizontal col-md-12" modelAttribute="instrument" method="post" action="saveInstrument" enctype="multipart/form-data">
    						<div class="row">
    						<div class="col-md-6">
			                    <div class="form-group">
			                        <div class="control-label col-md-4"> <form:label path="instrumentName" >Instrument Name</form:label> </div>
			                        <div class="col-md-8">
			                            <form:hidden path="instrumentId" value="${instrument.instrumentId}"/>
			                            <form:input cssClass="form-control" path="instrumentName" value="${instrument.instrumentName}"/>
			                        </div>
			                    </div>
			                    <div class="form-group">
			                        <form:label path="instrumentDescription" cssClass="control-label col-md-4">Instrument Description</form:label>
			                        <div class="col-md-8">
			                            <form:textarea rows="7" cssClass="form-control" path="instrumentDescription" value="${instrument.instrumentDescription}"/>
			                        </div>
			                    </div>
		                    </div>
		                    <div class="col-md-6 text-center">
			    				<div class="form-group">
				                        <label>Instrument Image</label>
				                        <div class="col-md-10 col-md-offset-1">
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
								                        <input type="file" accept="image/png, image/jpeg, image/gif" name="instrumentImage"/> <!-- rename it -->
								                    </div>
								                </span>
								            </div><!-- /input-group image-preview [TO HERE]--> 
				                       </div>
				                 </div>
           		             </div>
           		             </div>              
		                    <div class="form-group"><br/><br/>
		                        <div class="row">
		                            <div class="col-xs-3 col-xs-offset-3">
		                            	<input type="submit" id="saveInstrument" class="btn btn-success btn-block" value="Add"/>
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
						<!--body wrapper end-->
	</div>
			<div class="clearfix"></div>
		
		<!-- All required js files -->
<%@include file="../comman_files/scriptFile.jsp"%>

		<!--body wrapper end-->
		
	</section>

</body>
</html>