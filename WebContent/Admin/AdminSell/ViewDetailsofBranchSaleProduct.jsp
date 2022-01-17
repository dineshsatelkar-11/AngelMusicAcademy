

<%@page import="com.accede.angel.sell.model.BranchSaleDetails"%>
<%@page import="com.accede.angel.sell.dao.SaveBranchSaleDAO"%>
<%@page import="com.accede.angel.sell.model.BranchSale"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shrotcut icon" href="../production/images/angle-music-logo.png" />
        <title>Blessings Aquarium </title>

        <!-- Bootstrap -->
        <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
        <!-- iCheck -->
        <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
        <!-- bootstrap-wysiwyg -->
        <link href="../vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
        <!-- Select2 -->
        <link href="../vendors/select2/dist/css/select2.min.css" rel="stylesheet">
        <!-- Switchery -->
        <link href="../vendors/switchery/dist/switchery.min.css" rel="stylesheet">
        <!-- starrr -->
        <link href="../vendors/starrr/dist/starrr.css" rel="stylesheet">
        <!-- bootstrap-daterangepicker -->
        <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
        <!-- Datatables -->
        <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
        <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
        <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

        <!-- Custom Theme Style -->
        <link href="../build/css/custom.min.css" rel="stylesheet">


        <%       String purchaseid = request.getParameter("purchaseid");
            System.out.println("purchaseid" + purchaseid);
            int saleid = Integer.parseInt(purchaseid);
            BranchSale branchsale = new BranchSale();
            SaveBranchSaleDAO purchase = new SaveBranchSaleDAO();
            branchsale = purchase.getpurchaseByID(saleid);


        %>












    </head>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/adminSideBarForBilling.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>


                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">

                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12">

                                <!-- form date pickers -->

                            </div>
                            <div class="row" id="tablefetch">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Branch sale Product Details </h2>
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
                                            <table id="datatable-buttons" class="table table-striped table-bordered tablefetch">
                                                <thead>
                                                    <tr>
                                                        <th>Sr No.</th>
                                                        <th class="text-center" >Model No</th>
                                                        <th class="text-center" >Brand</th>
                                                        <th class="text-center" >Color</th>
                                                        <th class="text-center" >Category</th>

                                                        <th>Sell Quantity</th> 
                                                        <th>Sale Date</th>                                                 


                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <%                                                   List<BranchSaleDetails> AllProduct = branchsale.getBranchsaledetails();
                                                        int i = 0;
                                                        for (BranchSaleDetails c1 : AllProduct) {

                                                            i++;

                                                    %>
                                                    <tr>
                                                        <td><%=i%></td>
                                                        <td  class="data_center"><%=c1.getProduct().getModel().getModelName()%></td>
                                                        <td  class="data_center"><%=c1.getProduct().getBrand().getBrand()%></td>
                                                        <td  class="data_center"><%=c1.getProduct().getColorModel().getColorName()%></td>
                                                        <td  class="data_center"><%=c1.getProduct().getCategory().getCategory()%></td>

                                                        <td><%=c1.getProductquantity()%></td>
                                                        <td><%=c1.getDate()%></td>


                                                    </tr> 
                                                    <%
                                                        }
                                                    %>





                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="outputt">   </div>                    
                        </div>
                    </div>
                    <!-- /page content -->

                    <!-- footer content -->
                    <%@ include file = "../comman_files/BranchFooter.jsp" %>
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
            <!-- bootstrap-daterangepicker -->
            <script src="../vendors/moment/min/moment.min.js"></script>
            <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
            <!-- Ion.RangeSlider -->
            <script src="../vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
            <!-- Bootstrap Colorpicker -->
            <script src="../vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
            <!-- jquery.inputmask -->
            <script src="../vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
            <!-- jQuery Knob -->
            <script src="../vendors/jquery-knob/dist/jquery.knob.min.js"></script>
            <!-- Cropper -->
            <script src="../vendors/cropper/dist/cropper.min.js"></script>

            <!-- Custom Theme Scripts -->
            <script src="../build/js/custom.min.js"></script>
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


            <script type="text/javascript">
                $(document).ready(function() {
                    $(".hidedata").hide();
                });

                $('.search').click(function(event) {
                    alert("garimaaa!!!!");
                    var num = document.getElementById("search1").innerHTML;
                    var res = num.split("-");
                    var start = res[0];
                    var end = res[1];
                    var Branch = $("#Branch").val().trim();

                    alert("garimaaaaaa!!!!" + num);
                    $.ajax({
                        url: "ReportFetchAjax.jsp",
                        type: "post",
                        data: {start: start, end: end, Branch: Branch},
                        success: function(response) {
                            alert("garimaaaaaa!!!!");
                            $(".tablefetch").html(response);
                            alert("garimaaaaaa!!!!final");
                        },
                    });

                });

                $('.btn9').click(function() {
                    //alert('adsjhfgadsf');
                    var purchaseid = this.id;
                    if (purchaseid.trim() !== "")
                    {
                        alert('adsjhfgadsf===' + purchaseid);
                        $.ajax({
                            url: "ViewAllProductSaleToBranchAjax.jsp",
                            type: "post",
                            data: {purchaseid: purchaseid},
                            success: function(response) {
                                alert('success1');
                                $("#outputt").html(response);
                                alert('success2');
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                console.log(textStatus, errorThrown);
                            }
                        });
                    }

                });





            </script>
        </div>
    </body>
</html> 