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
                        <div class="x_content">
                            <form action="../../SaveFollowUp" method="get">


                                <%
                                    int id = Integer.parseInt(request.getParameter("asd"));
                                    EnquiryDao ed = new EnquiryDao();
                                    Enquiry en = new Enquiry();
                                    en = ed.getEnquiryByID(id);

                                %>
                                <input type="hidden" value="<%=en.getId() %>" id="enquiryid" name="enquiryid">

                                <div class="row">

                                    <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                        <label>Customer Name</label>
                                    </div>
                                    <div class="col-md-9 col-sm-12 col-xs-12 form-group">
                                        <input id="text" readonly="" value="<%=en.getName()%>" style="height: 50px"  name="requirement"  class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                        <label>Customer Requirement</label>
                                    </div>
                                    <div class="col-md-9 col-sm-12 col-xs-12 form-group">
                                        <input id="textarea" readonly="" value="<%=en.getCustRequirement()%>" style="height: 50px"  name="requirement"  class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                        <label>Offer Given By Shop </label>
                                    </div>

                                    <div class="col-md-9 col-sm-12 col-xs-12 form-group">
                                        <input id="textarea" readonly="" value="<%=en.getOfferGivenByShop()%>" style="height: 50px" name="offer" placeholder="Offer From Shop" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                        <label>Remark </label>
                                    </div>

                                    <div class="col-md-9 col-sm-12 col-xs-12 form-group">
                                        <input id="textarea"   name="remark" placeholder="Remark" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                        <label>Follow Up By </label>
                                    </div>

                                    <div class="col-md-9 col-sm-12 col-xs-12 form-group">
                                        <input id="textarea"   name="counsellorname" placeholder="Counsellor Name" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                        <label>Next Follow Up Date </label>
                                    </div>

                                    <div class="col-md-9 col-sm-12 col-xs-12 form-group">
                                        <input type="text" id="datetimepicker1" name="follow" required="" placeholder="Next Follow Up Date" class="form-control">
                                    </div>
                                </div>
 
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                     
                                        <button type="reset" class="btn btn-primary">Reset</button>
                                        <button type="submit" class="btn btn-success">Submit</button>

                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Client Details </h2>   
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
                                        <table id="datatable-buttons" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>

                                                    <th class="table_center">Sr No</th>
                                                    <th class="table_center">Remark</th>
                                                    <th class="table_center">Counsellor Name</th>
                                                    <th class="table_center">Follow Up Date</th>

                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%

                                                    int i = 0;

                                                   
                                                    for (EnquiryDetail p : en.getEnquiryDetail()) {
                                                        i++;
                                                %>
                                                <tr>
                                                    <td class="table_center"><%=i%> </td>
                                                    <td class="table_center"><%=p.getRemark()%> </td>
                                                    <td class="table_center"><%=p.getCounsellorName()%></td> 
                                                    <td class="table_center"><%=p.getFollowupDate()%></td> 
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