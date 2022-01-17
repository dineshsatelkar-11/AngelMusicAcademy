   



<%@page import="com.accede.angel.sell.model.SubCategory"%>
<%@page import="com.accede.angel.sell.dao.SubCatDao"%>
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

    <link href="New/fSelect.css" rel="stylesheet" type="text/css"/>
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
    <script>
        $('#document').ready(function() {
            //alert("ready");





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

                <%@ include file = "../comman_files/adminSideBarForBilling.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div  role="main">
                    <div class="">

                        <div class="clearfix"></div>

                        <div class="row">

                            <form action="../../ProductSave" method="post">
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
                                <div>

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="x_panel">
                                            <div class="x_title">
                                                <h2>Add Product</h2>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <div  id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" >
                                                    <div class="row" >

                                                        <div class="form-group">

                                                            <div class="col-md-2 col-sm-6 col-xs-12 ">
                                                                <label class="control-label col-md-12 col-sm-12 col-xs-12 " style="text-align: left;padding-bottom: 10px;" for="name">Select Category<span class="required">*</span>
                                                                </label>
                                                                
                                                                <select type="text" name="Category" id="Category" required="" style="    padding-top: 10px;" class="form-control multi-select-dd4">
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
                                                                </select>  </div>

                                                            <div class="col-md-2 col-sm-12 col-xs-12" >
                                                                <label class="control-label col-md-12 col-sm-12 col-xs-12" style="text-align: left;padding-bottom: 10px;" for="name">Select Sub Category<span class="required">*</span>
                                                                </label>  <div id="output1"> <select type="text" name="SubCategory" style="padding-top: 10px;" id="SubCategory" required="" class="form-control multi-select-dd3">
                                                                    <option value="">Select Sub category</option>

                                                                </select>  </div>
                                                                 </div>
                                                       
                                                        <div class="col-md-2 col-sm-12 col-xs-12">
                                                            <label class="control-label col-md-12 col-sm-3 col-xs-12" style="text-align: left;padding-bottom: 10px;" for="name">Select Brand<span class="required">*</span>
                                                            </label>
                                                            <select type="text" name="Brand" id="Brand" multiple="multiple" style="padding-top: 10px;" required class="form-control multi-select-dd2">
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
                                                            </select>  </div>


                                                        <div class="col-md-2 col-sm-12 col-xs-12">
                                                            <label class="control-label col-md-12 col-sm-12 col-xs-12" style="text-align: left;padding-bottom: 10px;" for="name">Select Model No<span class="required">*</span>
                                                            </label>
                                                            <select type="text" name="Model" id="Model" multiple="multiple" required style="padding-top: 10px;" class="form-control multi-select-dd1">
                                                                <option value="">Select Model No</option>
                                                                <%  ModelDao md = new ModelDao();
                                                                    AddModel am = new AddModel();
                                                                    List<AddModel> pp = md.getAllAddModel(am);
                                                                    for (AddModel gm : pp) {

                                                                %>

                                                                <option value="<%=gm.getId()%>"><%=gm.getModelName()%></option>
                                                                <%

                                                                    }
                                                                %>
                                                            </select>    </div>


                                                        <div class="col-md-2 col-sm-12 col-xs-12">
                                                            <label class="control-label col-md-12 col-sm-12 col-xs-12" style="text-align: left;padding-bottom: 10px;" for="name">Select Color<span class="required">*</span>
                                                            </label>
                                                            <select type="text" name="ColorName" multiple="multiple" id="ColorName" style="    padding-top: 10px;" required class="form-control multi-select-dd">
                                                                <option value="">Select Color</option>
                                                                <%  ColorDao cd = new ColorDao();
                                                                    ColorModel cmm = new ColorModel();
                                                                    List<ColorModel> cm = cd.getAllColorModel(cmm);
                                                                    for (ColorModel gm : cm) {

                                                                %>

                                                                <option value="<%=gm.getId()%>"><%=gm.getColorName()%></option>
                                                                <%}%>
                                                            </select>  </div>
                                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                                            <label class="control-label col-md-12 col-sm-12 col-xs-12" style="text-align: left;padding-bottom: 10px;" for="name">HSN Code<span class="required">*</span>
                                                            </label>
                                                            <input type="text" id="hsncode" name="hsncode" required style=" display: inline-block;cursor: pointer; line-height: 1; width: 100%;" class="form-control multi-select-dd5">    
                                                        </div>
                                                        </div>
                                                        
                                                        <div class="ln_solid"></div>
                                                        <div class="form-group">
                                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                                <!--<button class="btn btn-primary" type="button">Cancel</button>-->
                                                                <button class="btn btn-primary" type="reset">Reset</button>
                                                                <button type="submit" class="btn btn-success">Submit</button>
                                                            </div>
                                                        </div>

                                                    </div> 



                                                    <div class="row" >

                                                    </div>




                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form> 
                            <div id="Report_Fetch">
                                <div class="x_content table-responsive">
                                    <!--                    <p class="text-muted font-13 m-b-30">
                                                          The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                        </p>-->
                                    <div id="output1">
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead> <tr>
                                                    <th class="text-center" >Sr.No</th>

                                                    <th class="text-center" >Delete</th>
                                                    <th class="text-center" >Category</th>
                                                    <th class="text-center" >Sub Category</th>
                                                    <th class="text-center" >Brand</th>
                                                    <th class="text-center" >Model No</th>

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
int productsize=0;
                                                    if (allProducts != null && allProducts.size() > 0) {
                                                        int i = 0;
                                                        for (ProductModel products : allProducts) {
                                                            //if (products.getAdminOfBranch().getAdminId() == admin.getAdminId()) {

                                                            System.out.println("count:-" + i);
                                                            boolean b = products.isStatus();
                                                            if (b) {
                                                                i++;
                                                                productsize++;

                                                %>                             

                                                <tr>
                                            <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                            <td class="data_center"><%=i%></td>
                                            <form id="from<%=i%>" action="../../DeleteProduct" method="post">

                                                <input type="hidden" name="productId" id="productId" value="<%=products.getId()%>">
                                                <input type="hidden" name="prd_model1<%=i%>" id="prd_model1<%=i%>" value="<%=products.getModel().getId()%>">
                                                <input type="hidden" name="prd_cat1<%=i%>" id="prd_cat1<%=i%>" value="<%=products.getCategory().getId()%>">
                                                <input type="hidden" name="prd_subcat1<%=i%>" id="subcat1<%=i%>" value="<%=products.getSubCategory().getId()%>">
                                                <input type="hidden" name="prd_brand1<%=i%>" id="prd_brand1<%=i%>" value="<%=products.getBrand().getId()%>">
                                                <input type="hidden" name="prd_color1<%=i%>" id="prd_color1<%=i%>" value="<%=products.getColorModel().getId()%>">

                                                <td><button type="submit" class="btn btn-danger table_center" >Delete</button></td>
                                            </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                                            <input type="hidden" id="prd_name<%=i%>"  value="<%=products.getProductBarcode()%>" >                                                   
                                            <td class="data_center"  id="prd_cat<%=i%>"><%=products.getCategory().getCategory()%></td>  
                                            <td class="data_center"  id="prd_subcat<%=i%>"><%=products.getSubCategory().getSubCategory()%></td>  
                                            <td class="data_center"  id="prd_brand<%=i%>"><%=products.getBrand().getBrand()%></td>  
                                            <td class="data_center"  id="prd_model<%=i%>"><%=products.getModel().getModelName()%></td>  
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
                                               <input type="hidden" id="noofcourse" id="noofcourse" value="<%=productsize%>">
                                         
                                        </table>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>                                 
                </div>

            </div>

            <!-- footer content -->
            <%@ include file = "../comman_files/BranchFooter.jsp" %>
            <!-- /footer content -->
        </div>
    </div>

<script>

var j=document.getElementById('noofcourse').value;
var i;
for (i = 1; i < j+1; i++) {
   
document.querySelector('#from'+i).addEventListener('submit', function(e) {
  var form = this;

  e.preventDefault(); // <--- prevent form from submitting

  swal({
      title: "Are you sure?",
      text: "You will not be able to recover this  Product!",
      icon: "warning",
      buttons: [
        'No, cancel it!',
        'Yes, I am sure!'
      ],
      dangerMode: true,
    }).then(function(isConfirm) {
      if (isConfirm) {
        swal({
          title: 'Product!',
          text: 'Request Send Successfully!',
          icon: 'success'
        }).then(function() {
          form.submit(); // <--- submit form programmatically
        });
      } else {
        swal("Cancelled", "Your Product  is safe :)", "error");
      }
    })
});
}
</script>
    <style>
        .data_center{

            text-align:center;

        }
    </style>  


    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <script src="../production/js/jquery.formError.js" type="text/javascript"></script>
    <script src="New/fSelect.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- jQuery Smart Wizard -->

    <script src="../build/js/custom.min.js"></script>
    <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
    <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>


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
       $(document).ready(function() {
           // alert('fsdfsdf');
           $('#Category').change(function() {

               var Category = $('#Category').val();

               $.get("AjaxPages/FetchSubCategory.jsp", {Category: Category}, function(data) {
                   //   alert('sucess');
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
<script>
    (function($) {
        $(function() {
            $('.multi-select-dd').fSelect();
            $('.multi-select-dd1').fSelect();
            $('.multi-select-dd2').fSelect();
            $('.multi-select-dd3').fSelect();
            $('.multi-select-dd4').fSelect();
         

        });
    })(jQuery);
</script>
</html>