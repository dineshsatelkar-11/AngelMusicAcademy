<!DOCTYPE html><%@page import="com.accede.angel.admin.dao.PaymentDao"%>
<%@page import="com.accede.angel.admin.model.Payment"%>
<%@page import="com.accede.angel.admin.model.StudentAccount"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.model.ClassEnquiry"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
<!--                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
                </div>-->

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="" role="main" >
                   
                  

                    <div id="AccountFetch">


                    </div>
                    <!-- top tiles -->
                    
                    
                                  
                                    
                    <div id="allDashboard">
                        


<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="java.util.List"%>

<%

    String MobileNo = request.getParameter("mobileno");
    System.out.println("MobileNo==" + MobileNo);
    if (MobileNo != "") {
 Admin adminnn= (Admin) session.getAttribute("BRANCH_ADMIN");

%>

<div class="row">
<%                int s = 0;
    List<CustomerAccount> AllCustomerAccount = new CustomerAccountDao().getCustomerAccountsByMobile(MobileNo,adminnn);

    if (AllCustomerAccount != null && AllCustomerAccount.size() > 0) {
        for (CustomerAccount p : AllCustomerAccount) {

            s++;

%>



    <div class="col-md-3 col-sm-12 col-xs-12">
        <div class="x_panel">
            <h2 style="text-align:center">User Profile Card</h2>

            <div class="card">
                <img src="../../StudentImages/<%=p.getImage()%>" alt="<%=p.getName()%>" style="width:25%" alt=""/>
            

                <h2><%=p.getName()%></h2>

                <p class="title"><%=p.getMobileNo()%></p>
                <p class="title">Bal:-<%=p.getAccountBalance()%></p>
                <p><%=p.getAddress()%></p>
                <div style="margin: 24px 0;">
                 
                    <a href="StudentProfileDetails.jsp?accountid=<%=p.getId()%>"><img src="../../AdminImages/admission.png"  alt="John" style="width:20%; margin-top: -25px;"></a>
                    <a href="CustRent.jsp?accountid=<%=p.getId()%>"><span  tool-tip-toggle="tooltip-demo" data-original-title="Rent "><img src="../../AdminImages/for-rent.png"  alt="John" style="width:20%; margin-top: -25px;"></span></a>
                    <a href="CustRepair.jsp?accountid=<%=p.getId()%>"><img src="../../AdminImages/repair.jpg"  alt="John" style="width:20%; margin-top: -25px;"></span></a>
                    <a href="#"><img src="../../AdminImages/Sell.png"  alt="John" style="width:20%; margin-top: -25px;"></span></a>




                </div>

            </div>
        </div>
    </div>


    <%}%>


    <%

    } else {%>


    <div class="row">
        <div class="x_panel" >
            <h2 class=" text-center"  style="color:red;">Account not Found For These Mobile Number</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 col-sm-12 col-xs-12"></div>
        <div class="col-md-4 col-sm-12 col-xs-12">
            <div class="x_panel" >
                <marquee><h2 class="titletag" style="color:blue;">Create Account</h2></marquee>


                <div class="card">
                    <br>
                    <img src="../../AdminImages/admin.jpg" alt="Person" width="96" height="96">
                    <div class="container">
                        <h4><b></b></h4> 
                        <p></p> 
                        <br>
                        <br>
                       
                        <blink> <p ><button type="button"  class="btn btnclass btn-lg right"  data-toggle="modal" data-target="#myModal">Create Account</button></p></blink>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12">
            <div class="x_panel" >

                <marquee><h2 class="titletag" style="color:blue;">Inquiry Request</h2> </marquee>
                <div class="card">
                    <br>
                    <img src="../../AdminImages/admin.jpg" alt="Person" width="96" height="96">
                    <div class="container">
                        <h4><b></b></h4> 
                        <p></p> 
                        <br>
                        <br>
                        <blink>    <p><button type="button" class="btn btnclass btn-lg right"  data-toggle="modal" data-target="#myModal1">Inquiry Request</button></p> </blink> 
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%}
} else {%>



    <%}%> 

    <script>

        $.fn.popover.Constructor.prototype.leave = function(a) {
            var c, d, b = a instanceof this.constructor ? a : $(a.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
            originalLeave.call(this, a), a.currentTarget && (c = $(a.currentTarget).siblings(".popover"), d = b.timeout, c.one("mouseenter", function() {
                clearTimeout(d), c.one("mouseleave", function() {
                    $.fn.popover.Constructor.prototype.leave.call(b, b)
                })
            }))
        },
                $(document).ready(function() {
            init_wysiwyg(), init_InputMask(), init_JQVmap(), init_cropper(), init_knob(), init_IonRangeSlider(), init_ColorPicker(), init_TagsInput(), init_parsley(), init_daterangepicker(), init_daterangepicker_right(), init_EasyPieChart(), init_charts(), init_echarts(), init_morris_charts(), init_skycons(), init_select2(), init_validator(), init_DataTables(), init_chart_doughnut(), init_gauge(), init_PNotify(), init_starrr(), init_calendar(), init_compose(), init_CustomNotification(), init_autosize(), init_autocomplete()
        });





    </script>


    <style>
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            max-width: 300px;
            margin: auto;
            text-align: center;
            font-family: arial;
        }

        .title {
            color: grey;
            font-size: 18px;
        }
        title{ color: red; } 
        
        
        .btnclass {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}


.btnclass:hover {
  opacity: 0.7;
}
        
/*        button {
            border: none;
            outline: 0;
            display: inline-block;
            padding: 8px;
            color: white;
            background-color: #000;
            text-align: center;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
        }*/

        a {
            text-decoration: none;
            /*font-size: 22px;*/
            color: black;
        }

        button:hover, a:hover {
            opacity: 0.7;
            visibility: visible;
        }
    </style>


    <style>
        .chip {
            display: inline-block;
            padding: 0 25px;
            height: 50px;
            font-size: 16px;
            line-height: 50px;
            border-radius: 25px;
            background-color: #f1f1f1;
        }

        .chip img {
            float: left;
            margin: 0 10px 0 -25px;
            height: 50px;
            width: 50px;
            border-radius: 50%;
        }


        blink {
            -webkit-animation: 1s linear infinite condemned_blink_effect; // for android
            animation: 2s linear infinite condemned_blink_effect;
        }
        @-webkit-keyframes condemned_blink_effect { // for android
                                                    0% {
                                                        visibility: hidden;
                                                    }
                                                    50% {
                                                        visibility: hidden;
                                                    }
                                                    100% {
                                                        visibility: visible;
                                                    }
        }
        @keyframes condemned_blink_effect {
            0% {
                visibility: hidden;
            }
            50% {
                visibility: hidden;
            }
            100% {
                visibility: visible;
            }
        }
    </style>


                    </div>
                </div>
                <!-- /page content -->
  
                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
            
            </div>
        </div>

 <script src="../production/js/jquery.formError.js" type="text/javascript"></script>
        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- Chart.js -->/
       
        <script src="../vendors/Chart.js/dist/Chart.min.js"></script>
        <!-- gauge.js -->
        <script src="../vendors/gauge.js/dist/gauge.min.js"></script>
        <!-- bootstrap-progressbar -->
        <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <!-- iCheck -->
        <script src="../vendors/iCheck/icheck.min.js"></script>
        <!-- Skycons -->
        <script src="../vendors/skycons/skycons.js"></script>
        <!-- Flot -->
        <script src="../vendors/Flot/jquery.flot.js"></script>
        <script src="../vendors/Flot/jquery.flot.pie.js"></script>
        <script src="../vendors/Flot/jquery.flot.time.js"></script>
        <script src="../vendors/Flot/jquery.flot.stack.js"></script>
        <script src="../vendors/Flot/jquery.flot.resize.js"></script>
        <!-- Flot plugins -->
        <script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
        <script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
        <script src="../vendors/flot.curvedlines/curvedLines.js"></script>
        <!-- DateJS -->
        <script src="../vendors/DateJS/build/date.js"></script>
        <!-- JQVMap -->
        <script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
        <script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
        <script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
        <!-- bootstrap-daterangepicker -->
        <script src="../vendors/moment/min/moment.min.js"></script>
        <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- Datatables -->
        <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
        <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
        <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
        <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
        <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
        <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
        
         <%@ include file = "JavaScriptFile.jsp" %>



        <script type="text/javascript">
            $(document).ready(function() {

                $('#mobileno').keyup(function() {

                    var mobileno = $('#mobileno').val();
                    if (mobileno != "")
                    {
                        $('#allDashboard').hide();

                        $.get("AjaxPages/SearchAccount.jsp", {mobileno: mobileno}, function(data) {
                            //   alert('sucess');
                            $('#AccountFetch').html(data);
                        });
                    }
                    else
                    {

                        $.get("AjaxPages/SearchAccount.jsp", {mobileno: mobileno}, function(data) {
                            //   alert('sucess');
                            $('#AccountFetch').html(data);
                            $('#allDashboard').show();
                        });
                    }
                });


                $('.srrequest').click(function() {

                    var srrequestid = this.id;

                    $('#allDashboard').hide();

                    $.get("AjaxPages/RequestFetch.jsp", {srrequestid: srrequestid}, function(data) {
                        alert('sucess');
                        $('#AccountFetch').html(data);
                    });

                });


            });
        </script>
    </body>
</html>
