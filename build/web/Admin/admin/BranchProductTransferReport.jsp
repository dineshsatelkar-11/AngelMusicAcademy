

<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.dao.SubCatDao"%>
<%@page import="com.accede.angel.sell.model.SubCategory"%>
<%@page import="com.accede.angel.sell.model.SubCategory"%>
<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.dao.ColorDao"%>
<%@page import="com.accede.angel.sell.model.AddModel"%>
<%@page import="com.accede.angel.sell.dao.ModelDao"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="com.accede.angel.sell.dao.BrandDao"%>
<%@page import="com.accede.angel.sell.model.BranchProduct"%>
<%@page import="com.accede.angel.sell.model.BranchClassTransfer"%>
<%@page import="com.accede.angel.sell.dao.BranchClassTransferDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

  <script src="../production/Validation/js/Alertajax.js" type="text/javascript"></script>



    <body class="nav-md">
        <div class="container body">
            <div class="main_container">

                <%@ include file = "../comman_files/adminSideBarFile.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

   <div class="modal fade" id="CustomeDate" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" style="margin-right: -240px" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title"> Custom Filter</h4>
                            </div>
                            <form class="form-horizontal form-label-left input_mask" method="post"  action="CustomerSellReport.jsp"  data-parsley-vdalidate>


                                <div class="modal-body">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">From Date <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  type="date" value=""  name="FDate" id="FDate" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                                    </div>
                                    <br>

                                    <!--          <p>Some text in the modal.</p>-->
                                </div>
                                <div class="modal-body">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">To Date<span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  type="date" value=""  name="TDate" id="TDate" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                                    </div>
                                    <br>
                                    <br>

                                    <!--          <p>Some text in the modal.</p>-->
                                </div>
                              

                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <!--                          <p><button class="btn btn-primary" type="button">Cancel</button></p>-->
                                        <table>
                                            <tr>
                                                <td> <button class="btn btn-primary" type="reset">Reset</button></td>
                                                <td> <button type="button" id="Customfilterbtn" class="btn btn-success">Submit</button></td>


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
                <!-- page content -->
                <div  role="main">
                    <div class="">

                        <div class="clearfix"></div>

                        <div class="row">


                            <div class="col-md-12 col-sm-12 col-xs-12" >
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Branch Product Transfer Report</h2>
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
                                        <%                                             if (session.getAttribute("i") != null) {
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
                                    </div>


                                  

                                    <div class="row" >
                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                            <div class="form-group">
                                                <div class="col-md-7 col-sm-12 col-xs-12">

                                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                                        <select class="form-control Add_Product" id="adminid" name="adminid" >

                                                            <option value=""> From Branch</option>
                                                            <%
                                                                AdminDao adAdminDao = new AdminDao();
                                                                List<Admin> allAdminList = null;
                                                                allAdminList = adAdminDao.getAllAdmin();
                                                              
                                                                if (allAdminList != null && allAdminList.size() > 0) {
                                                                    for (Admin p123 : allAdminList) {
                                                                        if ( p123.getAdminId() != 1) {
                                                            %>
                                                            <option  value="<%=p123.getAdminId()%>"><%=p123.getAdminOfBranch().getBranchName()%></option>
                                                            <%}
                                                                    }
                                                                }%>


                                                        </select>   
                                                    </div>
<div class="col-md-3 col-sm-12 col-xs-12">
                                                        <select class="form-control Add_Product" id="Branch" name="Branch" >

                                                            <option value=""> To Branch</option>
                                                            <%
                                                              
                                                                allAdminList = adAdminDao.getAllAdmin();
                                                               
                                                                if (allAdminList != null && allAdminList.size() > 0) {
                                                                    for (Admin p123 : allAdminList) {
                                                                        if ( p123.getAdminId() != 1) {
                                                            %>
                                                            <option  value="<%=p123.getAdminId()%>"><%=p123.getAdminOfBranch().getBranchName()%></option>
                                                            <%}
                                                                    }
                                                                }%>


                                                        </select>   
                                                    </div>
                                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                                        <select type="text" name="Category" id="Category"  class="form-control Add_Product">
                                                            <option value="">Select Category</option>
                                                            <%  CategoryDao dao = new CategoryDao();
                                                                Category bm = new Category();
                                                                List<Category> model = dao.getAllCategory(bm);
                                                                for (Category gm : model) {


                                                            %>
                                                            <option value="<%=gm.getId()%>"><%=gm.getCategory()%></option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>    
                                                    </div>
                                                    <div class="col-md-3 col-sm-12 col-xs-12">

                                                        <select type="text" name="SubCategory" id="SubCategory" required="" class="form-control Add_Product">
                                                            <option value="">Select Sub category</option>
                                                            <%
                                                                List<SubCategory> allSubcat = new SubCatDao().getAllSubCategory();
                                                                for (SubCategory p : allSubcat) {

                                                            %>
                                                            <option value="<%=p.getId()%>"><%=p.getSubCategory()%></option>     <%}%>    
                                                        </select>
                                                    </div> 


                                                </div>
                                                <div class="col-md-5 col-sm-12 col-xs-12">


                                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                                        <select type="text" name="Brand" id="Brand"  class="form-control Add_Product">
                                                            <option value="">Select Brand</option>
                                                            <%  BrandDao dao1 = new BrandDao();
                                                                Brand bm1 = new Brand();
                                                                List<Brand> mod = dao1.getAllBrand(bm1);
                                                                for (Brand gm : mod) {


                                                            %>
                                                            <option value="<%=gm.getId()%>"><%=gm.getBrand()%></option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>  
                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                                        <select type="text" name="Model" id="Model"  class="form-control Add_Product">
                                                            <option value="">Select Model</option>
                                                            <%  ModelDao md = new ModelDao();
                                                                AddModel am = new AddModel();
                                                                List<AddModel> pp1 = md.getAllAddModel(am);
                                                                for (AddModel gm : pp1) {


                                                            %>
                                                            <option value="<%=gm.getId()%>"><%=gm.getModelName()%></option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>     
                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                                        <select type="text" name="ColorName" id="ColorName"  class="form-control Add_Product">
                                                            <option value="">Select Color</option>
                                                            <%  ColorDao cd = new ColorDao();
                                                                ColorModel cmm = new ColorModel();
                                                                List<ColorModel> cm = cd.getAllColorModel(cmm);
                                                                for (ColorModel gm : cm) {


                                                            %>
                                                            <option value="<%=gm.getId()%>"><%=gm.getColorName()%></option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>     
                                                    </div>


                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                    <br>

                                    <div class="row" >
                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                            <div class="form-group">
                                                <div class="row">
                                                    <style>

                                                        fieldset {
                                                            overflow: hidden
                                                        }

                                                        .some-class {
                                                            float: left;
                                                            clear: none;
                                                        }

                                                        label {
                                                            float: left;
                                                            clear: none;
                                                            display: block;
                                                            padding: 2px 1em 0 0;
                                                        }

                                                        input[type=radio],
                                                        input.radio {
                                                            float: left;
                                                            clear: none;
                                                            margin: 2px 0 0 2px;
                                                        }

                                                    </style>
                                                   
                                                <label>     <input type="radio" class="btn btn-default Add_Product" name="Today" value="2" >  All </label>
                                                <label>     <input type="radio" class="btn btn-default Add_Product" name="Today" value="0" >  Today </label>
                                                    <label><input  type="radio" class=" Add_Product" name="Today" value="1">Yesterday</label>
                                                    <label><input  type="radio" class=" Add_Product" name="Today" value="7" >Last 7 Days</label>
                                                    <!--                                                </div>
                                                                                                    <div class="btn btn-default">-->
                                                    <label><input   type="radio" class=" Add_Product" name="Today" value="30">Last 30 Days</label>
                                                    <label><input  type="radio" class="btn btn-default Add_Product" name="Today" value="-1" >This Month</label>
                                                    <label><input  type="radio" class="btn btn-default Add_Product" name="Today" value="-2" >Last Month</label>
                                                    <!--                                                </div>
                                                                                                    <div class="btn btn-default">-->
                                                    <label><button type="button" class="btn btn-default" data-toggle="modal" data-target="#CustomeDate" >Custom</button>

                                                        <!--</div>-->

                                                        <!--</div>-->
                                                       






                                                        </div>








                                                        </div>

                                                        </div>
                                                        </div>          
                                                        <div class="x_content table-responsive">
                                                            <!--                    <p class="text-muted font-13 m-b-30">
                                                                                  The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                </p>-->
                                                            <div id="Report_Fetch">
                                                                <table id="datatable" class="table table-striped table-bordered">
                                                                    <thead> <tr>
                                                                            <th class="text-center" >Sr.No</th>


                                                                            <!--<th class="text-center" >Branch Name</th>-->
                                                                            <th class="text-center" >From Branch </th>
                                                                            <th class="text-center" >To Branch </th>
                                                                            <th class="text-center" >Transfer_Date</th>
                                                                            <th class="text-center" >Category</th>
                                                                            <th class="text-center" >Sub Category</th>
                                                                            <th class="text-center" >Brand</th>
                                                                            <th class="text-center" >Model No</th>

                                                                            <th class="text-center" >Color</th>

                                                                            <th class="text-center" >Quantity</th>
                                                                            <th class="text-center" > Bar Code</th>


                                                                            <!--<th class="text-center" >Purchase Price</th>-->
                                                                            <th class="text-center" >MRP Price</th>
                                                                            <th class="text-center" >CGST (%)</th>
                                                                            <th class="text-center" >SGST (%)</th>
                                                                            <th class="text-center" >IGST (%)</th>




                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>      

                                                                        <%                                                        BranchClassTransferDao pdo = new BranchClassTransferDao();

                                                                            BranchClassTransfer pm = new BranchClassTransfer();
                                                                            List<BranchClassTransfer> allProducts = null;
                                                                            allProducts = pdo.getAllBranchClassTransfer();
                                                                            long totalq = 0;
                                                                            if (allProducts.size() > 0 && allProducts != null) {
                                                                                int i = 0;
                                                                                for (BranchClassTransfer products : allProducts) {
                                                                                    //if (products.getAdminOfBranch().getAdminId() == admin.getAdminId()) {

                                                                                    System.out.println("count:-" + i);
                                                                                    totalq = totalq + products.getProductquantity();
                                                                                    i++;
                                                                                    String date1 = DATE_FORMAT.format(products.getDate());

                                                                        %>                             

                                                                        <tr>
                                                                    <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                                                    <td class="data_center"><%=i%></td>
                                                                    <!--<td class="table_center"><a data-target="#SendStock" role="button" data-toggle="modal" id="<%=i%>" class="btn btn-round btn-success btn-xs sendstockother">Transfer</a></td>-->
                    <!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                                                                    <td class="data_center" id="prd_name<%=i%>"><%=products.getAdmin().getAdminOfBranch().getBranchName()%></td> 
                                                                    <td class="data_center" id="prd_name<%=i%>"><%=products.getToadmin().getAdminOfBranch().getBranchName()%></td> 
                                                                    <td  class="data_center"><%=date1%></td>
                                                                    <td  class="data_center"><%=products.getProduct().getCategory().getCategory()%></td>
                                                                    <td  class="data_center"><%=products.getProduct().getSubCategory().getSubCategory()%></td>
                                                                    <td  class="data_center"><%=products.getProduct().getBrand().getBrand()%></td>
                                                                    <td  class="data_center"><%=products.getProduct().getModel().getModelName()%></td>

                                                                    <td  class="data_center"><%=products.getProduct().getColorModel().getColorName()%></td>

                                                                    <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                    
                                                                    <td class="data_center" id="prd_bar<%=i%>"><%=products.getProduct().getProductBarcode()%></td>         

                                                                    <td class="data_center" id="prd_unit<%=i%>"><%=products.getProduct().getUnitPrice()%></td>                                                   
                                                                    <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProduct().getCgst()%></td>                                                   
                                                                    <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProduct().getSgst()%></td>                                                   
                                                                    <td class="data_center" id="prd_igst<%=i%>"><%=products.getProduct().getIgst()%></td>                                                   



                                                                    </tr> 
                                                                    <%}

                                                                        }

                                                                    %> 



                                                                    </tbody>
                                                                    <tfoot>
                                                                        <tr>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"><%=totalq%></td>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"></td>
                                                                            <td class="data_center"></td>




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

                            </div>
                            <!-- /page content -->    



                            <!-- footer content -->
                            <%@ include file = "../comman_files/BranchFooter.jsp" %>

                            <!-- /footer content -->
                        </div>
                    </div>



                    <style>
                        .data_center{

                            text-align:center;

                        }
                    </style>  
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
                    </body>
                   
                    
                    
    <script type="text/javascript">
        $('document').ready(function() {



            $('.Add_Product').change(function() {

  var radioValue = $("input[name='Today']:checked").val();
               var noofdays = 2;
                if (radioValue) {
                   noofdays=radioValue;
                }
               
                var Category = $('#Category').val();
                var Brand = $('#Brand').val();
                var Model = $('#Model').val();
                var Branch = $('#Branch').val();
                var adminid = $('#adminid').val();
                var SubCategory = $('#SubCategory').val();
                var ColorName = $('#ColorName').val();


                $.get("AjaxPages/FetchProductTransfer.jsp",
                        {ColorName: ColorName, Category: Category, Brand: Brand, Model: Model, Branch: Branch, SubCategory: SubCategory,noofdays:noofdays,adminid:adminid}, function(data) {

                    $('#Report_Fetch').html(data);



                });

            });

          $('#Customfilterbtn').click(function() {
    var FDate = $('#FDate').val();
              
                if(FDate !== "")
                {
                   $('#FDate').formError({remove: true});
              var TDate = $('#TDate').val();
              if(TDate !== "")
              {
                  $('#TDate').formError({remove: true});
               var Category = $('#Category').val();
                var Brand = $('#Brand').val();
                var Model = $('#Model').val();
                var Branch = $('#Branch').val();
                var adminid = $('#adminid').val();
                var SubCategory = $('#SubCategory').val();
                var ColorName = $('#ColorName').val();


                 $.get("AjaxPages/FetchProductTransfer1.jsp",
                        {TDate:TDate,FDate:FDate,ColorName: ColorName, Category: Category, Brand: Brand, Model: Model, Branch: Branch, SubCategory: SubCategory,adminid:adminid}, function(data) {

                    $('#Report_Fetch').html(data);
$("#CustomeDate .close").click();


                });
           }else
            {
                
                 $('#TDate').formError("Please Select To Date   ");
            }
            }else
            {
                
                 $('#FDate').formError("Please Select From Date   ");
            }
  });

        });

    </script> 
                    <script type="text/javascript">

                        function alpha(e) {
                            var k;
                            document.all ? k = e.keyCode : k = e.which;
                            return (k > 47 && k < 58);
                        }
                        function coder(e1) {
                            var l;
                            document.all ? l = e1.keyCode : l = e1.which;
                            return ((l > 47 && l < 58) || (l > 64 && l < 91) || (l > 96 && l < 123));
                        }
                        function alpha11(e2) {
                            var l;
                            document.all ? l = e2.keyCode : l = e2.which;
                            return ((l > 96 && l < 123) || (l > 64 && l < 91) || k == 8 || k == 32);
                        }
                    </script>

                    </html>