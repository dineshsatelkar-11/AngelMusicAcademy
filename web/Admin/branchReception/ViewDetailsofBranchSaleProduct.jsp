<%@page import="com.accede.angel.sell.model.BranchSaleDetails"%>
<%@page import="com.accede.angel.sell.model.BranchSaleDetails"%>
<%@page import="com.accede.angel.sell.dao.SaveBranchSaleDAO"%>
<%@page import="com.accede.angel.sell.dao.SaveBranchSaleDAO"%>
<%@page import="com.accede.angel.sell.model.BranchSale"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
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
                                    </div>

   <%       String purchaseid = request.getParameter("purchaseid");
            System.out.println("purchaseid" + purchaseid);
            int saleid = Integer.parseInt(purchaseid);
            BranchSale branchsale = new BranchSale();
            SaveBranchSaleDAO purchase = new SaveBranchSaleDAO();
            branchsale = purchase.getpurchaseByID(saleid);


        %>
                                     <div id="">
                                        <div class="x_content">

                                            <table id="datatable-buttons" class="table table-striped table-bordered tablefetch">
                                                <thead>
                                                    <tr>
                                                        <th>Sr No.</th>
                                                        <th>Sale Date</th> 
                                                         <th class="text-center" >Category</th>
                                                         <th class="text-center" >Sub Category</th>
                                                                       <th class="text-center" >Brand</th>
                                                        <th class="text-center" >Model No</th>
                                          
                                                        <th class="text-center" >Color</th>
                                                        <!--<th class="text-center" >Purchase Price</th>-->
                                                        <th class="text-center" >MRP Price</th>
                                                       

                                                        <th>Sell Quantity</th> 
                                                                                                        


                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <%                                                   List<BranchSaleDetails> AllProduct = branchsale.getBranchsaledetails();
                                                        int i = 0;
                                                        for (BranchSaleDetails c1 : AllProduct) {
String date1 = DATE_FORMAT.format(c1.getDate());
                                                            i++;

                                                    %>
                                                    <tr>
                                                        <td><%=i%></td>
                                                          <td><%=date1%></td>
                                                           <td  class="data_center"><%=c1.getProduct().getCategory().getCategory()%></td>
                                                           <td  class="data_center"><%=c1.getProduct().getSubCategory().getSubCategory()%></td>
    <td  class="data_center"><%=c1.getProduct().getBrand().getBrand()%></td>
                                                        <td  class="data_center"><%=c1.getProduct().getModel().getModelName()%></td>
                                                    
                                                        <td  class="data_center"><%=c1.getProduct().getColorModel().getColorName()%></td>
                                                        <!--<td  class="data_center"><%=c1.getProduct().getPurchasePrice()%></td>-->
                                                        <td  class="data_center"><%=c1.getProduct().getUnitPrice()%></td>
                                                     
                                                        <td><%=c1.getProductquantity()%></td>
                                                      


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
                        </div>



                    </div>
                </div>
                <script>
                    $(document).ready(function() {
                        $('[data-toggle="popover"]').popover();
                    });
                </script>

                <!-- /page content -->


                <!-- footer content -->
                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
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

        <script>
                    $(document).ready(function() {

                        $('.user_buttons').click(function(event) {
                            var UID = this.id;
                            var adminidd = $("#adminidd").val();
                            if (UID !== "")
                            {
                                var pos = $(this).attr("data");
                                $("#position").text("" + pos + " Due Date Student");
                                $.ajax({
                                    url: "FetchStudent.jsp",
                                    type: "post",
                                    data: {userID: UID, adminidd: adminidd},
                                    success: function(response) {
                                        $("#studentfetch").html(response);
                                    },
                                    error: function(jqXHR, textStatus, errorThrown) {
                                        console.log(textStatus, errorThrown);
                                        alert("Something Went Wrong...!!!");
                                    }
                                });
                            } else
                            {
                                alert("No Users Added...!!!");
                            }
                        });



                    });
        </script>
    </body>
</html>