<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>
<%@page import="com.accede.angel.admin.dao.SubjectDao"%>
<%@page import="com.accede.angel.admin.dao.UserDao"%>
<%@page import="com.accede.angel.admin.model.Instrument"%>
<%@page import="com.accede.angel.admin.model.Subject"%>
<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Gentelella Alela! | </title>

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

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <!--            <div class="page-title">
                                      <div class="title_left">
                                        <h3>Form Wizards</h3>
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
                                        <!--<h2>Admission Details <small></small></h2>-->
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <h4>Admission Details</h4>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <input type="text" id="mob_email" name="mob_email" placeholder="Mobile no. or EmailId" class="form-control">
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <input type="submit" class="btn btn-primary" value="Search">
                                        </div>
                                        <!--                    <ul class="nav navbar-right panel_toolbox">
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
                                                            </ul>-->
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">

                                        <form class="form-horizontal form-label-left" enctype="multipart/form-data" action="../../AddAdmissionServlet" method="post">
                                            <%

                                                if (session.getAttribute("i") != null) {
                                                    int i = (Integer) session.getAttribute("i");
                                                    if (i == 2) {

                                                        System.out.println("fdgsfd");
                                            %>
                                            <div class="alert">
                                                <span class="closebtn">&times;</span>  
                                                <strong>Danger!</strong> Something Went Wrong.
                                            </div>
                                            <%} else {%>
                                            <div class="alert success">
                                                <span class="closebtn">&times;</span>  
                                                <strong>Success!</strong> Admission Details Save Successfully.
                                            </div>
                                            <% }
                                                    session.removeAttribute("i");
                                                }%>
                                            <!-- Smart Wizard -->
                                            <div id="wizard" class="form_wizard wizard_horizontal">
                                                <ul class="wizard_steps">
                                                    <li>
                                                        <a href="#step-1">
                                                            <span class="step_no">1</span>
                                                            <span class="step_descr">
                                                                Step 1<br />
                                                                <small>Details</small>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#step-2">
                                                            <span class="step_no">2</span>
                                                            <span class="step_descr">
                                                                Step 2<br />
                                                                <small>Personal Details</small>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#step-3">
                                                            <span class="step_no">3</span>
                                                            <span class="step_descr">
                                                                Step 3<br />
                                                                <small>Payment Details</small>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#step-4">
                                                            <span class="step_no">4</span>
                                                            <span class="step_descr">
                                                                Step 4<br />
                                                                <small>Step 4 description</small>
                                                            </span>
                                                        </a>
                                                    </li>
                                                </ul>

                                                <div id="step-1">

                                                    <div id="output">
                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="fname" name="fname" placeholder="First Name" class="form-control">
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="mname" name="mname" placeholder="Middle Name" class="form-control">
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="lname" name="lname" placeholder="Last Name" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="contact" name="contact" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="email" name="email" placeholder="Email" class="form-control">
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <select class="form-control" id="instname" name="instname" >
                                                                    <option value="">-Select Instrument-</option> 
                                                                    <%                List<Instrument> inst = new InstrumentDao().getAllInstrumene();

                                                                        for (Instrument i : inst) {

                                                                    %>
                                                                    <option value="<%=i.getInstrumentName()%>"><%=i.getInstrumentName()%></option>
                                                                    <%
                                                                        }

                                                                    %>
                                                                </select>
                                                            </div>
                                                        </div>




                                                    </div>
                                                </div>
                                                <div id="step-2">
                                                    <div class="row">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="datetimepicker1" name="dob" placeholder="Date Of Birth" class="form-control">
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="age" name="age" placeholder="Age" readonly="" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <select class="form-control" id="gender" name="gender">
                                                                <option value="">Select Gender</option>
                                                                <option value="Male">Male</option>
                                                                <option value="Female">Female</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                            <textarea id="address" placeholder="Address" required="required" class="form-control" name="address" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                                      data-parsley-validation-threshold="10"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="occupation" name="occupation" placeholder="Occupation" class="form-control">
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="parentcontact" name="parentcontact" placeholder="Parents Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="nationality" name="nationality" placeholder="Nationality" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="religion" name="religion" placeholder="Religion" class="form-control">
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="qualification" name="qualification" placeholder="Qualification" class="form-control">
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="mothertongue" name="mothertongue" placeholder="Mother Tongue" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <!--                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                                                                <input type="text" id="fathername" name="fathername" placeholder="Name of Father" class="form-control">
                                                                                                            </div>-->

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="mothername" name="mothername" placeholder="Name of Mother" class="form-control">
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <select class="form-control" id="duration" name="duration">
                                                                <option>--Select Course Duration -</option>
                                                                <option value="1">One Month</option>
                                                                <option value="3">Three Month</option>
                                                                <option value="6">Six Month</option>
                                                                <option value="12">One Year</option>
                                                            </select>

                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="datetimepicker2" name="joindate"  placeholder="Joining Date" class="form-control">
                                                        </div>


                                                    </div>
                                                    <div class="row">


                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text"   id="DueDate"  name="DueDate" readonly=""  placeholder="Due Date" class="form-control">
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <select class="form-control" id="batchtime" name="batchtime" >
                                                                <option value="">-Select Batch Timings-</option> 
                                                                <%                               List<BatchTime> batch = new BatchTimeDa0().getAllBatchTime();

                                                                    for (BatchTime b : batch) {

                                                                %>
                                                                <option value="<%=b.getBatchTimeId()%>"><%=b.getBatchTiming()%></option>
                                                                <%
                                                                    }

                                                                %>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="file"  name="image" id="image" class="form-control">
                                                        </div> 
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <select multiple="" class="form-control" id="days" name="days" >
                                                                <option value="">--Select Days in Week--</option>
                                                                <%                                  List<String> Days = new UserDao().initDaysList();

                                                                    for (String b : Days) {

                                                                %>
                                                                <option value="<%=b.toString()%>"><%=b.toString()%></option>
                                                                <%
                                                                    }

                                                                %>
                                                            </select>

                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <select multiple name="course[]"  class="form-control" id="coursename" name="coursename" >
                                                                <option value="">-Select CourseName-</option> 
                                                                <%                               List<Course> cs = new CourseDao().getAllCourse();

                                                                    for (Course c : cs) {

                                                                %>
                                                                <option value="<%=c.getCourseName()%>"><%=c.getCourseName()%></option>
                                                                <%
                                                                    }

                                                                %>
                                                            </select>
                                                        </div>






                                                    </div>

                                                    <div id="output12" class="outttt">

                                                    </div >
                                                </div>   
                                                <div id="step-3">
                                                    <div class="row">
                                                        <div class="col-md-4"></div>
                                                        <div class="col-md-4">
                                                            <h3><b>FEES & PAYMENT</b></h3>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4"></div>
                                                        <div class="col-md-4">
                                                            <label >Admission Fee : </label>
                                                            <input type="text" class="form-control rechide" onkeypress="return isNumberKey(event)"  id="adfee" name="adfee" placeholder="Enter Fee" required>
                                                        </div>
                                                        <div class="col-md-4"></div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4"></div>
                                                        <div class="col-md-4">
                                                            <h4><strong>COURSE FEES PAYMENT</strong></h4>
                                                        </div>
                                                    </div><br>
                                                    <input type="hidden" id="rowcount" name="rowcount">
                                                    <div class="row form-group" id="allfees0">
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  name="Coursename0" id="Coursename0" class="form-control "   readonly>
                                                        </div>
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control row0" name="CourseFee0" id="CourseFee0" placeholder="Course Fee" required>
                                                        </div>
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control row0" name="paid_fee0" id="paid_fee0" placeholder="Advanced Fee" required>
                                                        </div>
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control row0" name="dis_fee0" id="dis_fee0" placeholder="Discount Fee" required>
                                                        </div>
                                                        <div class="col-md-2 " >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  id="remaining_fee0" name="remaining_fee0" readonly="readonly" class="form-control rempaid" placeholder="Remaining Fee" required>
                                                        </div>
                                                        <div class="col-md-2 ">
                                                            <input type="text" id="datetimepicker4" name="duedate0"  placeholder="Due Date" class="form-control">
                                                        </div>
                                                    </div><br>
                                                    <div class="row form-group" id="allfees1">
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  name="Coursename1" id="Coursename1" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeyup="myfunction1(this.id)"  class="form-control  row1" name="CourseFee1" id="CourseFee1" placeholder="Course Fee" required>
                                                        </div>
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control advancedpaid row1" name="paid_fee1" id="paid_fee1" placeholder="Advanced Fee" required>
                                                        </div>
                                                          <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control row1" name="dis_fee1" id="dis_fee1" placeholder="Discount Fee" required>
                                                        </div>
                                                        <div class="col-md-2 " >
                                                            <input type="text" onkeypress="return isNumberKey(event)"   id="remaining_fee1" name="remaining_fee1" readonly="readonly" class="form-control rempaid" placeholder="Remaining Fee" required>
                                                        </div>
                                                        <div class="col-md-2 ">
                                                            <input type="text" id="datetimepicker5" name="duedate1"  placeholder="Due Date" class="form-control">
                                                        </div>
                                                    </div><br>
                                                    <div class="row form-group" id="allfees2">
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  name="Coursename2" id="Coursename2" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control coursefee row2" name="CourseFee2" id="CourseFee2" placeholder="Course Fee" required>
                                                        </div>
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control advancedpaid row2" name="paid_fee2" id="paid_fee2" placeholder="Advanced Fee" required>
                                                        </div>
                                                          <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control row2" name="dis_fee2" id="dis_fee2" placeholder="Discount Fee" required>
                                                        </div>
                                                        <div class="col-md-2 " >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  id="remaining_fee2" name="remaining_fee2" readonly="readonly" class="form-control rempaid" placeholder="Remaining Fee" required>
                                                        </div>
                                                        <div class="col-md-2 ">
                                                            <input type="text" id="datetimepicker6" name="duedate2"  placeholder="Due Date" class="form-control">
                                                        </div>
                                                    </div><br>
                                                    <div class="row form-group" id="allfees3">
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  name="Coursename3" id="Coursename3" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control row3" name="CourseFee3" id="CourseFee3" placeholder="Course Fee" required>
                                                        </div>
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control row3" name="paid_fee3" id="paid_fee3" placeholder="Advanced Fee" required>
                                                        </div>
                                                          <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control row3" name="dis_fee3" id="dis_fee3" placeholder="Discount Fee" required>
                                                        </div>
                                                        <div class="col-md-2 " >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  id="remaining_fee3" name="remaining_fee3" readonly="readonly" class="form-control rempaid" placeholder="Remaining Fee" required>
                                                        </div>
                                                        <div class="col-md-2 ">
                                                            <input type="text" id="datetimepicker7" name="duedate3"  placeholder="Due Date" class="form-control">
                                                        </div>
                                                    </div><br>
                                                    <div class="row form-group" id="allfees4">
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  name="Coursename4" id="Coursename4" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control row4" name="CourseFee4" id="CourseFee4" placeholder="Course Fee" required>
                                                        </div>
                                                        <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control row4" name="paid_fee4" id="paid_fee4" placeholder="Advanced Fee" required>
                                                        </div>
                                                          <div class="col-md-2" >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control row4" name="dis_fee4" id="dis_fee4" placeholder="Discount Fee" required>
                                                        </div>
                                                        <div class="col-md-2 " >
                                                            <input type="text" onkeypress="return isNumberKey(event)"  id="remaining_fee4" name="remaining_fee4" readonly="readonly" class="form-control rempaid" placeholder="Remaining Fee" required>
                                                        </div>
                                                        <div class="col-md-2 ">
                                                            <input type="text" id="datetimepicker8" name="duedate4"  placeholder="Due Date" class="form-control">
                                                        </div>
                                                    </div><br>
                                                    <br>
                                                    </br>
                                                    <div class="row form-group" id="allfees">
                                                          
                                                        <div class="col-md-2" id="cTotalFee">
                                                            <p><strong>Total Course Fee:</strong></p><br>
                                                            <input type="text" class="form-control" placeholder=""   name="coursetotalfee" id="coursetotalfee" value="0" readonly="readonly" required>
                                                        </div>
                                                        <div class="col-md-2" id="cTotalFee">
                                                            <p><strong>Admission Fee:</strong></p><br>
                                                            <input type="text" class="form-control" placeholder=""   name="admissonnfee" id="admissonnfee" value="0" readonly="readonly" required>
                                                        </div>
                                                        <div class="col-md-2" id="cTotalFee">
                                                            <p><strong>Total Fee:</strong></p><br>
                                                            <input type="text" class="form-control" placeholder=""   name="totalfee" id="totalfee" value="0" readonly="readonly" required>
                                                        </div>
                                                        <div class="col-md-2" id="cFeePaid">
                                                            <p><strong>Total Advanced Fee</strong></p>
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control rechide" name="totaladvancedfee" id="totaladvancedfee" value="0"  placeholder="" readonly="readonly" required>
                                                            <input type="hidden" onkeypress="return isNumberKey(event)" name="recadv" id="recadv">

                                                        </div>
                                                        <div class="col-md-2 remsinglefee" id="cFeeRem">
                                                            <p><strong>Class Fee Paid</strong></p><br>
                                                            <input type="text" placeholder="" name="c_fee" class="form-control" readonly="" value="0" onkeypress="return isNumberKey(event)"  id="c_fee"  required>
                                                        </div>
                                                        <div class="col-md-2 remsinglefee" id="cFeeRem">
                                                            <p><strong>Total Remaining Fee</strong></p>
                                                            <input type="text" placeholder="" name="totalremfee" class="form-control" value="0" onkeypress="return isNumberKey(event)"readonly="readonly" id="totalremfee"required>
                                                        </div>
                                                       
                                                    </div>
                                                    <br>
<!--                                                    <div class="row" class="form-group" id="allfees">
                                                        <div class="col-md-3"></div> 
                                                        <div class="col-md-2" id="OtherFee">
                                                            <p><strong>Other Fees:</strong></p><br>
                                                            <input type="text" class="form-control rechide" placeholder=""   name="otherfees" id="otherfees" value="0">
                                                        </div>
                                                        <div class="col-md-2" id="cTotalFee">
                                                            <p><strong>Discount in %:</strong></p><br>
                                                            <input type="text" class="form-control" placeholder=""    name="discount" id="discount" value="0" required>
                                                            <input type="hidden" onkeypress="return isNumberKey(event)"; name="recdisamt" id="recdisamt">
                                                        </div>
                                                        <div class="col-md-2" id="cFeePaid">
                                                            <p><strong>Amount After Discount</strong></p>
                                                            <input type="text" onkeypress="return isNumberKey(event)"  class="form-control" name="finalamount" id="finalamount"  placeholder="" readonly="readonly" required>
                                                            <input type="hidden" onkeypress="return isNumberKey(event)"  class="form-control" name="recdis" id="recdis" >
                                                        </div>
                                                        <div class="col-md-2" class="remsinglefee" id="cFeeRem">		    
                                                        </div>
                                                        <input type="hidden" name="rtot" onkeypress="return onlyNumbers(this.value);" id="totaladvancedfee1" >
                                                        <input type="hidden" name="totalwords" id="totalwords"  >
                                                        <div class="col-md-3"></div>
                                                    </div>-->

                                                    <br><br>
                                                </div>
                                        </form>
                                        <div id="step-4">
                                            <h2 class="StepTitle">Step 4 Content</h2>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                            </p>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor
                                                in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                            </p>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor
                                                in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                            </p>
                                        </div>

                                    </div>
                                    <!-- End SmartWizard Content -->
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->

            <!-- footer content -->
            <footer>
                <div class="pull-right">
                    Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
                </div>
                <div class="clearfix"></div>
            </footer>
            <!-- /footer content -->
        </div>
    </div>


    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- jQuery Smart Wizard -->
    <script src="../vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
    <!-- Multiple Select Script -->
    <script src="../production/js/multipleselect.js" type="text/javascript"></script>
    <link href="../production/js/multiple_select.css" rel="stylesheet" type="text/css"/>
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
    <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script type="text/javascript">
                                                            $('#document').ready(function() {
                                                                $('.amounthide').hide();
                                                                $('#datetimepicker1').datetimepicker({
                                                                    format: 'DD/MM/YYYY',
                                                                    viewMode: "years"
                                                                });
                                                                $('#datetimepicker2').datetimepicker({
                                                                    format: 'DD/MM/YYYY',
                                                                    viewMode: "years"
                                                                });
                                                                $('#datetimepicker3').datetimepicker({
                                                                    format: 'DD/MM/YYYY',
                                                                    viewMode: "years"
                                                                });
                                                                $('#datetimepicker4').datetimepicker({
                                                                    format: 'DD/MM/YYYY',
                                                                    viewMode: "years"
                                                                });
                                                                $('#datetimepicker5').datetimepicker({
                                                                    format: 'DD/MM/YYYY',
                                                                    viewMode: "years"
                                                                });
                                                                $('#datetimepicker6').datetimepicker({
                                                                    format: 'DD/MM/YYYY',
                                                                    viewMode: "years"
                                                                });
                                                                $('#datetimepicker7').datetimepicker({
                                                                    format: 'DD/MM/YYYY',
                                                                    viewMode: "years"
                                                                });
                                                                $('#datetimepicker8').datetimepicker({
                                                                    format: 'DD/MM/YYYY',
                                                                    viewMode: "years"
                                                                });
                                                                $('#datetimepicker9').datetimepicker({
                                                                    format: 'DD/MM/YYYY',
                                                                    viewMode: "years"
                                                                });
                                                                $('#allfees1').hide();
                                                                $('#allfees2').hide();
                                                                $('#allfees3').hide();
                                                                $('#allfees4').hide();
                                                                $('#allfees0').hide();

                                                                $('#otherfees').on('keyup change', function() {

                                                                    var otherfees = $('#otherfees').val();
                                                                    var totalremfee = $('#totalremfee').val();
                                                                    var finalamount = $('#finalamount').val();
                                                                    var discount = $('#discount').val();
                                                                    var totalamount = parseInt(totalremfee) + parseInt(otherfees);
                                                                    var disamount = discount * totalamount / 100;
                                                                    var afterdiscountamount = totalamount - disamount;
                                                                    $('#finalamount').val(afterdiscountamount);

                                                                });
                                                                $('#discount').on('keyup change', function() {

                                                                    var otherfees = $('#otherfees').val();
                                                                    var totalremfee = $('#totalremfee').val();
                                                                    var finalamount = $('#finalamount').val();
                                                                    var discount = $('#discount').val();
                                                                    var totalamount = parseInt(totalremfee) + parseInt(otherfees);
                                                                    var disamount = discount * totalamount / 100;
                                                                    var afterdiscountamount = totalamount - disamount;
                                                                    $('#finalamount').val(afterdiscountamount);

                                                                });

                                                                $('.row0').on('keyup change', function() {

                                                                    var CourseFee0 = $('#CourseFee0').val();
                                                                    var adfee = $('#adfee').val();

                                                                    var paid_fee0 = $('#paid_fee0').val();
                                                                    var dis_fee0 = $('#dis_fee0').val();
                                                                    
                                                                    if (parseInt(CourseFee0) >= parseInt(paid_fee0))
                                                                    {
                                                                        if(dis_fee0)
                                                                        {
                                                                        var amount=dis_fee0*CourseFee0/100;
                                                                        CourseFee0=CourseFee0-dis_fee0;
                                                                       
                                                                    }
                                                                    var remaining_fee4 = parseInt(CourseFee0) - parseInt(paid_fee0);
                                                                        $('#remaining_fee0').val(remaining_fee4);
                                                                        
                                                                    }
                                                                    var rowcount = $('#rowcount').val();
                                                                    var totalcoursefee = 0;
                                                                    var totalAdvancefee = 0;
                                                                    var totalRemainingfee = 0;
                                                                    var i = 0;
                                                                    for (i = 0; i < rowcount; i++)
                                                                    {
                                                                        var cou = $('#CourseFee' + i).val();
                                                                        var paid = $('#paid_fee' + i).val();
                                                                        var remain = $('#remaining_fee' + i).val();

                                                                        if (cou) {

                                                                            totalcoursefee = parseInt(totalcoursefee) + parseInt(cou);
                                                                            $('#coursetotalfee').val(totalcoursefee);
                                                                        }

                                                                        if (paid) {

                                                                            totalAdvancefee = parseInt(totalAdvancefee) + parseInt(paid);
                                                                            $('#totaladvancedfee').val(totalAdvancefee);
                                                                        }



                                                                    }
                                                                    var totalll = $('#coursetotalfee').val();
                                                                    var paidd = $('#totaladvancedfee').val();
                                                                    $('#totalremfee').val(parseInt(totalll) - parseInt(paidd));

                                                                });
                                                                $('.row1').on('keyup change', function() {

                                                                    var CourseFee0 = $('#CourseFee1').val();
                                                                    var adfee = $('#adfee').val();
                                                                                          
                                                                    var paid_fee0 = $('#paid_fee1').val();
                                                                    if (parseInt(CourseFee0) > parseInt(paid_fee0))
                                                                    {
                                                                        var remaining_fee4 = parseInt(CourseFee0) - parseInt(paid_fee0);
                                                                        $('#remaining_fee1').val(remaining_fee4);
                                                                    }
                                                                    var rowcount = $('#rowcount').val();
                                                                    var totalcoursefee = 0;
                                                                    var totalAdvancefee = 0;
                                                                    var totalRemainingfee = 0;
                                                                    var i = 0;
                                                                    for (i = 0; i < rowcount; i++)
                                                                    {
                                                                        var cou = $('#CourseFee' + i).val();
                                                                        var paid = $('#paid_fee' + i).val();
                                                                        var remain = $('#remaining_fee' + i).val();

                                                                        if (cou) {

                                                                            totalcoursefee = parseInt(totalcoursefee) + parseInt(cou);
                                                                            $('#coursetotalfee').val(totalcoursefee);
                                                                        }

                                                                        if (paid) {

                                                                            totalAdvancefee = parseInt(totalAdvancefee) + parseInt(paid);
                                                                            $('#totaladvancedfee').val(totalAdvancefee);
                                                                        }

                                                                    }
                                                                    var totalll = $('#coursetotalfee').val();
                                                                    var paidd = $('#totaladvancedfee').val();
                                                                    $('#totalremfee').val(parseInt(totalll) - parseInt(paidd));

                                                                });
                                                                $('.row2').on('keyup change', function() {

                                                                    var CourseFee0 = $('#CourseFee2').val();

                                                                    var paid_fee0 = $('#paid_fee2').val();
                                                                    if (parseInt(CourseFee0) > parseInt(paid_fee0))
                                                                    {
                                                                        var remaining_fee4 = parseInt(CourseFee0) - parseInt(paid_fee0);
                                                                        $('#remaining_fee2').val(remaining_fee4);
                                                                    }
                                                                    var rowcount = $('#rowcount').val();
                                                                    var totalcoursefee = 0;
                                                                    var totalAdvancefee = 0;
                                                                    var totalRemainingfee = 0;
                                                                    var i = 0;
                                                                    for (i = 0; i < rowcount; i++)
                                                                    {
                                                                        var cou = $('#CourseFee' + i).val();
                                                                        var paid = $('#paid_fee' + i).val();
                                                                        var remain = $('#remaining_fee' + i).val();

                                                                        if (cou) {

                                                                            totalcoursefee = parseInt(totalcoursefee) + parseInt(cou);
                                                                            $('#coursetotalfee').val(totalcoursefee);
                                                                        }

                                                                        if (paid) {

                                                                            totalAdvancefee = parseInt(totalAdvancefee) + parseInt(paid);
                                                                            $('#totaladvancedfee').val(totalAdvancefee);
                                                                        }

                                                                    }
                                                                    var totalll = $('#coursetotalfee').val();
                                                                    var paidd = $('#totaladvancedfee').val();
                                                                    $('#totalremfee').val(parseInt(totalll) - parseInt(paidd));

                                                                });
                                                                $('.row3').on('keyup change', function() {

                                                                    var CourseFee0 = $('#CourseFee3').val();

                                                                    var paid_fee0 = $('#paid_fee3').val();
                                                                    if (parseInt(CourseFee0) > parseInt(paid_fee0))
                                                                    {
                                                                        var remaining_fee4 = parseInt(CourseFee0) - parseInt(paid_fee0);
                                                                        $('#remaining_fee3').val(remaining_fee4);
                                                                    }
                                                                    var rowcount = $('#rowcount').val();
                                                                    var totalcoursefee = 0;
                                                                    var totalAdvancefee = 0;
                                                                    var totalRemainingfee = 0;
                                                                    var i = 0;
                                                                    for (i = 0; i < rowcount; i++)
                                                                    {
                                                                        var cou = $('#CourseFee' + i).val();
                                                                        var paid = $('#paid_fee' + i).val();
                                                                        var remain = $('#remaining_fee' + i).val();

                                                                        if (cou) {

                                                                            totalcoursefee = parseInt(totalcoursefee) + parseInt(cou);
                                                                            $('#coursetotalfee').val(totalcoursefee);
                                                                        }

                                                                        if (paid) {

                                                                            totalAdvancefee = parseInt(totalAdvancefee) + parseInt(paid);
                                                                            $('#totaladvancedfee').val(totalAdvancefee);
                                                                        }

                                                                    }
                                                                    var totalll = $('#coursetotalfee').val();
                                                                    var paidd = $('#totaladvancedfee').val();
                                                                    $('#totalremfee').val(parseInt(totalll) - parseInt(paidd));

                                                                });
                                                                $('.row4').on('keyup change', function() {

                                                                    var CourseFee0 = $('#CourseFee4').val();

                                                                    var paid_fee0 = $('#paid_fee4').val();
                                                                    if (parseInt(CourseFee0) > parseInt(paid_fee0))
                                                                    {
                                                                        var remaining_fee4 = parseInt(CourseFee0) - parseInt(paid_fee0);
                                                                        $('#remaining_fee4').val(remaining_fee4);
                                                                    }
                                                                    var rowcount = $('#rowcount').val();
                                                                    var totalcoursefee = 0;
                                                                    var totalAdvancefee = 0;
                                                                    var totalRemainingfee = 0;
                                                                    var i = 0;
                                                                    for (i = 0; i < rowcount; i++)
                                                                    {
                                                                        var cou = $('#CourseFee' + i).val();
                                                                        var paid = $('#paid_fee' + i).val();
                                                                        var remain = $('#remaining_fee' + i).val();

                                                                        if (cou) {

                                                                            totalcoursefee = parseInt(totalcoursefee) + parseInt(cou);
                                                                            $('#coursetotalfee').val(totalcoursefee);
                                                                        }

                                                                        if (paid) {

                                                                            totalAdvancefee = parseInt(totalAdvancefee) + parseInt(paid);
                                                                            $('#totaladvancedfee').val(totalAdvancefee);
                                                                        }

                                                                    }
                                                                    var totalll = $('#coursetotalfee').val();
                                                                    var paidd = $('#totaladvancedfee').val();
                                                                    $('#totalremfee').val(parseInt(totalll) - parseInt(paidd));

                                                                });
                                                                $("#datetimepicker1").on("dp.change", function(e) {
                                                                    var year = new Date(e.date).getFullYear();
                                                                    var month = new Date(e.date).getMonth() + 1;
                                                                    var currentYear = new Date().getFullYear();
                                                                    var currentMonth = new Date().getMonth() + 1;
                                                                    var age = currentYear - year;
                                                                    if ((currentMonth - month) < 0)
                                                                        age--;
                                                                    $('#age').val(age);
                                                                });
                                                                $("#datetimepicker2").on("dp.change", function(e) {
                                                                    var duration = $('#duration').val();


                                                                    duration = parseInt(duration);
                                                                    var today = new Date(e.date);
                                                                    var currMonth = today.getMonth() + duration;
                                                                    var secondInstallmentDate = new Date(today.setMonth(currMonth));
                                                                    var month = secondInstallmentDate.getMonth() + 1;
                                                                    var year = new Date(secondInstallmentDate).getFullYear();
                                                                    var date5 = new Date(secondInstallmentDate).getDate();
                                                                    $('#DueDate').val(date5 + "/" + month + "/" + year);
                                                                });
                                                                $("#duration").on("change", function(e) {
                                                                    var duration = $('#duration').val();
                                                                    duration = parseInt(duration);
                                                                    var today = new Date(e.date);
//                                                                        alert(e.date);
                                                                    if (e.date != null)
                                                                    {
                                                                        var currMonth = today.getMonth() + duration;
                                                                        var secondInstallmentDate = new Date(today.setMonth(currMonth));
                                                                        var month = secondInstallmentDate.getMonth() + 1;
                                                                        var year = new Date(secondInstallmentDate).getFullYear();
                                                                        var date5 = new Date(secondInstallmentDate).getDate();
                                                                        $('#DueDate').val(date5 + "/" + month + "/" + year);
                                                                    }
                                                                });
                                                                $('#regfees').on('keyup change', function() {
                                                                    var regfees = $('#regfees').val();

                                                                    var duration = $('#duration').val();



                                                                    if (duration != 0)
                                                                    {
                                                                        var amount = duration * regfees;


                                                                        amount = parseInt(amount);
                                                                        $('#totalfees').val(amount);
                                                                        $('#amountinword').val(converAmount(amount));

                                                                    }
                                                                    else
                                                                    {


                                                                        $('#totalfees').val("0");

                                                                    }
                                                                });

                                                                $('#advpay').on('keyup change', function() {
                                                                    var advpay = $('#advpay').val();
                                                                    var regfees = $('#regfees').val();
                                                                    var duration = $('#duration').val();

                                                                    $('.amounthide').hide();

                                                                    if (duration != 0)
                                                                    {

                                                                        if (regfees != 0)
                                                                        {
                                                                            var amount = duration * regfees;


                                                                            amount = parseInt(amount);
                                                                            $('#totalfees').val(amount);
                                                                            if (amount >= advpay)
                                                                            {
                                                                                amount = parseInt(amount) - parseInt(advpay);
                                                                                $('#balamt').val(amount);
                                                                                $('#amountinword').val(converAmount(amount));
                                                                            }
                                                                            else
                                                                            {
                                                                                $('.amounthide').show();
                                                                                $('#balamt').val("0");
                                                                                $('#amountinword').val("0");
                                                                            }
                                                                        }
                                                                        else
                                                                        {


                                                                            $('#totalfees').val("0");

                                                                        }
                                                                    }
                                                                    else
                                                                    {


                                                                        $('#totalfees').val("0");

                                                                    }
                                                                });
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


                                                            });
    </script>


    <script type="text/javascript">
        $(document).ready(function() {
            // alert('fsdfsdf');
            $('#mob_email').blur(function() {

                var studEmail = $('#mob_email').val();

                $.get("StudentEnquiryAjax.jsp", {studEmail: studEmail}, function(data) {
                    //   alert('sucess');
                    $('#output').html(data);
                });

            });
            $('#coursename').change(function() {
                $('#allfees1').hide();
                $('#allfees2').hide();
                $('#allfees3').hide();
                $('#allfees4').hide();
                $('#allfees0').hide();
                var id_menu = $(this).val().join();
                var ss = id_menu.split(",");
                var rowcount = 0;
                for (var i in ss) {
                    rowcount++;
//                    alert(ss[i])
                    $("#allfees" + i).show();
                    $('#Coursename' + i).val(ss[i]);

                }
                $('#rowcount').val(rowcount);


            });
            function isNumberKey(evt) {

                var charCode = (evt.which) ? evt.which : evt.keyCode
                if (charCode != 46 && charCode > 31
                        && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }

        });
    </script>
    <script>
        var close = document.getElementsByClassName("closebtn");
        var i;

        for (i = 0; i < close.length; i++) {
            close[i].onclick = function() {
                var div = this.parentElement;
                div.style.opacity = "0";
                setTimeout(function() {
                    div.style.display = "none";
                }, 600);
            }
        }
    </script>
</body>
</html>