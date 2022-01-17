<%-- 
    Document   : Event
    Created on : Sep 8, 2017, 5:20:20 PM
    Author     : Admin
--%>


<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
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

         <style>
        .alert {
            padding: 20px;
            background-color: #f44336;
            color: white;
            opacity: 1;
            transition: opacity 0.6s;
            margin-bottom: 15px;
        }

        .alert.success {background-color: #4CAF50;}
        .alert.info {background-color: #2196F3;}
        .alert.warning {background-color: #ff9800;}

        .closebtn {
            margin-left: 15px;
            color: white;
            font-weight: bold;
            float: right;
            font-size: 22px;
            line-height: 20px;
            cursor: pointer;
            transition: 0.3s;
        }

        .closebtn:hover {
            color: black;
        }
    </style>
    
         
         




    <div class="main-content">

             <div class="about-us">
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/about_us.jpeg">
                    <div class="container pt-100 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-100">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Contact</h3>
                                    <ul class="breadcrumb white">
                                        <li><a href="index.jsp">Home</a></li>
                                        <li class="active"><a href="Contact_Us.jsp">Contact Us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="contact">
                <div class="container">
                    <div class="contact-grids wd">

                        <div class="row">
                            <div class="col-md-6">
                                <h2 align="center">Enquiry Form</h2><br>
                                <p id="head" style="color:red; font-size:12px;"></p> 
                                <form method="get" action="Regservelet">
                                     <%
                                    if (session.getAttribute("i") != null) {
                                        int i = (Integer) session.getAttribute("i");
                                        String msg = (String) session.getAttribute("msg");
                                        if (i == 2) {

                                            System.out.println("fdgsfd");
                                %>
                                <div class="alert">
                                    <span class="closebtn">&times;</span>  
                                    <strong>Danger!</strong> <%=msg%>
                                </div>
                                <%} else {%>
                                <div class="alert success">
                                    <span class="closebtn">&times;</span>  
                                    <strong>Success!</strong><%=msg%> 
                                </div>
                                <%
                                        }
                                        session.removeAttribute("i");
                                        session.removeAttribute("msg");
                                    }%>
                                    <input type="hidden" name="_token" value="hOUw4SCwV8EckAaRDpmhtIYtwsFZ6pAY5k47D0V0">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="input-group">

                                                <input type="text" class="form-control" name="cfname" required="" placeholder="First Name" aria-describedby="basic-addon1" id="cname" onkeypress="return ValidateAlpha(event);" autofocus="">
                                                <p id="p1" style="color:red; font-size:12px;"></p>
                                                <p><span class="emsg hidden" id="first">Please Enter Only Characters</span></p>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="input-group">

                                                <input type="text" class="form-control" name="cmname" required="" placeholder="Middle Name" aria-describedby="basic-addon1" id="cname" onkeypress="return ValidateAlpha(event);">
                                                <p id="p1" style="color:red; font-size:12px;"></p>
                                                <p><span class="emsg hidden" id="middle">Please Enter Only Characters</span></p>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="clname" required="" placeholder="Last Name" aria-describedby="basic-addon1" id="cname" onkeypress="return ValidateAlpha(event);">
                                                <p id="p1" style="color:red; font-size:12px;"></p>
                                                <p><span class="emsg hidden" id="last">Please Enter Only Characters</span></p>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                       
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon" id="basic-addon1"><i class="fa fa-envelope"></i></span>
                                                        <input type="email" class="form-control" name="email" required="" placeholder="Email" aria-describedby="basic-addon1" id="email">
                                                        <p><span class="emsg hidden" id="emailid">Please Enter Valid email</span></p>
                                                        <p id="p2" style="color:red; font-size:12px;"></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <select class="form-control" id="Branch" required="" name="Branch" >
                                                    <option value="">Select Branch</option>
                                                    <%
                                                        AdminDao ad = new AdminDao();
                                                        List<Admin> b = null;
                                                        b = ad.getAllAdmin();
                                                        if (b != null && b.size() > 0) {
                                                            for (Admin p : b) {
                                                                if (p.getAdminId() != 1) {
                                                    %>
                                                    <option value="<%=p.getAdminId()%>"><%=p.getAdminOfBranch().getBranchName()%></option>
                                                    <%}
                                                            }
                                                        }%>

                                                </select>
                                                </div>
                                            </div>
                                   
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1"><i class="fa fa-phone"></i></span>
                                                <input type="tel" class="form-control" name="mobile" required="" placeholder="Mobile" aria-describedby="basic-addon1" minlength="10" maxlength="15" id="mobile" onkeypress="return isNumberKey(event)">
                                                <p id="p3" style="color:red; font-size:12px;"></p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <select id="realenquiry" class="form-control" required="" name="enquirycategory">
                                                    <option value="" disabled="" selected="">Select Enquiry Category</option>
                                                  
                                                     <option value="MusicClass">Music Class</option>
                                                <option value="Sell">Sell</option>
                                                <option value="Repair">Repair</option>
                                                <option value="Rent">Rent</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>


                                    <p id="p5" style="color:red; font-size:12px;"></p>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <textarea class="form-control" name="message" required="" placeholder="Type your Message" rows="5" id="message"></textarea>
                                                <p id="p6" style="color:red; font-size:12px;"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-group btnsub">
                                            <input type="hidden" name="flag" value="online">
                                            <input type="submit" class="btn btn-warning btn-lg btn-block" name="submitcontact" value="Submit" id="submit">
                                            <br>
                                        </div>
                                    </div>
                                </form>	
                            </div>
                            <div class="col-md-6" style="text-align: center;">
                                <h2 align="center">Contact Information</h2><br>
                                <img src="./Contact us_files/angle-music-logo.png">
                                <h4>Angel Music &amp; Education Association's</h4><br>
                                <p>
                                    <i class="fa fa-map-marker"><strong>&nbsp;&nbsp;Flat No.: 04, Sr. No. A/24, Nakoda Corner,<br>
                                            Near Alandi Police Chowki, Vishrantwadi, Pune - 15.</strong></i></p>
                                <br>
                                <p><i class="fa fa-map-marker"><strong>&nbsp;&nbsp;Shop No. 7, Shantiban Society, Near PNG,<br>
                                            Chafekar Chowk, Chinchwad, Pune 33.</strong></i></p>
                                <br>	
                                <p><i class="fa fa-phone"><strong>&nbsp;&nbsp;020 65117722/ 9049976912 / 9762465737</strong></i></p>
                                <br>
                                <p><i class="fa fa-envelope"><strong>&nbsp;&nbsp;dalvir94@yahoo.com</strong></i></p>									
                            </div>
                        </div>
                        <br><br><br>
                        <div class="row">
                            <hr>
                            <h2 align="center">Find Our Locations</h2><br>
                            <hr>
                            <div class="col-md-6">				
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d472.7763074217466!2d73.87752202307061!3d18.56454811404278!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c0db297bb435%3A0x7765f5322fefc4a7!2sVishrantwadi+Police+Station!5e0!3m2!1sen!2sin!4v1504875708649" width="250" height="250" frameborder="0" style="border:0" allowfullscreen></iframe>	
                                <p style="text-align: center;"><i class="fa fa-map-marker"></i> <strong>Flat No.: 04, Sr. No. A/24, Nakoda Corner,<br>
                                        Near Alandi Police Chowki,<br>
                                        Vishrantwadi, Pune - 15. </strong></p>
                            </div>		
                            <div class="col-md-6">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3780.743573787247!2d73.77632931489435!3d18.63059998734505!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2b9bb967b4125%3A0xb28f413cd21e0b1a!2sAngel+Music!5e0!3m2!1sen!2sin!4v1504876045799" width="250" height="250" frameborder="0" style="border:0" allowfullscreen></iframe>
                                <p style="text-align: center;"><i class="fa fa-map-marker"></i> <strong>Shop No. 7, Shantiban Society, <br>Near PNG,
                                        Chafekar Chowk, Chinchwad, <br>Pune 33.</strong></p>
                            </div>					
                        </div>				
                    </div>			
                </div>			
            </div>
        </div>
        <script type="text/javascript" src="./Contact us_files/contact-us-validation.js.download"></script>
        <script>
                                                            $(document).ready(function(){
                                                    function isNumberKey(evt){ < !--Function to accept only numeric values-- >
                                                            //var e = evt || window.event;
                                                            var charCode = (evt.which) ? evt.which : evt.keyCode
                                                            if (charCode != 46 && charCode > 31
                                                                    && (charCode < 48 || charCode > 57))
                                                            return false;
                                                            return true;
                                                    }

                                                    function ValidateAlpha(evt)
                                                    {
                                                    var keyCode = (evt.which) ? evt.which : evt.keyCode
                                                            if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32)

                                                            return false;
                                                            return true;
                                                    }

                                                    $('#realenquiry').on('change', function() {
                                                    if (this.value == 'Sale')
                                                    {
                                                    $("#Sale").show();
                                                    }
                                                    else
                                                    {
                                                    $("#Sale").hide();
                                                    }
                                                    if (this.value == 'Music Class')
                                                    {
                                                    $("#Music_class").show();
                                                    }
                                                    else
                                                    {
                                                    $("#Music_class").hide();
                                                    }
                                                    if (this.value == 'Repair')
                                                    {
                                                    $("#repair").show();
                                                    }
                                                    else
                                                    {
                                                    $("#repair").hide();
                                                    }
                                                    if (this.value == 'Rent')
                                                    {
                                                    $("#rent").show(); }
                                                    else
                                                    {
                                                    $("#rent").hide();
                                                    }
                                                    });
                                                    });        </script>
        <script type="text/javascript" src="./Contact us_files/contact-us-validation.js.download"></script>
        <script>
                                                            $(document).ready(function(){
                                                    function isNumberKey(evt){ < !--Function to accept only numeric values-- >
                                                            //var e = evt || window.event;
                                                            var charCode = (evt.which) ? evt.which : evt.keyCode
                                                            if (charCode != 46 && charCode > 31
                                                                    && (charCode < 48 || charCode > 57))
                                                            return false;
                                                            return true;
                                                    }

                                                    function ValidateAlpha(evt)
                                                    {
                                                    var keyCode = (evt.which) ? evt.which : evt.keyCode
                                                            if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32)

                                                            return false;
                                                            return true;
                                                    }

                                                    $('#realenquiry').on('change', function() {
                                                    if (this.value == 'Sale')
                                                    {
                                                    $("#Sale").show();
                                                    }
                                                    else
                                                    {
                                                    $("#Sale").hide();
                                                    }
                                                    if (this.value == 'Music Class')
                                                    {
                                                    $("#Music_class").show();
                                                    }
                                                    else
                                                    {
                                                    $("#Music_class").hide();
                                                    }
                                                    if (this.value == 'Repair')
                                                    {
                                                    $("#repair").show();
                                                    }
                                                    else
                                                    {
                                                    $("#repair").hide();
                                                    }
                                                    if (this.value == 'Rent')
                                                    {
                                                    $("#rent").show();
                                                    }
                                                    else
                                                    {
                                                    $("#rent").hide();
                                                    }
                                                    });
                                                    });
        </script>    

        <link rel="stylesheet" href="./Contact us_files/footer.css">

        <!-- end main-content -->

        <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>

        <!-- end wrapper -->
        <%@include file="footer.jsp"%>
        <!-- Footer Scripts -->
        <!-- JS | Custom script for all pages -->
        <!--<script src="js/custom.js"></script>-->
        
        
    
    
<script>
    var close = document.getElementsByClassName("closebtn");
    var i;

    for (i = 0; i < close.length; i++) {
        close[i].onclick = function() {
            var div = this.parentElement;
            div.style.opacity = "0";
            setTimeout(function() {
                div.style.display = "none";
            }, 600);
        }
    }
</script>
    
    </body>
</html>
