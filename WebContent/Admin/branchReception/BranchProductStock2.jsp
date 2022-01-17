


<%@page import="com.accede.angel.sell.dao.SubCatDao"%>
<%@page import="com.accede.angel.sell.model.SubCategory"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.sell.dao.ColorDao"%>
<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.dao.ModelDao"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="com.accede.angel.sell.dao.BrandDao"%>
<%@page import="com.accede.angel.sell.model.AddModel"%>
<%@page import="com.accede.angel.sell.model.BranchProduct"%>
<%@page import="com.accede.angel.sell.dao.BranchProductDao"%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.ProductDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
  


    <%    if (request.getParameter("modal_prd_id") != null) {
            int modal_prd_id = Integer.parseInt(request.getParameter("modal_prd_id"));
            int modal_prd_quant = Integer.parseInt(request.getParameter("modal_prd_quant"));

    %>
    <script>
        window.open("PrintBarcode.jsp?Barcodeid=<%=modal_prd_id%>&modal_prd_quant=<%=modal_prd_quant%>");

    </script>        <%
        }


    %>
    <script src="../production/js/Alertajax.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('#document').ready(function() {
          
            $("#datatable").on("click", ".sendstockother", function() {

                var i = this.id;

                var a = $('#prd_id' + i).val();
              
           
                var j = $('#prd_quant' + i).text();
          
                $('#Productidstock').val(a);
             
                $('#Productavailablequant').val(j);
             
            });


        });

    </script>
<div class="modal fade" id="SendStock" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" style="margin-right: -240px" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Send Stock To Other Branch</h4>
                </div>
                <form class="form-horizontal form-label-left input_mask" action="../../SendStock" id="sendstockform"   >

                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name"> Select Branch <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control col-md-7 col-xs-12 " required="" id="StockBranch" name="Branch" >
 <option value="">Select Branch</option>
                                <%
                                    AdminDao adAdminDao = new AdminDao();
                                    List<Admin> allAdminList = null;
                                    allAdminList = adAdminDao.getAllAdmin();
                                     admintop = (Admin) session.getAttribute("BRANCH_ADMIN");
                                    if (allAdminList != null && allAdminList.size() > 0) {
                                        for (Admin p123 : allAdminList) {
if(p123.getAdminId() != admintop.getAdminId() &&  p123.getAdminId() != 1){
                                %>
                                <option  value="<%=p123.getAdminId()%>"><%=p123.getAdminOfBranch().getBranchName()%></option>
                                <%}
                                        }
                                    }%>

                            </select> 

                        </div>
                        <br>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <input type="hidden" id="Productidstock" name="Productid" required="required" class="form-control col-md-7 col-xs-12">
                    <input type="hidden" id="Productavailablequant" name="Productavailablequant" required="required" class="form-control col-md-7 col-xs-12">
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">Enter Quantity <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="QuantityStock" name="QuantityStock" required=""   required="required" class="form-control col-md-7 col-xs-12" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                        </div>
                        <!--          <p>Some text in the modal.</p>-->
                        <br>
                        <br>
                        <br>
                    </div>
                    <br>



                    <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <!--                          <p><button class="btn btn-primary" type="button">Cancel</button></p>-->
                            <table>
                                <tr>
                                    <td> <button class="btn btn-primary" type="reset">Reset</button></td>
                                    <td> <button type="submit" id="trasferbutton" class="btn btn-success">Submit</button></td>


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

    <script type="text/javascript">
        $('document').ready(function() {




            $('.Add_Product').change(function() {


                var Category = $('#Category').val();
                var Brand = $('#Brand').val();
                var Model = $('#Model').val();
                var Branch = $('#Branch').val();
                var SubCategory = $('#SubCategory').val();
                var ColorName = $('#ColorName').val();


                $.get("AjaxPages/FetchProductStockAvailable1.jsp",
                        {ColorName: ColorName, Category: Category, Brand: Brand, Model: Model, Branch: Branch, SubCategory: SubCategory}, function(data) {

                    $('#Report_Fetch').html(data);



                });

            });

        });

    </script> 

    
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">

                <%@ include file = "../comman_files/adminSideBarForBilling.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->
 
                <!-- page content -->
                <div  role="main">
                    <div class="">
                   
                        <div class="clearfix"></div>

                        <div class="row">


                            <div class="col-md-12 col-sm-12 col-xs-12" >
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Branch Product Notification</h2>
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
                                         <%

                                            if (session.getAttribute("i") != null) {
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


                                    <input type="hidden" id="sessionidd" name="sessionidd" value="<%=sessionidd%>">


                                    <div class="row" >
                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-12 col-xs-12">

                                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                                        <select class="form-control Add_Product" id="Branch" name="Branch" >

                                                            <%                                                                AdminDao ad = new AdminDao();
                                                                List<Admin> b2 = null;
                                                                b2 = ad.getAllAdmin();

                                                                if (b2 != null && b2.size() > 0) {
                                                                    for (Admin p : b2) {
                                                                        if (p.getAdminId() == admin.getAdminId()) {
                                                            %>
                                                            <option selected="selected" value="<%=p.getAdminId()%>"><%=p.getAdminOfBranch().getBranchName()%></option>
                                                            <%}
                                                                    }
                                                                }%>


                                                        </select>   
                                                    </div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12">
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
                                                    <div class="col-md-4 col-sm-12 col-xs-12">

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
                                                <div class="col-md-6 col-sm-12 col-xs-12">


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
                                    <div class="x_content table-responsive">
                                        <!--                    <p class="text-muted font-13 m-b-30">
                                                              The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                            </p>-->
                                        <div id="Report_Fetch">
                                            <table id="datatable" class="table table-striped table-bordered">
                                                <thead> <tr>
                                                        <th class="text-center" >Sr.No</th>


                                                        <!--<th class="text-center" >Branch Name</th>-->
                                                     
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

                                                    <%                                                        BranchProductDao pdo = new BranchProductDao();

                                                        BranchProduct pm = new BranchProduct();
                                                        List<BranchProduct> allProducts = null;
                                                        allProducts = pdo.getAllProduct(admin.getAdminId());
                                                        long totalq = 0;
                                                        if (allProducts.size() > 0 && allProducts != null) {
                                                            int i = 0;
                                                            for (BranchProduct products : allProducts) {
                                                                //if (products.getAdminOfBranch().getAdminId() == admin.getAdminId()) {
                                                                if (products.getProductquantity() < 4) {
                                                                    System.out.println("count:-" + i);
                                                                    totalq = totalq + products.getProductquantity();
                                                                    i++;

                                                    %>                             

                                                    <tr>
                                                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                                <td class="data_center"><%=i%></td>


                                                  <td  class="data_center"><%=products.getProduct().getCategory().getCategory()%></td>
                                                <td  class="data_center"><%=products.getProduct().getSubCategory().getSubCategory()%></td>
                                                <td  class="data_center"><%=products.getProduct().getBrand().getBrand()%></td>
                                                <td  class="data_center"><%=products.getProduct().getModel().getModelName()%></td>

                                                <td  class="data_center"><%=products.getProduct().getColorModel().getColorName()%></td>

                                                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                    
                                                <td class="data_center" id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         

                                                <td class="data_center" id="prd_unit<%=i%>"><%=products.getProduct().getUnitPrice()%></td>                                                   
                                                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProduct().getCgst()%></td>                                                   
                                                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProduct().getSgst()%></td>                                                   
                                                <td class="data_center" id="prd_igst<%=i%>"><%=products.getProduct().getIgst()%></td>                                                   



                                                </tr> 
                                                <%}
                                                        }
                                                    }

                                                %> 



                                                </tbody>
                                                <tfoof>
                                                    <tr>
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
                                                </tfoof>
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
                                  
                                    $('.remove_prd').click(function() {
                                        var PRD_ID = this.id;
                                        alert(PRD_ID);
                                        $.get("DeleteProductAjax.jsp", {PRD_ID: PRD_ID}, function(data) {
                                            $('#output1').html(data);
                                        });

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