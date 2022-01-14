<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.model.StudentAccount"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.EnquiryDetail"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
    <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('#document').ready(function() {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                viewMode: "years"
            });



        })
    </script>

    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/branchAdminSideBar.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <!--                        <div class="page-title">
                                                    <div class="title_left">
                                                        <h3>All Client Details </h3>                               
                        
                                                    </div>
                        
                                                    <div class="title_right">
                                                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control" placeholder="Search for...">
                                                                <span class="input-group-btn">
                                                                    <button class="btn btn-default" type="button">Go!</button>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>-->
                     
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Problem Details </h2>   
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
                                        <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                </p>-->
                                        
                                        
                                        
                                <%                                    long id = Long.parseLong(request.getParameter("asd"));
                                    RepairDao cd = new RepairDao();
                                    Repair admission = cd.getRepairByID(id);
                                    int i = 0;
                                    int j = admission.getNoofinstrument();
                                   String [] brandname=new String[5];
                                   String [] modelnumber=new String[5];
                                   String [] problem=new String[5];
                                   String [] repairingcost=new String[5];
                                   String [] instrumnts=new String[5];
                                    int coursefee = 0;
                                    for (int k = 0; k < j; k++) {
                                        if (k == 0) {
                                            int fee = admission.getInstrumentFee1();
                                           brandname[k]=admission.getBrandname1() ;
                                           modelnumber[k]=admission.getModelnumber1();
                                           problem[k]=admission.getProblem1();
                                           instrumnts[k]=admission.getInstrumentName1();
                                           repairingcost[k]=Integer.toString(fee);
                                         
                                            coursefee = coursefee + fee;
                                        } else if (k == 1) {
                                            int fee = admission.getInstrumentFee2();
                                              brandname[k]=admission.getBrandname2() ;
                                           modelnumber[k]=admission.getModelnumber2();
                                           problem[k]=admission.getProblem2();
                                            instrumnts[k]=admission.getInstrumentName2();
                                           repairingcost[k]=Integer.toString(fee);
                                          
                                            coursefee = coursefee + fee;
                                        } else if (k == 2) {
                                            int fee = admission.getInstrumentFee3();
                                              brandname[k]=admission.getBrandname3() ;
                                           modelnumber[k]=admission.getModelnumber3();
                                           problem[k]=admission.getProblem3();
                                            instrumnts[k]=admission.getInstrumentName3();
                                           repairingcost[k]=Integer.toString(fee);
                                          
                                            coursefee = coursefee + fee;
                                        } else if (k == 3) {
                                            int fee = admission.getInstrumentFee4();
                                              brandname[k]=admission.getBrandname4() ;
                                           modelnumber[k]=admission.getModelnumber4();
                                           problem[k]=admission.getProblem4();
                                            instrumnts[k]=admission.getInstrumentName4();
                                           repairingcost[k]=Integer.toString(fee);
                                           
                                            coursefee = coursefee + fee;
                                        } else if (k == 4) {
                                            int fee = admission.getInstrumentFee5();
                                              brandname[k]=admission.getBrandname5() ;
                                           modelnumber[k]=admission.getModelnumber5();
                                           problem[k]=admission.getProblem5();
                                            instrumnts[k]=admission.getInstrumentName5();
                                           repairingcost[k]=Integer.toString(fee);
                                           
                                            coursefee = coursefee + fee;
                                        }
                                    }
                                %>

                                        <table id="datatable-buttons" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="table_center">Sr No</th>
                                                    <th class="table_center">Instrument Name</th>
                                                    <th class="table_center">Brand Name </th>
                                                    <th class="table_center">Model Number</th>
                                                    <th class="table_center">Problem</th>
                                                    <th class="table_center">Repairing Cost</th>
                                                   

                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%

                                                     for (int k = 0; k < j; k++)
                                                     {  
                                                         i++;

                                                %>
                                                <tr>

                                                    <td class="table_center"><%=i%> </td>
                                                    <td class="table_center"><%=instrumnts[k]%></td> 
                                                    <td class="table_center"><%=brandname[k]%></td> 
                                                    <td class="table_center"><%=modelnumber[k]%></td> 
                                                    <td class="table_center"><%=problem[k]%></td> 
                                                    <td class="table_center"><%=repairingcost[k]%></td> 
                                                 

                                                </tr> 
                                                <%}
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
        <!-- bootstrap-progressbar -->
        <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <!-- iCheck -->
        <script src="../vendors/iCheck/icheck.min.js"></script>
        <!-- bootstrap-daterangepicker -->
        <script src="../vendors/moment/min/moment.min.js"></script>
        <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- bootstrap-wysiwyg -->
        <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
        <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
        <script src="../vendors/google-code-prettify/src/prettify.js"></script>
        <!-- jQuery Tags Input -->
        <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
        <!-- Switchery -->
        <script src="../vendors/switchery/dist/switchery.min.js"></script>
        <!-- Select2 -->
        <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
        <!-- Parsley -->
        <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
        <!-- Autosize -->
        <script src="../vendors/autosize/dist/autosize.min.js"></script>
        <!-- jQuery autocomplete -->
        <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
        <!-- starrr -->
        <script src="../vendors/starrr/dist/starrr.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
        <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
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
                                $(document).ready(function() {
                                    $('#payment_mode_hide').hide();
                                    $('#payment_hide').hide();
                                    $('#payment_paid_hide').hide();
                                    $('#followupdate').hide();
                                    $('.row0').on('keyup change', function() {

                                        var paymenttype = $('#paymenttype').val();

                                        var Course_fee = $('#Course_fee').val();
                                        var pbal = $('#pbal').val();
                                        var totalAmount = $('#totalAmount').val();
                                        var paidAmount = $('#paidAmount').val();
                                        var Discount = $('#Discount').val();
                                        var beforedisc = $('#beforedisc').val();
                                        var discAmount = $('#discAmount').val();
                                        var remaining_amount = $('#remaining_amount').val();

                                        if (paymenttype == 1)
                                        {
                                            totalAmount = parseInt(Course_fee) + parseInt(pbal);
                                            $('#beforedisc').val(totalAmount);
                                            discAmount = parseInt(totalAmount) * Discount / 100;
                                            $('#discAmount').val(discAmount);
                                            totalAmount = parseInt(totalAmount) - parseInt(discAmount);

                                            $('#totalAmount').val(totalAmount);
                                            remaining_amount = parseInt(totalAmount) - parseInt(paidAmount);
                                            $('#remaining_amount').val(remaining_amount);
                                        }
                                        else if (paymenttype == 2)
                                        {
                                            totalAmount = parseInt(pbal);
                                            $('#beforedisc').val(totalAmount);
                                            discAmount = parseInt(totalAmount) * Discount / 100;
                                            $('#discAmount').val(discAmount);
                                            totalAmount = parseInt(totalAmount) - parseInt(discAmount);

                                            $('#totalAmount').val(totalAmount);
                                            remaining_amount = parseInt(totalAmount) - parseInt(paidAmount);
                                            $('#remaining_amount').val(remaining_amount);

                                        }
                                        else
                                        {

                                        }

                                    })
                                })

        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".hide_gst").hide();
                $(".hide_price").hide();
                $(".hideall").hide();
                $(".hide_qnt").hide();
                $(".hide_ship").hide();
                $('#datetimepicker1').datetimepicker({
                    format: 'DD/MM/YYYY',
                    viewMode: "years"
                });
            })
        </script>>
        <style>

            .table_center{

                text-align: center;
            }

        </style>
    </body>
</html>