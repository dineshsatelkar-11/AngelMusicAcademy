
<%@page import="com.accede.angel.sell.dao.PurchaseDao"%>
<%@page import="com.accede.angel.sell.model.PurchaseProduct"%>
<%@page import="com.accede.angel.sell.model.PurchaseDetails"%>

<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<!DOCTYPE html>
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

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
                        <!--                        <div class="page-title">
                                                    <div class="title_left">
                                                        <h3>All Client Details </h3>                               
                        
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
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Purchase Products</h2>   
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
                                        <table id="datatable-buttons" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>

                                                    <th class="table_center">Sr No</th>
                                                   
                                                    <th class="table_center">Category </th>
                                                    <th class="table_center">Sub Category </th>
                                                     <th class="table_center">Model No </th>
                                                    <th class="table_center">Brand </th>
                                                    <th class="table_center">Color </th>
                                                    <th class="table_center">Purchase Price</th>
                                                    <th class="table_center">Quantity</th>
                                                    <th class="table_center">Barcode No</th>
                                                    <th class="table_center">CGST %</th>
                                                      <th class="table_center">CGST Amount</th>
                                                    <th class="table_center">SGST %</th>
                                                     <th class="table_center">SGST Amount</th>
                                                    <th class="table_center">IGST %</th>
                                                   
                                                    <th class="table_center">IGST Amount</th>
                                                    <th class="table_center">Taxable Amount</th>
                                                    <th class="table_center">Total Amount</th>
                                                    <th class="table_center">Final Amount</th>
                                          
                                                   


                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%
                                                    PurchaseDao cd = new PurchaseDao();
                                                    long id =Long.parseLong(request.getParameter("id"));
                                                  System.out.println("id="+id);
                                                    PurchaseProduct p=new PurchaseProduct();
                                                   p=cd.getProductById2(id);
                                                      System.out.println("p="+p);
                                                   int i=0;
                                                   float finalAmount=0;
                                                   for(PurchaseDetails pp : p.getPurchaseDetails()){
                                                    finalAmount=pp.getTotal()+pp.getTaxableAmount();
                                                    
                                                                i++;


                                                %>
                                                <tr>
                                                    <td class="table_center"><%=i%></td>
                                                 
                                                  
                                                    <td class="table_center"><%=pp.getProductModel().getCategory().getCategory()%> </td>
                                                    <td class="table_center"><%=pp.getProductModel().getSubCategory().getSubCategory()%> </td>
                                                      <td class="table_center"><%=pp.getProductModel().getModel().getModelName() %> </td>
                                                    <td class="table_center"><%=pp.getProductModel().getBrand().getBrand()%> </td>
                                                    <td class="table_center"><%=pp.getProductModel().getColorModel().getColorName()%> </td>
                                                    <td class="table_center"><%=pp.getPurchasePrice()%> </td>
                                                    <td class="table_center"><%=pp.getQuantity()%> </td>
                                                     <td class="table_center"><%=pp.getProductModel().getProductBarcode() %> </td>
                                                    <td class="table_center"><%=pp.getCgstper()%></td>
                                                     <td class="table_center"><%=pp.getCgstamount()%></td> 
                                                    <td class="table_center"><%=pp.getSgstper()%></td> 
                                                     <td class="table_center"><%=pp.getSgstamount() %></td> 
                                                    <td class="table_center"><%=pp.getIgstper()%></td>
                                                   
                                                    <td class="table_center"><%=pp.getIgstamount() %></td> 
                                                    <td class="table_center"><%=pp.getTaxableAmount()%></td> 
                                                    <td class="table_center"><%=pp.getTotal()%></td> 
                                                    <td class="table_center"><%=finalAmount%></td> 



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
    </body>
</html>