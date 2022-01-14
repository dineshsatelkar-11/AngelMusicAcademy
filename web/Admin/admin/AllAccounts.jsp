<%@page import="com.accede.angel.sell.dao.CustomerSaleDAO"%>
<%@page import="com.accede.angel.sell.model.CustomerSale"%>
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
    <%    if (session.getAttribute("printInvoiceID2") != null) {
            long celloId = (Long) session.getAttribute("printInvoiceID2");
            session.removeAttribute("printInvoiceID");
            session.removeAttribute("printInvoiceID2");
    %>
    <script>
        window.open("Class_invoice.jsp?admissionid=<%=celloId%>");</script>
        <%
            }


        %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <style> 
        .studentimage {
            width: 50px;
            hight: 50px;


            -webkit-transition: width 2s; /* For Safari 3.1 to 6.0 */
            transition: width 2s;
        }
        .studentimage:hover {
            width: 300px;
            hight: 300px;

        }
    </style>
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
                                        <h2>All Account Details </h2>   
                                        <ul class="nav navbar-right panel_toolbox">


                                            <!--<li> <p><button type="button" class="btn btn-round btn-sm btn-info "  data-toggle="modal" data-target="#myModal">Create Account</button></p>-->
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>

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


                                    <input type="hidden" id="adminidd" name="adminidd" value="<%=admin.getAdminId()%>">
                                    <div id="studentfetch">
                                        <div class="x_content">

                                            <table id="datatable" class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>

                                                        <th class="table_center">Sr No</th>
                                                        <th class="table_center">Name</th>
                                                        <th class="table_center">Mobile</th>

                                                        <th class="table_center">Class</th>
                                                        <th class="table_center">Sell</th>
                                                        <th class="table_center">Quotation </th>
                                                        <th class="table_center">Rent</th>
                                                        <th class="table_center">Repair</th>

                                                        <th class="table_center">Follow Up Report</th>
                                                        <th class="table_center">Balance</th>
                                                        <th class="table_center">Advance  Amount</th>




                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <%
                                                        CustomerAccountDao cd = new CustomerAccountDao();
                                                        AdmissionDao AdmissionDao = new AdmissionDao();
                                                        int i = 0;
                                                        float allsellamount = 0;
                                                        int allrentamount = 0;
                                                        int allrepairamount = 0;
                                                        int allStudentBalanceamount = 0;
                                                        float alladvance = 0;
                                                        List<CustomerAccount> cl = null;
                                                        cl = cd.getCustomerAccount();
                                                        if (cl != null && cl.size() > 0) {
                                                            for (CustomerAccount p : cl) {
                                                                i++;
                                                                int StudentBalanceamount = 0;
                                                                Admission Admission = AdmissionDao.getAdmissionByAccount(p);
                                                                if (Admission != null) {
                                                                    StudentBalanceamount = Admission.getRemaininFee();
                                                                }
                                                                RentDao RentDao = new RentDao();
                                                                List<Rent> allRent = RentDao.getAllRentRequestForCust(p);
                                                                int rentamount = 0;
                                                                int repairamount = 0;
                                                                float sellamount = 0;

                                                                if (allRent != null && allRent.size() > 0) {
                                                                    for (Rent rent : allRent) {
                                                                        rentamount = rentamount + rent.getPaid_ByCust();
                                                                    }
                                                                }
                                                                RepairDao RepairDao = new RepairDao();

                                                                List<Repair> allRepair = null;
                                                                allRepair = RepairDao.getAllRepairRequestForCust(p);
                                                                if (allRepair != null && allRepair.size() > 0) {
                                                                    for (Repair rp : allRepair) {

                                                                        repairamount = repairamount + rp.getBal();
                                                                    }
                                                                }

                                                                CustomerSale CustomerSale = new CustomerSale();
                                                                CustomerSaleDAO b1 = new CustomerSaleDAO();
                                                                List<CustomerSale> AllBrand1 = b1.getAllCustomerSale(p);

                                                                for (CustomerSale c1 : AllBrand1) {
                                                                    sellamount = sellamount + c1.getBalamt();
                                                                }

                                                                allrentamount = allrentamount + rentamount;
                                                                allrepairamount = allrepairamount + repairamount;
                                                                allsellamount = allsellamount + sellamount;
                                                                allStudentBalanceamount = allStudentBalanceamount + StudentBalanceamount;
                                                                alladvance = alladvance + p.getAdvanceAmount();


                                                    %>
                                                    <tr>
                                                        <td class="table_center"><%=i%></td> 


                                                        <td class="table_center"><%=p.getName()%></td> 
                                                        <td class="table_center"><%=p.getMobileNo()%></td> 

                                                        <td class="table_center" ><a href="StudentProfileDetails.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs"><%=StudentBalanceamount%></a></td> 
                                                        <td class="table_center" ><a href="CustomerSaleReport.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">0</a></td> 
                                                        <td class="table_center" ><a href="CustomerQuatationReport.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">Quatation</td> 

                                                        <td class="table_center" ><a href="CustRent.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs"><%=rentamount%></a></td> 
                                                        <td class="table_center" ><a href="CustRepair.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs"><%=repairamount%></a></td> 
                                                        <td class="table_center" ><a href="FollowupReport.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">Follow Up Report</a></td> 

                                                        <td class="table_center"><%=rentamount + repairamount + StudentBalanceamount%></td> 
                                                        <td class="table_center"><%=p.getAdvanceAmount()%></td> 

                                                    </tr> 
                                                    <%}

                                                        }%>

                                                </tbody>
                                                <tfoot>
                                                    <tr>

                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>

                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>







                                                    </tr>
                                                    <tr>

                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center">Total</th>

                                                        <th class="table_center"><%=allStudentBalanceamount%></th>
                                                        <th class="table_center"><%=allsellamount%></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"><%=allrentamount%></th>
                                                        <th class="table_center"><%=allrepairamount%></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"><%=alladvance%></th>







                                                    </tr>
                                                </tfoot>
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