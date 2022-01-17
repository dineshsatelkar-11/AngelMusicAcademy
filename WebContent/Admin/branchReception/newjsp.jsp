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
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
    <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
    <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>


    <script type="text/javascript">
        $(document).ready(function() {
            $(".hide_gst").hide();
            $(".hide_price").hide();
            $(".hideall").hide();
            $(".hide_qnt").hide();
            $(".hide_ship").hide();
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
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->
                <%     AdmissionDao cd = new AdmissionDao();
                    int id = Integer.parseInt(request.getParameter("accountid"));
                    CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                    CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(id);

                    Admission p = cd.getAdmissionByAccount(CustomerAccount);

                    String ImgPath1 = p.getImage();


                %>
                <!-- page content -->
                <div class="right_col" role="main">
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
                                            <h3>Samuel Doe</h3>

                                            <ul class="list-unstyled user_data">
                                                <li><i class="fa fa-map-marker user-profile-icon"></i> <%=p.getAddress()%>
                                                </li>

                                                <li>
                                                    <i class="fa fa-briefcase user-profile-icon"></i> <%=p.getOccupation()%>
                                                </li>

                                                <li class="m-top-xs">
                                                    <i class="fa fa-external-link user-profile-icon"></i>
                                                    <a href="StudentProfile.jsp?asd=<%=p.getAdmissionId()%>" ><%=p.getEmail()%></a>
                                                </li>
                                            </ul>

                                            <a href="StudentProfile.jsp?asd=<%=p.getAdmissionId()%>" class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>Edit Profile</a>
                                            <br />



                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-12">



                                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                <ul id="myTab" class="nav nav-tabs bar_tabs responsive" role="tablist">
                                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Payment</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Course Details</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Upload Video</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab3" data-toggle="tab" aria-expanded="false">Upload PDF</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content5" role="tab" id="profile-tab4" data-toggle="tab" aria-expanded="false">Admission Details</a>
                                                    </li>
                                                </ul>
                                                <div id="myTabContent" class="tab-content">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                                                        <div class="x_content">
                                                            <form action="../../UpdateStudentPayment" onsubmit="return valid()" class="form-horizontal form-label-left" data-parsley-validate method="get">


                                                                <%

                                                                    Admission admission = p;
                                                                    int i = 0;
                                                                    int j = admission.getNoofCourse();
                                                                    int l = admission.getPaymentmodecount();
                                                                    int coursefee = 0;
                                                                    for (int k = 0; k < j; k++) {
                                                                        if (k == 0) {
                                                                            int fee = admission.getCourseFee1();
                                                                            fee = fee * l;
                                                                            coursefee = coursefee + fee;
                                                                        } else if (k == 1) {
                                                                            int fee = admission.getCourseFee2();
                                                                            fee = fee * l;
                                                                            coursefee = coursefee + fee;
                                                                        } else if (k == 2) {
                                                                            int fee = admission.getCourseFee3();
                                                                            fee = fee * l;
                                                                            coursefee = coursefee + fee;
                                                                        } else if (k == 3) {
                                                                            int fee = admission.getCourseFee4();
                                                                            fee = fee * l;
                                                                            coursefee = coursefee + fee;
                                                                        } else if (k == 4) {
                                                                            int fee = admission.getCourseFee5();
                                                                            fee = fee * l;
                                                                            coursefee = coursefee + fee;
                                                                        }
                                                                    }
                                                                %>

                                                                <span class="section">Payment Info</span>
                                                                <input type="hidden" value="<%=admission.getAdmissionId()%>" id="studentid" name="studentid">
                                                                <div class="row">

                                                                    <div class="col-md-3">
                                                                        <center >Previous Balance</center>
                                                                        <input type="text" id="pbal" name="pbal" readonly="" style="text-align: center;background-color: aqua" value="<%=admission.getRemaininFee()%>" required="required" class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <center >Course Fee</center>
                                                                        <input type="text" id="Course_fee" readonly=""  style="text-align: center;background-color: aqua" value="<%=coursefee%>"  name="Course_fee"  class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <center >Total Amount</center>
                                                                        <input type="number" readonly="" style="text-align: center;background-color: aqua "  id="totalAmount" value="<%=coursefee + admission.getRemaininFee()%>" name="beforedisc" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <center > <span id="payment_paid_hide" style="color:red"></span></center >
                                                                        <center >Paid Amount</center>
                                                                        <input type="text" id="paidAmount" style="text-align: center"   value="0" name="paidAmount" required="required" data-validate-minmax="10,100" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">
                                                                    </div>
                                                                </div>
                                                                <br>

                                                                <div class="row">


                                                                    <div class="col-md-3">
                                                                        <center >Remaining Amount</center>
                                                                        <input type="number" readonly="" id="remaining_amount" style="text-align: center;background-color: aqua"  value="0" name="remaining_amount" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <center > <span id="payment_mode_hide" style="color:red"></span></center >
                                                                        <center >Select Payment Type</center>
                                                                        <select class="form-control" style="text-align: center" required="required" id="paymode" name="paymode">
                                                                            <option value="">Select Payment Type</option>
                                                                            <option value="Card">Card</option>
                                                                            <option value="Cash">Cash</option>
                                                                            <option value="Paytm">Paytm</option>
                                                                            <option value="Net Banking">Net Banking</option>
                                                                            <option value="Net Banking">Cheque</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <div id="chequeno">
                                                                            <center >Cheque No/Transction No  </center>
                                                                            <input type="text" style="text-align: center"  placeholder="Cheque No/Transction No" name="chequeno" class="form-control"       >
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <center >Bank Name  </center>
                                                                        <input type="text" placeholder="Bank Name"  style="text-align: center"  name="bankname" class="form-control"   id="bankname"  >   
                                                                    </div>
                                                                </div>
                                                                <br>

                                                                <div class="row">


                                                                    <div class="col-md-3" id="nextfollow">
                                                                        <center >Next Payment Date  </center>
                                                                        <input type="date" id="datetimepicker2" readonly="" style="text-align: center"  name="nextFollowdate" placeholder="Next Follow Up Date" class="form-control">
                                                                    </div>
                                                                    <div class="col-md-3" id="nextfollow1">
                                                                        <center >Next Payment Date  </center>
                                                                        <input type="date" id="datetimepicker2"  style="text-align: center"  name="nextFollowdate1" placeholder="Next Follow Up Date" class="form-control">
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <br>
                                                                        <button type="reset" class="btn btn-primary">Reset</button>
                                                                        <button type="submit" class="btn btn-success">Submit</button>
                                                                    </div>

                                                                </div>
                                                                <br>



                                                                <input type="hidden" value="" placeholder="Bank Name" name="amountinword" class="form-control"   id="amountinword"  required>
                                                            </form>
                                                        </div>

                                                    </div>
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                                        <div class="x_content">
                                                            <br />
                                                            <form class="form-horizontal form-label-left"   action="../../StudentAddCourse"  method="post">


                                                                <input type="hidden" id="studentid" name="studentid" value="<%=p.getAdmissionId()%>">
                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" style="color: white">Select Course</label>
                                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                                        <select class="form-control" id="course" name="course" style="width:326px;">
                                                                            <option value="">-Add Course-</option> 
                                                                            <%
                                                                                List<Course> course = new CourseDao().getAllCourse();

                                                                                for (Course i1 : course) {

                                                                            %>
                                                                            <option value="<%=i1.getCourseId()%>"><%=i1.getCourseName()%></option>
                                                                            <%
                                                                                }

                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div id="">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" style="color: white">Enter Course Fee</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input class="form-control" style="width:326px;" type="number" name="coursefee" id="coursefee" >
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                                <div class="ln_solid"></div>
                                                                <div class="form-group">
                                                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                                        <!--<button class="btn btn-primary"  type="button">Cancel</button>-->
                                                                        <button class="btn btn-primary" type="reset">Reset</button>
                                                                        <input  type="submit" class="btn btn-success" value="Upload" >
                                                                    </div>
                                                                </div>



                                                            </form>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel">
                                                                    <div class="x_title">
                                                                        <label class="col-md-offset-4" id="position">   <h2>All Course Details </h2>         </label>   
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
                                                                        <form action="../../UpdateCourse" method="get">

                                                                            <input type="hidden" id="studentid" name="studentid" value="<%=p.getAdmissionId()%>">
                                                                            <table id="datatable" class="data table table-striped no-margin ">
                                                                                <thead>
                                                                                    <tr>

                                                                                        <th class="table_center">Sr No</th>
                                                                                        <th class="table_center">Course Name</th>
                                                                                        <th class="table_center">Course Fee</th>

                                                                                        <th class="table_center">Delete</th>


                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>

                                                                                    <%

                                                                                        Admission ad = p;
                                                                                        ad = cd.getAdmissionByID(id);
                                                                                        j = 0;
                                                                                        int noofcourse = ad.getNoofCourse();
                                                                                        System.out.println(noofcourse);
                                                                                        int k = 0;
                                                                                        if (noofcourse > 0) {
                                                                                            for (i = 0; i < noofcourse; i++) {
                                                                                                j++;
                                                                                                String val = Integer.toString(j);
                                                                                                String coursename = ad.getCourseName();
                                                                                                String[] curese = coursename.split(" ");
                                                                                                coursefee = 0;
                                                                                                String coursename1 = "";
                                                                                                if (j == 1) {
                                                                                                    coursefee = ad.getCourseFee1();
                                                                                                    coursename1 = ad.getCourseName1();

                                                                                                } else if (j == 2) {
                                                                                                    coursefee = ad.getCourseFee2();
                                                                                                    coursename1 = ad.getCourseName2();
                                                                                                } else if (j == 3) {
                                                                                                    coursefee = ad.getCourseFee3();
                                                                                                    coursename1 = ad.getCourseName3();
                                                                                                } else if (j == 4) {
                                                                                                    coursefee = ad.getCourseFee4();
                                                                                                    coursename1 = ad.getCourseName4();
                                                                                                } else {
                                                                                                    coursefee = ad.getCourseFee5();
                                                                                                    coursename1 = ad.getCourseName5();
                                                                                                }


                                                                                    %>

                                                                                    <tr>

                                                                                        <td class="table_center"><%=j%> </td>

                                                                                        <td class="table_center"><input type="text" style="border: none" class="text-center" name="CourseName<%=i%>" value="<%=coursename1%>"></td> 
                                                                                        <td class="table_center"><input type="text" class="text-center" name="Coursefee<%=i%>" value="<%=coursefee%>"></td> 

                                                                                        <td class="table_center"><input type="checkbox" value="checked" style="width: 15px;hight:15px" name="checkbox<%=i%>"></td> 






                                                                                    </tr> 
                                                                                    <%
                                                                                                k++;
                                                                                            }
                                                                                        }
                                                                                    %>

                                                                                </tbody>
                                                                            </table>
                                                                            <div class="form-group">
                                                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                                                    <!--                                                <button type="button" class="btn btn-primary">Cancel</button>-->
                                                                                    <button type="reset" class="btn btn-primary">Reset</button>
                                                                                    <button type="submit" class="btn btn-success">Update</button>

                                                                                </div>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                                                        <form class="form-horizontal form-label-left"  enctype="multipart/form-data" action="../../UploadVideoStudentWise" onsubmit="return validation(this)" method="post">

                                                            <%                                          if (session.getAttribute("i") != null) {
                                                                    i = (Integer) session.getAttribute("i");
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



                                                            <%
                                                                admission = p;
                                                            %>
                                                            <input type="hidden" name="studentid" value="<%=p.getAdmissionId()%>" id="studentid">
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Course</label>
                                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                                    <select class="form-control" id="course1" name="course" style="width:326px;">
                                                                        <option value="">-Select Course-</option> 
                                                                        <%
                                                                            j = 0;
                                                                            CourseDao coursedao = new CourseDao();
                                                                            Course cr = new Course();
                                                                            noofcourse = admission.getNoofCourse();
                                                                            for (i = 0; i < noofcourse; i++) {
                                                                                j++;
                                                                                String val = Integer.toString(j);
                                                                                String coursename = admission.getCourseName();
                                                                                String[] curese = coursename.split(" ");

                                                                                String cname = curese[i];
                                                                                System.out.println("cname-" + cname);

                                                                                cr = coursedao.getCourseByName(cname);


                                                                        %>



                                                                        <option value="<%=cr.getCourseId()%>"><%=cname%></option>
                                                                        <%
                                                                            }

                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div id="nd">
                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Lesson</label>
                                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                                        <select class="form-control" id="lesson1" name="lesson" style="width:326px;">
                                                                            <option value="">-Select Lesson-</option> 

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Enter Description <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <textarea id="description" placeholder="Description of Video" required="required" class="form-control" name="description" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                                              data-parsley-validation-threshold="10"></textarea>

                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Date of Video <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input type="date" id="datetimepicker1" name="dov" placeholder="Date Of Video" class="form-control">           
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Select Video File <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input type="file"  name="file" accept=".mp4,.3gp" id="PDFfile" required="" class="form-control">
                                                                    <center > <span id="valid_msg" style="color:red"></span></center >

                                                                </div>
                                                            </div>

                                                            <div class="ln_solid"></div>
                                                            <div class="form-group">
                                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                                    <!--<button class="btn btn-primary"  type="button">Cancel</button>-->
                                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                                    <input  type="submit" class="btn btn-success" value="Upload" >
                                                                </div>
                                                            </div>



                                                        </form>
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel">
                                                                    <div class="x_title">
                                                                        <h2>All Video Details </h2>   
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
                                                                                                <th class="table_center">Video Uploaded Date</th>
                                                                                                <th class="table_center">Course Name</th> 
                                                                                                <th class="table_center">Lesson No</th>
                                                                                                <th class="table_center">Date of Video </th>
                                                                                                <th class="table_center">Description</th>
                                                                                                <th class="table_center">View Video</th>


                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>

                                                                                            <%                                                    List<StudentWiseVideo> sv = null;
                                                                                                StudentWiseVideoDao sd = new StudentWiseVideoDao();

                                                                                                for (StudentWiseVideo p1 : sd.getAllStudentWiseVideo()) {
                                                                                                    if (p1.getStudentid() == p.getAdmissionId()) {
                                                                                                        cr = coursedao.getCourseBylongID(p1.getCourseid());

                                                                                            %>
                                                                                            <tr>

                                                                                                <td class="table_center"><%=p1.getUploadedDate()%> </td>


                                                                                                <td class="table_center"><%=cr.getCourseName()%></td> 
                                                                                                <td class="table_center">Lesson <%=p1.getLessonno()%></td> 
                                                                                                <td class="table_center"><%=p1.getDateofvideo()%></td> 
                                                                                                <td class="table_center"><%=p1.getVideodescription()%></td> 

                                                                                                <td class="table_center"><a href="StudentVideo.jsp?asd=<%=p1.getId()%>" target="blank"><i class="fa fa-3x fa-video-camera"></i></a></td> 



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
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel">
                                                                    <div class="x_title">
                                                                        <h2>Upload PDF <small>on Student Request</small></h2>
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
                                                                        <br />
                                                                        <form class="form-horizontal form-label-left"   action="../../UploadPDFStudentWise" onsubmit="return valid();" method="post">

                                                                            <%                                          if (session.getAttribute("i") != null) {
                                                                                    i = (Integer) session.getAttribute("i");
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



                                                                            <input type="hidden" name="studentid" value="<%=p.getAdmissionId()%>" id="studentid">
                                                                            <div class="form-group">
                                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Course</label>
                                                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                    <select class="form-control" required="" id="course" name="course" style="width:326px;">
                                                                                        <option value="">-Select Course-</option> 
                                                                                        <%
                                                                                            j = 0;

                                                                                            noofcourse = admission.getNoofCourse();
                                                                                            for (i = 0; i < noofcourse; i++) {
                                                                                                j++;
                                                                                                String val = Integer.toString(j);
                                                                                                String coursename = admission.getCourseName();
                                                                                                String[] curese = coursename.split(" ");

                                                                                                String cname = curese[i];
                                                                                                System.out.println("cname-" + cname);

                                                                                                cr = coursedao.getCourseByName(cname);


                                                                                        %>



                                                                                        <option value="<%=cr.getCourseId()%>"><%=cname%></option>
                                                                                        <%
                                                                                            }

                                                                                        %>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div id="FetchLessons">
                                                                                <div class="form-group">
                                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Lesson</label>
                                                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                        <select class="form-control" required="" id="lesson" name="lesson" style="width:326px;">
                                                                                            <option value="">-Select Lesson-</option> 

                                                                                        </select>
                                                                                    </div>
                                                                                </div>



                                                                                <div class="form-group">
                                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Enter Description <span class="required">*</span>
                                                                                    </label>
                                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                        <textarea id="description"  placeholder="Enter PDF Description" required="required" class="form-control" name="description" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                                                                  data-parsley-validation-threshold="10"></textarea>

                                                                                    </div>
                                                                                </div>
                                                                                <div id="output12">
                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Select PDF  <span class="required">*</span>
                                                                                        </label>
                                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                            <select class="form-control" required="" id="PDF" name="PDF" style="width:326px;">
                                                                                                <option value="">-Select PDF-</option> 

                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="ln_solid"></div>
                                                                            <div class="form-group">
                                                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                                                    <!--<button class="btn btn-primary"  type="button">Cancel</button>-->
                                                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                                                    <button  type="submit" class="btn btn-success"  >Submit</button>
                                                                                </div>
                                                                            </div>



                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="clearfix"></div>
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel">
                                                                    <div class="x_title">
                                                                        <h2>All Video Details </h2>   
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
                                                                                                <th class="table_center">Lesson No</th>

                                                                                                <th class="table_center">Description</th>
                                                                                                <th class="table_center">Download</th>


                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>

                                                                                            <%                                                    List<StudentPdf> sv1 = null;
                                                                                                StudentPDFDao StudentPDFDao = new StudentPDFDao();

                                                                                                for (StudentPdf p2 : StudentPDFDao.getAllStudentPdf()) {
                                                                                                    if (p2.getStudentid() == id) {
                                                                                                        cr = coursedao.getCourseBylongID(p2.getCourseid());

                                                                                            %>
                                                                                            <tr>

                                                                                                <td class="table_center"><%=p2.getUploadedDate()%> </td>


                                                                                                <td class="table_center"><%=cr.getCourseName()%></td> 
                                                                                                <td class="table_center">Lesson <%=p2.getLessonno()%></td> 

                                                                                                <td class="table_center"><%=p2.getPdfdescription()%></td> 

                                                                                                <td class="table_center">

                                                                    <!--<a href="../../DownloadPDF?asd=<%=p2.getPdfGalleryid()%>" class="btn btn-primary btn-sm">Download </a>-->
                                                                                                    <!--
                                                                                                    -->                                                                    <form action="DownloadPDF.jsp" method="get">
                                                                                                        <input type="hidden" value="<%=p2.getPdfGalleryid()%>" name="asd" id="asd">
                                                                                                        <button type="submit"    class="btn btn-primary btn-sm">Download</button>
                                                                                                    </form>
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
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content5" aria-labelledby="profile-tab">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel">
                                                                   
                                                                    <div class="x_content center">
                                                                      
                                                                        <div class="form-group ">
                                                                            <div class="col-md-3"></div>  <h2>Admission Fee:- <%=p.getAdmissionFee()%> </h2>
                                                                        </div>
                                                                          <%
                                                                        for(StudentAccount s:p.getStudentAccount()){
                                                                        %>
                                                                        <div class="form-group ">
                                                                            <div class="col-md-3"></div>  <h2>Course Fee:- <%=s.getCoursetotalfee() %> </h2>
                                                                        </div>
                                                                      
                                                                        <div class="form-group ">
                                                                            <div class="col-md-3"></div>  <h2>Discount in Percentage:- <%=s.getDiscper()%> </h2>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <div class="col-md-3"></div>  <h2>Discount in Amount- <%=s.getDisamount()%> </h2>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <div class="col-md-3"></div>  <h2>Total- <%=s.getFinalamount()%> </h2>
                                                                        </div>
                                                                       
                                                                        <div class="form-group ">
                                                                            <div class="col-md-3"></div>  <h2>Paid- <%=s.getTotaladvancedfee()%> </h2>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <div class="col-md-3"></div>  <h2>Balance- <%=s.getTotalremfee()%> </h2>
                                                                        </div>
                                                                         <%
                                                                        break;}%>
                                                                        <div class="form-group ">
                                                                            <div class="col-md-3"></div>  <h2>Admission Date- <%=p.getAdmissionDate()%> </h2>
                                                                        </div>






                                                                        </form>
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
                                                                    <th class="table_center">Payment Date</th>

                                                                    <th class="table_center">Payment Mode</th>


                                                                    <th class="table_center">Previous Balance</th>

                                                                    <th class="table_center">Total Fee</th>


                                                                    <th class="table_center">Paid Amount</th>
                                                                    <th class="table_center">Remaining Amount</th>
                                                                    <th class="table_center">Bank Name</th>
                                                                    <th class="table_center">Cheq/Tran No</th>
                                                                    <th class="table_center">Due_Date</th>   <th class="table_center">Print Details</th> 

                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                                <%
                                                                    i = 0;
                                                                    for (StudentAccount p1 : p.getStudentAccount()) {
                                                                        i++;
                                                                        if (i > 1) {

                                                                %>
                                                                <tr>

                                                                    <td class="table_center"><%=p1.getPaymentDate()%> </td>

                                                                    <td class="table_center"><%=p1.getPaymentMode()%></td> 

                                                                    <td class="table_center"><%=p1.getPreviousBalance()%></td> 

                                                                    <td class="table_center"><%=p1.getTotalfee()%></td> 


                                                                    <td class="table_center"><%=p1.getTotaladvancedfee()%></td> 
                                                                    <td class="table_center"><%=p1.getTotalremfee()%></td> 
                                                                    <td class="table_center"><%=p1.getBankname()%></td> 
                                                                    <td class="table_center"><%=p1.getChequeno()%></td> 
                                                                    <td class="table_center"><%=p1.getDueDate()%></td>   <%
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
                $('.row0').on('keyup change', function() {



                    var Course_fee = $('#Course_fee').val();
                    var pbal = $('#pbal').val();

                    var paidAmount = $('#paidAmount').val();
                    var totalAmount = $('#totalAmount').val();

                    var remaining_amount = $('#remaining_amount').val();




                    remaining_amount = parseInt(totalAmount) - parseInt(paidAmount);


                    $('#remaining_amount').val(remaining_amount);
                    $('#amountinword').val(converAmount(parseInt(paidAmount)));
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



        <script>
            function valid()
            {


                var paymenttype = document.getElementById('paymenttype').value;


                var paymode = document.getElementById('paymode').value;
                var paidAmount = document.getElementById('paidAmount').value;
                var datetimepicker1 = document.getElementById('datetimepicker1').value;

                $('#payment_mode_hide').hide();
                $('#payment_hide').hide();
                $('#payment_paid_hide').hide();
                $('#followupdate').hide();

                if (paymenttype == 0)
                {

                    $('#payment_hide').show();
                    $('#payment_mode_hide').hide();
                    $('#payment_paid_hide').hide();
                    $('#followupdate').hide();

                    document.getElementById('paymenttype').focus();
                    return false;
                }



                else if (paymode == 0)
                {

                    $('#payment_hide').hide();
                    $('#payment_mode_hide').show();
                    $('#payment_paid_hide').hide();
                    $('#followupdate').hide();

                    document.getElementById('paymode').focus();
                    return false;
                }



                else if (datetimepicker1 == "")
                {

                    $('#payment_hide').hide();
                    $('#payment_mode_hide').hide();
                    $('#payment_paid_hide').hide();
                    $('#followupdate').show();

                    document.getElementById('datetimepicker1').focus();
                    return false;
                }
                else
                {
                    $('#payment_mode_hide').hide();
                    $('#payment_hide').hide();
                    $('#payment_paid_hide').hide
                    $('#followupdate').hide();


                }



            }

        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#nextfollow1").hide();

                $('#datetimepicker1').datetimepicker({
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
        </script>>

        <script type="text/javascript">
            $(document).ready(function() {

                $("#course").change(function(event) {
                    var course = $('#course').val();
                    $.get("Fetchnolessoninpdf.jsp", {course: course}, function(data) {
                        //   alert('sucess');
                        $('#output11').html(data);
                    });
                });
                $("#course1").change(function(event) {
                    var course = $('#course1').val();
                    $.get("Fetchnooflessonajax.jsp", {course: course}, function(data) {
                        //   alert('sucess');
                        $('#nd').html(data);
                    });
                });

                $("#lesson").change(function(event) {
                    alert("fdg");
                    var course = $('#course').val();
                    var lesson = $('#lesson').val();
                    $.get("FetchPdfGallery.jsp", {course: course}, function(data) {
                        //   alert('sucess');
                        $('#output12').html(data);
                    });
                });


            })

        </script>
    </body>
</html>