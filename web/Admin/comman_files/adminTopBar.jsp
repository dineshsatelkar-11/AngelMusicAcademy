<%@page import="com.accede.angel.admin.dao.AdminPrevilleagesDao"%>
<%@page import="com.accede.angel.admin.model.AdminPrevilleages"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.model.EnquiryDetail"%>
<%@page import="com.accede.angel.admin.model.PaymentFollowupMessage"%>
<%@page import="com.accede.angel.admin.model.PaymentFollowup"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.PaymentFollowupDao"%>

<style>
    .dropdown-submenu {
        position: relative;
    }

    .dropdown-submenu .dropdown-menu {
        top: 0;
        left: 100%;
        margin-top: -1px;
    }
</style>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->

        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="#">Angel Music</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse"  style="background-color: #3a3a35" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" style="margin-left:10px ">
                <%

                    int paymentfollowup = 0;
                    int activeenquiry = 0;
                    String admintype = (String) session.getAttribute("Type");
                    AdminPrevilleages AdminPrevilleages = new AdminPrevilleages();
                    AdminPrevilleagesDao AdminPrevilleagesDao = new AdminPrevilleagesDao();

                    AdminPrevilleages = AdminPrevilleagesDao.getAdminPrevilleages(admin, admintype);

                    if (admintype.equals("1")) {
                %> 
                <li ><a href="../admin/adminIndex.jsp"><span style="color: white">Home</span> <span class="sr-only">(current)</span></a></li>

                <%} else {%>
                <li ><a href="../branchReception/branchReceptionIndex.jsp"><span style="color: white">Home</span> <span class="sr-only">(current)</span></a></li>
                    <%}%>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span style="color: white">Report</span>  <span style="color: white" class="caret"></span></a>
                    <ul class="dropdown-menu">

                        <%
                            if (admintype.equals("1")) {
                        %>
                        <li><a href="../admin/AllAccounts.jsp">All Account List</a></li>
                        <li><a href="../admin/AllStudent.jsp">All Student List</a></li>
                        <li><a href="../admin/LossReport.jsp">Vanished History</a></li>
                        <li><a href="../admin/AllRentRequest.jsp">All Rent Request</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="../admin/AllRepairing.jsp">All Repair Request</a></li>


                        <li><a href="../admin/AllEmployee.jsp">All Employee Account</a></li>

                        <li><a href="../admin/DailyInOut.jsp">All Payment In/out</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="../admin/AllEnquiry.jsp">All Enquiry</a></li>




                        <li><a href="../admin/AllUploadPdf.jsp">All Uploaded PDF</a></li>
                        <li><a href="../admin/PreviousStudentReport.jsp">Previous  Student Report</a></li>
                        <li><a href="../admin/AllSuperAdminExternal.jsp">External Account Report</a></li>
                            <%}%>


                        <%
                            if (!admintype.equals("1")) {
                        %>

                        <%
                            if (AdminPrevilleages.isAllAccounts()) {
                        %>
                        <li><a href="../branchReception/AllAccounts.jsp">All Account List</a></li>
                            <% }
                                if (AdminPrevilleages.isAllStudent()) {
                            %>
                        <li><a href="../branchReception/AllStudent.jsp">All Student List</a></li>
                            <% }
                                if (AdminPrevilleages.isVanished()) {
                            %>
                        <li><a href="../branchReception/LossReport.jsp">Vanished History</a></li>
                            <% }
                                if (AdminPrevilleages.isAllRentRequest()) {
                            %>
                        <li><a href="../branchReception/AllRentRequest.jsp">All Rent Request</a></li>
                            <% }

                            %>
                        <li role="separator" class="divider"></li>
                            <%                              if (AdminPrevilleages.isAllRepairing()) {
                            %>
                        <li><a href="../branchReception/AllRepairing.jsp">All Repair Request</a></li>

                        <% }
                            if (AdminPrevilleages.isAllEmployee()) {
                        %>
                        <!--<li><a href="../branchReception/AllEmployee.jsp">All Employee Account</a></li>-->
                        <% }
                            if (AdminPrevilleages.isDailyInOut()) {
                        %>
                        <li><a href="../branchReception/DailyInOut.jsp">All Payment In/out</a></li>
                            <% }

                            %>
                        <li role="separator" class="divider"></li>
                            <%                              if (AdminPrevilleages.isAllEnquiry()) {
                            %>
                        <li><a href="../branchReception/AllEnquiry.jsp">All Enquiry</a></li>



                        <%}
                            }%>


                    </ul>
                </li>

                <%   if (admintype.equals("1")) {
                %>  
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span style="color: white"> In/Out Report</span>  <span style="color: white" class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li>  <a href="../admin/SuperAdminDailyInOut.jsp">All Super Admin In/Out </a>

                        <li>  <a href="../admin/SuperAdminInOutBranch.jsp">Super Admin In/Out Branch </a>

                        <li>  <a href="../admin/SuperAdminInOutVendor.jsp">Super Admin In/Out Vendor</a>
                        <li>  <a href="../admin/SuperAdminEmployee.jsp">Super Admin In/Out Employee</a>
                        <li>  <a href="../admin/SuperAdminClient.jsp">Super Admin In/Out Client</a>

                        </li> 
                    </ul>  


                </li>
                <%}%>

                <%   if (admintype.equals("1")) {
                %>  

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" ><span style="color: white">Add Details</span> <span class="caret" style="color: white"></span></a>
                    <ul class="dropdown-menu">

                        <li><a href="../admin/addBranch.jsp">Branches</a></li>
                        <!--                      <li><a href="addSubject.jsp">Subjects</a></li>-->
                        <li><a href="../admin/addCourse.jsp">Course</a></li>


                        <li><a href="../admin/addInstrument.jsp">Instruments Rent</a></li>
                        <li><a href="../admin/InstrumentRepair.jsp">Instruments Repair</a></li>
                        <!--<li><a href="../admin/EmployeeRegistr.jsp"> Employee</a></li>-->
                        <li><a href="../admin/PreviousStudent_1.jsp"> Previous Student</a></li>
                        <li><a href="../admin/UploadCoursePdf.jsp">Upload Course PDF</a></li>
                        <li><a href="../admin/AssignPDFtoAdmin.jsp">Assign  PDF To Admin</a></li>
                        <li><a href="../admin/SuperAdminPayment.jsp">Admins Payment</a></li>
                        <li><a href="../admin/ExternalAccount.jsp">External Account</a></li>
                        <li><a href="../admin/AddSms.jsp">Add SMS</a></li>
                        <li><a href="../admin/GroupSms.jsp">Send Promotional  SMS</a></li>
















                    </ul>
                </li>
                <%}%>



                <%   if (admintype.equals("1")) {
                %>  
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" ><span style="color: white">Add Sell Details</span> <span class="caret" style="color: white"></span></a>
                    <ul class="dropdown-menu">

                        <li><a href="../admin/AddCategory.jsp">Category</a></li>
                        <li><a href="../admin/AddSubCat.jsp">Sub Category</a></li>
                        <li><a href="../admin/AddModelNo.jsp">Model No</a></li>
                        <li><a href="../admin/AddBrand.jsp">Brand</a></li>


                        <li><a href="../admin/AddColor.jsp">Color</a></li>
                        <li><a href="../admin/ProductSave.jsp">Product</a></li>

                        <li><a href="../admin/Vendorregistration.jsp">Vendor</a></li>

                        <li><a href="../admin/Purchase.jsp"> Purchase Order</a></li>
                        <li><a href="../admin/SellProductToBranch.jsp">Sell to Branch</a></li>
                        <li><a href="../admin/SellProductToClass.jsp">Sell to Class</a></li>



                        <li></li>
















                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" ><span style="color: white"> Sell Report</span> <span class="caret" style="color: white"></span></a>
                    <ul class="dropdown-menu">
                        <!--<li><a href="../admin/UpdateBalanceAmount.jsp"> Debit Vendor</a></li>-->
                        <li><a href="../admin/VendorReport.jsp">Vendor Report</a></li>
                        <li><a href="../admin/PurchaseReport.jsp">Purchase Report</a></li>
                        <li><a href="../admin/Report.jsp">Branch Sell Report</a></li>
                        <li><a href="../admin/ClassStockSellReport.jsp">Class Branch Sell Report</a></li>


                        <li><a href="../admin/CustomerSellReport.jsp">Customer Sell Report</a></li>
                        <li><a href="../admin/AllCustomerQuatationReport.jsp">Customer Quatation Report</a></li>
                        <li><a href="../admin/AddProduct.jsp">All Product Report</a></li>
                        <li><a href="../admin/AddProduct1.jsp">Available Product </a></li>
                        <li><a href="../admin/BranchProductTransferReport.jsp"> Product Transfer Report</a></li>

                        <li><a href="../admin/BranchProductStock.jsp">Branch Product Report</a></li>
                        <li><a href="../admin/ClassAddProduct.jsp">Class Product Stock Report</a></li>
                        <li><a href="../admin/ProductwisePurchase.jsp"> Product  Report</a></li>





                        <li></li>
















                    </ul>
                </li>
                <%}%>   



                <%   if (!admintype.equals("1")) {
                %>  
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" ><span style="color: white">Other</span> <span class="caret" style="color: white"></span></a>
                    <ul class="dropdown-menu">
                        <%
                            if (AdminPrevilleages.isBatch_Timing()) {
                        %>

                        <li><a href="../branchReception/addBatchTiming.jsp">Batch Timing</a></li>
                            <%}
                                if (AdminPrevilleages.isPackage()) {
                            %>

                        <li><a href="../branchReception/Package.jsp">Package</a></li>
                            <%}
                                                          %>
                        <li role="separator" class="divider"></li>
                            <%                             if (AdminPrevilleages.isSMS()) {
                            %>
                        <li><a href="../branchReception/AddSms.jsp">Add SMS</a></li>
                            <%}
                                if (AdminPrevilleages.isSend_Promotional_SMS()) {
                            %>
                        <li><a href="../branchReception/GroupSms.jsp">Send Promotional  SMS</a></li>
                        <li><a href="../branchReception/StudentSms.jsp">Send Student  SMS</a></li>
                            <%}
                                if (AdminPrevilleages.isPreviliageTab()) {

                            %>
                        <li><a href="../branchReception/ViewPrevileageForAdmin.jsp">Assign Previliage</a></li>
                        <li><a href="../branchReception/ChangePassword.jsp">Change Password</a></li>
                            <%}
                            %>

                        <li role="separator" class="divider"></li>
                            <%
      if (AdminPrevilleages.isActivePackage()) {%>
                        <li><a href="../branchReception/ActivePackage.jsp">Active Packages</a></li>
                            <%}
      if (AdminPrevilleages.isRentCostReport()) {%>
                        <li><a href="../branchReception/InstrumentRentList.jsp">Instrument Rent List </a></li>
                            <%}
        if (AdminPrevilleages.isRepairCostReport()) {%>
                        <li><a href="../branchReception/InstrumentRepairList.jsp">Instrument Repair List</a></li>
                            <%}%>
                    </ul>
                </li>



                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" ><span style="color: white"> Sell Report</span> <span class="caret" style="color: white"></span></a>
                    <ul class="dropdown-menu">
                        <%                            if (AdminPrevilleages.isBranch_Sell_Report()) {
                        %>


                        <li><a href="../branchReception/Report.jsp">Branch Sell Report</a></li>
                            <%}
                                if (AdminPrevilleages.isClass_Branch_Sell_Report()) {
                            %>
                        <li><a href="../branchReception/ClassStockSellReport.jsp">Class Branch Sell Report</a></li>
                            <%}
                                if (AdminPrevilleages.isCustomer_Sell_Report()) {
                            %>

                        <li><a href="../branchReception/CustomerSellReport.jsp">Customer Sell Report</a></li>
                        <li><a href="../branchReception/AllCustomerQuatationReport.jsp">Customer Quatation Report</a></li>
                            <%}
                                if (AdminPrevilleages.isBranch_Product_Report()) {
                            %>

                        <li><a href="../branchReception/BranchProductStock.jsp">Branch Product Report</a></li>
                            <%}
                                if (AdminPrevilleages.isAvailable_Product()) {
                            %>
                        <li><a href="../branchReception/BranchProductStock1.jsp">Available Branch Product </a></li>
                        <li><a href="../branchReception/BranchProductStock2.jsp">Stock Notification</a></li>
                        <li><a href="../branchReception/BranchProductTransferReport.jsp"> Product Transfer Report</a></li>
                            <%}
                                if (AdminPrevilleages.isClass_Product_Stock_Report()) {
                            %>
                        <li><a href="../branchReception/ClassAddProduct.jsp">Class Product Stock Report</a></li>
                            <%}

                            %>



                        <li></li>
















                    </ul>
                </li>
                <%}%>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <%   if (admintype.equals("1")) {%>
                <li class="">

                    <a href="../admin/FilterStudent.jsp">   <span style="color: white">Time Table</span>  </a>




                </li>


                <%}%>


                <%   if (!admintype.equals("1")) {

                        if (AdminPrevilleages.isTime_Table()) {
                %>
                <li class="">



                    <a href="FilterStudent.jsp">   <span style="color: white">Time Table</span>  </a>




                </li>
                <%}
                    if (AdminPrevilleages.isExpense()) {
                %>  
                <li class="">



                    <a href="CreateAccount.jsp">   <span style="color: white">Expense</span>  </a>




                </li>
                <%}
                    if (AdminPrevilleages.isEnquiry()) {
                %>  
                <li class="">



                    <a href="#" data-toggle="modal" data-target="#myModal1">
                        <!--<img src="../../images/Enquiry.jpg" title="Create Enquiry"  alt="" style="width:20px"/>-->
                        <span style="color: white">Enquiry</span>   </a>




                </li>
                <%}
                    if (AdminPrevilleages.isNew_Account()) {
                %> 
                <li class="">



                    <a href="#" data-toggle="modal" data-target="#myModal"> 
                        <!--<img src="../../images/Account.jpg" title="Create Account"  alt="" style="width: 20px"/>-->
                        <span style="color: white">New Account</span>   </a>




                </li>
                <%}
                    if (AdminPrevilleages.isBalance()) {
                %> 
                <li class="">



                    <a href="#" data-toggle="modal" data-target="#myModal10"> 
                        <!--<img src="../../images/Balance.png" title="Create Enquiry"  alt="" style="width:20px"/>-->
                        <span style="color: white">Balance</span>   </a>




                </li>
                <%}
                    if (AdminPrevilleages.isEnquiryReport()) {
                %> 

                <%
                    if (admin.getAdminOfBranch() != null) {
                        EnquiryDao EnquiryDao = new EnquiryDao();
                        List<Enquiry> allEnquiry = EnquiryDao.getAllEnquiryFollowup(admin);
                        activeenquiry = allEnquiry.size();
                %> 


                <li role="presentation" class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-bell-o" style="color: white" title="Enqury Followup" ></i>
                        <%if (allEnquiry.size() > 0) {%>
                        <span class="badge bg-green"><%=activeenquiry%></span>
                        <%}%>
                    </a>
                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">

                        <%
                            int iiii = 0;
                            for (Enquiry enquiry : allEnquiry) {
                                iiii++;
                                if (iiii == 4) {
                                    break;
                                }

                                SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("dd-MM-yyyy");
                                String date1 = DATE_FORMAT1.format(enquiry.getFollowupDate());
                        %>

                        <li  >
                            <a href="Followupinquiry.jsp?srrequestid=<%=enquiry.getId()%>">
                                <span class="image"><img src="../../StudentImages/Student.jpg" alt="Profile Image" /></span>
                                <span>
                                    <span><%=enquiry.getName()%></span>
                                    <span class="time"><%=date1%></span>
                                </span>
                                <span class="message"><%

                                    String msg = "";
                                    for (EnquiryDetail q : enquiry.getEnquiryDetail()) {
                                        msg = q.getRemark();
                                        System.out.println(q);
                                    }

                                    %>
                                    <%=msg%>
                                </span>
                            </a>
                        </li>
                        <%}%>
                        <li>
                            <div class="text-center">
                                <a href="Followupinquiry.jsp?srrequestid=all">
                                    <strong>See All Alerts</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <%}%>

                <%}
                    if (AdminPrevilleages.isPayemtReport()) {
                %> 


                <%
                    if (admin.getAdminOfBranch() != null) {
                        PaymentFollowupDao PaymentFollowupDao = new PaymentFollowupDao();
                        List<PaymentFollowup> allPaymentFollowup = PaymentFollowupDao.getAllPaymentFollowup(admin);
                        paymentfollowup = allPaymentFollowup.size();
                %>
                <li role="presentation" class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-envelope-o" style="color: white" ></i>
                        <%if (allPaymentFollowup.size() > 0) {%>
                        <span class="badge bg-green"><%=allPaymentFollowup.size()%></span>
                        <%}%>

                    </a>

                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">

                        <%
                            int iiii = 0;
                            for (PaymentFollowup PaymentFollowup : allPaymentFollowup) {
                                iiii++;
                                if (iiii == 4) {
                                    break;
                                }
                                SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("dd-MM-yyyy");
                                String date1 = DATE_FORMAT1.format(PaymentFollowup.getRequestDate());
                        %>

                        <li  >
                            <a href="RequestFetch.jsp?srrequestid=<%=PaymentFollowup.getId()%>">
                                <span class="image"><img src="../../StudentImages/<%=PaymentFollowup.getCustomerAccount().getImage()%>" alt="Profile Image" /></span>
                                <span>
                                    <span><%=PaymentFollowup.getCustomerAccount().getName()%></span>
                                    <span class="time"><%=date1%></span>
                                </span>
                                <span class="message"><%

                                    List<PaymentFollowupMessage> allPaymentFollowupMessage = PaymentFollowupDao.getAllPaymentFollowupMessage(PaymentFollowup);
                                    String msg = "";
                                    System.out.println(allPaymentFollowupMessage.size());

                                    for (PaymentFollowupMessage q : allPaymentFollowupMessage) {
                                        msg = q.getDescription();
                                        System.out.println(q);
                                    }

                                    %>
                                    <%=msg%>
                                </span>
                            </a>
                        </li>
                        <%}%>
                        <li>
                            <div class="text-center">
                                <a href="RequestFetch.jsp?srrequestid=all">
                                    <strong>See All Alerts</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <%}
                    }%>


                <%}%>
                <!--<li><a data-toggle="modal" data-target="#myModal2"><i class="fa fa-user " title="Change Profile"  ></i>Profile </a></li>-->
                <!--  <form action="SearchAccountCust.jsp" class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" name="mobileno" class="form-control" placeholder="Search">
                        </div>
                          <button type="submit" style="margin-bottom: 0px;" class="btn btn-default">Submit</button>
                      </form>-->
                <li><a href="../../logout.jsp"><img src="../../images/Logout.png"style="width: 20px" alt="Profile Image" /></a></li>




            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>