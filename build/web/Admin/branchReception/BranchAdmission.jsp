<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>

<%@page import="com.accede.angel.admin.dao.UserDao"%>
<%@page import="com.accede.angel.admin.model.Instrument"%>

<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
    <%    if (session.getAttribute("printInvoiceID") != null) {
            long celloId = (Long) session.getAttribute("printInvoiceID");
            session.removeAttribute("printInvoiceID");
    %>
    <script>
        window.open("Invoice_Cello.jsp?admissionid=<%=celloId%>");</script>
        <%
            }


        %>

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

                                        <form class="form-horizontal form-label-left"  enctype="multipart/form-data" action="../../AdmissionbyBranchReception" onsubmit="return valid();" method="post">
                                            <%                                               if (request.getParameter("asd") != null) {
                                                    int asd = Integer.parseInt(request.getParameter("asd"));

                                            %>
                                            <input type="hidden" name="inquiryid" value="<%=asd%>">
                                            <%} else {%>
                                            <input type="hidden" name="inquiryid" value="0">

                                            <%}

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
                                                                <input type="text" id="fname" name="fname" onkeypress="return alpha(event)" placeholder="First Name" class="form-control">

                                                            </div>


                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="mname" name="mname" onkeypress="return alpha(event)" placeholder="Middle Name" class="form-control">

                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="lname" name="lname" onkeypress="return alpha(event)" placeholder="Last Name" class="form-control">

                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="contact" name="contact" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="email" name="email" placeholder="Email" class="form-control">
                                                            </div>
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="mothername" name="mothername" onkeypress="return alpha(event)" placeholder="Name of Mother" class="form-control">

                                                            </div>
                                                            <!--                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
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
                                                    </div>-->
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                                <textarea id="address" placeholder="Address" required="required" class="form-control" name="address" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                                          data-parsley-validation-threshold="10"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                                                                <select class="form-control" id="occupation"  name="occupation" required>
                                                                    <option value="" selected>Occupation</option>
                                                                    <option value="Musician">Musician</option>
                                                                    <option value="Singer">Singer</option>
                                                                    <option value="Service">Service</option>
                                                                    <option value="Government Servant">Government Servant</option>
                                                                    <option value="Student">Student</option>
                                                                    <option value="Housewife">Housewife</option>
                                                                    <option value="others">others</option>
                                                                </select>
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="parentcontact" name="parentcontact" maxlength="10" placeholder="Parents Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="nationality" onkeypress="return alpha(event)" name="nationality" placeholder="Nationality" class="form-control">

                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <!--                                                            <input type="text" id="religion" name="religion" placeholder="Religion" class="form-control">-->
                                                                <select class="form-control" name="religion" id="religion" required>
                                                                    <option value="" selected>Religion</option>
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
                                                                <input type="text" id="qualification" name="qualification" placeholder="Qualification" class="form-control">
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                                                                <select class="form-control"  id="mothertongue" name="mothertongue" required >
                                                                    <option value="" selected>Mother Tongue</option>
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
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                                                            </div>
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group" id="fetchimage">

                                                            </div>

                                                        </div>


                                                    </div>

                                                    <br>   
                                                    <br>   
                                                    <br>   
                                                    <br>   
                                                    <br>   
                                                    <br>   
                                                    <br>   
                                                    <br>   
                                                    <br>   
                                                    <br>   

                                                </div>
                                                <div id="step-2">
                                                    <div class="row">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="datetimepicker1" name="dob" placeholder="Date Of Birth" class="form-control">
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <input type="text" id="age" name="age" placeholder="Age" readonly="" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                        </div>

                                                        <!--                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                                                                   <input type="file"  name="image" id="uploadFile" required="" class="form-control">
                                                        
                                                                                                                </div> -->
                                                    </div>
                                                    <div class="row">
                                                        <!--                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                                                                <input type="text" id="fathername" name="fathername" placeholder="Name of Father" class="form-control">
                                                                                                            </div>-->



                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <select class="form-control" id="gender" name="gender">
                                                                <option value="">Select Gender</option>
                                                                <option value="Male">Male</option>
                                                                <option value="Female">Female</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <select class="form-control durationn" id="duration" name="duration">
                                                                <option value="0">--Select Course Duration -</option>
                                                                <option value="1">One Month</option>
                                                                <option value="3">Three Month</option>
                                                                <option value="6">Six Month</option>
                                                                <option value="12">One Year</option>
                                                            </select>
                                                            <center > <span id="duration_" style="color:red"></span></center >
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
                                                            <select class="form-control" id="Paymentmode" name="Paymentmode">
                                                                <option value="0">Select Payment Mode</option>
                                                                <option value="1">Monthly</option>
                                                                <option value="3">Three Month</option>
                                                                <option value="6">Six Month</option>
                                                                <option value="12">One Year</option>
                                                            </select>
                                                            <center > <span id="Payment_mode" style="color:red"></span></center >
                                                        </div>

                                                    </div>

                                                    <div class="row">

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <dl class="dropdown  "> 

                                                                <dt class="form-control">
                                                                <a href="#">
                                                                    <span class="hida">-Select Days in Week -</span>    
                                                                    <p class="multiSel"></p>  
                                                                </a>
                                                                </dt>

                                                                <dd>
                                                                    <div class="mutliSelect ">
                                                                        <ul>


                                                                            <%                                  List<String> Days = new UserDao().initDaysList();

                                                                                for (String b : Days) {

                                                                            %>
                                                                            <li>
                                                                                <input type="checkbox"  name="days" value="<%=b.toString()%>" /><%=b.toString()%></li>


                                                                            <%                                                                               }

                                                                            %>


                                                                        </ul>
                                                                    </div>
                                                                </dd>

                                                            </dl>   </div>



                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <dl class="dropdown  "> 

                                                                <dt class="form-control">
                                                                <a href="#">
                                                                    <span class="hida1">-Select Course List -</span>    
                                                                    <p class="multiSel1"></p>  
                                                                </a>
                                                                </dt>

                                                                <dd>
                                                                    <div class="mutliSelect1 ">
                                                                        <ul>


                                                                            <%                                                                                List<Course> cs1 = new CourseDao().getAllCourse();
                                                                                for (Course c : cs1) {

                                                                            %>
                                                                            <li>
                                                                                <input type="checkbox"  name="coursename" value="<%=c.getCourseName()%>" /><%=c.getCourseName()%></li>


                                                                            <%                                                                               }

                                                                            %>


                                                                        </ul>
                                                                    </div>
                                                                </dd>

                                                            </dl>   </div>

                                                        <!--                                                        <div class="col-md-4 col-sm-4 col-xs-4 form-group"  >
                                                                                                                    <dl class="dropdown1"> 
                                                        
                                                                                                                        <dt>
                                                                                                                        <a href="#">
                                                        
                                                                                                                            <span class="hida1 col-md-12  col-sm-12 col-xs-12 " >       - Select Days in Week -    </span>  
                                                        
                                                                                                                            <p class="multiSel1"></p>  
                                                                                                                        </a>
                                                                                                                        </dt>
                                                        
                                                                                                                        <dd>
                                                                                                                            <div class="mutliSelect1">
                                                                                                                                <ul>
                                                        <%                                                                                List<String> Days1 = new UserDao().initDaysList();

                                                            for (String b : Days1) {

                                                        %>
                                                        <li>
                                                            <input type="checkbox" value="<%=b.toString()%>" name="days" /><%=b.toString()%></li>
                                                        <%
                                                            }

                                                        %>
                                                </ul>
                                            </div>
                                        </dd>

                                    </dl> 
                                </div>




                                <div class="col-md-4 col-sm-4 col-xs-4 form-group"  >
                                    <dl class="dropdown"> 

                                        <dt>
                                        <a href="#">

                                            <span class="hida col-md-12  col-sm-12 col-xs-12 " >       - Select Course Name -    </span>  

                                            <p class="multiSel"></p>  
                                        </a>
                                        </dt>

                                        <dd>
                                            <div class="mutliSelect">
                                                <ul>
                                                        <%                                                                                List<Course> cs2 = new CourseDao().getAllCourse();
                                                            for (Course c : cs1) {

                                                        %>
                                                        <li>
                                                            <input type="checkbox" value="<%=c.getCourseName()%>" name="coursename" /><%=c.getCourseName()%></li>
                                                        <%
                                                            }

                                                        %>
                                                </ul>
                                            </div>
                                        </dd>

                                    </dl> 
                                </div>-->



                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <dl class="dropdown "> 

                                                                <dt class="form-control">
                                                                <a href="#">
                                                                    <span class="hida2">-Select Batch Time  in Day -</span>    
                                                                    <p class="multiSel2"></p>  
                                                                </a>
                                                                </dt>

                                                                <dd>
                                                                    <div class="mutliSelect2 ">
                                                                        <ul>


                                                                            <%                               List<BatchTime> batch = new BatchTimeDa0().getAllBatchTime();

                                                                                for (BatchTime b : batch) {
                                                                                    if (b.getAdminOfBranch().getAdminId() == admin.getAdminId()) {
                                                                            %>
                                                                            <li>
                                                                                <input type="checkbox"  name="batchtime" value="<%=b.getBatchTiming()%>" ><%=b.getBatchTiming()%></li>


                                                                            <%                                                                               }
                                                                                }
                                                                            %>


                                                                        </ul>
                                                                    </div>
                                                                </dd>

                                                            </dl>   </div>


                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>

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
                                                            <input type="text" class="form-control priceup row0"   id="adfee" name="adfee" placeholder="Enter Fee" required>
                                                        </div>
                                                        <div class="col-md-4"></div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4"></div>
                                                        <div class="col-md-4">
                                                            <h4><strong>COURSE FEES PAYMENT</strong></h4>
                                                        </div>
                                                    </div><br>
                                                    <input type="hidden" id="rowcount" value="0" name="rowcount">
                                                    <div class="row form-group" id="allfees0">
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename0" id="Coursename0" class="form-control priceup "   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control row0 priceup" value="0" name="CourseFee0" id="CourseFee0" placeholder="Course Fee" required>
                                                        </div>
                                                    </div><br>
                                                    <div class="row form-group" id="allfees1">
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename1" id="Coursename1" class="form-control priceup"   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control row0 row1 priceup"  value="0" name="CourseFee1" id="CourseFee1" placeholder="Course Fee" required>
                                                        </div>
                                                    </div><br>
                                                    <div class="row form-group" id="allfees2">
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename2" id="Coursename2" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control coursefee row0 priceup row2"  value="0" name="CourseFee2" id="CourseFee2" placeholder="Course Fee" required>
                                                        </div>
                                                    </div><br>
                                                    <div class="row form-group" id="allfees3">
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename3" id="Coursename3" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control row0 priceup row3"  value="0" name="CourseFee3" id="CourseFee3" placeholder="Course Fee" required>
                                                        </div>
                                                    </div><br>
                                                    <div class="row form-group" id="allfees4">
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename4" id="Coursename4" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control priceup row0 row4"  value="0" name="CourseFee4" id="CourseFee4" placeholder="Course Fee" required>
                                                        </div>
                                                    </div><br>
                                                    <br>
                                                    </br>
                                                    <div class="row form-group" id="allfees">

                                                        <div class="col-md-4" id="cTotalFee">
                                                            <p><strong>Total Course Fee:</strong></p><br>
                                                            <input type="text" class="form-control" placeholder=""   name="coursetotalfee" id="coursetotalfee" value="0" readonly="readonly" required>
                                                        </div>
                                                        <div class="col-md-4" id="cTotalFee">
                                                            <p><strong>Admission Fee:</strong></p><br>
                                                            <input type="text" class="form-control" placeholder=""   name="admissonnfee" id="admissonnfee" value="0" readonly="readonly" required>
                                                        </div>
                                                        <div class="col-md-4" id="cTotalFee">
                                                            <p><strong>Total Fee:</strong></p><br>
                                                            <input type="text" class="form-control" placeholder=""   name="totalfee" id="totalfee" value="0" readonly="readonly" required>
                                                        </div>


                                                    </div>
                                                    <br>
                                                    <div class="row form-group" id="allfees">
                                                        <div class="col-md-4 remsinglefee" id="cFeeRem">
                                                            <p><strong>Discount in Percentage</strong></p><br>
                                                            <input type="text" placeholder="" name="discper" class="form-control priceup row0"  value="0"   id="discper"  required>
                                                        </div>
                                                        <div class="col-md-4 remsinglefee" id="cFeeRem">
                                                            <p><strong>Discount Amount</strong></p><br>
                                                            <input type="text" placeholder="" name="disamount" class="form-control" readonly="" value="0"   id="disamount"  required>
                                                        </div>
                                                        <div class="col-md-4 remsinglefee" id="cFeeRem">
                                                            <p><strong>Amount After Discount</strong></p><br>
                                                            <input type="text" placeholder="" name="finalamount" class="form-control" readonly="" value="0"  id="finalamount"  required>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="row form-group" id="allfees">
                                                        <div class="col-md-4" id="cFeePaid">
                                                            <p><strong>Total Advanced Fee</strong></p>
                                                            <input type="text"  class="form-control priceup row0" style="background-color: antiquewhite" name="totaladvancedfee" id="totaladvancedfee" value="0"  placeholder=""  required>
                                                            <input type="hidden" onkeypress="return isNumberKey(event)" name="recadv" id="recadv">
                                                            <center > <span id="Advance_paidd" style="color:red"> </span></center >
                                                        </div>

                                                        <div class="col-md-4 remsinglefee" id="cFeeRem">
                                                            <p><strong>Total Remaining Fee</strong></p>
                                                            <input type="text" placeholder="" name="totalremfee" style="background-color: aquamarine" class="form-control" value="0" onkeypress="return isNumberKey(event)"readonly="readonly" id="totalremfee"required>
                                                        </div>
                                                        <div class="col-md-4 ">
                                                            <p><strong>Due Date</strong></p>
                                                            <input type="text" id="datetimepicker4" required="" name="duedate0"  placeholder="Due Date" class="form-control">
                                                        </div>

                                                    </div>

                                                    <br><br>
                                                </div>

                                                <div id="step-4">
                                                    <div class="row form-group" >

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <select class="form-control" id="paymode" name="paymode">
                                                                <option value="">Select Payment Type</option>
                                                                <option value="Card">Card</option>
                                                                <option value="Cash">Cash</option>
                                                                <option value="Paytm">Paytm</option>
                                                                <option value="Net Banking">Net Banking</option>
                                                                <option value="Net Banking">Cheque</option>
                                                            </select>
                                                            <center > <span id="Pay_mode" style="color:red"> </span></center >
                                                        </div>
                                                        <div class="col-md-4 " >

                                                            <input type="text" placeholder="Cheque No/Transction No" name="chequeno" class="form-control"     id="chequeno"  required>
                                                        </div>
                                                        <div class="col-md-4 remsinglefee" id="cFeeRem">

                                                            <input type="text" placeholder="Bank Name" name="bankname" class="form-control"   id="bankname"  required>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                            <!-- End SmartWizard Content -->
                                            <input type="hidden" value="" placeholder="Bank Name" name="amountinword" class="form-control"   id="amountinword"  required>
                                        </form>
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
                width: 100%;
            }

            .dropdown dt a span,
            .multiSel span {
                cursor: pointer;
                display: inline-block;
                padding: 0 3px 2px 0;
            }
            .multiSel1 span {
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


        <script src="../production/js/Swal.js" type="text/javascript"></script>
        <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">

                                                                function alpha(e) {
                                                                    var k;
                                                                    document.all ? k = e.keyCode : k = e.which;
                                                                    return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8);
                                                                }

                                                                function valid()
                                                                {

                                                                    var rollno = /^[0-9]*$/;
                                                                    // var phoneno = /^\d{10}$/;
                                                                    var letters = /^[A-Za-z]+$/;
                                                                    var fname = document.getElementById('fname').value;

                                                                    var lname = document.getElementById('lname').value;
                                                                    var nationality = document.getElementById('nationality').value;
                                                                    var Paymentmode = document.getElementById('Paymentmode').value;
                                                                    var duration = document.getElementById('duration').value;
                                                                    var paymode = document.getElementById('paymode').value;
                                                                    var parentcontact = document.getElementById('parentcontact').value;
                                                                    var contact = document.getElementById('contact').value;
                                                                    var count = document.getElementById('parentcontact').value.length;
                                                                    var count1 = document.getElementById('contact').value.length;
                                                                    var age = document.getElementById('age').value;
                                                                     var rowcount = document.getElementById('rowcount').value;
                                                                    var datetimepicker4 = document.getElementById('datetimepicker4').value;

//                                                                        document.getElementById("f_name").innerHTML = "";
//                                                                        document.getElementById("l_name").innerHTML = "";
//                                                                        document.getElementById("Nationality_").innerHTML = "";
//                                                                        document.getElementById("duration_").innerHTML = "";
//                                                                        document.getElementById("Payment_mode").innerHTML = "";
//                                                                        document.getElementById("Pay_mode").innerHTML = "";
//                                                                        document.getElementById("Upload_file").innerHTML = "";
//                                                                        document.getElementById("Contact_No").innerHTML = "";
//                                                                        document.getElementById("Contact_No1").innerHTML = "";
//                                                                    var nme = document.getElementById("uploadFile");
//                                                                    alert(nme);
//                                                                    alert(nme.value);
//                                                                        alert("fdgd"); 


                                                                    if (fname.match(letters))
                                                                    {

                                                                        if (lname.match(letters))
                                                                        {
                                                                            if (count1 == 10)
                                                                            {
                                                                                if (count == 10)
                                                                                {
                                                                                    if (duration != 0)
                                                                                    {

                                                                                        if (Paymentmode != 0)
                                                                                        {
                                                                                            if (paymode != 0)
                                                                                            {
//                                                                                                if (nme.value.length > 4)
//                                                                                                {
//                                                                                                }
//                                                                                                else
//                                                                                                {
//                                                                                                    swal({
//                                                                                                        title: 'These is not allowed.!',
//                                                                                                        html: $('<div>')
//                                                                                                                .addClass('some-class')
//                                                                                                                .text('Select Student Image.'),
//                                                                                                        animation: false,
//                                                                                                        customClass: 'animated tada'
//                                                                                                    })
//                                                                                                    return false;
//                                                                                                }

                                                                                                if (age > 0)
                                                                                                {
                                                                            if (rowcount == 0)
                                                                            {
                                                                                swal({
                                                                                    title: 'These is not allowed.!',
                                                                                    html: $('<div>')
                                                                                            .addClass('some-class')
                                                                                            .text('Add Atleast One Course.....'),
                                                                                    animation: false,
                                                                                    customClass: 'animated tada'
                                                                                })
                                                                                return false;
                                                                            } else
                                                                            {
                                                                                if(datetimepicker4=="")
                                                                                {
                                                                                    swal({
                                                                                    title: 'These is not allowed.!',
                                                                                    html: $('<div>')
                                                                                            .addClass('some-class')
                                                                                            .text('Select Due Date.....'),
                                                                                    animation: false,
                                                                                    customClass: 'animated tada'
                                                                                })
                                                                                return false;
                                                                                }
                                                                                else
                                                                                {
                                                                                     return true;
                                                                                }
                                                                               
                                                                            }

                                                                        }
                                                                                                else
                                                                                                {

                                                                                                    swal({
                                                                                                        title: 'These is not allowed.!',
                                                                                                        html: $('<div>')
                                                                                                                .addClass('some-class')
                                                                                                                .text('The First Name has special characters.'),
                                                                                                        animation: false,
                                                                                                        customClass: 'animated tada'
                                                                                                    })
                                                                                                    return false;
                                                                                                }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                swal({
                                                                                                    title: 'Select Payment Type ',
                                                                                                    input: 'select',
                                                                                                    inputOptions: {
                                                                                                        'Card': 'Card',
                                                                                                        'Paytm': 'Paytm',
                                                                                                        'Net Banking': 'Net Banking',
                                                                                                        'Cheque': 'Cheque',
                                                                                                        'Cash': 'Cash'
                                                                                                    },
                                                                                                    inputPlaceholder: 'Select Payment Type',
                                                                                                    showCancelButton: true,
                                                                                                    inputValidator: function(value) {
                                                                                                        return new Promise(function(resolve, reject) {
                                                                                                            if (value === 'Card' || value === 'Paytm' || value === 'Net Banking' || value === 'Cheque' || value === 'Cash')
                                                                                                            {

                                                                                                                $('#paymode').val(value);
                                                                                                                resolve()
                                                                                                            } else {
                                                                                                                reject('You need to select Payment Type :)')
                                                                                                            }
                                                                                                        })
                                                                                                    }
                                                                                                }).then(function(result) {
                                                                                                    swal({
                                                                                                        type: 'success',
                                                                                                        html: 'You selected: ' + result
                                                                                                    })
                                                                                                })
                                                                                                return false;
                                                                                            }
                                                                                        }

                                                                                        else
                                                                                        {
                                                                                            swal({
                                                                                                title: 'Select Payment Mode ',
                                                                                                input: 'select',
                                                                                                inputOptions: {
                                                                                                    'One Month': 'Monthly',
                                                                                                    'Three Month': 'Three Month',
                                                                                                    'Six Month': 'Six Month',
                                                                                                    'One Year': 'One Year'
                                                                                                },
                                                                                                inputPlaceholder: 'Select Payment Mode',
                                                                                                showCancelButton: true,
                                                                                                inputValidator: function(value) {
                                                                                                    return new Promise(function(resolve, reject) {
                                                                                                        if (value === 'One Month' || value === 'Three Month' || value === 'Six Month' || value === 'One Year')
                                                                                                        {
                                                                                                            if (value === 'One Month') {
                                                                                                                $('#Paymentmode').val(1);
                                                                                                            } else if (value === 'Three Month') {
                                                                                                                $('#Paymentmode').val(3);
                                                                                                            }
                                                                                                            else if (value === 'Six Month') {
                                                                                                                $('#Paymentmode').val(6);
                                                                                                            } else
                                                                                                            {
                                                                                                                $('#Paymentmode').val(12);
                                                                                                            }
                                                                                                            resolve()
                                                                                                        } else {
                                                                                                            reject('You need to select Payment Mode :)')
                                                                                                        }
                                                                                                    })
                                                                                                }
                                                                                            }).then(function(result) {
                                                                                                swal({
                                                                                                    type: 'success',
                                                                                                    html: 'You selected: ' + result
                                                                                                })
                                                                                            })
                                                                                            return false;
                                                                                        }
                                                                                    }
                                                                                    else
                                                                                    {

                                                                                        swal({
                                                                                            title: 'Select Course Duration ',
                                                                                            input: 'select',
                                                                                            inputOptions: {
                                                                                                'One Month': 'One Month',
                                                                                                'Three Month': 'Three Month',
                                                                                                'Six Month': 'Six Month',
                                                                                                'One Year': 'One Year'
                                                                                            },
                                                                                            inputPlaceholder: 'Select Course Duration',
                                                                                            showCancelButton: true,
                                                                                            inputValidator: function(value) {
                                                                                                return new Promise(function(resolve, reject) {
                                                                                                    if (value === 'One Month' || value === 'Three Month' || value === 'Six Month' || value === 'One Year')
                                                                                                    {
                                                                                                        if (value === 'One Month') {
                                                                                                            $('#duration').val(1);
                                                                                                        } else if (value === 'Three Month') {
                                                                                                            $('#duration').val(3);
                                                                                                        }
                                                                                                        else if (value === 'Six Month') {
                                                                                                            $('#duration').val(6);
                                                                                                        } else
                                                                                                        {
                                                                                                            $('#duration').val(12);
                                                                                                        }
                                                                                                        resolve()
                                                                                                    } else {
                                                                                                        reject('You need to select Ukraine :)')
                                                                                                    }
                                                                                                })
                                                                                            }
                                                                                        }).then(function(result) {
                                                                                            swal({
                                                                                                type: 'success',
                                                                                                html: 'You selected: ' + result
                                                                                            })
                                                                                        })
                                                                                        return false;
                                                                                    }
                                                                                } else {
                                                                                    swal({
                                                                                        title: 'Enter  Correct Parents Mobile No',
                                                                                        input: 'number',
                                                                                        showCancelButton: true,
                                                                                        animation: false,
                                                                                        inputValidator: function(value) {
                                                                                            return new Promise(function(resolve, reject) {
                                                                                                if (value.length == 10)
                                                                                                {

                                                                                                    $('#parentcontact').val(value);
                                                                                                    resolve()
                                                                                                } else {
                                                                                                    reject('You need to Enter Mobile No :)')
                                                                                                }
                                                                                            })
                                                                                        }
                                                                                    }).then(function(result) {
                                                                                        swal({
                                                                                            type: 'success',
                                                                                            html: 'You Enter ' + result
                                                                                        })
                                                                                    })

                                                                                    return false;
                                                                                }
                                                                            } else
                                                                            {
                                                                                swal({
                                                                                    title: 'Enter Correct Mobile No',
                                                                                    input: 'number',
                                                                                    showCancelButton: true,
                                                                                    animation: false,
                                                                                    inputValidator: function(value) {
                                                                                        return new Promise(function(resolve, reject) {
                                                                                            if (value.length == 10)
                                                                                            {

                                                                                                $('#contact').val(value);
                                                                                                resolve()
                                                                                            } else {
                                                                                                reject('You need to Enter Mobile No :)')
                                                                                            }
                                                                                        })
                                                                                    }
                                                                                }).then(function(result) {
                                                                                    swal({
                                                                                        type: 'success',
                                                                                        html: 'You Enter ' + result
                                                                                    })
                                                                                })

                                                                                return false;
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            swal({
                                                                                title: 'Enter  Last Name',
                                                                                input: 'text',
                                                                                showCancelButton: true,
                                                                                inputValidator: function(value) {
                                                                                    return new Promise(function(resolve, reject) {
                                                                                        if (value)
                                                                                        {

                                                                                            $('#lname').val(value);
                                                                                            resolve()
                                                                                        } else {
                                                                                            reject('You need to Enter Last Name :)')
                                                                                        }
                                                                                    })
                                                                                }
                                                                            }).then(function(result) {
                                                                                swal({
                                                                                    type: 'success',
                                                                                    html: 'You Enter ' + result
                                                                                })
                                                                            })


                                                                            return false;
                                                                        }

                                                                    }
                                                                    else
                                                                    {
                                                                        swal({
                                                                            title: 'Enter  First Name',
                                                                            input: 'text',
                                                                            showCancelButton: true,
                                                                            inputValidator: function(value) {
                                                                                return new Promise(function(resolve, reject) {
                                                                                    if (value)
                                                                                    {

                                                                                        $('#fname').val(value);
                                                                                        resolve()
                                                                                    } else {
                                                                                        reject('You need to Enter First Name :)')
                                                                                    }
                                                                                })
                                                                            }
                                                                        }).then(function(result) {
                                                                            swal({
                                                                                type: 'success',
                                                                                html: 'You Enter ' + result
                                                                            })
                                                                        })


                                                                        return false;
                                                                    }


                                                                }

        </script>
        <script type="text/javascript">
            $('#document').ready(function() {
                $('.amounthide').hide();
//                                                                    $('#f_name').hide();





                $('#fname').blur(function() {

                    var fname = $('#fname').val();
                    var letters = /^[A-Za-z]+$/;
                    document.getElementById("f_name").innerHTML = "";
                    if (fname.match(letters))
                    {
                    }
                    else
                    {
                        swal({
                            title: 'These is not allowed.!',
                            html: $('<div>')
                                    .addClass('some-class')
                                    .text('The First Name has special characters.'),
                            animation: false,
                            customClass: 'animated tada'
                        })

                    }
                });
                $('#lname').blur(function() {

                    var lname = $('#lname').val();
                    var letters = /^[A-Za-z]+$/;
                    document.getElementById("l_name").innerHTML = "";
                    if (lname.match(letters))
                    {
                    }
                    else
                    {
                        swal({
                            title: 'These is not allowed.!',
                            html: $('<div>')
                                    .addClass('some-class')
                                    .text('The Last Name has special characters.'),
                            animation: false,
                            customClass: 'animated tada'
                        })


                    }
                });
                $('#contact').blur(function() {

                    var contact = $('#contact').val().length;
                    if (contact == 10)
                    {
                    }
                    else
                    {
                        swal({
                            title: 'Enter Correct Mobile No',
                            input: 'number',
                            showCancelButton: true,
                            animation: false,
                            inputValidator: function(value) {
                                return new Promise(function(resolve, reject) {
                                    if (value.length == 10)
                                    {

                                        $('#contact').val(value);
                                        resolve()
                                    } else {
                                        reject('You need to Enter Mobile No :)')
                                    }
                                })
                            }
                        }).then(function(result) {
                            swal({
                                type: 'success',
                                html: 'You Enter ' + result
                            })
                        })


                    }
                });
                $('#parentcontact').blur(function() {

                    var contact = $('#parentcontact').val().length;
                    if (contact == 10)
                    {
                    }
                    else
                    {
                        swal({
                            title: 'Enter  Correct Parents Mobile No',
                            input: 'number',
                            showCancelButton: true,
                            animation: false,
                            inputValidator: function(value) {
                                return new Promise(function(resolve, reject) {
                                    if (value.length == 10)
                                    {

                                        $('#parentcontact').val(value);
                                        resolve()
                                    } else {
                                        reject('You need to Enter Mobile No :)')
                                    }
                                })
                            }
                        }).then(function(result) {
                            swal({
                                type: 'success',
                                html: 'You Enter ' + result
                            })
                        })


                    }
                });
                $('#nationality').blur(function() {

                    var nationality = $('#nationality').val();
                    var letters = /^[A-Za-z]+$/;
                    document.getElementById("Nationality_").innerHTML = "";
                    if (nationality.match(letters))
                    {
                    }
                    else
                    {
                        swal({
                            title: 'These is not allowed.!',
                            html: $('<div>')
                                    .addClass('some-class')
                                    .text('The Nationality  has special characters.'),
                            animation: false,
                            customClass: 'animated tada'
                        })


                    }
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
                        var id_menu = $('.multiSel').text();
//                                    alert()                                        alert(id_menu);
                        var ss = id_menu.split(",");
                        var rowcount = 0;
                        for (var i in ss) {
                            if (ss[i])
                            {
                                rowcount++;
//                                                                                alert(rowcount);


//                                                                                 alert(rowcount);
                            }
                            if (rowcount == 0)
                            {
                                title = "-Select Days in Week -"
                                var html = '<span title="' + "Select Course" + '">' + title + '</span>';
                                $('.multiSel').append(html);
                            }
                        }
                    }
                });
                $('.mutliSelect2 input[type="checkbox"]').on('click', function() {

                    var title = $(this).closest('.mutliSelect2').find('input[type="checkbox"]').val(),
                            title = $(this).val() + ",";
                    if ($(this).is(':checked')) {
                        var html = '<span title="' + title + '">' + title + '</span>';
                        $('.multiSel2').append(html);
                        $(".hida2").hide();
                    } else {
                        $('span[title="' + title + '"]').remove();
                        var ret = $(".hida2");
                        $('.dropdown dt a').append(ret);
                        var id_menu = $('.multiSel2').text();
//                                    alert()                                        alert(id_menu);
                        var ss = id_menu.split(",");
                        var rowcount = 0;
                        for (var i in ss) {
                            if (ss[i])
                            {
                                rowcount++;
//                                                                                alert(rowcount);


//                                                                                 alert(rowcount);
                            }
                            if (rowcount == 0)
                            {
                                title = "-Select Batch Time in Day -"
                                var html = '<span title="' + "Select Course" + '">' + title + '</span>';
                                $('.multiSel2').append(html);
                            }
                        }
                    }
                });
                $('.mutliSelect1 input[type="checkbox"]').on('click', function() {
                    $('#allfees1').hide();
                    $('#allfees2').hide();
                    $('#allfees3').hide();
                    $('#allfees4').hide();
                    $('#allfees5').hide();
                    document.getElementById("Payment_mode").innerHTML = "";
                    var Paymentmode = $('#Paymentmode').val();
                    if (Paymentmode == 0)
                    {
                        {

                            var title = $(this).closest('.mutliSelect1').find('input[type="checkbox"]').val(),
                                    title = $(this).val() + ",";
                            var rowcount = 0;
                            if ($(this).is(':checked')) {
                                var html = '<span title="' + title + '">' + title + '</span>';
                                $('.multiSel1').append(html);
                                $(".hida1").hide();
                                var id_menu = $('.multiSel1').text();
//                                                                            alert(id_menu);
                                var ss = id_menu.split(",");
                                var rowcount = 0;
                                for (var i in ss) {
                                    if (ss[i])
                                    {
                                        rowcount++;
//                                                                                alert(rowcount);
//                                                                                                   alert(ss[i])
                                        $("#allfees" + i).show();
                                        $('#Coursename' + i).val(ss[i]);
//                                                                                 alert(rowcount);
                                    }
                                }
                                $('#rowcount').val(rowcount);
                            } else {
                                $('span[title="' + title + '"]').remove();
                                var ret = $(".hida1");
                                $('.dropdown dt a').append(ret);
                                var id_menu = $('.multiSel1').text();
//                                    alert()                                        alert(id_menu);
                                var ss = id_menu.split(",");
                                var rowcount = 0;
                                for (var i in ss) {
                                    if (ss[i])
                                    {
                                        rowcount++;
//                                                                                alert(rowcount);

                                        $("#allfees" + i).show();
                                        $('#Coursename' + i).val(ss[i]);
//                                                                                 alert(rowcount);
                                    }
                                    if (rowcount == 0)
                                    {
                                        title = "-Select Course List-"
                                        var html = '<span title="' + "Select Course" + '">' + title + '</span>';
                                        $('.multiSel1').append(html);
                                    }
                                }
                                $('#rowcount').val(rowcount);
                            }
                        }
                        swal({
                            title: 'Select Payment Mode First',
                            input: 'select',
                            inputOptions: {
                                'One Month': 'Monthly',
                                'Three Month': 'Three Month',
                                'Six Month': 'Six Month',
                                'One Year': 'One Year'
                            },
                            inputPlaceholder: 'Select Payment Mode',
                            showCancelButton: true,
                            inputValidator: function(value) {
                                return new Promise(function(resolve, reject) {
                                    if (value === 'One Month' || value === 'Three Month' || value === 'Six Month' || value === 'One Year')
                                    {
                                        if (value === 'One Month') {
                                            $('#Paymentmode').val(1);
                                        } else if (value === 'Three Month') {
                                            $('#Paymentmode').val(3);
                                        }
                                        else if (value === 'Six Month') {
                                            $('#Paymentmode').val(6);
                                        } else
                                        {
                                            $('#Paymentmode').val(12);
                                        }
                                        resolve()
                                    } else {
                                        reject('You need to select Payment Mode :)')
                                    }
                                })
                            }
                        }).then(function(result) {
                            swal({
                                type: 'success',
                                html: 'You selected: ' + result
                            })
                        })



                    }
                    else {

                        var title = $(this).closest('.mutliSelect1').find('input[type="checkbox"]').val(),
                                title = $(this).val() + ",";
                        var rowcount = 0;
                        if ($(this).is(':checked')) {
                            var html = '<span title="' + title + '">' + title + '</span>';
                            $('.multiSel1').append(html);
                            $(".hida1").hide();
                            var id_menu = $('.multiSel1').text();
//                                                                            alert(id_menu);
                            var ss = id_menu.split(",");
                            var rowcount = 0;
                            for (var i in ss) {
                                if (ss[i])
                                {
                                    rowcount++;
//                                                                                alert(rowcount);
//                                                                                                   alert(ss[i])
                                    $("#allfees" + i).show();
                                    $('#Coursename' + i).val(ss[i]);
//                                                                                 alert(rowcount);
                                }
                            }
                            $('#rowcount').val(rowcount);
                        } else {
                            $('span[title="' + title + '"]').remove();

                            var ret = $(".hida1");
//                            alert(ret);
                            $('.dropdown dt a').append(ret);
                            var id_menu = $('.multiSel1').text();
//                                                                            alert(id_menu);
                            var ss = id_menu.split(",");
                            var rowcount = 0;
                            for (var i in ss) {
                                if (ss[i])
                                {
                                    rowcount++;
//                                                                                alert(rowcount);

                                    $("#allfees" + i).show();
                                    $('#Coursename' + i).val(ss[i]);
//                                                                                 alert(rowcount);
                                }
                            }
//                            alert(rowcount);
                            if (rowcount == 0)
                            {
                                title = "-Select Course List-"
                                var html = '<span title="' + "Select Course" + '">' + title + '</span>';
                                $('.multiSel1').append(html);
                            }
                            $('#rowcount').val(rowcount);
                        }
                    }
                });
                $('.row0').on('keyup change', function() {


                    var adfee = $('#adfee').val();
                    var Paymentmode = $('#Paymentmode').val();
                    var discper = $('#discper').val();
                    var totaladvancedfee = $('#totaladvancedfee').val();
                    var rowcount = $('#rowcount').val();
                    var totalcoursefee = 0;
                    var i = 0;
                    for (i = 0; i < rowcount; i++)
                    {
                        var cou = $('#CourseFee' + i).val();
                        if (cou) {
                            cou = parseInt(cou) * parseInt(Paymentmode);
                            //                                                                                alert(cou);
                            totalcoursefee = parseInt(totalcoursefee) + parseInt(cou);
                        }
                    }
                    $('#coursetotalfee').val(totalcoursefee);
                    //                                                                                alert(totalcoursefee);
                    $('#admissonnfee').val(adfee);
                    var totalfee = parseInt(adfee) + parseInt(totalcoursefee);
                    $('#totalfee').val(totalfee);
                    var discountamount = discper * totalfee / 100;
                    $('#disamount').val(discountamount);
                    $('#finalamount').val(parseInt(totalfee) - parseInt(discountamount));
                    document.getElementById("Advance_paidd").innerHTML = "";
                    if ((parseInt(totalfee) - parseInt(discountamount)) >= parseInt(totaladvancedfee))
                    {

                        $('#totalremfee').val(parseInt(totalfee) - parseInt(discountamount) - parseInt(totaladvancedfee));
                        $('#amountinword').val(converAmount(parseInt(totaladvancedfee)));
                    } else
                    {
                        swal({
                            title: 'Enter Correct Advanced Payment',
                            html: $('<div>')
                                    .addClass('some-class')
                            ,
                            animation: false,
                            customClass: 'animated tada'
                        })

                        $('#totalremfee').val(0);
                    }
                });
                $("#datetimepicker1").on("dp.change", function(e) {
                    var year = new Date(e.date).getFullYear();
                    var month = new Date(e.date).getMonth() + 1;
                    var currentYear = new Date().getFullYear();
                    var currentMonth = new Date().getMonth() + 1;
                    var age = currentYear - year;
                    if ((currentMonth - month) < 0)
                        age--;
                    if (age > 0)
                    {
                        $('#age').val(age);
                    }
                    else
                    {
                        swal({
                            title: 'These is not allowed.!',
                            html: $('<div>')
                                    .addClass('some-class')
                                    .text('Select Correct Birth Date.'),
                            animation: false,
                            customClass: 'animated tada'
                        })
                    }
                });

                $("#datetimepicker2").on("dp.change", function(e) {
                    var duration = $('#duration').val();
                    duration = parseInt(duration);
                    document.getElementById("duration_").innerHTML = "";
                    if (duration == 0)
                    {
                        swal({
                            title: 'Select Course Duration First',
                            input: 'select',
                            inputOptions: {
                                'One Month': 'One Month',
                                'Three Month': 'Three Month',
                                'Six Month': 'Six Month',
                                'One Year': 'One Year'
                            },
                            inputPlaceholder: 'Select Course Duration',
                            showCancelButton: true,
                            inputValidator: function(value) {
                                return new Promise(function(resolve, reject) {
                                    if (value === 'One Month' || value === 'Three Month' || value === 'Six Month' || value === 'One Year')
                                    {
                                        if (value === 'One Month') {
                                            $('#duration').val(1);
                                        } else if (value === 'Three Month') {
                                            $('#duration').val(3);
                                        }
                                        else if (value === 'Six Month') {
                                            $('#duration').val(6);
                                        } else
                                        {
                                            $('#duration').val(12);
                                        }
                                        resolve()
                                    } else {
                                        reject('You need to select Ukraine :)')
                                    }
                                })
                            }
                        }).then(function(result) {
                            swal({
                                type: 'success',
                                html: 'You selected: ' + result
                            })
                        })

                    }
                    else {
                        var today = new Date(e.date);
//                        alert(today);
                        var currMonth = today.getMonth() + duration;
                        var secondInstallmentDate = new Date(today.setMonth(currMonth));
                        var month = secondInstallmentDate.getMonth() + 1;
                        var year = new Date(secondInstallmentDate).getFullYear();
                        var date5 = new Date(secondInstallmentDate).getDate();
                        $('#DueDate').val(date5 + "/" + month + "/" + year);
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


            });</script>


        <script type="text/javascript">
            $(document).ready(function() {

                $('#mob_email').blur(function() {

                    var studEmail = $('#mob_email').val();
                    $.get("StudentEnquiryAjax.jsp", {studEmail: studEmail}, function(data) {
                        //   alert('sucess');
                        $('#output').html(data);
                    });
                });
                $('#duration').change(function() {

                    var duration = $('#duration').val();
                    var duration1 = $('#datetimepicker2').val();


                    var ss = duration1.split("/");

                    var date = ss[1].concat("/");
                    date = date.concat(ss[0]);
                    date = date.concat("/");
                    date = date.concat(ss[2]);


                    var today = new Date(date);
//                    alert(today);

//                        alert(today);
                    var currMonth = today.getMonth() + parseInt(duration);
                    var secondInstallmentDate = new Date(today.setMonth(currMonth));
                    var month = secondInstallmentDate.getMonth() + 1;
                    var year = new Date(secondInstallmentDate).getFullYear();
                    var date5 = new Date(secondInstallmentDate).getDate();
                    $('#DueDate').val(date5 + "/" + month + "/" + year);
                });
                $('#captureimage').click(function() {
                    alert("fadsg");

                    $.get("CaptureImageAjax.jsp", {}, function(data) {
                        //   alert('sucess');

                    });
                });


//                $('#coursename').change(function() {
//                    $('#allfees1').hide();
//                    $('#allfees2').hide();
//                    $('#allfees3').hide();
//                    $('#allfees4').hide();
//                    var id_menu = $(this).val().join();
//                    var ss = id_menu.split(",");
//                    var rowcount = 0;
//                    $('#allfees0').hide();
//                    var id_menu = $(this).val().join();
//                    var ss = id_menu.split(",");
//                    var rowcount = 0;
//                    for (var i in ss) {
//                        rowcount++;
//                        //                    alert(ss[i])
//                        $("#allfees" + i).show();
//                        $('#Coursename' + i).val(ss[i]);
//                    }
//                    $('#rowcount').val(rowcount);
//                });
                function isNumberKey(evt) {

                    var charCode = (evt.which) ? evt.which : evt.keyCode
                    if (charCode != 46 && charCode > 31
                            && (charCode < 48 || charCode > 57))
                        return false;
                    return true;
                }

            });
        </script>

    </body>
</html>