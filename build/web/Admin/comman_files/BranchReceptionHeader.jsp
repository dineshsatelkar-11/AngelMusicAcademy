<%@page import="com.accede.angel.services.DynamicGenerator"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    <!-- Datatables -->
    <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

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


<%
    Admin admintop = new Admin();
     SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
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
                        <input  type="text" value="<%=yesterdayamt%>" readonly="" name="image" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                    </div>
                    <br>

                    <!--          <p>Some text in the modal.</p>-->
                </div>
                <div class="modal-body">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Today Credit Balance <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input  type="text" value="<%=todaycreditamt%>"  readonly="" name="image" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                    </div>
                    <br>

                    <!--          <p>Some text in the modal.</p>-->
                </div>
                <div class="modal-body">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Today Debit Balance <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input  type="text" value="<%=todaydebitamt%>"  readonly="" name="image" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                    </div>
                    <br>

                    <!--          <p>Some text in the modal.</p>-->
                </div>
                <div class="modal-body">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Final Balance <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input  type="text" value="<%=yesterdayamt+todaycreditamt-todaydebitamt%>" readonly=""  name="image" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
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



