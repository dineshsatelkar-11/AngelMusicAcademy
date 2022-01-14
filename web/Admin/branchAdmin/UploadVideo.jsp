<%@page import="com.accede.angel.admin.dao.StudentWiseVideoDao"%>
<%@page import="com.accede.angel.admin.model.StudentWiseVideo"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.model.Course"%>
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
    <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
    <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('#document').ready(function () {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                viewMode: "years"
            });



        })
    </script>
   <script type="text/javascript">



        function valid()
        {

            var rollno = /^[0-9]*$/;
            // var phoneno = /^\d{10}$/;
            var letters = /^[A-Za-z]+$/;


            document.getElementById("Upload_file").innerHTML = "";

            var nme = document.getElementById("uploadFile");


            if (nme.value.length < 4) {
                document.getElementById("Upload_file").innerHTML = "Must Select any of your photo for upload!";

                nme.focus();
                return false;
            }
            else
            {
                return true;
            }





        }



        function validation(thisform)
        {
           
            with (thisform)
            {
                if (validateFileExtension(file, "valid_msg", "MP4 video  only allowed!",
                        new Array("jpg", "wmv", "ogg", "avi", "mov", "webm", "flv", "vob", "ogv", "gif", "gifv", "3gp", "mpeg", "pdf", "jpeg", "gif", "png", "doc", "docx", "xls", "xlsx", "ppt", "txt", "pdf")) == false)
                {
                    return false;

                }
                if (validateFileSize(file, 20000000, "valid_msg", "Video size should be less than 30MB !") == false)
                {
                    return false;
                }
            }
        }
        function validateFileExtension(component, msg_id, msg, extns)
        {

            var flag = 0;
            with (component)
            {
                var ext = value.substring(value.lastIndexOf('.') + 1);


                for (i = 0; i < extns.length; i++)
                {
                   

                    if (ext == extns[i])
                    {

                        flag = 0;

                        break;
                    }
                    else
                    {
                        flag = 1;
                    }
                }

                if (flag == 0)
                {

                    document.getElementById(msg_id).innerHTML = msg;
                    component.value = "";
                    component.style.backgroundColor = "#eab1b1";
                    component.style.border = "thin solid #000000";
                    component.focus();
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }



        function validateFileSize(component, maxSize, msg_id, msg)
        {
            if (navigator.appName == "Microsoft Internet Explorer")
            {
                if (component.value)
                {
                    var oas = new ActiveXObject("Scripting.FileSystemObject");
                    var e = oas.getFile(component.value);
                    var size = e.size;
                }
            }
            else
            {
                if (component.files[0] != undefined)
                {
                    size = component.files[0].size;
                }
            }
            if (size != undefined && size > maxSize)
            {

                document.getElementById(msg_id).innerHTML = msg;
                component.value = "";
                component.style.backgroundColor = "#eab1b1";
                component.style.border = "thin solid #000000";
                component.focus();
            
                return false;



            }
            else
            {
                return true;
            }
        }
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

            else if (paidAmount == 0)
            {

                $('#payment_hide').hide();
                $('#payment_mode_hide').hide();
                $('#payment_paid_hide').show();
                $('#followupdate').hide();

                document.getElementById('paidAmount').focus();
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
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/branchAdminSideBar.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
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
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Form Design <small>different form elements</small></h2>
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
                                        <form class="form-horizontal form-label-left"  enctype="multipart/form-data" action="../../UploadVideoStudentWise" onsubmit="return validation(this)"  method="post">

                                            <%                                          if (session.getAttribute("i") != null) {
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



                                            <%                                    long id = Long.parseLong(request.getParameter("asd"));
                                                AdmissionDao cd = new AdmissionDao();
                                                Admission admission = cd.getAdmissionByID(id);
                                            %>
                                            <input type="hidden" name="studentid" value="<%=id%>" id="studentid">
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Course</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <select class="form-control" id="course" name="course" style="width:326px;">
                                                        <option value="">-Select Course-</option> 
                                                        <%
                                                            int j = 0;
                                                              CourseDao coursedao = new CourseDao();
                                                               Course cr =new Course();
                                                            int noofcourse = admission.getNoofCourse();
                                                            for (int i = 0; i < noofcourse; i++) {
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
                                            <div id="output11">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Lesson</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <select class="form-control" id="lesson" name="lesson" style="width:326px;">
                                                            <option value="">-Select Lesson-</option> 

                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Enter Description <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <textarea id="description" placeholder="Video Description" required="required" class="form-control" name="description" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                              data-parsley-validation-threshold="10"></textarea>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Date of Video <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="datetimepicker1" name="dov" placeholder="Date Of Video" class="form-control">           
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
 
  String course="";
                                                    for (StudentWiseVideo p : sd.getAllStudentWiseVideo()) {
                                                        if (p.getStudentid() == id) {
cr=coursedao.getCourseBylongID(p.getCourseid() );

                                                %>
                                                <tr>

                                                    <td class="table_center"><%=p.getUploadedDate()%> </td>


                                                    <td class="table_center"><%=cr.getCourseName() %></td> 
                                                    <td class="table_center">Lesson <%=p.getLessonno()%></td> 
                                                    <td class="table_center"><%=p.getDateofvideo()%></td> 
                                                    <td class="table_center"><%=p.getVideodescription()%></td> 
                                                    
                                                    <td class="table_center"><a href="StudentVideo.jsp?asd=<%=p.getId() %>" target="blank"><i class="fa fa-3x fa-video-camera"></i></a></td> 



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
                <!-- /page content -->


                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
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
        <script type="text/javascript">
                                            $(document).ready(function () {
                                                $('#payment_mode_hide').hide();
                                                $('#payment_hide').hide();
                                                $('#payment_paid_hide').hide();
                                                $('#followupdate').hide();
                                                $("#course").change(function (event) {
                                                    var course = $('#course').val();
                                                    $.get("Fetchnooflessonajax.jsp", {course: course}, function (data) {
                                                        //   alert('sucess');
                                                        $('#output11').html(data);
                                                    });
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
                                                $('.row0').on('keyup change', function () {

                                                    var paymenttype = $('#paymenttype').val();

                                                    var Course_fee = $('#Course_fee').val();
                                                    var pbal = $('#pbal').val();
                                                    var totalAmount = $('#totalAmount').val();
                                                    var paidAmount = $('#paidAmount').val();
                                                    var Discount = $('#Discount').val();
                                                    var beforedisc = $('#beforedisc').val();
                                                    var discAmount = $('#discAmount').val();
                                                    var remaining_amount = $('#remaining_amount').val();

                                                    if (paymenttype == 1)
                                                    {
                                                        totalAmount = parseInt(Course_fee) + parseInt(pbal);
                                                        $('#beforedisc').val(totalAmount);
                                                        discAmount = parseInt(totalAmount) * Discount / 100;
                                                        $('#discAmount').val(discAmount);
                                                        totalAmount = parseInt(totalAmount) - parseInt(discAmount);

                                                        $('#totalAmount').val(totalAmount);
                                                        remaining_amount = parseInt(totalAmount) - parseInt(paidAmount);
                                                        $('#remaining_amount').val(remaining_amount);
                                                        $('#amountinword').val(converAmount(parseInt(paidAmount)));
                                                    }
                                                    else if (paymenttype == 2)
                                                    {
                                                        totalAmount = parseInt(pbal);
                                                        $('#beforedisc').val(totalAmount);
                                                        discAmount = parseInt(totalAmount) * Discount / 100;
                                                        $('#discAmount').val(discAmount);
                                                        totalAmount = parseInt(totalAmount) - parseInt(discAmount);

                                                        $('#totalAmount').val(totalAmount);
                                                        remaining_amount = parseInt(totalAmount) - parseInt(paidAmount);
                                                        $('#remaining_amount').val(remaining_amount);
                                                        $('#amountinword').val(converAmount(parseInt(paidAmount)));

                                                    }
                                                    else
                                                    {

                                                    }

                                                })
                                            })

        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".hide_gst").hide();
                $(".hide_price").hide();
                $(".hideall").hide();
                $(".hide_qnt").hide();
                $(".hide_ship").hide();
                $('#datetimepicker1').datetimepicker({
                    format: 'DD/MM/YYYY',
                    viewMode: "years"
                });

            })
        </script>>
        <style>

            .table_center{

                text-align: center;
            }

        </style>
    </body>
</html>