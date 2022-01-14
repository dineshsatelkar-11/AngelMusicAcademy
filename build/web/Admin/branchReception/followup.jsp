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

                <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div  role="main">



                    <div class="">
                        <div class="row">
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <div class="x_panel">

                                    <h4><small>Follow Up Form</small></h4>



                                    <div class="x_content">

                                        <form class="form-horizontal form-label-left input_mask" action="../../SaveFollowUp" id="myForm1" data-parsley-vdalidate>
                                            <%                                                 int id = Integer.parseInt(request.getParameter("asd"));
                                                EnquiryDao ed = new EnquiryDao();
                                                Enquiry en = new Enquiry();
                                                en = ed.getEnquiryByID(id);

                                            %>
                                            <input type="hidden" value="<%=en.getId()%>" id="enquiryid" name="enquiryid"> <div class="row">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p ><strong>  Customer Name:</strong></p>
                                                    <input type="text" id="fname" readonly="" name="fname" value="<%=en.getName()%>"  onkeypress="return alpha(event)" placeholder="First Name" class="form-control">

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p ><strong> Mobile Name:</strong></p>
                                                    <input type="text" id="fname" readonly name="fname" value="<%=en.getMobile()%>"  onkeypress="return alpha(event)" placeholder="First Name" class="form-control">

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p ><strong> Customer Requirement :</strong></p>
                                                    <input type="text" id="fname" readonly name="fname" value="<%=en.getCustRequirement()%>"  onkeypress="return alpha(event)" placeholder="First Name" class="form-control">

                                                </div>

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p ><strong> Offer Given By Shop:</strong></p>
                                                    <input type="text" id="fname" readonly name="fname" value="<%=en.getOfferGivenByShop()%>"  onkeypress="return alpha(event)" placeholder="First Name" class="form-control">

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p ><strong>Follow Up By:</strong></p>
                                                    <input type="text" id="counsellorname" name="counsellorname" value=""  onkeypress="return alpha(event)" placeholder="Counsellor Name" class="form-control">

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p ><strong>Next Follow Up Date :</strong></p>
                                                    <input type="date" id="follow" name="follow" value="<%=en.getCustRequirement()%>"  onkeypress="return alpha(event)" placeholder="First Name" class="form-control">

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p ><strong>Remark :</strong></p>
                                                    <select id="type_remark" required="" name="type_remark" class="form-control col-md-7 col-xs-12">

                                                        <option value="">Select Remark</option>
                                                        <option value="Followup Remark">Followup Remark</option>
                                                        <option value="Closure Remark">Closure Remark</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-8 col-sm-12 col-xs-12 form-group">
                                                    <p ><strong>Remark :</strong></p>
                                                    <input type="text" required="" id="remark" name="remark" value=""  onkeypress="return alpha(event)" placeholder="Enter remark Here" class="form-control">

                                                </div>


                                                <div class="ln_solid"></div>
                                                <div class="form-group">
                                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">

                                                        <button type="reset" class="btn btn-primary">Reset</button>
                                                        <button type="submit" class="btn btn-success">Submit</button>

                                                    </div>
                                                </div>



                                            </div>

                                    </div>
                                </div> </div>
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
                                                                   
String date1 = DATE_FORMAT.format(p.getFollowupDate());
                                                        i++;
                                                %>
                                                <tr>
                                                    <td class="table_center"><%=i%> </td>
                                                    <td class="table_center"><%=p.getRemark()%> </td>
                                                    <td class="table_center"><%=p.getCounsellorName()%></td> 
                                                    <td class="table_center"><%=date1%></td> 
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