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




    <div class="modal fade" id="EditAccountCust" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" style="margin-right: -240px" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Account</h4>
                </div>
                <form class="form-horizontal form-label-left input_mask" action="../../EditAccountCust" id="myAccount" data-parsley-vdalidate  >

                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name"> Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="Edit_First_Name" name="First_Name" required="required" class="form-control col-md-7 col-xs-12">
                            <input type="hidden" id="Edit_Cust_Id" name="account_id" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                        <br>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">Mobile No. <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" readonly="" id="Edit_Account_Mobile_No" name="Account_Mobile_No" required=""   required="required" class="form-control col-md-7 col-xs-12" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                        </div>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <br>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email-id">Email Id <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="Edit_Account_Email_Id"  name="Account_Email_Id" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                        </div>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <br>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Address <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea id="Edit_AccountAddress" name="AccountAddress" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text"></textarea>
                        </div>
                        <br>
                        <br>
                        <br>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>

                    <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <!--                          <p><button class="btn btn-primary" type="button">Cancel</button></p>-->
                            <table>
                                <tr>
                                    <td> <button class="btn btn-primary" type="reset">Reset</button></td>
                                    <td> <button type="submit" id="AccountCreate" class="btn btn-success">Submit</button></td>


                                </tr>
                            </table>



                        </div>
                    </div>
                </form>
                <br>
                <br>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" style="width:20%" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#document').ready(function() {
         $("#datatable").on("click", ".edit_Customer", function(){   
       

                var i = this.id;
              
                var a = $('#Cust_Name' + i).text();
                
                var j = $('#Cust_Email' + i).val();
                var k = $('#Cust_Addr' + i).val();
                var l = $('#Cust_Mob' + i).text();
                var m = $('#Cust_Id' + i).val();


                $('#Edit_Cust_Id').val(m);
                $('#Edit_First_Name').val(a);
                $('#Edit_Account_Mobile_No').val(l);
                $('#Edit_Account_Email_Id').val(j);
                $('#Edit_AccountAddress').val(k);

            });


        });

    </script>
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

                <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>


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


                                            <li> <p><button type="button" class="btn btn-round btn-sm btn-info "  data-toggle="modal" data-target="#myModal">Create Account</button></p>
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
                                                        <th class="table_center">Edit</th>
                                                        <th class="table_center">Name</th>
                                                        <th class="table_center">Mobile</th>
                                                            <%
                                                                if (AdminPrevilleages.isAllStudent()) {
                                                            %>
                                                        <th class="table_center">Class</th>
                                                            <%}
                                                                if (AdminPrevilleages.isCustomer_Sell_Report()) {%>
                                                        <th class="table_center">Sell</th>
                                                        <th class="table_center">Quatation </th>
                                                            <%}
                                                                if (AdminPrevilleages.isAllRentRequest()) {%>
                                                        <th class="table_center">Rent</th>
                                                            <%}
                                                                if (AdminPrevilleages.isAllRepairing()) {%>
                                                        <th class="table_center">Repair</th>
                                                            <%} %>

                                                        <th class="table_center">Follow Up Report</th>
                                                            <% if (AdminPrevilleages.isCustomer_Sell_Report()) {%>
                                                        <th class="table_center">Advance Amount</th>

                                                        <th class="table_center">Advance  Amount</th>
                                                            <%} %>






                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <%
                                                        CustomerAccountDao cd = new CustomerAccountDao();
                                                        AdmissionDao AdmissionDao = new AdmissionDao();
                                                        int i = 0;
                                                        int allrentamount = 0;
                                                        int allrepairamount = 0;
                                                        float allsellamount = 0;
                                                        int allStudentBalanceamount = 0;
                                                        float alladvance = 0;
                                                        int finalamount = 0;
                                                        List<CustomerAccount> cl = null;
                                                        cl = cd.getCustomerAccount(admin);
                                                        if (cl != null && cl.size() > 0) {
                                                            for (CustomerAccount p : cl) {
                                                                i++;

                                                                RentDao RentDao = new RentDao();
                                                                List<Rent> allRent = RentDao.getAllRentRequestForCust(p);
                                                                int rentamount = 0;
                                                                int repairamount = 0;
                                                                float sellamount = 0;
                                                                int StudentBalanceamount = 0;
                                                                Admission Admission = AdmissionDao.getAdmissionByAccount(p);
                                                                if (Admission != null) {
                                                                    StudentBalanceamount = Admission.getRemaininFee();
                                                                }
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

                                                    %>
                                                    <tr>
                                                <input type="hidden" value="<%=p.getId()%>" id="Cust_Id<%=i%>">
                                                <input type="hidden" value="<%=p.getAddress()%>" id="Cust_Addr<%=i%>">
                                                <input type="hidden" value="<%=p.getEmail()%>" id="Cust_Email<%=i%>">
                                                <td class="table_center"><%=i%></td> 

                                                <td class="table_center"><a class="fa-2x glyphicon glyphicon-edit edit_Customer" href="#EditAccountCust" role="button" data-toggle="modal" id="<%=i%>" ></a></td>

                                                <td class="table_center"  id="Cust_Name<%=i%>"><%=p.getName()%></td> 
                                                <td class="table_center"  id="Cust_Mob<%=i%>"><%=p.getMobileNo()%></td> 
                                                <%
                                                    if (AdminPrevilleages.isAllStudent()) {
                                                %>
                                                <td class="table_center" ><a href="StudentProfileDetails.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs"><%=StudentBalanceamount%></a></td> 
                                                    <%}
                                                                if (AdminPrevilleages.isCustomer_Sell_Report()) {%>
                                                <td class="table_center" ><a href="CustomerSaleReport.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs"><%=sellamount%></a></td> 
                                                <td class="table_center" ><a href="CustomerQuatationReport.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">Quatation</td> 
                                                <%}
                                                                if (AdminPrevilleages.isAllRentRequest()) {%>
                                                <td class="table_center" ><a href="CustRent.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs"><%=rentamount%></a></td> 
                                                    <%}
                                                                if (AdminPrevilleages.isAllRepairing()) {%>
                                                <td class="table_center" ><a href="CustRepair.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs"><%=repairamount%></a></td> 
                                                    <%}%>
                                                <td class="table_center" ><a href="FollowupReport.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">Follow Up Report</a></td> 
                                                <% if (AdminPrevilleages.isCustomer_Sell_Report()) {%>

                                                <td class="table_center"><%=p.getAdvanceAmount()%></td> 
                                                <td class="table_center" ><a href="AdvanceAmount.jsp?accountid=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">Advance</a></td> 
                                                <%} %>
                                                </tr> 
                                                <%
                                                            alladvance = alladvance + p.getAdvanceAmount();
                                                        }

                                                    }%>
                                                <tfoot>
                                                    <tr>

                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                            <%
                                                                if (AdminPrevilleages.isAllStudent()) {
                                                            %>
                                                        <th class="table_center"></th>
                                                            <%}
                                                                if (AdminPrevilleages.isCustomer_Sell_Report()) {%>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                            <%}
                                                                if (AdminPrevilleages.isAllRentRequest()) {%>
                                                        <th class="table_center"></th>
                                                            <%}
                                                                if (AdminPrevilleages.isAllRepairing()) {%>
                                                        <th class="table_center"></th>
                                                            <%} %>
                                                        <th class="table_center"></th>

                                                        <th class="table_center"></th>
                                                            <% if (AdminPrevilleages.isCustomer_Sell_Report()) {%>

                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                            <%} %>





                                                    </tr>
                                                    <tr>

                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center"></th>
                                                        <th class="table_center">Total</th>
                                                            <%
                                                                if (AdminPrevilleages.isAllStudent()) {
                                                            %>
                                                        <th class="table_center"><%=allStudentBalanceamount%></th>
                                                            <%}
                                                                if (AdminPrevilleages.isCustomer_Sell_Report()) {%>
                                                        <th class="table_center"><%=allsellamount%></th>
                                                        <th class="table_center"></th>
                                                            <%}
                                                                if (AdminPrevilleages.isAllRentRequest()) {%>
                                                        <th class="table_center"><%=allrentamount%></th>
                                                            <%}
                                                                if (AdminPrevilleages.isAllRepairing()) {%>
                                                        <th class="table_center"><%=allrepairamount%></th>
                                                            <%} %>
                                                        <th class="table_center"></th>
                                                            <% if (AdminPrevilleages.isCustomer_Sell_Report()) {%>

                                                        <th class="table_center"><%=alladvance%></th>
                                                        <th class="table_center"></th>
                                                            <%}%>





                                                    </tr>
                                                </tfoot>
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