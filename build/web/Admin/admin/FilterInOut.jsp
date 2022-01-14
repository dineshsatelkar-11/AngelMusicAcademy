
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.admin.dao.PaymentDao"%>
<%@page import="com.accede.angel.admin.model.Payment"%>
<%@page import="com.accede.angel.admin.model.Payment"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	 <link href="../../images/favicon.png" rel="icon" type="image/png">

    <title>Angel Music Academy </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="../vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="../vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="../vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="../vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
  <!-- Datatables -->
    <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
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
  </head>

    <body class="nav-md footer_fixed">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                  <%@ include file = "../comman_files/adminSideBarFile.jsp" %>
</div>
                <!-- top navigation -->
              <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12">

                                <!-- form date pickers -->
                                <div class="x_panel" style="">
                                    <div class="x_content">
                                        <div class="well" style="overflow: auto">
                                            <div class="col-md-3">
                                                <p>Select Date Range </p>
                                            </div>
                                            <div class="col-md-4">
                                                <div id="reportrange_right" class="pull-left dateranger" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                                                    <i class="search2 glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                    <span class="search1" id="search1">December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <select class="form-control" id="Branch" name="Branch" >
                                                    <option value="">Select Branch</option>
                                                    <%
                                                   AdminDao ad = new AdminDao();  
                                                  List<Admin> b = null;
                                                    b = ad.getAllAdmin();
                                                    if (b != null && b.size() > 0) {
                                                        for (Admin p : b) {
                                                            if(p.getAdminId()!=1)
                                                            {
                                                    %>
                                                    <option value="<%=p.getAdminId() %>"><%=p.getAdminOfBranch().getBranchName() %></option>
                                                    <%}}}%>
  
                                                </select>

                                            </div>
                                            <div class="col-md-1">
                                                <input type="button" class="search" value="Search">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /form datepicker -->



                                <br />
                                <br />
                                <!-- /form grid slider -->

                                <!-- image cropping -->
                                <div class="container cropper hidedata">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <div class="img-container">

                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-9 docs-buttons">
                                            <h3 class="page-header">Toolbar:</h3> 




                                            Show the cropped image in modal 
                                            <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            <h4 class="modal-title" id="getCroppedCanvasTitle">Cropped</h4>
                                                        </div>
                                                        <div class="modal-body"></div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            <a class="btn btn-primary" id="download" href="javascript:void(0);" download="cropped.png">Download</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> /.modal 

                                            <input type="text" class="form-control" id="putData" placeholder="Get data to here or set data with this value">
                                        </div> /.docs-buttons 
                                        /.docs-toggles 
                                    </div>
                                </div>
                                <!-- /image cropping -->
                            </div>
                        </div>
                        <div class="row " id="">
                            <div class="col-md-12 col-sm-12 col-xs-12 tablefetch">
                                <div class="x_panel">
                                  
                                     <div class="x_content" >
                                        <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                </p>-->
                                        <table id="datatable-buttons" class="table table-striped table-bordered ">
                                            <thead>
                                              <tr>

                                                      <th class="table_center">Sr No</th>
                                                      <th class="table_center">Branch Name</th>
                                                    <th class="table_center">Date</th>
                                                    <th class="table_center">Time</th>
                                                    <th class="table_center">Credit</th>
                                                    <th class="table_center">Debit</th>
                                                    <th class="table_center">Payment Agains</th>
                                                    <th class="table_center">Payment Type</th>
                                                    <th class="table_center">Bank Name</th>
                                                    <th class="table_center">Transction No</th>

                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%
                                                    PaymentDao cd = new PaymentDao();

                                                    int i = 0;
                                                    List<Payment> cl = null;
                                                    cl = cd.getAllPayment();
                                                    if (cl != null && cl.size() > 0) {
                                                        for (Payment p : cl) {

                                                          
                                                                  Date dt=p.getPaymentTime();
                                                                    String dd=dt.toString();
                                                                    String[] datespilt=dd.split(" "); 
                                                                  
                                                                i++;


                                                %>
                                                <tr>
                                                    <td class="table_center"><%=i%></td>
                                                    <td class="table_center"><%=p.getAdminOfBranch().getAdminOfBranch().getBranchName() %></td>
                                                    <td class="table_center"><%=datespilt[0] %> </td>
                                                    <td class="table_center"><%=datespilt[1] %> </td>
                                                    <%if(p.getPaymentType().equals("Credit"))
                                                    {%>
                                                    <td class="table_center"><%=p.getAmount()%></td> 
                                                    <td class="table_center"></td> 
                                                    <%}else
                                                    { %>
                                                         <td class="table_center"></td> 
                                                  <td class="table_center"><%=p.getAmount()%></td>  
                                                   <%}%>
                                                    <td class="table_center"><%=p.getPaymentAgains()%></td> 
                                                    <td class="table_center"><%=p.getPaymentMode()%></td> 
                                                    <td class="table_center"><%=p.getBankName()%></td> 
                                                    <td class="table_center"><%=p.getTransctionNo()%></td> 



                                                </tr>  
                                                <%}
                                                        }
                                                   
                                                %>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
        <!-- bootstrap-daterangepicker -->
        <script src="../vendors/moment/min/moment.min.js"></script>
        <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- Ion.RangeSlider -->
        <script src="../vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
        <!-- Bootstrap Colorpicker -->
        <script src="../vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
        <!-- jquery.inputmask -->
        <script src="../vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
        <!-- jQuery Knob -->
        <script src="../vendors/jquery-knob/dist/jquery.knob.min.js"></script>
        <!-- Cropper -->
        <script src="../vendors/cropper/dist/cropper.min.js"></script>

        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>







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


        <script type="text/javascript">
            $(document).ready(function () {
                $(".hidedata").hide();
            });

            $('.search').click(function (event) {

                var num = document.getElementById("search1").innerHTML;
                  var Branch = $('#Branch').val();
             
                var res = num.split("-");
                var start = res[0];
                var end = res[1];

                $.ajax({
                    url: "FilterPaymentAjax.jsp",
                    type: "post",
                    data: {start: start, end: end ,Branch :Branch},
                    success: function (response) {
                        $(".tablefetch").html(response);

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                        alert("Something Went Wrong...!!!");
                    }
                });

            });

        </script>
    </body>
</html>