<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.accede.angel.admin.model.StudentPdf"%>
<%@page import="com.accede.angel.admin.dao.StudentPDFDao"%>
<%@page import="com.accede.angel.admin.dao.StudentWiseVideoDao"%>
<%@page import="com.accede.angel.admin.model.StudentWiseVideo"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.model.StudentAccount"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<!DOCTYPE html>
<html lang="en">
    
    
     <%     AdmissionDao cd = new AdmissionDao();
        int id = Integer.parseInt(request.getParameter("accountid"));
        CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
        CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(id);
        int i = 0;
        int j = 0;
        int k = 0;
        Admission p = cd.getAdmissionByAccount(CustomerAccount);
        if (p != null) {
            String ImgPath1 = CustomerAccount.getImage();


    %>
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

    <script type="text/javascript">
        $(document).ready(function() {

            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY',
                viewMode: "years"
            });


            $('#paymode').change(function() {

                var paymode = $('#paymode').val();
                $('#chequeno').show();
                $('#bankname').show();
                if (paymode == "Cash")
                {
                    $('#chequeno').hide();
                    $('#bankname').hide();
                }
            });

        })
    </script>
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
             
                    <%@ include file = "../comman_files/StudentSideBar.jsp" %>
          

                <!-- top navigation -->
                <%@ include file = "../comman_files/StudentTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div  role="main">
                    <div class="">


                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Student Profile </h2>
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
                                        <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                                            <div class="profile_img">
                                                <div id="crop-avatar">
                                                    <!-- Current avatar -->


                                                    <img  onclick="openmodel(this.id)" id="myImg1" class="img-responsive avatar-view" src="../../StudentImages/<%=ImgPath1%>" alt="Avatar" title="Change the avatar">
                                                </div>
                                            </div>
                                            <h3><%=p.getFirstName()%> </h3>

                                            <ul class="list-unstyled user_data">


                                                <li>
                                                    <i class="fa fa-briefcase user-profile-icon"></i> <%=p.getCourseName()%>
                                                </li>

                                                <li class="m-top-xs">
                                                    <i class="fa fa-external-link user-profile-icon"></i>
                                                    <a href="StudentProfile.jsp?asd=<%=p.getAdmissionId()%>" ><%=p.getEmail()%></a>
                                                </li>

                                                <li><i class="fa fa-mobile fa-2x user-profile-icon"></i> <%=p.getContactNo()%>
                                                </li>
                                                <li><i class="fa  fa-calendar  user-profile-icon"></i> Due Date <%=p.getNextPaymentDate()%>
                                                </li>
                                            </ul>

                                            <a href="StudentProfile.jsp?accountid=<%=CustomerAccount.getId() %>" class="btn btn-success"><i class="fa fa-edit m-right-xs"></i> Profile</a>
                                            <br />



                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-12">



                                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                <ul id="myTab" class="nav nav-tabs bar_tabs responsive" role="tablist">
                                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Payment</a>
                                                    </li>

                                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Balance</a>
                                                    </li>
<!--                                                    <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Course Details</a>
                                                    </li>-->
                                                    <li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab3" data-toggle="tab" aria-expanded="false"> PDF</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content5" role="tab" id="profile-tab4" data-toggle="tab" aria-expanded="false"> Video</a>
                                                    </li>
                                                </ul>
                                                <div id="myTabContent" class="tab-content">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                                                        <div class="x_content">
                                                           
                                                               <span class="section">Payment Info</span>
                                                                <input type="hidden" value="<%=id%>" id="custid" name="custid">
                                                                <div class="row">


                                                                    <div class="col-md-3">
                                                                        <center >Course Fee</center>
                                                                        <input type="text" id="Course_fee" readonly=""  style="text-align: center;background-color: aqua" value="<%=p.getFee()%>"  name="Course_fee"  class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <center >Discount Per</center>
                                                                        <input type="text" id="Course_fee" readonly=""  style="text-align: center;background-color: aqua" value="<%=p.getDiscper()%>"  name="Course_fee"  class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <center >Discount Amount</center>
                                                                        <input type="text" id="Course_fee" readonly=""  style="text-align: center;background-color: aqua" value="<%=p.getDisamount()%>"  name="Course_fee"  class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <center >Total Fee </center>
                                                                        <input type="text" id="pbal1" name="pbal1" readonly="" style="text-align: center;background-color: aqua" value="<%=p.getFee() - p.getDisamount()%>" required="required" class="form-control col-md-7 col-xs-12">
                                                                    </div>

                                                                </div>
                                                                <br>

                                                                <div class="row">

                                                                    <div class="col-md-3">
                                                                        <center >Previous Balance</center>
                                                                        <input type="text" id="pbal" name="pbal" readonly="" style="text-align: center;background-color: aqua" value="<%=p.getRemaininFee()%>" required="required" class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <center >Total Amount</center>
                                                                        <input type="number" readonly="" style="text-align: center;background-color: aqua "  id="totalAmount" value="<%=p.getFee() - p.getDisamount() + p.getRemaininFee()%>" name="totalAmount" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12">
                                                                    </div>
<!--                                                                    <div class="col-md-3">
                                                                        <center > <span id="payment_paid_hide" style="color:red"></span></center >
                                                                        <center >Paid Amount</center>
                                                                        <input type="text" id="paidAmount" style="text-align: center"   value="0" name="paidAmount" required="required" data-validate-minmax="10,100" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">
                                                                        <input type="hidden" id="paidAmountinword" style="text-align: center"   value="0" name="paidAmountinword" required="required" data-validate-minmax="10,100" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">
                                                                    </div>-->
                                                                    <div class="col-md-3">
                                                                        <center >Remaining Amount</center>
                                                                        <input type="number" readonly="" id="remaining_amount" style="text-align: center;background-color: aqua"  value="0" name="remaining_amount" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                </div>
                                                                     <div class="col-md-3">
                                                                        <br>
                                                                        <button type="reset" class="btn btn-primary">Reset</button>
                                                                       <a href="payuform.jsp?accountid=<%=CustomerAccount.getId() %>" class="btn btn-success"> Payment</a>
                                           
                                                                    </div>
                                                                <br>
                                                           
                                                                <br>

                                                                <div class="row">




                                                                </div>
                                                                <br>



                                                                <input type="hidden" value="" placeholder="Bank Name" name="amountinword" class="form-control"   id="amountinword"  required>
                                                            </form>
                                                        </div>

                                                    </div>


                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                                                        <div class="x_content">
                                                            <form action="../../PreviousBalance" id="myForm1" class="form-horizontal form-label-left" data-parsley-validate method="get">
                                                                <span class="section">Payment Info</span>
                                                                <input type="hidden" value="<%=p.getAdmissionId()%>" id="studentid" name="studentid">
                                                                <input type="hidden" value="<%=id%>" id="custid" name="custid">

                                                                <div class="row">

                                                                    <div class="col-md-3">
                                                                        <center >Previous Balance</center>
                                                                        <input type="text" id="PreviousBalance" name="PreviousBalance" readonly="" style="text-align: center;background-color: aqua" value="<%=p.getRemaininFee()%>" required="required" class="form-control col-md-7 col-xs-12">
                                                                    </div>

                                                                    <div class="col-md-3">
                                                                        <center > <span id="payment_paid_hide" style="color:red"></span></center >
                                                                        <center >Paid Amount</center>
                                                                        <input type="text" id="PaidAmountBalance" style="text-align: center"   value="0" name="PaidAmountBalance" required="required" data-validate-minmax="10,100" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row1">
                                                                        <input type="hidden" id="PaidAmountBalanceinword" style="text-align: center"   value="0" name="PaidAmountBalanceinword" required="required" data-validate-minmax="10,100" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row1">
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <center >Remaining Amount</center>
                                                                        <input type="number" readonly="" id="remaining_amountPreviousBalance" style="text-align: center;background-color: aqua"  value="0" name="remaining_amountPreviousBalance" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12">
                                                                    </div> <div class="col-md-3">
                                                                        <center > <span id="payment_mode_hide" style="color:red"></span></center >
                                                                        <center >Select Payment Type</center>
                                                                        <select class="form-control" style="text-align: center" required="required" id="paymodePreviousBalance" name="paymodePreviousBalance">
                                                                            <option value="">Select Payment Type</option>
                                                                            <option value="Card">Card</option>
                                                                            <option value="Cash">Cash</option>
                                                                            <option value="Paytm">Paytm</option>
                                                                            <option value="Net Banking">Net Banking</option>
                                                                            <option value="Net Banking">Cheque</option>
                                                                        </select>
                                                                    </div>

                                                                </div>
                                                                <br>
                                                                <div class="row">



                                                                    <div class="col-md-3" id="nextfollow3">
                                                                        <center >Next Payment Date  </center>
                                                                        <input type="date" id="nextPaymentDateBalance" readonly="" style="text-align: center"  name="nextPaymentDateBalance" placeholder="Next Follow Up Date" class="form-control">
                                                                    </div>
                                                                    <div class="col-md-3" id="nextfollow2">
                                                                        <center >Next Payment Date  </center>
                                                                        <input type="date" id="nextPaymentDateBalance1"  style="text-align: center"  name="nextPaymentDateBalance1" placeholder="Next Follow Up Date" class="form-control">
                                                                    </div>
<!--                                                                    <div class="col-md-3">
                                                                        <br>
                                                                        <button type="reset" class="btn btn-primary">Reset</button>
                                                                        <button type="submit" id="PreviousPaymentBtn" class="btn btn-success">Submit</button>
                                                                    </div>-->
                                                                </div>






                                                                <input type="hidden" value="" placeholder="Bank Name" name="amountinword" class="form-control"   id="amountinword"  required>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">

                                                        <div class="x_panel">
                                                            <div class="x_title">
                                                                <div class="col-md-3">
                                                                </div>
                                                                <div class="col-md-6"> <h2 >Course Details </h2> </div>
                                                                <ul class="nav panel_toolbox">
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
                                                                <div class="col-md-3">
                                                                </div>
                                                                <div class="col-md-6">

                                                                    <table class="table table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>#</th>
                                                                                <th>Course Name</th>

                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>


                                                                            <%
                                                                                String coursename = p.getCourseName();
                                                                                String coursenames = coursename.substring(1, coursename.length() - 1);
                                                                                List<String> myList = new ArrayList<String>(Arrays.asList(coursenames.split(",")));

                                                                                i = 0;
                                                                                for (String q : myList) {
                                                                                    i++;

                                                                            %>
                                                                            <tr>
                                                                                <th scope="row"><%=i%></th>
                                                                                <td><%=q%></td>

                                                                            </tr>
                                                                            <%}

                                                                            %>

                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>



                                                    </div>
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab">
                                                        <div class="x_panel">
                                                            <div class="x_title">
                                                                <h2> PDF <small>on Student Request</small></h2>
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
                                                         
                                                            <div class="row" id="tablefetch">
                                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="x_panel">

                                                                        <div class="x_content">
                                                                            <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                                                        The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                                                    </p>-->
                                                                            <table id="datatable" class="table table-striped table-bordered">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th class="table_center">PDF Uploaded Date</th>
                                                                                        <th class="table_center">Course Name</th> 

                                                                                        <th class="table_center">Description</th>
                                                                                        <th class="table_center">Download</th>


                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>

                                                                                    <%                                                    List<StudentPdf> sv = null;
                                                                                        StudentPDFDao sd = new StudentPDFDao();

                                                                                        for (StudentPdf p1 : sd.getAllStudentPdf()) {
                                                                                            if (p1.getStudentid() == p.getAdmissionId()) {


                                                                                    %>
                                                                                       <tr>

                                                                                        <td class="table_center"><%=p1.getUploadedDate() %> </td>


                                                                                        <td class="table_center"><%=p1.getUploadCoursePdfModel().getCourseName()%></td> 


                                                                                        <td class="table_center"><%=p1.getPdfname()%></td> 

                                                                                        <td class="table_center">

                                                                                            <a href="<%=p1.getPdfdescription()%>" target="blank" class="btn btn-primary btn-sm">Download </a>

                                                                                            <!--                                                                                                                                                                <form action="DownloadPDF.jsp" method="get">
                                                                                                                                                                                            <input type="hidden" value="<%=p1.getPdfGalleryid()%>" name="asd" id="asd">
                                                                                                                                                                                            <button type="submit"    class="btn btn-primary btn-sm">Download</button>
                                                                                                                                                                                        </form>-->
                                                                                        </td> 



                                                                                    </tr> 
                                                                                    <%}
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
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content5" aria-labelledby="profile-tab">
                                                        <div class="x_panel">
                                                            <div class="x_title">
                                                                <h2>Upload Video <small>on Student Request</small></h2>
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
                                                             <div class="row" id="tablefetch">
                                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="x_panel">

                                                                        <div class="x_content">
                                                                            <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                                                        The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                                                    </p>-->
                                                                       <table id="datatable" class="table table-striped table-bordered">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th class="table_center">Video Uploaded Date</th>
                                                                                        <th class="table_center">Course Name</th> 

                                                                                        <th class="table_center">Description</th>
                                                                                        <th class="table_center">View</th>


                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>

                                                                                    <%                                       
                                                                                    
                                                                                    List<StudentWiseVideo> allStudentWiseVideo = null;
                                                                                        StudentWiseVideoDao StudentWiseVideoDao = new StudentWiseVideoDao();

                                                                                        for (StudentWiseVideo p1 : StudentWiseVideoDao.getAllStudentWiseVideo()) {
                                                                                            if (p1.getStudentid() == p.getAdmissionId()) {


                                                                                    %>
                                                                                    <tr>

                                                                                        <td class="table_center"><%=p1.getUploadedDate()%> </td>


                                                                                        <td class="table_center"><%=p1.getCourseName()%></td> 


                                                                                        <td class="table_center"><%=p1.getVideodescription()%></td> 

                                                                                        <td class="table_center">

                                                                                           <a href="ViewVideo.jsp?viewid=<%=p1.getId()%>" target="blank" class="btn btn-primary btn-sm">View </a>
                                                                                           
                                                                                        </td> 



                                                                                    </tr> 
                                                                                    <%}
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



                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <label class="col-md-offset-4" id="position"><h2>All Payment Details </h2>      </label>   
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
                                                        <table id="datatable-buttons" class="data table table-striped no-margin">
                                                            <thead>
                                                                <tr>
                                                                    <th class="table_center">Payment_Date</th>
                                                                    <th class="table_center" >Due_Date</th>


                                                                    <th class="table_center">Fee Type</th>


                                                                    <th class="table_center">Previous Balance</th>

                                                                    <th class="table_center">Package Fee</th> <th class="table_center">Discount Per</th>
                                                                    <th class="table_center">Discount Amount</th>

                                                                    <th class="table_center">Final Amount</th>


                                                                    <th class="table_center">Paid Amount</th>
                                                                    <th class="table_center">Remaining Amount</th>
                                                                    <th class="table_center">Payment Mode</th>
                                                                    <th class="table_center">Print Details</th> 

                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                                <%                                                                    i = 0;
                                                                    for (StudentAccount p1 : p.getStudentAccount()) {
                                                                        i++;

                                                                %>
                                                                <tr>

                                                                    <td class="table_center"><%=p1.getPaymentDate()%> </td>
                                                                    <%
                                                                    if(p1.getFeeType().equals("Previous Balance"))
                                                                    {
                                                                    %>
                                                                    <td class="table_center" ></td>
                                                                    <%}else{%>
                                                                    <td class="table_center" ><%=p1.getNextPaymentDate()%> </td>
                                                                    <%}%>
                                                                    <td class="table_center"><%=p1.getFeeType()%></td> 

                                                                    <td class="table_center"><%=p1.getPreviousBalance()%></td> 

                                                                    <td class="table_center"><%=p1.getPackageFee()%></td> 


                                                                    <td class="table_center"><%=p1.getDiscper()%></td> 
                                                                    <td class="table_center"><%=p1.getDisamount()%></td> 
                                                                    <td class="table_center"><%=p1.getFinalamount()%></td> 
                                                                    <td class="table_center"><%=p1.getPaid()%></td> 
                                                                    <td class="table_center"><%=p1.getTotalremfee()%></td> 
                                                                    <td class="table_center"><%=p1.getPaymentMode()%></td> 
                                                                    <%
                                                                        if (i == 1) {
                                                                    %>
                                                                    <td class="table_center"><a href="Invoice_Cello.jsp?admissionid=<%=id%>" target="blank"><i class="glyphicon glyphicon-print"></i></a></td> 
                                                                            <%} else {
                                                                            %>
                                                                    <td class="table_center"><a href="Perticular_invoice.jsp?admissionid=<%=id%>&invoiceid=<%=p1.getAccountId()%>" target="blank"><i class="glyphicon glyphicon-print"></i></a></td> 
                                                                            <%
                                                                                }%>



                                                                </tr> 
                                                                <%}

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

        <div id="myModal" class="modal">
            <span class="close">&times;</span>
            <img class="modal-content" id="img01">
            <div id="caption"></div>
        </div>

        <script>
            function openmodel(id)
            {
                var s = id;
                // Get the modal
                var modal = document.getElementById('myModal');

                // Get the image and insert it inside the modal - use its "alt" text as a caption
                var img = document.getElementById('' + s);
                var modalImg = document.getElementById("img01");
                var captionText = document.getElementById("caption");
                img.onclick = function() {
                    modal.style.display = "block";
                    modalImg.src = this.src;
                    captionText.innerHTML = this.alt;
                }

                // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("close")[0];

                // When the user clicks on <span> (x), close the modal
                span.onclick = function() {
                    modal.style.display = "none";
                }
            }
        </script>
        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <script src="../production/js/jquery.formError.js" type="text/javascript"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- morris.js -->
        <script src="../vendors/raphael/raphael.min.js"></script>
        <script src="../vendors/morris.js/morris.min.js"></script>
        <!-- bootstrap-progressbar -->
        <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <!-- bootstrap-daterangepicker -->
        <script src="../vendors/moment/min/moment.min.js"></script>
        <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
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
        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {


                function onlyDigit(n)
                {

                    var units = ['', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine'];
                    var randomer = ['', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen'];
                    var tens = ['', 'Ten', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];
                    var r = 0;
                    var num = parseInt(n);
                    var str = "";
                    var pl = "";
                    var tenser = "";
                    while (num >= 1)
                    {
                        r = parseInt(num % 10);
                        tenser = r + tenser;
                        if (tenser <= 19 && tenser > 10)
                        {
                            str = randomer[tenser - 10];
                        }
                        else
                        {
                            if (pl == 0)
                            {
                                str = units[r];
                            }
                            else if (pl == 1)
                            {
                                str = tens[r] + " " + str;
                            }
                        }
                        if (pl == 2)
                        {
                            str = units[r] + " Hundred " + str;
                        }

                        num = parseInt(num / 10);
                        pl++;
                    }
                    return str;
                }




                function converAmount(amount)
                {
                    var grandtotal = amount;

                    var r = 0;
                    var txter = grandtotal.toString();
                    var sizer = txter.toString().length;
                    var numStr = "";
                    var n = parseInt(grandtotal);
                    var places = 0;
                    var str = "";
                    var entry = 0;
                    while (n >= 1)
                    {
                        r = parseInt(n % 10);
                        if (places < 3 && entry == 0)
                        {

                            numStr = txter.substring(txter.toString().length - 0, txter.toString().length - 3) // Checks for 1 to 999.

                            str = onlyDigit(numStr); //Calls function for last 3 digits of the value.

                            entry = 1;
                        }

                        if (places == 3)
                        {

                            var size1 = txter.toString().length - 5;
                            var size2 = txter.toString().length - 3;
                            numStr = txter.substring(size1, size2)

                            if (numStr != "")
                            {
                                str = onlyDigit(numStr) + " Thousand " + str;
                            }
                        }

                        if (places == 5)
                        {

                            numStr = txter.substring(txter.toString().length - 7, txter.toString().length - 5) //Substring for 5 place to 7 place of the string

                            if (numStr != "")
                            {
                                str = onlyDigit(numStr) + " Lakhs " + str; //Appends the word lakhs to it

                            }
                        }

                        if (places == 6)
                        {
                            numStr = txter.substring(txter.toString().length - 9, txter.toString().length - 7)  //Substring for 7 place to 8 place of the string

                            if (numStr != "")
                            {
                                str = onlyDigit(numStr) + " Crores " + str;
                            }
                        }

                        n = parseInt(n / 10);
                        places++;
                    }

                    return str;

                }




                $('#PaidAmountBalance').on('keyup change', function() {
                    var PaidAmountBalance = $('#PaidAmountBalance').val();
                    var PreviousBalance = $('#PreviousBalance').val();
                    var remaining_amountPreviousBalance = $('#remaining_amountPreviousBalance').val();
                    remaining_amountPreviousBalance = parseInt(PreviousBalance) - parseInt(PaidAmountBalance);


                    $('#remaining_amountPreviousBalance').val(remaining_amountPreviousBalance);
                    $('#PaidAmountBalanceinword').val(converAmount(parseInt(PaidAmountBalance)));
                    if (remaining_amountPreviousBalance > 0)
                    {
                        $("#nextfollow2").show();
                        $("#nextfollow3").hide();
                    } else {
                        $("#nextfollow2").hide();
                        $("#nextfollow3").show();
                    }

                })
                $('.row0').on('keyup change', function() {



                    var Course_fee = $('#Course_fee').val();
                    var pbal = $('#pbal').val();

                    var paidAmount = $('#paidAmount').val();
                    var totalAmount = $('#totalAmount').val();

                    var remaining_amount = $('#remaining_amount').val();




                    remaining_amount = parseInt(totalAmount) - parseInt(paidAmount);


                    $('#remaining_amount').val(remaining_amount);
                    $('#paidAmountinword').val(converAmount(parseInt(paidAmount)));
                    if (remaining_amount > 0)
                    {
                        $("#nextfollow1").show();
                        $("#nextfollow").hide();
                    } else {
                        $("#nextfollow1").hide();
                        $("#nextfollow").show();
                    }

                })
            })

        </script>



        <%@ include file = "JavaScriptFile.jsp" %>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#nextfollow1").hide();
                $("#nextfollow2").hide();

            })
        </script>
        <script type="text/javascript">
            $(document).ready(function() {

                $("#courseID").change(function(event) {
                    var course = $('#courseID').val();
                    var studentid = $('#studentid').val();
                    $.get("AjaxPages/FetchPdf.jsp", {course: course, studentid: studentid}, function(data) {

                        $('#pdfoutput').html(data);
                    });
                });

            })

        </script>


        <script type="text/javascript">
            $(document).ready(
                    function()
                    {

                        $("#paymodePreviousBalance").change(validate1.controls.paymodePreviousBalance);
                        $("#PaidAmountBalance").keyup(validate1.controls.PaidAmountBalance);

                        $("#nextPaymentDateBalance1").change(validate1.controls.nextPaymentDateBalance1);

                        $("#paymode").change(validate.controls.paymode);
                        $("#paidAmount").change(validate.controls.paidAmount);

                        $("#nextpaymentdate").change(validate.controls.nextpaymentdate);

                        $("#coursepaymentbtn").click(
                                function(event)
                                {
                                    event.preventDefault();

                                    if (validate.all())
                                    {
                                        document.getElementById("myForm").submit();
                                    }
                                });

                        $("#PreviousPaymentBtn").click(
                                function(event)
                                {
                                    event.preventDefault();

                                    if (validate1.all())
                                    {
                                        document.getElementById("myForm1").submit();
                                    }
                                });


                    });

            var validate1 =
                    (function()
                    {


                        var all =
                                function()
                                {
                                    var invalidControls = [];

                                    var i = 0;
                                    for (var controlValidationMethod in validate1.controls)
                                    {


                                        if (!validate1.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
                                        {
                                            invalidControls.push(controlValidationMethod);
                                        }
                                    }

                                    if (invalidControls.length > 0)
                                    {
                                        // Set focus on the first erroneous control
                                        $("#" + invalidControls[0]).focus();
                                    }
                                    return invalidControls.length == 0;
                                };

                        var controls =
                                {
                                    PaidAmountBalance:
                                            function()
                                            {

                                                var $input = $(this);
                                                var isValid = true;


                                                if ($input.val() === "")
                                                {
                                                    $input.formError("Please enter a Amount");
                                                    isValid = false;
                                                }
                                                else if ($input.val() == 0)
                                                {

                                                    $input.formError("Enetr Paid Amount Correctly");
                                                    isValid = false;
                                                }

                                                else
                                                {
                                                    // Valid, remove any existing form error message for this input
                                                    $input.formError({remove: true});
                                                }

                                                return isValid;
                                            },
                                    nextPaymentDateBalance1:
                                            function()
                                            {
                                                
                                                 var $input = $(this);
                                                      $input.formError({remove: true});
                                                var isValid = true;
                                                var remaining_amount = $('#remaining_amountPreviousBalance').val();
                                                if (remaining_amount > 0)
                                                {
                                                    
                                                   
                                                    var currentYear = new Date().getFullYear() - 1;
                                                    var currentMonth = new Date().getMonth();
                                                    var currentDay = new Date().getDate();
                                                    var joindate = $input.val();
                                                    var res = joindate.split("-");
                                                    if (res[0] > currentYear)
                                                    {
                                                        if (res[1] > currentMonth)
                                                        {
                                                            if (res[1] == currentMonth + 1)
                                                            {

                                                                if (res[2] > currentDay)
                                                                {
                                                                    $input.formError({remove: true});

                                                                } else {
                                                                    $input.formError("Please Select Upcoming Date");
                                                                    isValid = false;
                                                                }

                                                            }


                                                        }



                                                        else {
                                                            $input.formError("Please Select Upcoming Date");
                                                            isValid = false;
                                                        }
                                                    } else {
                                                        $input.formError("Please Select Upcoming Date");
                                                        isValid = false;
                                                    }
//                                                    if (!(res[0] > currentYear && res[1] > currentMonth && res[2] > currentDay))
//
//                                                    {
//                                                        $input.formError("Please Select Upcoming Date");
//                                                        isValid = false;
//                                                    }
//
//                                                    else
//                                                    {
//                                                        // Valid, remove any existing form error message for this input
//                                                        $input.formError({remove: true});
//                                                    }
                                                }
                                                return isValid;
                                            },
                                                
                                                
                                               
                                    paymodePreviousBalance:
                                            function()
                                            {
                                                var $input = $(this);
                                                var isValid = true;

                                                if ($input.val() === "")
                                                {
                                                    $input.formError("Please Select Payment Mode");
                                                    isValid = false;
                                                }

                                                else
                                                {
                                                    // Valid, remove any existing form error message for this input
                                                    $input.formError({remove: true});
                                                }

                                                return isValid;
                                            }









                                };

                        return {
                            "all": all,
                            "controls": controls};
                    })();

            var validate =
                    (function()
                    {
                        var _regex =
                                {
                                    emailAddressIsValid:
                                            function(emailAddress)
                                            {
                                                // http://stackoverflow.com/questions/2855865/jquery-validate-e-mail-address-regex
                                                var pattern = new RegExp(/^(("[\w-+\s]+")|([\w-+]+(?:\.[\w-+]+)*)|("[\w-+\s]+")([\w-+]+(?:\.[\w-+]+)*))(@((?:[\w-+]+\.)*\w[\w-+]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][\d]\.|1[\d]{2}\.|[\d]{1,2}\.))((25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\.){2}(25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\]?$)/i);

                                                return pattern.test(emailAddress);
                                            },
                                    isWholeNumber:
                                            function(age)
                                            {
                                                var pattern = new RegExp(/^\d+$/);

                                                return pattern.test(age);
                                            }
                                };

                        var all =
                                function()
                                {
                                    var invalidControls = [];

                                    var i = 0;
                                    for (var controlValidationMethod in validate.controls)
                                    {


                                        if (!validate.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
                                        {
                                            invalidControls.push(controlValidationMethod);
                                        }
                                    }

                                    if (invalidControls.length > 0)
                                    {
                                        // Set focus on the first erroneous control
                                        $("#" + invalidControls[0]).focus();
                                    }
                                    return invalidControls.length == 0;
                                };

                        var controls =
                                {
                                    paidAmount:
                                            function()
                                            {

                                                var $input = $(this);
                                                var isValid = true;


                                                if ($input.val() === "")
                                                {
                                                    $input.formError("Please enter a Amount");
                                                    isValid = false;
                                                }
                                                else if ($input.val() == 0)
                                                {

                                                    $input.formError("Enetr Paid Amount Correctly");
                                                    isValid = false;
                                                }

                                                else
                                                {
                                                    // Valid, remove any existing form error message for this input
                                                    $input.formError({remove: true});
                                                }

                                                return isValid;
                                            },
                                    nextpaymentdate:
                                            function()
                                            {
                                                 var $input = $(this);
                                                      $input.formError({remove: true});
                                                var isValid = true;
                                                var remaining_amount = $('#remaining_amount').val();
                                                if (remaining_amount > 0)
                                                {
                                                    
                                                   
                                                    var currentYear = new Date().getFullYear() - 1;
                                                    var currentMonth = new Date().getMonth();
                                                    var currentDay = new Date().getDate();
                                                    var joindate = $input.val();
                                                    var res = joindate.split("-");
                                                    if (res[0] > currentYear)
                                                    {
                                                        if (res[1] > currentMonth)
                                                        {
                                                            if (res[1] == currentMonth + 1)
                                                            {

                                                                if (res[2] > currentDay)
                                                                {
                                                                    $input.formError({remove: true});

                                                                } else {
                                                                    $input.formError("Please Select Upcoming Date");
                                                                    isValid = false;
                                                                }

                                                            }


                                                        }



                                                        else {
                                                            $input.formError("Please Select Upcoming Date");
                                                            isValid = false;
                                                        }
                                                    } else {
                                                        $input.formError("Please Select Upcoming Date");
                                                        isValid = false;
                                                    }
//                                                    if (!(res[0] > currentYear && res[1] > currentMonth && res[2] > currentDay))
//
//                                                    {
//                                                        $input.formError("Please Select Upcoming Date");
//                                                        isValid = false;
//                                                    }
//
//                                                    else
//                                                    {
//                                                        // Valid, remove any existing form error message for this input
//                                                        $input.formError({remove: true});
//                                                    }
                                                }
                                                return isValid;
                                            },
                                    paymode:
                                            function()
                                            {
                                                var $input = $(this);
                                                var isValid = true;

                                                if ($input.val() === "")
                                                {
                                                    $input.formError("Please Select Payment Mode");
                                                    isValid = false;
                                                }

                                                else
                                                {
                                                    // Valid, remove any existing form error message for this input
                                                    $input.formError({remove: true});
                                                }

                                                return isValid;
                                            }









                                };

                        return {
                            "all": all,
                            "controls": controls};
                    })();






        </script>

    </body>
    <%} else {

            response.sendRedirect("StudentAdmission.jsp?accountid=" + id);

        }
    %>



</html>