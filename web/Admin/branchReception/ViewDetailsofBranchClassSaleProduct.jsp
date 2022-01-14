

<%@page import="com.accede.angel.sell.model.BranchClassSellDetails"%>
<%@page import="com.accede.angel.sell.model.BranchClassSale"%>
<%@page import="com.accede.angel.sell.model.BranchSaleDetails"%>
<%@page import="com.accede.angel.sell.dao.SaveBranchSaleDAO"%>
<%@page import="com.accede.angel.sell.model.BranchSale"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
   
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
   <%       String purchaseid = request.getParameter("purchaseid");
            System.out.println("purchaseid" + purchaseid);
            int saleid = Integer.parseInt(purchaseid);
            BranchClassSale branchsale = new BranchClassSale();
            SaveBranchSaleDAO purchase = new SaveBranchSaleDAO();
            branchsale = purchase.getBranchClassSaleByID(saleid);


        %>




    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
              
                    <%@ include file = "../comman_files/adminSideBarForBilling.jsp" %>
               
                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>


                <!-- page content -->
                <div  role="main">
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
                                                         <th class="text-center" >Category</th>
                                                         <th class="text-center" >Sub Category</th>
                                                                       <th class="text-center" >Brand</th>
                                                        <th class="text-center" >Model No</th>
                                          
                                                        <th class="text-center" >Color</th>
                                                        <th class="text-center" >Purchase Price</th>
                                                        <th class="text-center" >MRP Price</th>
                                                       

                                                        <th>Sell Quantity</th> 
                                                        <th>Sale Date</th>                                                 


                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <%                                                   List<BranchClassSellDetails> AllProduct = branchsale.getBranchsaledetails();
                                                        int i = 0;
                                                        for (BranchClassSellDetails c1 : AllProduct) {

                                                            i++;

                                                    %>
                                                    <tr>
                                                        <td><%=i%></td>
                                                           <td  class="data_center"><%=c1.getProduct().getCategory().getCategory()%></td>
                                                           <td  class="data_center"><%=c1.getProduct().getSubCategory().getSubCategory()%></td>
    <td  class="data_center"><%=c1.getProduct().getBrand().getBrand()%></td>
                                                        <td  class="data_center"><%=c1.getProduct().getModel().getModelName()%></td>
                                                    
                                                        <td  class="data_center"><%=c1.getProduct().getColorModel().getColorName()%></td>
                                                        <td  class="data_center"><%=c1.getProduct().getPurchasePrice()%></td>
                                                        <td  class="data_center"><%=c1.getProduct().getUnitPrice()%></td>
                                                     
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