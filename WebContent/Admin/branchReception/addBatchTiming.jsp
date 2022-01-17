<%@page import="com.accede.angel.admin.model.BatchTimings"%>
<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
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
    <head>
        <link href="../comman_files/favicon.png" rel="shortcut icon" type="image/png">

    </head>

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

                
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Add Batch Time  </h2>
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
                                        <br />
                                        <form method="post" action="../../AddBatchTiming" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                                            <%                                          if (session.getAttribute("i") != null) {
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

                                            <%

                                                BatchTimeDa0 bdd = new BatchTimeDa0();
                                                List<BatchTimings> b = bdd.getAllBatchTimings();
                                            %>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="batchtime">Starting Time <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select class="form-control" required="" id="from" name="from" >
                                                        <option >-Select Batch Timings-</option> 
                                                        <%
                                                            for (BatchTimings c : b) {

                                                                if (!(c.getBatchTiming().equals("10pm"))) {
                                                        %>
                                                        <option value="<%=c.getId()%>"><%=c.getBatchTiming()%></option> 
                                                        <%}
       }%>
                                                    </select>



                                                </div>
                                            </div>
                                            <div class="form-group" id="endbatchtimefetch">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="batchtime">End Time <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select required=""  class="form-control" id="end" name="end" >
                                                        <option >-Select Batch Timings-</option> 

                                                    </select>



                                                </div>
                                            </div>
                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">

                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <button type="submit" class="btn btn-success">Submit</button>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Batch Time Details </h2>   
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
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="table_center">Sr No</th>

                                                    <th class="table_center">Batch Time </th>
                                                    <th class="table_center">Edit Batch Time </th>


                                                    <th class="table_center">Delete Batch Time </th



                                                </tr>
                                            </thead>
                                            <tbody>

                                                <% int j = 0;
                                                    BatchTimeDa0 bd = new BatchTimeDa0();

                                                    List<BatchTime> c = bd.getAllBatchTime();
                                                    for (BatchTime p : c) {
                                                        if (p.getAdminOfBranch().getAdminId() == admin.getAdminId()) {
                                                            j++;

                                                %>
                                                <tr>
                                            <input type="hidden" value="<%=p.getBatchTimeId()%>" id="prd_id<%=j%>">
                                            <td class="table_center"><%=j%> </td>
                                            <td class="table_center" id="prd_name<%=j%>"><%=p.getBatchTiming()%></td> 

                                            <td class="table_center"><a href="EditBatchTiming.jsp?batchtimeid=<%=p.getBatchTimeId()%>" ><i id="<%=j%>" class="fa-2x glyphicon glyphicon-edit edit_prd"></i></a></td>

                                            <form action="../../DeleteBatchTime">
                                                <td class="table_center">
                                                    <input type="hidden" value="<%=p.getBatchTimeId()%>" id="deletebatch" name="deletebatch">
                                                    <button class="btn btn-danger table_center" type="submit">Delete</button>   
                                                </td>
                                            </form>



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
                <div class="example-modal">
                    <div class="modal" id="myModal1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="../../EditBatchTiming" name="update">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">Edit Product </h4>
                                    </div>
                                    <div class="modal-body">

                                        <table  class="table table-striped">
                                            <thead>

                                            <th class="table_center">Batch Timing</th>

                                            <!--                                                        <th>Discount</th>
                                                                                                    <th>Add Qnt</th>-->

                                            </thead>
                                            <tbody class="text-center">
                                                <tr class="text-center">
                                            <input type="hidden" id="modal_prd_id" name="modal_prd_id">
                                            <td class="text-center"><input type="text" name="modal_prd_name" id="modal_prd_name" class="form-control table_center" ></td>
                                            </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary" id="updateProduct"   >Edit Batch Timing</button>
                                    </div>
                                </form>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                </div>

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
            $('#document').ready(function() {

                $('.edit_prd').click(function(event) {
                    var i = this.id;
                    $('#modal_prd_id').val($('#prd_id' + i).val());


                    $('#modal_prd_name').val($('#prd_name' + i).text());

                });



                $('#from').change(function(event) {
//        alert("dsfhvg");                                                               
                    var i = this.value;
//                 alert("dsfhvg"+i);    
                    $.get("FetchBatchTimeAjax.jsp", {i: i}, function(data) {
//                           alert('sucess');
                        $('#endbatchtimefetch').html(data);
//                          alert('sucess');
                    });
                });


            });

        </script>


    </body>
</html>