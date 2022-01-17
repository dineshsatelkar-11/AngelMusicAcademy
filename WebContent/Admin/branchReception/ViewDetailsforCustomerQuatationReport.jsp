

<%@page import="com.accede.angel.sell.model.CustomerQuatation"%>
<%@page import="com.accede.angel.sell.dao.CustomerQuatationDAO"%>
<%@page import="com.accede.angel.sell.model.CustomerQuatation"%>
<%@page import="com.accede.angel.sell.model.CustomerQuatationDetails"%>
<%@page import="com.accede.angel.sell.model.BranchSaleDetails"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.sell.dao.SaveBranchSaleDAO"%>
<%@page import="com.accede.angel.sell.model.BranchSale"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
     <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
 <%

    String purchaseid = request.getParameter("purchaseid");
    System.out.println("purchaseid"+purchaseid);
    int saleid=Integer.parseInt(purchaseid);
    CustomerQuatation customersale = new CustomerQuatation();
    CustomerQuatationDAO purchase = new CustomerQuatationDAO();
    customersale = purchase.getpurchaseByID(saleid);

    

%>
     
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
       
        <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
       

        <!-- top navigation -->
       <%@ include file = "../comman_files/adminTopBar.jsp" %>


                <!-- page content -->
                <div  role="main">
                    <div class="">

                      
                        <div class="row">
                           
                            <div class="row" id="tablefetch">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Customer Quatation Product Details</h2>
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
                                                        <th>Date</th>     
                                                        <th>Category</th>
                                                        <th>Model No</th> 
                                                        <th>Brand</th> 
                                                        <th>Color</th> 
                                                        <th> Quantity</th> 
                                                        <th>Product Price</th> 
                                                       
                                                        <th>Total</th> 
                                                        
  


                                                    </tr>
                                                </thead>
                                                <tbody>

                                                  
                                                   
                               <%
       
        List<CustomerQuatationDetails> AllProduct = customersale.getCustomerQuatationDetails();
        int i = 0;
        for (CustomerQuatationDetails c1 : AllProduct) {
            
          
        i++;

        %>                                <tr>
                                                      
                                                        <td><%=i%></td>
            <td><%=c1.getDate()%></td>
            <td><%=c1.getProduct().getCategory().getCategory() %></td>
            <td><%=c1.getProduct().getModel().getModelName() %></td>
            <td><%=c1.getProduct().getBrand().getBrand() %></td>
            <td><%=c1.getProduct().getColorModel().getColorName()  %></td>
           
            <td><%=c1.getProductquantity()%></td>
            <td><%=c1.getMrpprice()%></td>
           
            <td><%=c1.getGross_amount()%></td>

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
            </div>
    </body>
</html> 