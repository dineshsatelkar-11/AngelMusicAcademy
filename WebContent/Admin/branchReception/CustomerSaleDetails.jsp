
<%@page import="com.accede.angel.sell.dao.ExchangeDao"%>
<%@page import="com.accede.angel.sell.model.Exchange"%>
<%@page import="com.accede.angel.sell.dao.CustomerSaleDAO"%>
<%@page import="com.accede.angel.sell.model.CustomerSale"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
 <%     if (session.getAttribute("printInvoiceID") != null) {

            String invoicefor = (String) session.getAttribute("printInvoiceID");

            if (invoicefor.equals("Sell")) {
               
                  int sellid = (Integer) session.getAttribute("Sellid");
                
//                String repairid1 = (String) session.getAttribute("repairid");
//                long repairid = Long.parseLong(repairid1);

                session.removeAttribute("printInvoiceID");
                session.removeAttribute("Sellid");
    %>
    <script>
        window.open("SellProductInvoice.jsp?sellid=<%=sellid%>");</script>
        <%
                }
            }

        %>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">

                <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div  role="main">
                    <div class="">

                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2> Customer Sell Details </h2>   
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

                                        <% //     AdmissionDao cd = new AdmissionDao();
                                         //   int id = Integer.parseInt(request.getParameter("accountid"));
                                          //  CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                                           // CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(id);


                                        %>

                                        <%                                            if (session.getAttribute("i") != null) {
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

                                    <div class="x_title">
                                        <div class="btn-group">

                                          </div>
                                        
                                        <label class="col-md-offset-3" id="position"></label>
                                        
                                                                       
                                      <div class="clearfix"></div>

                                    </div>
                                    
                                    <div id="studentfetch">
                                        <div class="x_content">
                                            <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                        The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                    </p>-->
                                            <table id="datatable-buttons" class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Sr No.</th>
                                                        <th>Date</th>
                                                        <th>Status</th>
                                                        <th>Grand Total</th>                                                          
                                                        <th>Other Charges</th> 
                                                        <th>Discount Amount</th>  
                                                        <th>Discount Percentage</th>  
                                                          
                                                   
                                                        <th>Exchange Amount</th>  
                                                        <th>paid Amount</th>  
                                                        <th>Balance Amount</th>  
                                                        <th>Gross Total</th>  
                                                        <th>Payment mode</th>

                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <%
                                        int id = Integer.parseInt(request.getParameter("exchangeid"));
                                                        Exchange p = new Exchange();
                                                        ExchangeDao b1 = new ExchangeDao();
                                                        p=b1.getpurchaseByID(id);
                                                                    %>
                                                    <tr>
                                                        <td><%=1%></td>
                                                      
                                                        <td><%=p.getCustomerSale().getDate()%></td>
                                     <td><%=p.getCustomerSale().isCloseRequest() %></td>
                                                        <td><%=p.getCustomerSale().getGrandtotal()%></td>
                                                        
                                                        
                                                        <td><%=p.getCustomerSale().getOther_charges()%></td>
                                                        <td><%=p.getCustomerSale().getDiscount_amount()%></td>
                                                        <td><%=p.getCustomerSale().getDiscount_Per()%></td>
                                     <td><%=p.getCustomerSale().getAdvance_Amount()%></td>
                                                        
                                                        <td><%=p.getCustomerSale().getPaidamt()%></td>
                                                        <td><%=p.getCustomerSale().getBalamt()%></td>
                                                        <td><%=p.getCustomerSale().getGrosstotal()%></td>
                                                        <td><%=p.getCustomerSale().getPaymentMode()%></td>
                                                       
                                                    </tr> 
                                                    

                                                </tbody>
                                            </table>
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
                        $("#position").text("" + pos + " Due Date Customer");
                        $.ajax({
                            url: "FetchRentCust.jsp",
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