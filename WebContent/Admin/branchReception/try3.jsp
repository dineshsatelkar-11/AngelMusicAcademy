<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
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




            .dropdown {
                position: absolute;
                top:50%;
                transform: translateY(-50%);
            }

            a {
                color: #fff;
            }

            .dropdown dd,
            .dropdown dt {
                margin: 0px;
                padding: 0px;
            }

            .dropdown ul {
                margin: -1px 0 0 0;
            }

            .dropdown dd {
                position: relative;
            }

            .dropdown a,
            .dropdown a:visited {
                color: #000000;
                text-decoration: none;
                outline: none;
                font-size: 12px;
            }

            .dropdown dt a {
                background-color: #ccc;
                display: block;
                /*                padding: 8px 0px 5px 10px;*/
                min-height: 25px;
                line-height: 24px;
                overflow: hidden;
                border: 1;
                border-color: black;
                width: 272px;
            }

            .dropdown dt a span,
            .multiSel span {
                cursor: pointer;
                display: inline-block;
                padding: 0 3px 2px 0;
            }

            .dropdown dd ul {
                background-color: #fff;
                border: 0;
                color: #000000;
                display: none;
                left: 0px;
                padding: 2px 0px 2px 5px;
                position: absolute;
                /*                top: 2px;*/
                width: 280px;
                list-style: none;
                height: 100px;
                overflow: auto;
            }

            .dropdown span.value {
                display: none;
            }

            .dropdown dd ul li a {
                padding: 5px;
                display: block;
            }
            .dropdown
            {
                padding-top: 40px;
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

                                        <form class="form-horizontal form-label-left"  action="../../UpdateClient" method="get">
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
                                                <%
                                                    long id = Long.parseLong(request.getParameter("asd"));
                                                    AdmissionDao cd = new AdmissionDao();
                                                    Admission ad = cd.getAdmissionByID(id);
                                                %>
                                                <div id="step-1">
                                                    <input type="hidden" id="custid" name="custid" value="<%=id%>">
                                                    <div id="output">
                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="fname" value="<%=ad.getFirstName()%>" name="fname" placeholder="First Name" class="form-control">
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="mname" value="<%=ad.getMiddleName()%>" name="mname" placeholder="Middle Name" class="form-control">
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="lname" name="lname" value="<%=ad.getLastName()%>" placeholder="Last Name" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="contact" name="contact" value="<%=ad.getContactNo()%>" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="email" name="email" value="<%=ad.getEmail()%>" placeholder="Email" class="form-control">
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <select class="form-control" id="instname" name="instname" >
                                                                    <option selected="" value="<%=ad.getInstrumentName()%>"><%=ad.getInstrumentName()%></option> 
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
                                                            <input type="text" readonly="" id="datetimepicker11" value="<%=ad.getDateofBirth()%>" name="dob"  class="form-control">
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="age" value="<%=ad.getAge()%>" name="age" placeholder="Age" readonly="" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <select class="form-control" style="text-align:center" id="gender" name="gender">
                                                                <option selected="" value="<%=ad.getGender()%>"><%=ad.getGender()%></option>

                                                                <option value="Male">Male</option>
                                                                <option value="Female">Female</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                            <input class="form-control" type="text" value="<%=ad.getAddress()%>" id="address" name="address">


                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                                                            <select class="form-control" id="occupation"  name="occupation" required>
                                                                <option value="<%=ad.getOccupation()%>" selected><%=ad.getOccupation()%></option>

                                                                <option value="Musician">Musician</option>
                                                                <option value="Singer">Singer</option>
                                                                <option value="Service">Service</option>
                                                                <option value="Government Servant">Government Servant</option>
                                                                <option value="Student">Student</option>
                                                                <option value="others">others</option>
                                                            </select>
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" value="<%=ad.getParentsNo()%>" id="parentcontact" name="parentcontact" placeholder="Parents Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" value="<%=ad.getNationality()%>"  id="nationality" name="nationality" placeholder="Nationality" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <!--                                                            <input type="text" id="religion" name="religion" placeholder="Religion" class="form-control">-->
                                                            <select class="form-control" name="religion" id="religion" required>
                                                                <option value="<%=ad.getReligion()%>" selected><%=ad.getReligion()%></option>
                                                                <option value="Hinduism">Hinduism</option>
                                                                <option value="Christianity">Christianity</option>
                                                                <option value="Islam">Islam</option>
                                                                <option value="Buddhism">Buddhism</option>
                                                                <option value="Sikhism">Sikhism</option>
                                                                <option value="Jainism">Jainism</option>
                                                                <option value="Others">Others</option>
                                                            </select>
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" value="<%=ad.getQualification()%>" id="qualification" name="qualification" placeholder="Qualification" class="form-control">
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                                                            <select class="form-control"  id="mothertongue" name="mothertongue" required >
                                                                <option value="<%=ad.getMotherTongue()%>" selected><%=ad.getMotherTongue()%></option>
                                                                <option value="Marathi">Marathi</option>
                                                                <option value="Hindi">Hindi</option>
                                                                <option value="English">English</option>
                                                                <option value="Bengali">Bengali</option>
                                                                <option value="Telugu">Telugu</option>
                                                                <option value="Kannada">Kannada</option>
                                                                <option value="Malayalam">Malayalam</option>
                                                                <option value="Punjabi">Punjabi</option>
                                                                <option value="Kashmiri">Kashmiri</option>
                                                                <option value="Gujarathi">Gujarathi</option>
                                                                <option value="Urdu">Urdu</option>
                                                                <option value="Sindhi">Sindhi</option>
                                                                <option value="Konkani">Konkani</option>
                                                                <option value="Others">Others</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <!--                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                                                                <input type="text" id="fathername" name="fathername" placeholder="Name of Father" class="form-control">
                                                                                                            </div>-->

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" value="<%=ad.getMothersName()%>" id="mothername" name="mothername" placeholder="Name of Mother" class="form-control">
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <%
                                                                int duration = ad.getDuration();
                                                                String Datee = "";
                                                                if (duration == 1) {
                                                                    Datee = "One Month";
                                                                } else if (duration == 3) {
                                                                    Datee = "Three Month";
                                                                } else if (duration == 6) {
                                                                    Datee = "Six Month";
                                                                } else {
                                                                    Datee = "One Year";
                                                                }

                                                            %>
                                                            <select class="form-control" id="duration" name="duration">
                                                                <option value="<%=ad.getDuration()%>" selected><%=Datee%></option>
                                                                <option value="" >-Select Course Duration-</option>
                                                                <option value="1">One Month</option>
                                                                <option value="3">Three Month</option>
                                                                <option value="6">Six Month</option>
                                                                <option value="12">One Year</option>
                                                            </select>

                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" value="<%=ad.getJoiningDate()%>" id="datetimepicker12" readonly="" name="joindate"  placeholder="Joining Date" class="form-control">
                                                        </div>


                                                    </div>
                                                    <div class="row">


                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" value="<%=ad.getDueDate()%>"  id="DueDate"  name="DueDate" readonly=""  placeholder="Due Date" class="form-control">
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <select class="form-control" id="batchtime" name="batchtime" >
                                                                <option value="<%=ad.getBatchTimings()%>"><%=ad.getBatchTimings()%></option> 
                                                              
                                                                 <option value="">-Select Batch Time-</option> 
                                                                 <%   
                                                                List<BatchTime> batch = new BatchTimeDa0().getAllBatchTime();

                                                                    for (BatchTime b : batch) {

                                                                %>
                                                                <option value="<%=b.getBatchTimeId()%>"><%=b.getBatchTiming()%></option>
                                                                <%
                                                                    }

                                                                %>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <dl class="dropdown "> 

                                                                <dt class="form-control">
                                                                <a href="#">
                                                                    <span class="hida">-Selected -</span>    
                                                                    <p class="multiSel"></p>  
                                                                </a>
                                                                </dt>

                                                                <dd>
                                                                    <div class="mutliSelect ">
                                                                        <ul>
                                                                            <%                                                                                String s1 = ad.getDaysInWeek();
                                                                                String[] daylist = s1.split("\\s");
                                                                                int Monday = 0;
                                                                                int Tuesday = 0;

                                                                                int Wednesday = 0;
                                                                                int Thursday = 0;
                                                                                int Friday = 0;
                                                                                int Saturday = 0;
                                                                                for (String w : daylist) {
                                                                                    String day = w;
                                                                                    if (day.equals("Monday")) {
                                                                                        Monday = 1;
                                                                                    } else if (day.equals("Tuesday")) {
                                                                                        Tuesday = 1;
                                                                                    } else if (day.equals("Wednesday")) {
                                                                                        Wednesday = 1;
                                                                                    } else if (day.equals("Thursday")) {
                                                                                        Thursday = 1;
                                                                                    } else if (day.equals("Friday")) {
                                                                                        Friday = 1;
                                                                                    } else {
                                                                                        Saturday = 1;
                                                                                    }

                                                                                }
                                                                            %>

                                                                            <%
                                                                                if (Monday == 1) {
                                                                            %>
                                                                            <li>
                                                                                <input type="checkbox" checked="" name="Day" value="Monday" />Monday</li>

                                                                            <%
                                                                            } else {
                                                                            %>

                                                                            <li>
                                                                                <input type="checkbox"  name="Day" value="Monday" />Monday</li>

                                                                            <%}%>
                                                                            <%
                                                                                if (Tuesday == 1) {
                                                                            %>
                                                                            <li>
                                                                                <input type="checkbox" checked="" name="Day" value="Tuesday" />Tuesday</li>

                                                                            <%
                                                                            } else {
                                                                            %>

                                                                            <li>
                                                                                <input type="checkbox"  name="Day" value="Tuesday" />Tuesday</li>

                                                                            <%}%>
                                                                            <%
                                                                                if (Wednesday == 1) {
                                                                            %>
                                                                            <li>
                                                                                <input type="checkbox" name="Day" checked="" value="Wednesday" />Wednesday</li>

                                                                            <%
                                                                            } else {
                                                                            %>

                                                                            <li>
                                                                                <input type="checkbox"  name="Day" value="Wednesday" />Wednesday</li>

                                                                            <%}%>
                                                                            <%
                                                                                if (Thursday == 1) {
                                                                            %>
                                                                            <li>
                                                                                <input type="checkbox" name="Day" checked="" value="Thursday" />Thursday</li>

                                                                            <%
                                                                            } else {
                                                                            %>

                                                                            <li>
                                                                                <input type="checkbox" name="Day" value="Thursday" />Thursday</li>

                                                                            <%}%>
                                                                            <%
                                                                                if (Friday == 1) {
                                                                            %>
                                                                            <li>
                                                                                <input type="checkbox" name="Day" checked="" value="Friday" />Friday</li>

                                                                            <%
                                                                            } else {
                                                                            %>

                                                                            <li>
                                                                                <input type="checkbox" name="Day"  value="Friday" />Friday</li>

                                                                            <%}%>
                                                                            <%
                                                                                if (Saturday == 1) {
                                                                            %>
                                                                            <li>
                                                                                <input type="checkbox" name="Day" checked="" value="Saturday" />Saturday</li>

                                                                            <%
                                                                            } else {
                                                                            %>

                                                                            <li>
                                                                                <input type="checkbox"  name="Day" value="Saturday" />Saturday</li>

                                                                            <%}%>

                                                                        </ul>
                                                                    </div>
                                                                </dd>

                                                            </dl>   </div>
                                                    </div>

                                                    <div id="output12" class="outttt">

                                                    </div >
                                                </div>    <div id="step-3">
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
                                                            <input type="text" value="<%=ad.getAdmissionFee()%>" class="form-control priceup row0"   id="adfee" name="adfee" placeholder="Enter Fee" required>
                                                        </div>
                                                        <div class="col-md-4"></div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4"></div>
                                                        <div class="col-md-4">
                                                            <h4><strong>COURSE FEES PAYMENT</strong></h4>
                                                        </div>
                                                    </div><br>

                                                    <%
                                                        String coursename1 = ad.getCourseName1();
                                                        String coursename2 = ad.getCourseName2();
                                                        String coursename3 = ad.getCourseName3();
                                                        String coursename4 = ad.getCourseName4();
                                                        String coursename5 = ad.getCourseName5();

                                                    %>
                                                    <input type="hidden" id="rowcount" value="<%=ad.getNoofCourse()%>" name="rowcount">

                                                    <%
                                                        if (ad.getNoofCourse() >= 1) {
                                                    %>

                                                    <div class="row form-group" >
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename0" id="Coursename0" value="<%=coursename1%>" class="form-control priceup "   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control row0 priceup" value="<%=ad.getCourseFee1()%>" name="CourseFee0" id="CourseFee0" placeholder="Course Fee" required>
                                                        </div>
                                                        <!--                                                        <div class="col-md-4" >
                                                                                                                   <button type="button" class="btn btn-danger col-md-12">Delete</button>
                                                                                                                </div>-->
                                                    </div><br>
                                                    <%}
                                                        if (ad.getNoofCourse() >= 2) {
                                                    %>
                                                    <div class="row form-group" >
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename1" value="<%=coursename2%>" id="Coursename1" class="form-control priceup"   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control row0 row1 priceup"  value="<%=ad.getCourseFee2()%>" name="CourseFee1" id="CourseFee1" placeholder="Course Fee" required>
                                                        </div>
                                                        <!--                                                         <div class="col-md-4" >
                                                                                                                   <button type="button" class="btn btn-danger col-md-12">Delete</button>
                                                                                                                </div>-->
                                                    </div><br>
                                                    <%}
                                                        if (ad.getNoofCourse() >= 3) {
                                                    %>
                                                    <div class="row form-group" >
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename2" id="Coursename2" value="<%=coursename3%>" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control coursefee row0 priceup row2"  value="<%=ad.getCourseFee3()%>" name="CourseFee2" id="CourseFee2" placeholder="Course Fee" required>
                                                        </div>
                                                        <!--                                                         <div class="col-md-4" >
                                                                                                                   <button type="button" class="btn btn-danger col-md-12">Delete</button>
                                                                                                                </div>-->
                                                    </div><br>
                                                    <%}
                                                        if (ad.getNoofCourse() >= 4) {
                                                    %>
                                                    <div class="row form-group" >
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename3" value="<%=coursename4%>" id="Coursename3" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control row0 priceup row3"  value="<%=ad.getCourseFee4()%>" name="CourseFee3" id="CourseFee3" placeholder="Course Fee" required>
                                                        </div>
                                                        <!--                                                         <div class="col-md-4" >
                                                                                                                   <button type="button" class="btn btn-danger col-md-12">Delete</button>
                                                                                                                </div>-->
                                                    </div><br>
                                                    <%}
                                                        if (ad.getNoofCourse() >= 5) {
                                                    %>
                                                    <div class="row form-group" >
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename4" value="<%=coursename5%>" id="Coursename4" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control priceup row0 row4" value="<%=ad.getCourseFee5()%>" name="CourseFee4" id="CourseFee4" placeholder="Course Fee" required>
                                                        </div>
                                                        <!--                                                         <div class="col-md-4" >
                                                                                                                   <button type="button" class="btn btn-danger col-md-12">Delete</button>
                                                                                                                </div>-->
                                                    </div><br>
                                                    <%}%>
                                                    <%
                                                        int coursefee = ad.getCourseFee1() + ad.getCourseFee2() + ad.getCourseFee3() + ad.getCourseFee4() + ad.getCourseFee5();
                                                        int totalfee = coursefee + ad.getAdmissionFee();
                                                    %>
                                                    <br>

                                                    <div class="row form-group" >


                                                        <%
                                                            int paymentmode = ad.getPaymentmodecount();
                                                            String paymentm = "";
                                                            if (paymentmode == 1) {
                                                                paymentm = "One Month";
                                                            } else if (paymentmode == 3) {
                                                                paymentm = "Three Month";
                                                            } else if (paymentmode == 6) {
                                                                paymentm = "Six Month";
                                                            } else {
                                                                paymentm = "One Year";
                                                            }

                                                        %>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group"></div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <select class="form-control" id="Paymentmode" name="Paymentmode">
                                                                <option value="<%=ad.getPaymentmodecount()%>"><%=paymentm%></option>
                                                                <option >Change Payment Mode</option>
                                                                <option value="1">Monthly</option>
                                                                <option value="3">Three Month</option>
                                                                <option value="6">Six Month</option>
                                                                <option value="12">One Year</option>
                                                            </select>
                                                        </div>


                                                    </div>
                                                </div>

                                                <div id="step-4">


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
                                                                    $(".dropdown dt a").on('click', function() {
                                                                        $(".dropdown dd ul").slideToggle('fast');
                                                                    });

                                                                    $(".dropdown dd ul li a").on('click', function() {
                                                                        $(".dropdown dd ul").hide();
                                                                    });

                                                                    function getSelectedValue(id) {
                                                                        return $("#" + id).find("dt a span.value").html();
                                                                    }

                                                                    $(document).bind('click', function(e) {
                                                                        var $clicked = $(e.target);
                                                                        if (!$clicked.parents().hasClass("dropdown"))
                                                                            $(".dropdown dd ul").hide();
                                                                    });

                                                                    $('.mutliSelect input[type="checkbox"]').on('click', function() {

                                                                        var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
                                                                                title = $(this).val() + ",";

                                                                        if ($(this).is(':checked')) {
                                                                            var html = '<span title="' + title + '">' + title + '</span>';
                                                                            $('.multiSel').append(html);
                                                                            $(".hida").hide();
                                                                        } else {
                                                                            $('span[title="' + title + '"]').remove();
                                                                            var ret = $(".hida");
                                                                            $('.dropdown dt a').append(ret);

                                                                        }
                                                                    });

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
                                                                            if (dis_fee0)
                                                                            {
                                                                                var amount = dis_fee0 * CourseFee0 / 100;
                                                                                CourseFee0 = CourseFee0 - dis_fee0;

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