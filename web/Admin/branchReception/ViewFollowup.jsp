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
                <%                    String paymentfollowId = request.getParameter("paymentfollowId");

                    int srrequestid = Integer.parseInt(paymentfollowId);

                %>
                <div class="" role="main">
                    <div class="">
                        <div class="modal fade" id="FollowupModel" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Add Remark</h4>
                                    </div>
                                    <form class="form-horizontal form-label-left input_mask" action="../../FollowupSave" id="myForm1" data-parsley-vdalidate>
                                        <input type="hidden" id="srrequestid" name="srrequestid" value="<%=srrequestid%>">


                                        <div class="modal-body">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email-id">Type of Remark <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select id="type_remark" required="" name="type_remark" class="form-control col-md-7 col-xs-12">

                                                    <option value="">Select Remark</option>
                                                    <option value="Followup Remark">Followup Remark</option>
                                                    <option value="Closure Remark">Closure Remark</option>
                                                </select>

                                            </div>
                                            <!--          <p>Some text in the modal.</p>-->
                                        </div>
                                        <br>

                                        <div class="modal-body">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Next Followup Date <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="date" id="nxtdate" name="nxtdate" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                            <br>

                                        </div>

                                        <br>
                                        <div class="modal-body">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Remark <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <textarea id="Remark" name="Remark" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text"></textarea>
                                            </div>
                                            <br>
                                            <br>
                                            <br>
                                            <!--          <p>Some text in the modal.</p>-->
                                        </div>

                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <!--                          <p><button class="btn btn-primary" type="button">Cancel</button></p>-->
                                                <button type="button" id="SubmitButton2" class="btn btn-success">Submit</button>
                                                <button class="btn btn-primary" type="reset">Reset</button>

                                            </div>
                                        </div>
                                    </form>
                                    <br>
                                    <br>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Followup Remark</h2>
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
                                        <div class="row">
                                            <div class="col-md-4 col-xs-12 col-sm-12" ></div>
                                            <div class="col-md-6 col-xs-12 col-sm-12" ></div>
                                            <div class="col-md-2 col-xs-12 col-sm-12" >
                                                <button type="button" class="btn btn-info btn-lg right"  data-toggle="modal" data-target="#FollowupModel">Remark</button>
                                            </div>
                                        </div>
                                    </div>

                                    <!--<p>Simple table with project listing with progress and editing options</p>-->





                                    <!-- start project list -->
                                    <table class="table table-striped projects">
                                        <thead>
                                            <tr>
                                                <th style="width: 1%">#</th>
                                                <th style="width: 20%">Customer Name</th>
                                                <th style="width: 60%"> Remark</th>
                                                <th> Remark Date</th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%
                                                PaymentFollowup PaymentFollowup = new PaymentFollowupDao().getPaymentFollowupByID(srrequestid);
                                                List<PaymentFollowupMessage> allPaymentFollowupMessage = new PaymentFollowupDao().getAllPaymentFollowupMessage(PaymentFollowup);

                                                System.out.println(allPaymentFollowupMessage.size());

                                                for (PaymentFollowupMessage q : allPaymentFollowupMessage) {

 String date1 = DATE_FORMAT.format(PaymentFollowup.getRequestDate());
 String date11 = DATE_FORMAT.format(q.getFollowupdate());
                                            %>
                                            <tr>
                                                <td>#</td>
                                                <td>
                                                    <a><%=PaymentFollowup.getCustomerAccount().getName().toUpperCase()%></a>
                                                    <br />
                                                    <small>Created <%=date1%></small>
                                                </td>
                                                <td>
                                                    <ul class="list-inline">
                                                        <%= q.getDescription()%>
                                                    </ul>
                                                </td>
                                                <td class="project_progress">
                                                    <%= date11%>
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


         <%@ include file = "JavaScriptFile.jsp" %>


</body>
</html>
