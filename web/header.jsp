<%-- 
    Document   : header.jsp
    Created on : Sep 8, 2017, 3:36:05 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
    <head>

        <!-- Meta Tags -->
        <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Industrypress - Factory & Industrial Business Template" />
        <meta name="keywords" content="building,business,construction,cleaning,transport,workshop" />
        <meta name="author" content="ThemeMascot" />

        <!-- Page Title -->
        <title>Angel Music</title>
        
        <!-- Favicon and Touch Icons -->
        <link href="images/favicon.png" rel="shortcut icon" type="image/png">
        <link href="images/apple-touch-icon.png" rel="apple-touch-icon">
        <link href="images/apple-touch-icon-72x72.png" rel="apple-touch-icon" sizes="72x72">
        <link href="images/apple-touch-icon-114x114.png" rel="apple-touch-icon" sizes="114x114">
        <link href="images/apple-touch-icon-144x144.png" rel="apple-touch-icon" sizes="144x144">

        <!-- Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css">
        <link href="css/animate.css" rel="stylesheet" type="text/css">
        <link href="css/css-plugin-collections.css" rel="stylesheet"/>
        <!-- CSS | menuzord megamenu skins -->
        <link id="menuzord-menu-skins" href="css/menuzord-skins/menuzord-rounded-boxed.css" rel="stylesheet"/>
        <!-- CSS | Main style file -->
        <link href="css/style-main.css" rel="stylesheet" type="text/css">
        <!-- CSS | Preloader Styles -->
        <link href="css/preloader.css" rel="stylesheet" type="text/css">
        <!-- CSS | Custom Margin Padding Collection -->
        <link href="css/custom-bootstrap-margin-padding.css" rel="stylesheet" type="text/css">
        <!-- CSS | Responsive media queries -->
        <link href="css/responsive.css" rel="stylesheet" type="text/css">
        <!-- CSS | Style css. This is the file where you can place your own custom css code. Just uncomment it and use it. -->
        <!-- <link href="css/style.css" rel="stylesheet" type="text/css"> -->

        <!-- Revolution Slider 5.x CSS settings -->
        <link  href="js/revolution-slider/css/settings.css" rel="stylesheet" type="text/css"/>
        <link  href="js/revolution-slider/css/layers.css" rel="stylesheet" type="text/css"/>
        <link  href="js/revolution-slider/css/navigation.css" rel="stylesheet" type="text/css"/>

        <!-- CSS | Theme Color -->
        <link href="css/colors/theme-skin-sky-blue.css" rel="stylesheet" type="text/css">

        <!-- external javascripts -->
        <script src="js/jquery-2.2.4.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- JS | jquery plugin collection for this theme -->
        <script src="js/jquery-plugin-collection.js"></script>

        <!-- Revolution Slider 5.x SCRIPTS -->
        <script src="js/revolution-slider/js/jquery.themepunch.tools.min.js"></script>
        <script src="js/revolution-slider/js/jquery.themepunch.revolution.min.js"></script>
    </head>
    <body>
        <div id="wrapper" class="clearfix">
            <!-- preloader -->
            <!--<div id="preloader">
                <div id="spinner">
                    <img class="ml-5" src="images/preloaders/3.gif" alt="">
                </div>
                <div id="disable-preloader" class="btn btn-default btn-sm">Disable Preloader</div>
            </div>-->

            <!-- Header -->
            <header id="header" class="header">
                <div class="header-top bg-black-333 sm-text-center border-top-theme-color-3px p-0">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="widget no-border m-0">
                                    <ul class="list-inline xs-text-center text-white mt-5">
                                        <li class="m-0 pl-10 pr-10">
                                            <a href="Admin/Login/adminLogin.jsp" class="text-white"><i class="fa fa-user-secret text-theme-colored"></i> Admin Login</a>
                                        </li>    
                                       
                                        <li class="m-0 pl-10 pr-10">
                                            <a href="Admin/Login/StudentLogin.jsp" class="text-white"><i class="fa fa-user text-theme-colored"></i> Student Login</a>
                                        </li>                                 
                                        
                                        <li class="m-0 pl-10 pr-10"> <a class="text-white"><i class="fa fa-phone text-theme-colored"></i>  +91 904 997 6912 , 976 246 5737</a> </li>
                                        <li class="m-0 pl-10 pr-10">
                                            <a  class="text-white"><i class="fa fa-envelope-o text-theme-colored"></i> admin@angelm.in</a>
                                        </li>                                                             
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-4 pr-0">
                            </div>
                            <!--<div class="col-md-2">
                                <a class="btn btn-colored btn-flat btn-theme-colored bs-modal-ajax-load pb-10" data-toggle="modal" data-target="#BSParentModal" href="ajax-load/reservation-form.html">Get A Quote Now</a>
                            </div>-->
                        </div>
                    </div>
                </div>

                <div class="header-nav">
                    <div class="header-nav-wrapper navbar-scrolltofixed bg-white">
                        <div class="container">
                            <table>
                                <tr>
<!--                                    <td style="width:30%">
                                        <a class=" pull-left flip xs-pull-center mt-20" href="index.html">
                                            <img style="width:80%" style="max-height: 100px;" src="images/bipsun.jpg" alt="">
                                        </a>
                                    </td>-->
                                    <td >
                                        <nav id="menuzord-right" class="menuzord default">
                                            <ul class="menuzord-menu">
                                                <li ><a href="index1.jsp">Home</a></li>
                                                <li><a href="aboutUs.jsp">About</a></li>

                                                <li><a href="#">Music Courses</a>
                                                    <ul class="dropdown">
                                                        <li><a href="#">Wind</a>
                                                            <ul class="dropdown">
                                                                <li><a href="sexophone.jsp">Saxophone</a></li>
                                                                <li><a href="flute.jsp" >Flute </a></li>
                                                                <li><a href="trumpet.jsp">Trumpet</a></li>
                                                                <li><a href="clarinet.jsp">Clarinet</a></li>
                                                                <li><a href="bugle.jsp">Bugle</a></li>
                                                                <li><a href="euphonium.jsp">Euphonium</a></li>
                                                                <li><a href="harmonica.jsp">Harmonica</a></li>
                                                                <li><a href="baritone.jsp">Baritone</a></li>
                                                                <li><a href="cornet.jsp">Cornet</a></li>

                                                            </ul>
                                                        </li>
                                                        <li><a href="#">String's</a>
                                                            <ul class="dropdown">

                                                                <li><a href="acousticguitar.jsp">Acoustic Guitar</a></li>
                                                                <li><a href="electricguitar.jsp">Electric Guitar</a></li>
                                                                <li><a href="mandolin.jsp">Mandolin</a></li>
                                                                <li><a href="violin.jsp">Violin</a></li>
                                                                <li><a href="sitar.jsp">Sitar</a></li>
                                                            </ul>
                                                        </li>

                                                        <li><a href="#">KeyBoard</a>
                                                            <ul class="dropdown">
                                                                <li><a href="harmonium.jsp">Harmonium</a></li>
                                                                <li><a href="keyboard.jsp">Keyboard</a></li>
                                                                <li><a href="piano.jsp">Piano</a></li>
                                                                <!-- <li><a href="PasteurizationSystem.html">Pasteurization System</a></li>
                                                                 <li><a href="KettlesTank.html">Kettles Tank</a></li>
                                                                 <li><a href="ScrewPress.html">Screw Press</a></li>
                                                                 <li><a href="GINGER WASHER.html">GINGER WASHER</a></li>
                                                                 <li><a href="FruitWasher.html">Fruit Washer</a></li>
                                                                 <li><a href="Conveyor.html">Conveyor</a></li>
                                                                 <li><a href="BlancherCumWasher.htm">Blancher Cum Washer</a></li>-->
                                                            </ul>
                                                        </li>

                                                        <li><a href="#">Percussion's</a>
                                                            <ul class="dropdown">
                                                                <li><a href="mrudanga.jsp">Mrudanga</a></li>
                                                                <li><a href="tabla.jsp">Tabla</a></li>
                                                                <li><a href="dholak.jsp">Dholak</a></li>
                                                                <li><a href="dholki.jsp">Dholki</a></li>
                                                                <li><a href="drum_set.jsp">Drum Set</a></li>
                                                                <li><a href="congo.jsp">Congo</a></li>
                                                                <li><a href="bongo.jsp">Bongo</a></li>

                                                            </ul>
                                                        </li>

                                                        <li><a href="#">Vocals's</a>
                                                            <ul class="dropdown">
                                                                <li><a href="indian_classical.jsp">Indian Classical</a></li>
                                                                <li><a href="light_music.jsp">Light Music</a></li>
                                                                <li><a href="play_back_singing.jsp">Play Back Singing</a></li>


                                                            </ul>
                                                        </li>
                                                        <li><a href="#">Band Training</a>
                                                            <ul class="dropdown">
                                                                <li><a href="jazz.jsp">Jazz Band</a></li>
                                                                <li><a href="brass.jsp">Brass Band</a></li>
                                                                <li><a href="pipe.jsp">Pipe Band</a></li>
                                                                <li><a href="worship.jsp">Worship Band</a></li>
                                                                <li><a href="military.jsp">Military Band</a></li>
                                                                <li><a href="school.jsp">School Band</a></li>
                                                                <li><a href="army.jsp">Army Band</a></li>
                                                                <li><a href="navy.jsp">Navy Band</a></li>
                                                                <li><a href="airforce.jsp">Indian Air Force</a></li>
                                                                <li><a href="police.jsp">Police Band</a></li>
                                                                <li><a href="srpf.jsp">S.R.P.F. Band</a></li>


                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
<!--                                                <li><a href="team.jsp">Team</a></li>-->
                                                <li><a href="Gallery.jsp">Gallery</a></li>
                                                <li><a href="https://musicofindia.org/">Events</a>
                                                <li><a href="https://musicofindia.org/Exam/">Exam</a>
                                                    <!--<ul class="dropdown">
                                                        <li><a href="SolarClients.html">Solar System</a></li>
                                                        <li><a href="foodclient.html">Food Processing System</a></li>
                                                    </ul>-->
                                                </li>
                                                <!--<li><a href="Award_Certificate.jsp">Award/Certificate</a></li>-->
                                                <li><a href="Contact_Us.jsp">Contact</a></li>
                                                <li><a href="https://angelm.co.in/" target="blank">Products</a></li>


                                            </ul>
                                        </nav>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </header>
