<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.PaymentFollowupDao"%>
<%@page import="com.accede.angel.admin.model.PaymentFollowup"%>
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
              
                    <%@ include file = "../comman_files/adminSideBarFile.jsp" %>
             

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <!-- page content -->
        <div role="main">
          <div class="">
           
            
            <div class="clearfix"></div>
<%
int id=Integer.parseInt(request.getParameter("accountid"));
CustomerAccount p =new CustomerAccount();
p= new CustomerAccountDao().getCustomerAccountById(id);
AdmissionDao AdmissionDao = new AdmissionDao();
                                                         RepairDao RepairDao = new RepairDao();
                                                          RentDao RentDao = new RentDao();
   int StudentBalanceamount = 0;
                Admission Admission = AdmissionDao.getAdmissionByAccount(p);
                if (Admission != null) {
                    StudentBalanceamount = Admission.getRemaininFee();
                }
               
                List<Rent> allRent = RentDao.getAllRentRequestForCust(p);
                int rentamount = 0;
                int repairamount = 0;
                if (allRent != null && allRent.size() > 0) {
                    for (Rent rent : allRent) {
                        rentamount = rentamount + rent.getPaid_ByCust();
                    }
                }
              

                List<Repair> allRepair = null;
                allRepair = RepairDao.getAllRepairRequestForCust(p);
                if (allRepair != null && allRepair.size() > 0) {
                    for (Repair rp : allRepair) {

                        repairamount = repairamount + rp.getBal();
                    }
                }
%>
            
<div class="row">
    
       <%                                           if (session.getAttribute("i") != null) {
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
    
    <div class="col-md-4 col-sm-12 col-xs-12"></div>
    <div class="col-md-4 col-sm-12 col-xs-12">
        <div class="x_panel">
            <h2 style="text-align:center">User Profile Card</h2>

            <div class="card">

                <img src="../../AdminImages/admin.jpg" alt="John" style="width:25%">

                <h2><%=p.getName()%></h2>

                <p class="title"><%=p.getMobileNo()%></p>
                <p class="title">Bal:-<%=rentamount + repairamount + StudentBalanceamount%></p>
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
</div>
          </div>
        </div>
        <!-- /page content -->
                <!-- /page content -->

                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
            </div>
        </div>

        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- Chart.js -->
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

        <script type="text/javascript">
            $(document).ready(function() {

                $('#mobileno').keyup(function() {
 
                    var mobileno = $('#mobileno').val();
                    if(mobileno != "")
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
 
                    var srrequestid =this.id;
                   
                          $('#allDashboard').hide();

                    $.get("AjaxPages/RequestFetch.jsp", {srrequestid: srrequestid}, function(data) {
                           alert('sucess');
                        $('#AccountFetch').html(data);
                    });
                
                });
              

            });
        </script>
      
        <%@ include file = "JavaScriptFile.jsp" %>  
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
        button {
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

        
    </body>
</html>
