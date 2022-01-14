
<%@page import="com.accede.angel.sell.dao.SubCatDao"%>
<%@page import="com.accede.angel.sell.model.SubCategory"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<!DOCTYPE html>
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
                <div  role="main">
                    <div class="">

                        <div class="page-title">
                            <div class="title_left">
                                <h3>Sub Category</h3>
                            </div>


                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Add Sub Category </h2>
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
                                        <form method="post" action="../../AddSubCatServ" id="demo-form2"  onsubmit="return valid();" data-parsley-validate class="form-horizontal form-label-left">
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
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Select Category <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select type="text" id="Catid" name="Catid"  required="required" placeholder="Invoice Number"  class="form-control"> 


                                                        <option value="">Select Category</option>

                                                        <%
                                                            CategoryDao bd = new CategoryDao();
                                                            Category ca = new Category();
                                                            List<Category> c = bd.getAllCategory(ca);
                                                            for (Category p : c) {


                                                        %>

                                                        <option value="<%=p.getCategory()%>"><%=p.getCategory()%></option>

                                                        <%}%>  </select></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Sub Category Name<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="SubCategory" name="SubCategory" required="required" onkeypress="return alpha(event)" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <!--                                            <div class="form-group" id="course_Name">
                                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname"> 
                                                                                            </label>
                                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                                <center > <span  style="color:red">The Instrument Name has  special characters. These are not allowed.</span></center >
                                                                                            </div>
                                                                                        </div>-->

                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                    <!--<button class="btn btn-primary" type="button">Cancel</button>-->
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
                                        <h2>All Category Details </h2>   
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


                                    <div class="example-modal">
                                        <div class="modal" id="EditSubCat">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="../../EditSubCategory" name="update">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title">Edit Category </h4>
                                                        </div>
                                                        <div class="modal-body">

                                                            <table  class="table table-striped">

                                                                <tbody class="text-center">
                                                                    <tr class="text-center">
                                                                <input type="hidden" id="modal_prd_id" name="modal_prd_id">
                                                                <td class="text-center">
                                                                    Category Name
                                                                </td>
                                                                <td class="text-center">
                                                                    <input type="text" name="modal_prd_name" readonly="" id="modal_prd_name" class="form-control table_center" >
                                                                </td>

                                                                </tr>
                                                                <tr class="text-center">

                                                                    <td class="text-center">
                                                                        Sub  Category Name
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <input type="text" name="modal_prd_name_sub" id="modal_prd_name_sub" class="form-control table_center" >
                                                                    </td>

                                                                </tr>
                                                                </tbody>
                                                            </table>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-primary" id="updateProduct"   >Edit Category</button>
                                                        </div>
                                                    </form>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.modal -->
                                    </div>
                                    <div class="x_content">
                                        <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                </p>-->
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="table_center">Sr No</th>

                                                    <th class="table_center">Category Name </th>
                                                    <th class="table_center">Sub Category Name </th>


                                                    <th class="table_center">Edit Category Name </th>


                                                    <th class="table_center">Delete Category Name </th

                                                </tr>
                                            </thead>
                                            <tbody>

                                                <% int j = 0;
                                                    SubCatDao SubCatDao = new SubCatDao();
                                                    List<SubCategory> allSubCategory = SubCatDao.getAllSubCategory();
                                                    for (SubCategory p : allSubCategory) {
                                                        j++;

                                                %>
                                                <tr>
                                            <input type="hidden" value="<%=p.getId()%>" id="prd_id<%=p.getId()%>">
                                            <input type="hidden" value="<%=p.getCat().getCategory()%>" id="prd_NAMEE<%=p.getId()%>">
                                            <input type="hidden" value="<%=p.getSubCategory()%>" id="prd_NAMEE1<%=p.getId()%>">
                                            <td class="table_center"><%=j%> </td>
                                            <td class="table_center" id="prd_name<%=p.getCategory()%>"><%=p.getCat().getCategory() %></td> 
                                            <td class="table_center" id="prd_name1<%=p.getSubCategory()%>"><%=p.getSubCategory()%></td> 

                                            <td class="table_center"><a href="#" data-toggle="modal" id="<%=p.getId()%>" data-target="#EditSubCat" class="fa-2x glyphicon glyphicon-edit edit_prd" ></a></td>

                                            <form id="from<%=j%>" action="../../DeleteSubCategory">
                                                <td class="table_center">
                                                    <input type="hidden" value="<%=p.getId()%>" id="deletecourse" name="deletecourse">
                                                    <button class="btn btn-danger table_center" type="submit">Delete</button>   
                                                </td>
                                            </form>


                                            </tr> 
                                            <%}
                                            %>

 <input type="hidden" id="noofcourse" id="noofcourse" value="<%=c.size() %>">
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
        <script src="../production/css/Alertajax.js" type="text/javascript"></script>

        
    <script>

var x=document.getElementById('noofcourse').value;
var y = 1;         // assign the value 5 to x
        // assign the value 2 to y
var j = parseInt(x) + parseInt(y);

var i=0;
for (i = 1; i < j; i++) {

document.querySelector('#from'+i).addEventListener('submit', function(e) {

        var form = this;

  e.preventDefault(); // <--- prevent form from submitting

  swal({
      title: "Are you sure?",
      text: "You will not be able to recover this  Sub Category!",
      icon: "warning",
      buttons: [
        'No, cancel it!',
        'Yes, I am sure!'
      ],
      dangerMode: true,
    }).then(function(isConfirm) {
      if (isConfirm) {
        swal({
          title: '',
          text: 'Request Send Successfully!',
          icon: 'success'
        }).then(function() {
          form.submit(); // <--- submit form programmatically
        });
      } else {
        swal("Cancelled", "Your Sub Category  is safe :)", "error");
      }
    })
});
}
</script> 
         <script src="../production/js/Swal.js" type="text/javascript"></script>
        <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>   

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

        <style>

            .table_center{

                text-align: center;
            }

        </style>

        <script type="text/javascript">
                                                        $('#document').ready(function() {
                                                            $("#datatable").on("click", ".edit_prd", function() {


                                                                var i = this.id;

                                                                var j = $('#prd_id'+i).val();
                                                                var k = $('#prd_NAMEE'+i).val();
                                                                var l = $('#prd_NAMEE1'+i).val();
                                                               

                                                                $('#modal_prd_id').val(j);


                                                                $('#modal_prd_name').val(k);
                                                                $('#modal_prd_name_sub').val(l);

                                                            });


                                                        });

        </script>
    </body>
</html>