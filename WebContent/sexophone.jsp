<%-- 
    Document   : aboutUs
    Created on : Sep 8, 2017, 4:53:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Angel Music</title>
    </head>
    <script>
        var video = document.querySelector('video');
        video.controls; // true
        video.controlsList; // "nofullscreen nodownload noremote" - "foobar" not present
        video.controlsList.remove('noremote');
        video.controlsList; // "nofullscreen nodownload" - "noremote" not present
        video.getAttribute('controlsList'); // "nofullscreen nodownload"
    </script>
    <body>
        <div id="wrapper" class="clearfix
             <%@include file="header.jsp"%>
             <!-- Start main-content -->
             <div class="main-content">
             <!-- Section: inner-header -->
             <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/sexophn_banner.jpg">
                <div class="container pt-60 pb-60">
                    <!-- Section Content -->
                    <div class="section-content">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h2 class="title text-white"></h2>
                                <ol class="breadcrumb asdfg white mt-10">
                                    <li ><a href="index.jsp" style="color:White">Home</a></li>
<!--                                    <li ><a href="Contact_Us.jsp" style="color:White">Contact Us</a></li>-->
                                    <li class="active ">Music Courses</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Section: About -->
            <section>
                <div class="container">
                    <div class="row">
                        <h2>Saxophone</h2>
                        <div class="col-md-12">
                            <div class="col-md-7"  >
                                
                                <iframe width="560" height="315" src="https://www.youtube.com/embed/t3M_nCSxSvg?rel=0" frameborder="5" allowfullscreen></iframe>
                                    <!--https://www.youtube.com/embed/z8GHf-aELjY?rel=0&amp;showinfo=0-->
                                
<!--                                <video id="videoElementID" autoplay="" class="pull-left flip mr-15 thumbnail" style="height:300px;width:400;" controls controlsList="nodownload">
                                    <source src="video/Saxophone Subbalaxmi - churaliya.mp4" type="video/mp4">
                                    <source src="video/Saxophone Subbalaxmi - churaliya.ogg" type="video/ogg">
                                </video>-->
                            </div>
                            <div class="col-md-5">

                                <p style="text-align:justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The saxophone is used in classical music (such as concert bands, chamber music, and solo repertoires), military bands, marching bands, and jazz (such as big bands and jazz combos). Saxophone players are called saxophonists.
                                    <br /> 
                                </p>
                            </div>
                            <div class="clearfix"></div>
                            <!--<div>
                                <table border="1px">
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>
                                                    Type of Collector/ Model with polyurethane paint or anolized
                                                </li>
                                                <li>
                                                    Collector operatoer efficiency
                                                </li>
                                            </ul>
                                        </td>
                                        <td>
                                            <ul>
                                                <li>Cu-Cu:12.5mm riser diameter with 9:Nos. of riser tubes</li>
                                                <li>68%</li>
                                            </ul>
                                        </td>
                                    </tr> 
                
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>Size of collector</li>
                                                <li>Absorber area</li>
                                            </ul>
                                        </td>
                                        <td>
                                            <ul>
                                                <li>2035mm(l) x 1035mm(b) x 95mm(h)</li>
                                                <li>2 Square Meter</li>
                                            </ul>
                                        </td>
                                    </tr>
                
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>Absorber Coating</li>
                                            </ul>
                                        </td>
                                        <td>
                                            <ul>
                                                <li>Selective Nickel chrome coating/ Black Nalsun Coating</li>
                                            </ul>
                                        </td>
                                    </tr> 
                
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>Absorptivity & Emissivity of absorber coating</li>
                                            </ul>
                                        </td>
                                        <td>
                                            <ul>
                                                <li>a>92%, e<15%.</li>
                                            </ul>
                                        </td>
                                    </tr>
                
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>Insulation Material</li>
                                            </ul>
                                        </td>
                                        <td>
                                            <ul>
                                                <li>Spintex, machine made pads</li>
                                            </ul>
                                        </td>
                                    </tr>
                
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>Thickness of Insulation</li>
                                                <li>Thermal conductivity of insulation</li>
                                            </ul>
                                        </td>
                                        <td>
                                            <ul>
                                                <li>Bottom: 50mm, Side: 25mm</li>
                                                <li>0.29 W/mK</li>
                                            </ul>
                                        </td>
                                    </tr>
                
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>Insulation density</li>
                                                <li>Material of the box and thickness</li>
                                                <li>Gasket</li>
                                            </ul>
                                        </td>
                                        <td>
                                            <ul>
                                                <li>48 Kg/meter cube</li>
                                                <li>Al 16 swg extruded section & bottom sheet of 22swg</li>
                                                <li>Neoprene</li>
                                            </ul>
                                        </td>
                                    </tr>
                
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>Faterners on collector box</li>
                                                <li>Collector box flangs</li>
                                            </ul>
                                        </td>
                                        <td>
                                            <ul>
                                                <li>SS 304</li>
                                                <li>Brass</li>
                                            </ul>
                                        </td>
                                    </tr>
                
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>Test Pressure</li>
                                                
                                            </ul>
                                        </td>
                                        <td>
                                            <ul>
                                                <li>5 KG/CM2</li>
                                            </ul>
                                        </td>
                                    </tr>     
                                </table>
                            </div>-->
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <!--<div class="row">
                        <h2>Evacuated Tube Collector System</h2>
                        <div class="col-md-12">
                           <div class="col-md-5">
                                <img class="pull-left flip mr-15 thumbnail" src="images/Col1.jpg" alt="">
                            </div>
                            <div class="col-md-7">
                                <p style="text-align:justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;They are made of a series of modular tubes, mounted in parallel, whose number can be 
                                    added to or reduced depending on the quantity of hot water required. In an evacuated tube collector, sunlight passing through an outer glass tube 
                                    heats the absorber tube contained within it. The absorber can either consist of copper (glass-metal) or specially coated glass tubing
                                    (glass-glass). The glass-metal evacuated tubes are typically sealed at the manifold end, and the absorber is actually sealed in the vacuum. 
                                    The glass tubes are directly connected & fitted to the hot water tank. <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bipsun solar collectors can be 
                                    mounted on a roof, wall,ground or custom built structure.This energy can be used for domestic and commercial hot water heating, pool heating,
                                    space heating or even air conditioning. 
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Evacuated Tube Collectors are highly efficient for domestic use not in a house manufacturer of the product buta also have been well established in the market
                                    as one of the top ETC provider and for the excellent after sales services.
                                </p>
                            </div>
                            
                            <div class="clearfix"></div>
                            <div class="row">
                                <h3 style="text-align:center">Capacity and specification </h3>
                                 
                                <table border="1px">
                                    <tr>
                                        <th rowspan="2">Model & Capacity (LPD)</th>
                                        <th colspan="2">Vacuum Tube</th>
                                        <th rowspan="2">Number of Tubes</th>
        
                                    </tr>
                                    <tr>
                                        <td><b>Dia.(mm)</b></td>
                                        <td><b>Length (mm)</b></td>
                                    </tr>
        
                                    <tr>
                                        <td>BIP-100</td>
                                        <td>&Phi;58</td>
                                        <td>1800</td>
                                        <td>10</td>
        
                                    </tr>
        
                                    <tr>
                                        <td>BIP-150</td>
                                        <td>&Phi;58</td>
                                        <td>1800</td>
                                        <td>15</td>
        
                                    </tr>
        
                                    <tr>
                                        <td>BIP-200</td>
                                        <td>&Phi;58</td>
                                        <td>1800</td>
                                        <td>20</td>
        
                                    </tr>
        
                                    <tr>
                                        <td>BIP-250</td>
                                        <td>&Phi;58</td>
                                        <td>1800</td>
                                        <td>25</td>
        
                                    </tr>
                                    <tr>
                                        <td>BIP-300</td>
                                        <td>&Phi;58</td>
                                        <td>1800</td>
                                        <td>30</td>
        
                                    </tr>
                                    <tr>
                                        <td>BIP Commercial-500</td>
                                        <td>&Phi;58</td>
                                        <td>1800</td>
                                        <td>35</td>
        
                                    </tr>
                                    <tr>
                                        <td>BIP Industrial-500</td>
                                        <td>&Phi;58</td>
                                        <td>1800</td>
                                        <td>35</td>
        
                                    </tr>
                                    <tr>
                                        <td><b>Manifold</b></td>
                                        <td>&Phi;58</td>
                                        <td>1800</td>
                                        <td>50</td>
        
                                    </tr>
                                </table>
                            </div>
                        </div>
        
                </div>-->
                    <div class="separator separator-rouned">
                        <i class="fa fa-cog fa-spin"></i>
                    </div>
                    <br />
                    <br />
                </div>
            </section>
        </div>
        <!-- end main-content -->

        <!-- end main-content -->
        <%@include file="footer.jsp"%>
        <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
    </div>
    <!-- end wrapper -->

    <!-- Footer Scripts -->
    <!-- JS | Custom script for all pages -->
  
</body>
</html>
