   



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
    <script>
        $('#document').ready(function () {
            //alert("ready");


            $('.createbarcode').click(function () {

                $.ajax({
                    url: "CreateBarcodeImageAjax.jsp",
                    type: "post",
                    data: {},
                    success: function (response) {


                        $("#barcodeg").html(response);

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                        alert('something went wrong....');
                    }
                });
            });
            $('#Brand').change(function () {


                var Brand = $("#Brand").val();
                if (Brand.trim() !== "")
                {
                    $.ajax({
                        url: "SelectBrandGetCategoryAjax.jsp",
                        type: "post",
                        data: {Brand: Brand},
                        success: function (response) {
                            $("#output").html(response);

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(textStatus, errorThrown);
                        }
                    });
                }
                else
                {
                    alert("Please Enter Brand");
                }
            });

            $(".priceup").keypress(function (event) {
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

                            <form action="../../EditColor" method="post">
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
                                        int productid = Integer.parseInt(request.getParameter("productid"));
                                        ColorModel pd = new ColorModel();
                                        ColorDao pdo = new ColorDao();
                                        pd = pdo.getelementByID(productid);

                                    %>
                                    <input type="hidden" name="modal_prd_quant1" id="modal_prd_quant1" value="<%=productid%>">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="x_panel">
                                            <div class="x_title">
                                                <h2>Edit Brand</h2>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <div  id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" >

                                                    <div class="row" >
                                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                            <div class="form-group">
                                                                <input type="hidden" id="modal_prd_id" value="<%=pd.getId()%>" name="modal_prd_id">
                                                              <input type="text" name="modal_prd_name" id="modal_prd_name" value="<%=pd.getColorName()%>" class="form-control table_center" >
                                                             
                                                            </div>
                                                        </div>
                                                    </div>



                                                    <div class="form-group">
                                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">

                                                            <button class="btn btn-primary" type="reset">Reset</button>
                                                            <button type="submit" class="btn btn-success" >Update</button>
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



    <script type="text/javascript">
        $('#document').ready(function () {

            $('.edit_prd').click(function (event) {
                var i = this.id;
                var j = $('#prd_id' + i).val();


                $('#modal_prd_id').val($('#prd_id' + i).val());


                $('#modal_prd_name').val($('#prd_name' + i).text());
                $('#modal_prd_quant').val($('#prd_quant' + i).text());

            });

            $('.edit_prd1').click(function (event) {
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
        $('document').ready(function () {
            $('.remove_prd').click(function () {
                var PRD_ID = this.id;
                alert(PRD_ID);
                $.get("DeleteProductAjax.jsp", {PRD_ID: PRD_ID}, function (data) {
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