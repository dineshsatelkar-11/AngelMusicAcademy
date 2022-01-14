<%@page import="com.accede.angel.admin.dao.ExternalAccountSuperDao"%>
<%@page import="com.accede.angel.admin.model.ExternalAccountSuper"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDao"%>
<%@page import="com.accede.angel.admin.dao.ExternalAccountDao"%>
<%@page import="com.accede.angel.sell.dao.VendorDao"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.sell.model.Venderregistration"%>
<%@page import="com.accede.angel.admin.model.ExternalAccount"%>
<%@page import="com.accede.angel.admin.model.SuperAdminPayment"%>
<%@page import="com.accede.angel.admin.dao.SuperAdminPaymentDao"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.accede.angel.admin.model.Payment"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <style> 
        .studentimage {
            width: 50px;
            hight: 50px;


            -webkit-transition: width 2s; /* For Safari 3.1 to 6.0 */
            transition: width 2s;
        }
        .studentimage:hover {
            width: 300px;
            hight: 300px;

        }
    </style>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">

                <%@ include file = "../comman_files/adminSideBarFile.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div  role="main">
                    <div class="">

                        <div class="clearfix"></div>
                        <!-- Modal -->


                        <div class="modal fade" id="CustomeDate" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" style="margin-right: -240px" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title"> Custom Filter</h4>
                                    </div>
                                    <form class="form-horizontal form-label-left input_mask" method="post"  action="SuperAdminDailyInOut.jsp"  data-parsley-vdalidate>


                                        <div class="modal-body">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">From Date <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input  type="date" value=""  name="FDate" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                                            </div>
                                            <br>

                                            <!--          <p>Some text in the modal.</p>-->
                                        </div>
                                        <div class="modal-body">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">To Date<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input  type="date" value=""  name="TDate" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                                            </div>
                                            <br>
                                            <br>
                                            <br>
   <input type="hidden" id="id" name="id" value="">
                                            <!--          <p>Some text in the modal.</p>-->
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <!--                          <p><button class="btn btn-primary" type="button">Cancel</button></p>-->
                                                <table>
                                                    <tr>
                                                        <td> <button class="btn btn-primary" type="reset">Reset</button></td>
                                                        <td> <button type="submit" id="myEnquirybtn" class="btn btn-success">Submit</button></td>


                                                    </tr>
                                                </table>



                                            </div>
                                        </div>

                                    </form>
                                    <br>
                                    <br>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" style="width:20%" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
<%

 SuperAdminPaymentDao cd = new SuperAdminPaymentDao();
 
                                                        int i = 0;
                                                        int creditamt=0;
                                                        int debitamt=0;
                                                        List<SuperAdminPayment> cl = null;
                                                        String Days = request.getParameter("Days");
                                                        String BranchId = request.getParameter("id");
                                                        String FDate = request.getParameter("FDate");
                                                        String TDate = request.getParameter("TDate");
                                                        String paymentAgainsType= "Branch";
                                                        System.out.println("BranchId==" + BranchId);
                                                        Admin adminfilter = new Admin();
                                                        if (BranchId != null) {
                                                            if (BranchId != "") {
                                                                adminfilter = adddd.getAdminByID(Integer.parseInt(BranchId));
                                                            }
                                                        }

%>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <!--                                        <h2>All Account Details </h2> -->
                                        <div class="row">
                                            <!--<div class="btn-group">-->
                                            <!--<div class="btn btn-default">-->
                                            <button onclick='window.top.location.href = "SuperAdminDailyInOut.jsp?Days=0&id=" + document.getElementById("Branch").value;' class="btn btn-default" name="Today" value="1" type="button">Today</button>
                                            <button onclick='window.top.location.href = "SuperAdminDailyInOut.jsp?Days=1&id=" + document.getElementById("Branch").value;' class="btn btn-default" name="Today" value="1" type="button">Yesterday</button>
                                            <button onclick='window.top.location.href = "SuperAdminDailyInOut.jsp?Days=7&id=" + document.getElementById("Branch").value;' class="btn btn-default" name="Today" value="1" type="button">Last 7 Days</button>
                                            <!--                                                </div>
                                                                                            <div class="btn btn-default">-->
                                            <button onclick='window.top.location.href = "SuperAdminDailyInOut.jsp?Days=30&id=" + document.getElementById("Branch").value;'  class="btn btn-default" name="Today" value="1" type="button">Last 30 Days</button>
                                            <button onclick='window.top.location.href = "SuperAdminDailyInOut.jsp?Days=-1&id=" + document.getElementById("Branch").value;' class="btn btn-default" name="Today" value="1" type="button">This Month</button>
                                            <button onclick='window.top.location.href = "SuperAdminDailyInOut.jsp?Days=-2&id=" + document.getElementById("Branch").value;' class="btn btn-default" name="Today" value="1" type="button">Last Month</button>
                                            <button onclick='window.top.location.href = "SuperAdminDailyInOut.jsp?Days=-3&id=" + document.getElementById("Branch").value;' class="btn btn-default" name="Today" value="1" type="button">All Days</button>
                                            <!--                                                </div>
                                                                                            <div class="btn btn-default">-->
                                            <button class="btn btn-default" data-toggle="modal" data-target="#CustomeDate" type="button">Custom</button>

                                            <!--</div>-->

                                            <!--</div>-->
                                           





                                        </div>
                                    </div>


                                        <input type="hidden" id="Branch" name="Branch" value="">
                                    <div id="studentfetch">
                                        <div class="x_content">

                                            <table id="datatable" class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>


                                                        <th class="table_center">Sr No</th>
                                                        <th class="table_center">Agains</th>
                                                       
                                                        <th class="table_center">Date</th>
                                                        <th class="table_center">Time</th>
                                                        <th class="table_center">Credit</th>
                                                        <th class="table_center">Debit</th>
                                                        <th class="table_center">Payment Agains</th>
                                                        <th class="table_center">Payment Type</th>






                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <%
                                                       
                                                        System.out.println("adminfilter==" + adminfilter);
                                                        int noofdays = 0;

                                                        if (Days != null) {
                                                            if (Days.equals("-1")) {

                                                                if (adminfilter.getAdminId() != 0) {

                                                                    cl = cd.getPaymentThisMonth();
                                                                } else {
                                                                    cl = cd.getPaymentThisMonth();
                                                                }
                                                            } else if (Days.equals("-2")) {

                                                                if (adminfilter.getAdminId() != 0) {
                                                                    cl = cd.getPaymentLastMonth();

                                                                } else {
                                                                    cl = cd.getPaymentLastMonth();
                                                                }

                                                            } else if (Days.equals("-3")) {

                                                                if (adminfilter.getAdminId() != 0) {
                                                                    cl = cd.getAllPayment();

                                                                } else {
                                                                    cl = cd.getAllPayment();
                                                                }

                                                            }  
                                                            else {
                                                                noofdays = Integer.parseInt(Days);
                                                                if (adminfilter.getAdminId() != 0) {
                                                                    cl = cd.getPaymentInoutt(noofdays);

                                                                } else {
                                                                    cl = cd.getPaymentInoutt(noofdays);

                                                                }
                                                            }
                                                        } else {

                                                            if (FDate != null) {
                                                                if (FDate != "") {

                                                                    Date FromDate = new Date();
                                                                    Date ToDate = new Date();

                                                                    try {
                                                                        FromDate = new SimpleDateFormat("yyyy-MM-dd").parse(FDate);
                                                                       
                                                                    } catch (ParseException ex) {
                                                                        ex.printStackTrace();
                                                                    }
                                                                    
                                                                    try {
                                                                        ToDate = new SimpleDateFormat("yyyy-MM-dd").parse(TDate);
                                                                       
                                                                    } catch (ParseException ex) {
                                                                        ex.printStackTrace();
                                                                    }
                                                                    
                                                                    if (adminfilter.getAdminId() != 0) {
                                                                    cl = cd.getPaymentInoutt(FromDate, ToDate);

                                                                } else {
                                                                cl = cd.getPaymentInoutt(FromDate, ToDate);
                                                                } 
                                                                    
                                                                    
                                                                }
                                                            } else {
                                                                cl = cd.getAllPayment();
                                                            }

                                                        }

                                                       if (cl != null && cl.size() > 0) {
                                                            for (SuperAdminPayment p : cl) {

                                                                Date dt = p.getPaymentTime();
                                                                String dd = dt.toString();
                                                                String[] datespilt = dd.split(" ");
  String dateee  = DATE_FORMAT.format(p.getPaymentDate());
                                                                i++;
 String agains = "";
                                                                if (p.getPaymentAgainsType().equals("External Account")) {
                                                                    ExternalAccountSuper ExternalAccount = new ExternalAccountSuperDao().getEmployeeByID(Integer.parseInt(p.getPaymentAgains()));
                                                                    agains = ExternalAccount.getAccountHolderName();
                                                                } else if (p.getPaymentAgainsType().equals("Vendor")) {
                                                                    Venderregistration Venderregistration = new VendorDao().getvenderbyid(Long.parseLong(p.getPaymentAgains()));
                                                                    agains = Venderregistration.getVendorname();
                                                                } else if (p.getPaymentAgainsType().equals("Branch")) {
                                                                    Admin Admin = new AdminDao().getAdminByID(Integer.parseInt(p.getPaymentAgains()));
                                                                    agains = Admin.getAdminOfBranch().getBranchName();
                                                                } else if (p.getPaymentAgainsType().equals("Employee")) {
                                                                    Employee Employee = new EmployeeDao().getEmployeeByID(Long.parseLong(p.getPaymentAgains()));
                                                                    agains = Employee.getName();
                                                                } else {
                                                                }

                                                    %>

                                                    <tr>
                                                        <td class="table_center"><%=i%></td>
                                                        <td class="table_center"><%=p.getPaymentAgainsType()%>-<%=agains%></td>
                                                    
                                                        <td class="table_center"><%=dateee%> </td>
                                                        <td class="table_center"><%=datespilt[1]%> </td>
                                                        <%if (p.getPaymentType().equals("Credit")) {
                                                        creditamt=creditamt+p.getAmount();
                                                        
                                                        %>
                                                        <td class="table_center"><%=p.getAmount()%></td> 
                                                        <td class="table_center"></td> 
                                                        <%} else {
                                                         debitamt=debitamt+p.getAmount();
                                                        %>
                                                        <td class="table_center"></td> 
                                                        <td class="table_center"><%=p.getAmount()%></td>  
                                                        <%}%>
                                                        <td class="table_center"><%=p.getDescription()%></td> 
                                                        <td class="table_center"><%=p.getPaymentMode()%></td> 




                                                    </tr>  
                                                    <%}
                                                        }%>

                                                </tbody>
                                                <tfoot>
                                                    <tr>


                                                        <th class="table_center"></th>
                                                  
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"><%=creditamt%></th>
                                                        <th class="table_center"><%=debitamt%></th>
                                                        
                                                        <th class="table_center">Final In Amount</th>
                                                        <th class="table_center"><%=creditamt-debitamt%></th>






                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>
                </div>
                <script>
                    $(document).ready(function() {
                        $('[data-toggle="popover"]').popover();
                    });
                </script>

                <!-- /page content -->


                <!-- footer content -->
                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
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

        <script>
                    $(document).ready(function() {

                        $('.user_buttons').click(function(event) {
                            var UID = this.id;
                            var adminidd = $("#adminidd").val();
                            if (UID !== "")
                            {
                                var pos = $(this).attr("data");
                                $("#position").text("" + pos + " Due Date Student");
                                $.ajax({
                                    url: "FetchStudent.jsp",
                                    type: "post",
                                    data: {userID: UID, adminidd: adminidd},
                                    success: function(response) {
                                        $("#studentfetch").html(response);
                                    },
                                    error: function(jqXHR, textStatus, errorThrown) {
                                        console.log(textStatus, errorThrown);
                                        alert("Something Went Wrong...!!!");
                                    }
                                });
                            } else
                            {
                                alert("No Users Added...!!!");
                            }
                        });



                    });
        </script>
    </body>
</html>