<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Mosaic Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<!-- Bootstrap Core CSS -->
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet" media="all">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" media="all">
<link href="<c:url value="/resources/css/dataTables.bootstrap.min.css"/>" rel="stylesheet" media="all">

<!-- Custom CSS -->
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

<!-- Graph CSS -->
<link href="<c:url value="/resources/css/font-awesome.css" />"
	rel="stylesheet">

<!-- jQuery -->
<!-- lined-icons -->
<link href="<c:url value="/resources/css/icon-font.css" />"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datetimepicker.min.css" />" >

<!-- //lined-icons -->
<!-- Meters graphs -->
<script src="<c:url value="/resources/js/jquery-2.1.4.js"/>"></script>


<link href="<c:url value="/resources/css/jquery-ui.css" />" rel="stylesheet">


<link href="<c:url value="/resources/css/jplayer.blue.monday.min.css" />" rel="stylesheet" type="text/css">
<style>
.table {
        max-width: none;
        table-layout: fixed;
        word-wrap: break-word;
    }
</style>
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