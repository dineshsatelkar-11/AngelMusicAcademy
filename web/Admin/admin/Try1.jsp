<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
<%@page import="com.accede.angel.admin.model.AssignPDFAdmin"%>
<%@page import="com.accede.angel.admin.dao.AssignPDFAdminDao"%>
<%@page import="com.accede.angel.admin.model.InstrumentRepair"%>
<%@page import="com.accede.angel.admin.dao.InstrumentRepairdao"%>
<%@page import="com.accede.angel.admin.model.Instrument"%>
<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>
<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="com.accede.angel.admin.model.StudentAccount"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.EnquiryDetail"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">



    <%@page import="com.accede.angel.admin.dao.AdminDao"%>
    <%@page import="com.accede.angel.admin.model.Admin"%>
    <%@page import="java.util.List"%>
    <%@page import="com.accede.angel.admin.dao.PaymentDao"%>
    <head>



        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../comman_files/favicon.png" rel="shortcut icon" type="image/png">
        <title>Angel Music </title>

        <!-- Bootstrap -->
        <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">


        <!-- Custom Theme Style -->
        <link href="../build/css/custom.min.css" rel="stylesheet">
        <style>
            .alert {
                padding: 20px;
                background-color: #f44336;
                color: white;
                opacity: 1;
                transition: opacity 0.6s;
                margin-bottom: 15px;
            }

            .alert.success {background-color: #4CAF50;}
            .alert.info {background-color: #2196F3;}
            .alert.warning {background-color: #ff9800;}

            .closebtn {
                margin-left: 15px;
                color: white;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }

            .closebtn:hover {
                color: black;
            }
        </style>
    </head>


    <style>


        .nav-md {
            margin-left: 20px;
            margin-top: 10px;
        }


        footer
        {
            margin-left: 0px;

        }

    </style>


    <div class="modal fade" id="myModal2" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" style="margin-right: -240px" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Change Profile  Picture</h4>
                </div>
                <form class="form-horizontal form-label-left input_mask" method="post" enctype="multipart/form-data"  action="../../UploadProfilePic"  data-parsley-vdalidate>


                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Change Profile Pic <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input  type="file"  name="image" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
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
                                    <td> <button type="submit" id="accbtn" class="btn btn-success">Submit</button></td>


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


    <%    Admin admintop = new Admin();
        if (session.getAttribute("BRANCH_ADMIN") != null) {

            admintop = (Admin) session.getAttribute("BRANCH_ADMIN");

            PaymentDao PaymentDao = new PaymentDao();
            long yesterdayamt = PaymentDao.getYesterdayPayment(admintop);
            long todaycreditamt = PaymentDao.getTodayPaymentCredit(admintop);
            long todaydebitamt = PaymentDao.getTodayPaymentDebit(admintop);
            System.out.print("===================================================");
            System.out.print(yesterdayamt);
            System.out.print("===================================================");
    //        int yesterdayamt = 0;
    //        int todaycreditamt = 0;
    //        int todaydebitamt = 0;
    //        if(yesterday != null){
    //        
    //            yesterdayamt = (Integer) yesterday.get(0);
    //        }
    //        if (todaycredit == null) {
    //        } else {
    //            todaycreditamt = (Integer) todaycredit.get(0);
    //        }
    //        if (todaydebit == null) {
    //        } else {
    //            todaydebitamt = (Integer) todaydebit.get(0);
    //        }

    %>




    <div class="modal fade" id="myModal10" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" style="margin-right: -240px" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"> Balance</h4>
                </div>
                <form class="form-horizontal form-label-left input_mask" method="post"  action="../../UploadProfilePic"  data-parsley-vdalidate>


                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Yesterday Closing Balance <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input  type="text" value="<%=yesterdayamt%>"  name="image" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                        </div>
                        <br>

                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Today Credit Balance <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input  type="text" value="<%=todaycreditamt%>"  name="image" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                        </div>
                        <br>

                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Today Debit Balance <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input  type="text" value="<%=todaydebitamt%>"  name="image" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                        </div>
                        <br>

                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Final Balance <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input  type="text" value="<%=yesterdayamt + todaycreditamt - todaydebitamt%>"  name="image" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                        </div>
                        <br>

                        <!--          <p>Some text in the modal.</p>-->
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

    <%
        }


    %>





    <div class="modal fade" id="myModal1" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" style="margin-right: -240px" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Enquiry Request</h4>
                </div>
                <form class="form-horizontal form-label-left input_mask" action="../../EnquryServlet" id="myEnquiry" data-parsley-vdalidate>

                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="Inquiry_Name" name="Inquiry_Name" required="required" class="form-control col-md-7 col-xs-12 col-sm-12">
                        </div>
                        <br>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">Mobile No. <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="Inquiry_Mobile_No" name="Inquiry_Mobile_No" required="required" class="form-control col-md-7 col-xs-12 col-sm-12" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                        </div>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <br>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email-id">Email Id 
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="Inquiry_Email_Id"  name="Inquiry_Email_Id" class="form-control col-md-7 col-xs-12 col-sm-12" type="email" name="middle-name">
                        </div>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <br>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email-id">Reference By
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select id="ref" class="form-control col-md-7 col-xs-12 col-sm-12" required="" name="ref">
                                <option value="">Select Reference By</option>
                                <option value="Friend">Friend</option>
                                <option value="News Paper">News Paper</option>
                                <option value="School/College">School/College</option>
                                <option value="Social Media">Social Media</option>
                                <option value="Internet">Internet</option>
                                <option value="Others">Others</option>

                            </select>
                        </div>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <br>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email-id">Enquiry Type <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select id="Inquiry_Type" class="form-control col-md-7 col-xs-12 col-sm-12" required="" name="Inquiry_Type">
                                <option value="">Select Enquiry Category</option>
                                <option value="Music Class">Music Class</option>
                                <option value="Sell">Sell</option>
                                <option value="Repair">Repair</option>
                                <option value="Rent">Rent</option>
                            </select>

                        </div>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <br>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Next Followup Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="date" id="nxtdate1" name="nxtdate1" required="required" class="form-control col-md-7 col-xs-12 col-sm-12">
                        </div>


                    </div>

                    <br>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Customer Requirement <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">

                            <input type="text" id="requirement" name="requirement" required="required" class="form-control col-md-7 col-xs-12 col-sm-12">


                        </div>

                        <br>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Offer From Shop <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">

                            <input type="text" id="offer" name="offer" required="required" class="form-control col-md-7 col-xs-12 col-sm-12">


                        </div>

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
                                    <td> <button type="submit" id="myEnquirybtn" class="btn btn-success">Submit</button></td>


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

    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" style="margin-right: -240px" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Create Account</h4>
                </div>
                <form class="form-horizontal form-label-left input_mask" action="../../CreateAccount" id="myAccount" data-parsley-vdalidate  >

                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">First Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="First_Name" name="First_Name" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                        <br>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">Mobile No. <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="Account_Mobile_No" name="Account_Mobile_No" required=""   required="required" class="form-control col-md-7 col-xs-12" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                        </div>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <br>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email-id">Email Id <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="Account_Email_Id"  name="Account_Email_Id" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                        </div>
                        <!--          <p>Some text in the modal.</p>-->
                    </div>
                    <br>
                    <div class="modal-body">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Address <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea id="AccountAddress" name="AccountAddress" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text"></textarea>
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


    <link href="New/fSelect.css" rel="stylesheet">
    <script src="New/jquery-1.11.3.min.js" type="text/javascript"></script>
    <!--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
    <script src="New/fSelect.js"></script>
    <script>
                                (function($) {
                                    $(function() {
                                        $('.test').fSelect();
                                    });
                                })(jQuery);
    </script>
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

                        <div class="page-title">
                            <div class="title_left">
                                <h3>Assign PDF to Branch </h3>
                            </div>


                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Assign  Course pdf to Branch </h2>
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
                                    <form class="form-horizontal form-label-left input_mask" action="../../AssignPDFAdminServlet" data-parsley-vdalidate>
                                       <%
 
    if (session.getAttribute("i") != null) {
        int i = (Integer)session.getAttribute("i");
         if(i ==  2 )
{
    
System.out.println("fdgsfd");
%>
                        <div class="alert">
  <span class="closebtn">&times;</span>  
  <strong>Danger!</strong> Something Went Wrong.
</div>
<%}else{%>
<div class="alert success">
  <span class="closebtn">&times;</span>Admission Details Save Successfully.
</div>
<% }
     session.removeAttribute("i");
    }%> 
                                        
                                        
                                        
                                        
                                        <div class="x_content">
                                            <label for="nop" class="control-label col-md-3 col-sm-3 col-xs-12">Name of Branch<span class="required">*</span>
                                            </label> 
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select class="form-control test  "   id="Branch"   required=""  name="Branch" >
                                                    <option value="">Select Branch</option>
                                                    <%                                                        AdminDao ad = new AdminDao();
                                                        List<Admin> b = null;
                                                        b = ad.getAllAdmin();
                                                        if (b != null && b.size() > 0) {
                                                            for (Admin p : b) {
                                                                if (p.getAdminId() != 1) {
                                                    %>
                                                    <option value="<%=p.getAdminId()%>"><%=p.getAdminOfBranch().getBranchName()%></option>
                                                    <%}
                                                            }
                                                        }%>

                                                </select>
                                            </div>
                                        </div>

                                        <div class="x_content">
                                            <label for="course" class="control-label col-md-3 col-sm-3 col-xs-12">Course<span class="required">*</span>
                                            </label>


                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select class="form-control multi-select-dd " required id="course"  name="course" >
                                                    <option value="">Select Course</option>


                                                    <%                                                             int count = 1;
                                                        CourseDao aud = new CourseDao();

                                                        List<Course> file = new CourseDao().getAllCourse();

                                                        //   file = aud.getUserDetails();
                                                        //  if (file != null && file.size() > 0) {
                                                        for (Course f : file) {

                                                            System.out.println(f.getCourseName());

                                                    %>

                                                    <option value="<%=f.getCourseName()%>"><%=f.getCourseName()%></option>
                                                    <%
                                                            count++;
                                                        }

                                                    %>   


                                                </select>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>               


                                        <div class="clearfix"></div>               
                                        <div class="x_content">
                                            <label for="lop" class="control-label col-md-3 col-sm-3 col-xs-12">Amount<span class="required">*</span>
                                            </label> 
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="Amount" name="Amount" required="" placeholder="Enter Amount" class="form-control">

                                            </div>
                                        </div>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <div class="form-group">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                <button type="button" class="btn btn-primary">Cancel</button>
                                                <button class="btn btn-primary" type="reset">Reset</button>
                                                <button type="submit" id="StdAdmbtn" class="btn btn-success">Submit</button>
                                            </div>
                                        </div>

                                    </form>



                                </div>
                            </div>
                        </div>



                        <div class="clearfix"></div>
                        <div id="Report_Fetch">
                                        <div class="x_content table-responsive">
                                            <!--                    <p class="text-muted font-13 m-b-30">
                                                                  The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                </p>-->
                                            <div id="output1">
                                                <table id="datatable" class="table table-striped table-bordered">
                                                    <thead> <tr>
                                                            <th class="text-center" >Sr.No</th>
                                                           
                                                            <th class="text-center" >Delete</th>
                                                              <th class="text-center" >Category</th>
                                                              <th class="text-center" >Sub Category</th>
                                                            <th class="text-center" >Brand</th>
                                                            <th class="text-center" >Model No</th>
                                                          
                                                            <th class="text-center" >Color</th>
                                                            <!--<th class="text-center" >Product Name</th>-->
                                                            <th class="text-center" >Product Bar Code</th>
                                                            <th class="text-center" >Quantity</th>
                                                            <!--<th class="text-center" >HSN Code</th>-->
                                                            <th class="text-center" >Purchase Price</th>
                                                            <th class="text-center" >Unit Price</th>
                                                            <th class="text-center" >CGST (%)</th>
                                                            <th class="text-center" >SGST (%)</th>
                                                            <th class="text-center" >IGST (%)</th>

                                                            <!--<th class="text-center" >Discription</th>-->



                                                        </tr>
                                                    </thead>
                                                    <tbody>      

                                                        <%                                                        ProductDao1 pdo = new ProductDao1();

                                                            ProductModel pm = new ProductModel();
                                                            List<ProductModel> allProducts = null;
                                                            allProducts = pdo.getAllProduct();

                                                            if (allProducts != null && allProducts.size() > 0) {
                                                                int i = 0;
                                                                for (ProductModel products : allProducts) {
                                                                    //if (products.getAdminOfBranch().getAdminId() == admin.getAdminId()) {

                                                                    System.out.println("count:-" + i);
                                                                    boolean bq = products.isStatus();
                                                                    if (bq) {
                                                                        i++;

                                                        %>                             

                                                               <tr>
                                                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                                <td class="data_center"><%=i%></td>
                                               <form action="../../DeleteProduct" method="post">
                                                  
                                                    <input type="hidden" name="productId" id="productId" value="<%=products.getId()%>">
                                                    <input type="hidden" name="prd_model1<%=i%>" id="prd_model1<%=i%>" value="<%=products.getModel().getId()%>">
                                                    <input type="hidden" name="prd_cat1<%=i%>" id="prd_cat1<%=i%>" value="<%=products.getCategory().getId()%>">
                                                    <input type="hidden" name="prd_subcat1<%=i%>" id="subcat1<%=i%>" value="<%=products.getSubCategory().getId()%>">
                                                    <input type="hidden" name="prd_brand1<%=i%>" id="prd_brand1<%=i%>" value="<%=products.getBrand().getId()%>">
                                                    <input type="hidden" name="prd_color1<%=i%>" id="prd_color1<%=i%>" value="<%=products.getColorModel().getId()%>">

                                                    <td><button type="submit" class="btn btn-danger table_center" >Delete</button></td>
                                                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                                                <input type="hidden" id="prd_name<%=i%>"  value="<%=products.getProductBarcode()%>" >                                                   
                                                 <td class="data_center"  id="prd_cat<%=i%>"><%=products.getCategory().getCategory()%></td>  
                                                 <td class="data_center"  id="prd_subcat<%=i%>"><%=products.getSubCategory().getSubCategory()%></td>  
                                                   <td class="data_center"  id="prd_brand<%=i%>"><%=products.getBrand().getBrand()%></td>  
                                                      <td class="data_center"  id="prd_model<%=i%>"><%=products.getModel().getModelName()%></td>  
                                                    <td class="data_center"  id="prd_color<%=i%>"><%=products.getColorModel().getColorName()%></td>  
                                                    
                                                
                                                     
                                                      
                                                <td class="data_center"  id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         
                                                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                                   
                                                <!--<td class="data_center" id="prd_hsn<%=i%>"><%=products.getHsn()%></td>-->                                                   
                                                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getPurchasePrice()%></td>                                                 
                                                <td class="data_center" id="prd_unit<%=i%>"><%=products.getUnitPrice()%></td>                                                   
                                                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getCgst()%></td>                                                   
                                                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getSgst()%></td>                                                   
                                                <td class="data_center" id="prd_igst<%=i%>"><%=products.getIgst()%></td>                                                   

                                                <!--<td class="data_center" id="prd_desc<%=i%>"><%=products.getDiscription()%></td>-->                                                   


                                                </tr> 
                                                    <%}
                                                            }
                                                        }
                                                    %>                                                 
                                                    </tbody>
                                                </table>
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
        <script src="../production/css/Alertajax.js" type="text/javascript"></script>

        <script type="text/javascript">


                            function alpha(e) {
                                var k;
                                document.all ? k = e.keyCode : k = e.which;
                                return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32);
                            }

        </script>

        <script type="text/javascript">
            $('#document').ready(function() {

                $('.edit_prd').click(function(event) {
                    var i = this.id;
                    var j = $('#prd_id' + i).val();

                    $('#modal_prd_id').val($('#prd_id' + i).val());


                    $('#modal_prd_name').val($('#prd_name' + i).text());
                    $('#modal_prd_rent').val($('#prd_rent' + i).text());

                });


            });

        </script>
       
        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- bootstrap-progressbar -->
        <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <!-- iCheck -->
        <script src="../vendors/iCheck/icheck.min.js"></script>
        <!-- bootstrap-daterangepicker -->
        <script src="../vendors/moment/min/moment.min.js"></script>
        <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- bootstrap-wysiwyg -->
        <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
        <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
        <script src="../vendors/google-code-prettify/src/prettify.js"></script>
        <!-- jQuery Tags Input -->
        <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
        <!-- Switchery -->
        <script src="../vendors/switchery/dist/switchery.min.js"></script>
        <!-- Select2 -->
        <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
        <!-- Parsley -->
        <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
        <!-- Autosize -->
        <script src="../vendors/autosize/dist/autosize.min.js"></script>
        <!-- jQuery autocomplete -->
        <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
        <!-- starrr -->
        <script src="../vendors/starrr/dist/starrr.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
        <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
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
<script>
                                                        (function($) {
                                                            $(function() {
                                                                $('.multi-select-dd').fSelect();
                                                                $('.multi-select-dd1').fSelect();
                                                                $('.multi-select-dd2').fSelect();

                                                            });
                                                        })(jQuery);
        </script>
        <style>

            .table_center{

                text-align: center;
            }

        </style>
        <script type="text/javascript">
            $('#document').ready(function() {



                $(".priceup").keypress(function(event) {
                    var inputCode = event.which;
                    var currentValue = $(this).val();
                    if (inputCode > 0 && (inputCode < 48 || inputCode > 57)) {
                        if (inputCode == 46) {
                            if (getCursorPosition(this) == 0 && currentValue.charAt(0) == '-')
                                return false;
                            if (currentValue.match(/[.]/))
                                return false;
                        }
                        else if (inputCode == 45) {
                            if (currentValue.charAt(0) == '-')
                                return false;
                            if (getCursorPosition(this) != 0)
                                return false;
                        }
                        else if (inputCode == 8)
                            return true;
                        else
                            return false;
                    }
                    else if (inputCode > 0 && (inputCode >= 48 && inputCode <= 57)) {
                        if (currentValue.charAt(0) == '-' && getCursorPosition(this) == 0)
                            return false;
                    }
                });
            });
        </script>
    </body>
</html>