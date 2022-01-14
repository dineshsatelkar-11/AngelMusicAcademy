   



<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.dao.ColorDao"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="com.accede.angel.sell.dao.BrandDao"%>
<%@page import="com.accede.angel.sell.model.AddModel"%>
<%@page import="com.accede.angel.sell.dao.ModelDao"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.ProductDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
    <script src="../production/Validation/js/Alertajax.js" type="text/javascript"></script>


    <%    if (request.getParameter("modal_prd_id") != null) {
            int modal_prd_id = Integer.parseInt(request.getParameter("modal_prd_id"));
            int modal_prd_quant = Integer.parseInt(request.getParameter("modal_prd_quant"));

    %>
    <script>
        window.open("PrintBarcode.jsp?Barcodeid=<%=modal_prd_id%>&modal_prd_quant=<%=modal_prd_quant%>");

    </script>        <%
        }


    %>
    
    
    
    <script type="text/javascript">
        $('document').ready(function () {




            $('.Add_Product').change(function () {


                var Category = $('#Category').val();
                var Brand = $('#Brand').val();
                var Model = $('#Model').val();
              
              
             
                $.get("AjaxPages/FetchProductStock.jsp",
                        { Category: Category, Brand: Brand, Model: Model}, function (data) {
                    $('#Report_Fetch').html(data);


                });

            });

        });

    </script> 
    <script>
        $('#document').ready(function() {
            //alert("ready");


            $('.createbarcode').click(function() {

                $.ajax({
                    url: "CreateBarcodeImageAjax.jsp",
                    type: "post",
                    data: {},
                    success: function(response) {


                        $("#barcodeg").html(response);

                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                        alert('something went wrong....');
                    }
                });
            });
            $('#Brand').change(function() {


                var Brand = $("#Brand").val();
                if (Brand.trim() !== "")
                {
                    $.ajax({
                        url: "SelectBrandGetCategoryAjax.jsp",
                        type: "post",
                        data: {Brand: Brand},
                        success: function(response) {
                            $("#output").html(response);

                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log(textStatus, errorThrown);
                        }
                    });
                }
                else
                {
                    alert("Please Enter Brand");
                }
            });

            $(".priceup").keypress(function(event) {
                var inputCode = event.which;
                var currentValue = $(this).val();
                if (inputCode > 0 && (inputCode < 48 || inputCode > 57)) {
                    if (inputCode == 46) {
                        if (getCursorPosition(this) == 0 && currentValue.charAt(0) == '-')
                            return false;
                        if (currentValue.match(/[.]/))
                            return false;
                    }
                    else if (inputCode == 45) {
                        if (currentValue.charAt(0) == '-')
                            return false;
                        if (getCursorPosition(this) != 0)
                            return false;
                    }
                    else if (inputCode == 8)
                        return true;
                    else
                        return false;
                }
                else if (inputCode > 0 && (inputCode >= 48 && inputCode <= 57)) {
                    if (currentValue.charAt(0) == '-' && getCursorPosition(this) == 0)
                        return false;
                }
            });
        });
    </script>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/adminSideBarForBilling.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <!--            <div class="page-title">
                                      <div class="title_left">
                                        <h3>Users <small>Some examples to get you started</small></h3>
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

                           
                                                                        
                                                                               <div class="x_content">






                                        <br>




                                    </div>
                                                                        <div class="col-md-12 col-sm-12 col-xs-12" >
                                <div class="x_panel">
                                    <div class="x_title">
                                                                                <h2>All Products</h2>
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
                                    
                                    
                                        <div class="row" >
                                            <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                <div class="form-group">

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


<!--                                                    <div class="col-md-3 col-sm-12 col-xs-12">
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
                                                    </div>-->

                                                </div>

                                            </div>
                                        </div>
                                    <div id="Report_Fetch">
                                    <div class="x_content table-responsive">
                                        <!--                    <p class="text-muted font-13 m-b-30">
                                                              The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                            </p>-->
                                        <div id="output1">
                                            <table id="datatable" class="table table-striped table-bordered">
                                                <thead> <tr>
                                                        <th class="text-center" >Sr.No</th>
                                                        <th class="text-center" >Print Barcode</th>
                                                        <th class="text-center" >Edit Product</th>
                                                        <th class="text-center" >Delete</th>
                                                        <th class="text-center" >Model No</th>
                                                        <th class="text-center" >Category</th>
                                                        <th class="text-center" >Brand</th>
                                                        <th class="text-center" >Color</th>
                                                        <!--<th class="text-center" >Product Name</th>-->
                                                        <th class="text-center" >Product Bar Code</th>
                                                        <th class="text-center" >Quantity</th>
                                                        <!--<th class="text-center" >HSN Code</th>-->
                                                        <th class="text-center" >Purchase Price</th>
                                                        <th class="text-center" >Unit Price</th>
                                                        <th class="text-center" >CGST (%)</th>
                                                        <th class="text-center" >SGST (%)</th>
                                                        <th class="text-center" >IGST (%)</th>

                                                        <!--<th class="text-center" >Discription</th>-->



                                                    </tr>
                                                </thead>
                                                <tbody>      

                                                    <%                                                        ProductDao1 pdo = new ProductDao1();

                                                        ProductModel pm = new ProductModel();
                                                        List<ProductModel> allProducts = null;
                                                        allProducts = pdo.getAllProduct();

                                                        if (allProducts != null && allProducts.size() > 0) {
                                                            int i = 0;
                                                            for (ProductModel products : allProducts) {
                                                                //if (products.getAdminOfBranch().getAdminId() == admin.getAdminId()) {

                                                                System.out.println("count:-" + i);
                                                                boolean b = products.isStatus();
                                                                if (b) {
                                                                    i++;

                                                    %>                             

                                                    <tr>
                                                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                                <td class="data_center"><%=i%></td>
                                                <td class="data_center"><a href="#myModal1" role="button" data-toggle="modal" data-id="<%=products.getId()%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-print edit_prd"></i></a></td>
                                                <td class="data_center"><a href="EditProduct.jsp?productid=<%=products.getId()%>" role="button" data-toggle="modal" data-id="<%=i%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-edit edit_prd1"></i></a></td>
                                                <form action="../../DeleteProduct" method="post">
                                                    <%                                          if (session.getAttribute("i") != null) {
                                                            int i1 = (Integer) session.getAttribute("i");
                                                            String msg = (String) session.getAttribute("msg");
                                                            if (i1 == 2) {

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
                                                    <input type="hidden" name="productId" id="productId" value="<%=products.getId()%>">
                                                    <input type="hidden" name="prd_model1<%=i%>" id="prd_model1<%=i%>" value="<%=products.getModel().getId()%>">
                                                    <input type="hidden" name="prd_cat1<%=i%>" id="prd_cat1<%=i%>" value="<%=products.getCategory().getId()%>">
                                                    <input type="hidden" name="prd_brand1<%=i%>" id="prd_brand1<%=i%>" value="<%=products.getBrand().getId()%>">
                                                    <input type="hidden" name="prd_color1<%=i%>" id="prd_color1<%=i%>" value="<%=products.getColorModel().getId()%>">

                                                    <td><button type="submit" class="btn btn-danger table_center" >Delete</button></td>
                                                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                                                <input type="hidden" id="prd_name<%=i%>"  value="<%=products.getProductBarcode()%>" >                                                   
                                                <td class="data_center"  id="prd_model<%=i%>"><%=products.getModel().getModelName()%></td>         
                                                <td class="data_center"  id="prd_cat<%=i%>"><%=products.getCategory().getCategory()%></td>         
                                                <td class="data_center"  id="prd_brand<%=i%>"><%=products.getBrand().getBrand()%></td>         
                                                <td class="data_center"  id="prd_color<%=i%>"><%=products.getColorModel().getColorName()%></td>         
                                                <td class="data_center"  id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         
                                                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                                   
                                                <!--<td class="data_center" id="prd_hsn<%=i%>"><%=products.getHsn()%></td>-->                                                   
                                                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getPurchasePrice()%></td>                                                 
                                                <td class="data_center" id="prd_unit<%=i%>"><%=products.getUnitPrice()%></td>                                                   
                                                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getCgst()%></td>                                                   
                                                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getSgst()%></td>                                                   
                                                <td class="data_center" id="prd_igst<%=i%>"><%=products.getIgst()%></td>                                                   

                                                <!--<td class="data_center" id="prd_desc<%=i%>"><%=products.getDiscription()%></td>-->                                                   


                                                </tr> 
                                                <%}
                                                        }
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
                    </div>                                 
                </div>

            </div>
            <!-- /page content -->    <div class="example-modal">
                <div class="modal" id="myModal1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="PrintBarcode.jsp" name="update">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Print Barcode </h4>
                                </div>
                                <div class="modal-body">

                                    <table  class="table table-striped">
                                        <thead>

                                        <th class="table_center">Product Barcode</th>
                                        <th class="table_center">Quantity </th>

                                        <!--                                                        <th>Discount</th>
                                                                                                <th>Add Qnt</th>-->

                                        </thead>
                                        <tbody class="text-center">
                                            <tr class="text-center">
                                        <input type="hidden" id="modal_prd_id" name="modal_prd_id">
                                        <td class="text-center"><input type="text" name="modal_prd_name" id="modal_prd_name" class="form-control table_center" ></td>
                                        <td class="text-center"><input type="number" max="44" name="modal_prd_quant" id="modal_prd_quant" class="form-control table_center" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ></td>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" id="updateProduct"   >Print Barcode</button>
                                </div>
                            </form>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>


            <div class="example-modal">
                <div class="modal" id="myModal2">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="../../UpdateProduct" name="update" class="form-horizontal form-label-left">
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
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Edit Product</h4>
                                </div>
                                <input type="hidden" id="modal_prd_id1" name="modal_prd_id1">
                                <input type="hidden" id="prd_model" name="prd_model">
                                <input type="hidden" id="prd_cat" name="prd_cat">
                                <input type="hidden" id="prd_brand" name="prd_brand">
                                <input type="hidden" id="prd_color" name="prd_color">


                                <div class="modal-body">
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Product Name <span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <select type="text" name="prd_cat1" id="prd_cat1"  class="form-control">

                                                <%
                                                    for (Category gm : model) {


                                                %>
                                                <option value="<%=gm.getId()%>"><%=gm.getCategory()%></option>
                                                <%
                                                    }
                                                %>
                                            </select> 
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Product Barcode <span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_prd_bar"  name="modal_prd_bar" readonly="" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Quantity<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_prd_quant1"  name="modal_prd_quant1" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">HSN Code <span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_prd_hsn"  name="modal_prd_hsn" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">MRP Price  <span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_prd_mrp"  name="modal_prd_mrp" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Unit Price <span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_prd_unit"  name="modal_prd_unit" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">CGST <span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_prd_cgst"  name="modal_prd_cgst" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">SGST<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_prd_sgst"  name="modal_prd_sgst" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">IGST<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_prd_igst"  name="modal_prd_igst" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Description<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <textarea type="text" id="modal_prd_desc"  name="modal_prd_desc" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                                        </div>
                                    </div>



                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" id="updateProduct"   >Update</button>
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



    <script type="text/javascript">
        $('#document').ready(function() {

            $('.edit_prd').click(function(event) {
                var i = this.id;
                var j = $('#prd_id' + i).val();


                $('#modal_prd_id').val($('#prd_id' + i).val());


                $('#modal_prd_name').val($('#prd_name' + i).val());
                $('#modal_prd_quant').val($('#prd_quant' + i).text());

            });

            $('.edit_prd1').click(function(event) {
                var i = this.id;
                var j = $('#prd_id' + i).val();
                var j1 = $('#prd_quant' + i).text();
                var j2 = $('#prd_name' + i).text();


                $('#modal_prd_id1').val($('#prd_id' + i).val());


                $('#modal_prd_name1').val($('#prd_name' + i).text());
                $('#modal_prd_quant1').val($('#prd_quant' + i).text());
                $('#modal_prd_bar').val($('#prd_bar' + i).text());
                $('#modal_prd_hsn').val($('#prd_hsn' + i).text());
                $('#modal_prd_mrp').val($('#prd_mrp' + i).text());
                $('#modal_prd_unit').val($('#prd_unit' + i).text());
                $('#modal_prd_cgst').val($('#prd_cgst' + i).text());
                $('#modal_prd_sgst').val($('#prd_sgst' + i).text());
                $('#modal_prd_desc').val($('#prd_desc' + i).text());
                $('#modal_prd_igst').val($('#prd_igst' + i).text());
                $('#prd_model').val($('#prd_model' + i).text());
                $('#prd_cat').val($('#prd_cat' + i).text());
                $('#prd_brand').val($('#prd_brand' + i).text());
                $('#prd_color').val($('#prd_color' + i).text());
                $('#prd_model1').val($('#prd_model1' + i).val());
                $('#prd_cat1').val($('#prd_cat1' + i).val());
                $('#prd_brand1').val($('#prd_brand1' + i).val());
                $('#prd_color1').val($('#prd_color1' + i).val());

            });


        });

    </script>
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
    <script src="../production/js/Swal.js" type="text/javascript"></script>

    <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>

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
        return ((l > 96 && l < 123) || (l > 64 && l < 91));
    }
    function alpha12(e2) {
        var l;
        document.all ? l = e2.keyCode : l = e2.which;
        return ((l > 96 && l < 123) || (l > 64 && l < 91) || (l = 32));
    }
</script>

</html>