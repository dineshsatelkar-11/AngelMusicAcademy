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
               
                    <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
              

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <!-- page content -->
        <div  role="main">
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
                    <table id="datatable-buttons" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th >Sr No</th>
                          <th >Customer Name</th>
                          <th>Last Remark</th>
                          <th>Last Remark Date</th>
                          <th>Customer Profile</th>
                          <th >#All Review</th>
                        </tr>
                      </thead>
                      <tbody>
                          
                           <%
                    String idd=request.getParameter("srrequestid");
                    System.out.println("idd=="+idd);
                    if(!(idd.equals("all")))
                    {
                   int  srrequestid =Integer.parseInt(idd);
                     PaymentFollowup PaymentFollowup = new PaymentFollowupDao().getPaymentFollowupByID(srrequestid);
                     List<PaymentFollowupMessage> allPaymentFollowupMessage =  new PaymentFollowupDao().getAllPaymentFollowupMessage(PaymentFollowup);
                                    String msg = "";
                                     System.out.println(allPaymentFollowupMessage.size());
                                    Date d=new Date();
                                    for (PaymentFollowupMessage q : allPaymentFollowupMessage) {
                                        msg = q.getDescription();
                                         d=q.getFollowupdate();
                                        System.out.println(q);
                                    }
                                    
                                    
                                      SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("dd-MM-yyyy");
                                                       
                                                          
                                                                 String date1 = DATE_FORMAT1.format(PaymentFollowup.getRequestDate());
                                                                 String date12 = DATE_FORMAT1.format(d);

                     %>
                        <tr>
                          <td>#</td>
                          <td>
                            <a><%=PaymentFollowup.getCustomerAccount().getName().toUpperCase() %></a>
                            <br />
                            <small>Created <%=date1%></small>
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
                            <%=date12%>
                          </td>
                          <td>
                              <a href="AccountDetails.jsp?accountid=<%=PaymentFollowup.getCustomerAccount().getId()%>"> <button type="button" class="btn btn-success btn-xs"><i class="fa fa-folder"></i> Profile</button></a>
                          </td>
                          <td>
                              <a href="ViewFollowup.jsp?paymentfollowId=<%=PaymentFollowup.getId()%>">   <button type="button" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View</button></a>
                          
                          </td>
                        </tr>
                     <%}else
                    {  int w=0;
                         List<PaymentFollowup> allPaymentFollowup1 = new PaymentFollowupDao().getAllPaymentFollowup(admin);
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

                    <%}}%>
                       
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
        <!-- iCheck -->
        <script src="../vendors/iCheck/icheck.min.js"></script>
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
        <script src="../vendors/jszip/dist/jszip.min.js"></script>
        <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
        <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
        <style>

            .table_center{

                text-align: center;
            }




        </style>


        <%@ include file = "JavaScriptFile.jsp" %>
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
