<%-- 
    Document   : Event
    Created on : Sep 8, 2017, 5:20:20 PM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Angel Music</title>
    </head>
    <body>
        <div id="wrapper" class="clearfix
             <%@include file="header.jsp"%>

             <!-- Start main-content -->

             <div class="main-content">

             <!-- Section: inner-header -->
             <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/about_us.jpeg">
                <div class="container pt-100 pb-50">
                    <!-- Section Content -->
                    <div class="section-content pt-100">
                        <div class="row"> 
                            <div class="col-md-12">
                                <h3 class="title text-white">Team Member</h3>
                                <ul class="breadcrumb white">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li class="active"><a href="#">Details</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Section: Blog -->
            <section>
                <div class="container">
                    <div class="section-content">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="thumb">
                                    <img src="http://placehold.it/360x360" alt="">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <h4 class="name font-24 mt-0 mb-0">Pankaj  Bhavsar </h4>
                                <h5 class="mt-5 text-theme-colored">Tabla </h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam vero expedita fugiat illo quasi doloremque, in unde omnis sint assumenda! Quaerat in, reprehenderit corporis voluptatum natus sequi reiciendis ullam. Quam eaque dolorum voluptates cupiditate explicabo.</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nesciunt culpa dicta quaerat qui recusandae possimus placeat quidem ipsam voluptates similique libero tempore, labore quasi delectus vero alias, consectetur blanditiis eum maxime sunt accusantium ipsa doloribus reiciendis. Ea quod reprehenderit deserunt. Veritatis omnis similique tempora delectus a consequuntur, quis.  Adipisicing elit. Nesciunt culpa dicta quaerat qui recusandae possimus placeat quidem ipsam voluptates similique libero tempore, labore quasi delectus vero alias.</p>
                                <ul class="styled-icons icon-dark icon-theme-colored icon-sm mt-15 mb-0">
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-skype"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>
        <script type="text/javascript" src="./Events_files/loader.js(1).download"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['Voice', 5],
                    ['Winds', 5],
                    ['Chamber Music', 5],
                    ['Keyboards', 5],
                    ['strings', 5],
                    ['Other Discipline', 5]
                ]);

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                if ($(window).width() < 500) {
                    chart.draw(data, {width: 350, height: 340});
                }
                else {
                    chart.draw(data, {width: 600, height: 400});
                }
            }
        </script>

        <!-- end main-content -->

        <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>

        <!-- end wrapper -->
        <%@include file="footer.jsp"%>
        <!-- Footer Scripts -->
        <!-- JS | Custom script for all pages -->
        <!--<script src="js/custom.js"></script>-->
    </body>
</html>
