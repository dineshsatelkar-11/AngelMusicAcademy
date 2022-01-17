

<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.dao.ColorDao"%>
<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="com.accede.angel.sell.dao.BrandDao"%>
<%@page import="com.accede.angel.sell.model.AddModel"%>
<%@page import="com.accede.angel.sell.model.AddModel"%>
<%@page import="com.accede.angel.sell.dao.ModelDao"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.dao.TempproductDao"%>
<%@page import="com.accede.angel.sell.dao.TempSaleforBranchDAO"%>
<%@page import="com.accede.angel.sell.model.TempSaleforBranch"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
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
    <script>
        $('#document').ready(function() {

            $SIDEBAR_MENU.find("li.active ul").hide();
            $('#Add_Product').click(function() {



                var Category = $('#Category').val();
                var Brand = $('#Brand').val();
                var Model = $('#Model').val();
                var SubCategory = $('#SubCategory').val();

                var ColorName = $('#ColorName').val();
                var Quantity = $('#Quantity').val();
                if (!(Category === ""))
                {
                    if (!(SubCategory === ""))
                    {
                        if (!(Brand === ""))
                        {
                            if (!(Model === ""))
                            {
                                if (!(ColorName === ""))
                                {
                                    if (!(Quantity === ""))
                                    {


                                        $.ajax({
                                            url: "AjaxPages/AddSellProductAjax.jsp",
                                            type: "post",
                                            data: {Category: Category, Brand: Brand, Model: Model, ColorName: ColorName, Quantity: Quantity, SubCategory: SubCategory},
                                            success: function(response) {


                                                $(".output2").html(response);
//                        alert('success');
                                            },
                                            error: function(jqXHR, textStatus, errorThrown) {
                                                console.log(textStatus, errorThrown);
                                            }
                                        });

                                    }
                                    else
                                    {
                                        swal({
                                            title: 'These is not allowed.!',
                                            html: $('<div>')
                                                    .addClass('some-class')
                                                    .text('Enter Quantity '),
                                            animation: false,
                                            customClass: 'animated tada'
                                        })
                                    }
                                } else
                                {
                                    swal({
                                        title: 'These is not allowed.!',
                                        html: $('<div>')
                                                .addClass('some-class')
                                                .text('Select Color '),
                                        animation: false,
                                        customClass: 'animated tada'
                                    })
                                }
                            }
                            else
                            {
                                swal({
                                    title: 'These is not allowed.!',
                                    html: $('<div>')
                                            .addClass('some-class')
                                            .text('Select Model '),
                                    animation: false,
                                    customClass: 'animated tada'
                                })
                            }
                        }
                        else
                        {
                            swal({
                                title: 'These is not allowed.!',
                                html: $('<div>')
                                        .addClass('some-class')
                                        .text('Select Brand '),
                                animation: false,
                                customClass: 'animated tada'
                            })
                        }
                    }
                    else
                    {
                        swal({
                            title: 'These is not allowed.!',
                            html: $('<div>')
                                    .addClass('some-class')
                                    .text('Select Sub Category '),
                            animation: false,
                            customClass: 'animated tada'
                        })
                    }
                }
                else
                {
                    swal({
                        title: 'These is not allowed.!',
                        html: $('<div>')
                                .addClass('some-class')
                                .text('Select Category '),
                        animation: false,
                        customClass: 'animated tada'
                    })
                }
            });


         







        });
    </script>
    <%        TempproductDao td = new TempproductDao();
        td.deleteProduct();
    %>


<script type="text/javascript">
                                                                $(document).ready(function() {
                                                                    // alert('fsdfsdf');
                                                                    $('.product').change(function() {
                                                                        var id = this.id;
                                                                       
                                                                        var count=0;
                                                                        if (id == "Category")
                                                                        {
                                                                            count=1;
                                                                        } else if (id == "SubCategory")
                                                                        {
                                                                              count=2;
                                                                        }
                                                                        else if (id == "Brand")
                                                                        {
                                                                              count=3;
                                                                        }
                                                                        else if (id == "Model")
                                                                        {
                                                                              count=4;
                                                                        }
                                                                        else
                                                                        {
                                                                              count=5;
                                                                        }
                                                                        var Category = $('#Category').val();
                                                                        var SubCategory = $('#SubCategory').val();
                                                                        var Model = $('#Model').val();
                                                                        var Brand = $('#Brand').val();
                                                                        var ColorName = $('#ColorName').val();

                                                                        $.get("AjaxPages/FetchSubCategoryInPurchase.jsp", {SubCategory: SubCategory, Model: Model, Brand: Brand, ColorName: ColorName, Category: Category ,count : count}, function(data) {

                                                                            $('#productfetch').html(data);
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

                            <form action="../../SaletoBranch" method="post" onsubmit="return valid();">
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
                                    
                                    
                                    <%
                                    String sessionidddd=sessionidd;
                                    if(sessionidddd != null )
                                    {
      %>
                                    <input type="hidden" id="sessionidd" name="sessionidd" value="<%=sessionidd%>">
<%}else{
                     String no1 = dg.passwordGenerator();
            String sessionidd123 = no1 + timeStamp+admin.getAdminId();
                               
                    %>

   <input type="hidden" id="sessionidd" name="sessionidd" value="<%=sessionidd123%>">

<%}%>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="x_panel">
                                            <div class="x_title">
                                                <h2>Sell product To Branch</h2>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <div  id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" >


                                                    <div class="row" >
                                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                            <div class="form-group" id="productfetch">

                                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                                    <select type="text" name="Category" id="Category"  class="form-control product">
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

                                                                <div id="output1">
                                                                    <div class="col-md-2 col-sm-12 col-xs-12">

                                                                        <select type="text" name="SubCategory" id="SubCategory" required="" class="form-control product">
                                                                            <option value="">Select Sub category</option>
                                                                        </select>
                                                                    </div>
                                                                    <div id="output2">


                                                                        <div class="col-md-2 col-sm-12 col-xs-12">
                                                                            <select type="text" name="Brand" id="Brand"  class="form-control productsearch product">
                                                                                <option value="">Select Brand</option>

                                                                            </select>  
                                                                        </div>
                                                                        <div id="output2">
                                                                            <div class="col-md-2 col-sm-12 col-xs-12">
                                                                                <select type="text" name="Model" id="Model"  class="form-control productsearch product">
                                                                                    <option value="">Select Model</option>

                                                                                </select>    
                                                                            </div> 
                                                                            <div id="output3">
                                                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                    <select type="text" name="ColorName" id="ColorName"  class="form-control productsearch product">
                                                                                        <option value="">Select Color</option>


                                                                                    </select>     
                                                                                </div></div>
                                                                        </div>
                                                                    </div>
                                                                </div>



                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row" >
                                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                            <div class="form-group">



                                                                <div class="col-md-4 col-sm-6 col-xs-12">
                                                                    <select class="form-control" required="" id="Branch" name="Branch" >
                                                                        <option value="1">Select Branch</option>
                                                                        <%
                                                                            AdminDao ad = new AdminDao();
                                                                            List<Admin> b2 = null;
                                                                            b2 = ad.getAllAdmin();
                                                                            if (b2 != null && b2.size() > 0) {
                                                                                for (Admin p : b2) {
                                                                                    if (p.getAdminId() != 1) {
                                                                        %>
                                                                        <option value="<%=p.getAdminId()%>"><%=p.getAdminOfBranch().getBranchName()%></option>


                                                                        <%}
                                                                                }
                                                                            }%>

                                                                    </select>

                                                                </div>


                                                                <div class="col-md-4 col-sm-12 col-xs-12">

                                                                    <input type="text" id="Quantity" name="Quantity"   placeholder="Quantity"  class="form-control totalamount ">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 


                                                                </div>










                                                                <div class="col-md-4 col-sm-12 col-xs-12">

                                                                    <input  type="button" id="Add_Product" name="Add_Product"  value="Add" class="form-control btn btn-success">


                                                                </div> 
                                                            </div>

                                                        </div>
                                                    </div>


                                                    <div class="row">
                                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                                            <div class="form-group">
                                                                <div class="col-md-4 col-sm-6 col-xs-12" align="left">

                                                                </div>

                                                                <div class="col-md-6 col-sm-6 col-xs-12">


                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>









                                                </div>
                                            </div>



                                            <div class="row" id="output2">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <div class="x_panel">
                                                        <div class="x_title">
                                                            <h2>All Product Details </h2>   
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
                                                            <table id="datatable" class="table table-striped table-bordered output2">
                                                                <thead>
                                                                    <tr>
                                                                        <th  class="data_center" >Sr No.</th>
                                                                        <th  class="data_center">Delete</th>
                                                                        <th class="text-center" >Model No</th>
                                                                        <th class="text-center" >Brand</th>
                                                                        <th class="text-center" >Color</th>
                                                                        <th class="text-center" >Category</th>
                                                                        <th class="text-center" >Barcode</th>
                                                                        <th  class="data_center">Sell Quantity</th>                

                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>

                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">


                                                </div>
                                            </div>


                                            <div class="row" >
                                                <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                    <div class="form-group">





                                                        <div class="col-md-4 col-sm-12 col-xs-12">

                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12">

                                                            <button type="submit" class="btn btn-success col-md-12 col-sm-12 col-xs-12 savebutton" >Save</button>


                                                        </div>










                                                        <div class="col-md-4 col-sm-12 col-xs-12">




                                                        </div> 
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>



                            </form> 
                        </div>
                    </div>                                 
                </div>

            </div>




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
    <script src="../production/js/Swal.js" type="text/javascript"></script>

    <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>

</body>
<script type="text/javascript">
                                $('document').ready(function() {
                                    $('.savebutton').hide();
                                    $SIDEBAR_MENU.find("li.active ul").hide();
                                    $('.remove_prd').click(function() {
                                        var PRD_ID = this.id;
                                      
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
</script>
<script type="text/javascript">



    function valid()
    {

        var Branch = document.getElementById('Branch').value;
        if (!(Branch == 1))
        {
        }
        else
        {
            swal({
                title: 'These is not allowed.!',
                html: $('<div>')
                        .addClass('some-class')
                        .text('Select Branch First'),
                animation: false,
                customClass: 'animated tada'
            })
            return false;
        }
    }
</script>
</html>