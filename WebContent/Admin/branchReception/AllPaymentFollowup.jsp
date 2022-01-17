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
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
         
            
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>All Request</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <!--<p>Simple table with project listing with progress and editing options</p>-->

                    
                   
                    
                   
                    <!-- start project list -->
                      <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th style="width: 1%">Sr No</th>
                          <th style="width: 20%">Customer Name</th>
                          <th>Last Remark</th>
                          <th>Last Remark Date</th>
                          <th>Customer Profile</th>
                          <th style="width: 20%">#All Review</th>
                        </tr>
                      </thead>
                      <tbody>
               
                       
                     <%
                         List<PaymentFollowup> allPaymentFollowup1 = new PaymentFollowupDao().getAllPaymentFollowup(admin);
                      int w=0;
                         for (PaymentFollowup PaymentFollowup : allPaymentFollowup1) {
                        w++;
                         List<PaymentFollowupMessage> allPaymentFollowupMessage1 = new PaymentFollowupDao().getAllPaymentFollowupMessage(PaymentFollowup);
                                    String msg = "";
                                    Date d=new Date();
                                    
                                   
                                    for (PaymentFollowupMessage q : allPaymentFollowupMessage1) {
                                        msg = q.getDescription();
                                        d=q.getFollowupdate();
                                        System.out.println(q);
                                    }
                        
%>

  <tr>
                          <td><%=w%></td>
                          <td>
                            <a><%=PaymentFollowup.getCustomerAccount().getName().toUpperCase() %></a>
                            <br />
                            <small>Created <%=PaymentFollowup.getRequestDate()%></small>
                          </td>
                          <td>
                            <ul class="list-inline">
                              <%=msg%>
                            </ul>
                          </td>
                          <td >
<!--                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
                            </div>-->
                            <%=d%>
                          </td>
                          <td>
                              <a href="AccountDetails.jsp?accountid=<%=PaymentFollowup.getCustomerAccount().getId()%>"> <button type="button" class="btn btn-success btn-xs"><i class="fa fa-folder"></i> Profile</button></a>
                          </td>
                          <td>
                              <a href="ViewFollowup.jsp?paymentfollowId=<%=PaymentFollowup.getId()%>">   <button type="button" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View</button></a>
                          
                          </td>
                        </tr>

                    <%}%>
                       
                      </tbody>
                    </table>
                    <!-- end project list -->

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
    </body>
</html>
