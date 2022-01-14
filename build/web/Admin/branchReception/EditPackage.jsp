<%@page import="com.accede.angel.admin.model.PackageCourse"%>
<%@page import="com.accede.angel.admin.dao.PackageDao"%>
<%@page import="com.accede.angel.admin.model.ExternalAccount"%>
<%@page import="com.accede.angel.admin.dao.ExternalAccountDao"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
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
    <head>
        <link href="../comman_files/favicon.png" rel="shortcut icon" type="image/png">

    </head>

    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

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

                        <div class="page-title">
                            <div class="title_left">
                                <h3>Package Details </h3>
                            </div>

                            <!--                            <div class="title_right">
                                                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control" placeholder="Search for...">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-default" type="button">Go!</button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Add Package Details </h2>
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
                                        <form  method="get" action="../../UpdatePackageSave" id="demo-form2" onsubmit="return valid();" data-parsley-vdalidate class="form-horizontal form-label-left">

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
<%

int packageid=Integer.parseInt(request.getParameter("packageid"));
PackageCourse PackageCourse=new PackageDao().getPackageCourseByID(packageid);

%>
<input type="hidden" id="packageid" name="packageid" value="<%=packageid%>">
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Package Name <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="Package" value="<%=PackageCourse.getPackagename() %>" name="Package" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchAddress"> Package Description  <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <textarea id="Description"  placeholder="Package Description" required="required" class="form-control" name="Description" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                              data-parsley-validation-threshold="10"><%=PackageCourse.getDescription()%></textarea>

                                                </div>
                                            </div>




                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adminEmail"> Select No of Days <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select class="form-control" id="NoofDays" name="NoofDays">
                                                        <%
                                                        for(int i=1;i<7;i++)
                                                        {
                                                        if(PackageCourse.getNoofdays()== i )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="<%=i%>"><%=i%></option>
                                                        <%}else{%>
                                                          <option value="<%=i%>"><%=i%></option>
                                                         
                                                      <%}}%>
                                                      
                                                      
                                                    </select>  </div>
                                            </div>
                                                <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adminMobileNo"> Select No of Course <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select class="form-control" id="NoofCourses" name="NoofCourses">
                                                      
                                                         <%
                                                        for(int i=1;i<6;i++)
                                                        {
                                                        if(PackageCourse.getNoofdays()== i )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="<%=i%>"><%=i%></option>
                                                        <%}else{%>
                                                          <option value="<%=i%>"><%=i%></option>
                                                         
                                                         <%}}%>
                                                     
                                                    </select> </div>
                                            </div>
                                                
                                                
                                                <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adminMobileNo"> Select No of Batch Time <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select class="form-control" id="NoofBatches" name="NoofBatches">
                                                      
                                                         <%
                                                        for(int i=1;i<7;i++)
                                                        {
                                                        if(PackageCourse.getNoofBatchTimes()== i )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="<%=i%>"><%=i%></option>
                                                        <%}else{%>
                                                          <option value="<%=i%>"><%=i%></option>
                                                         
                                                       <%}}%>
                                                       
                                                    </select> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adminMobileNo"> Select Payment Mode <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select class="form-control" id="Payment_Mode" name="Payment_Mode">
                                                        
                                                         <%
                                                        for(int i=1;i<7;i++)
                                                        {
                                                        if(PackageCourse.getPaymentMode()== i )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="<%=i%>"><%=i%> Month</option>
                                                        <%}else{%>
                                                          <option value="<%=i%>"><%=i%> Month</option>
                                                         
                                                          <%}}%>
                                                        
                                                       
                                                      
                                                    </select> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adminMobileNo"> Select Course Duration <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select class="form-control" id="Duration" name="Duration">
                                                       
                                                          <%
                                                      
                                                        if(PackageCourse.getCourseDuration() == 15 )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="15">15 Days</option>
                                                        <%}else{%>
                                                          <option value="15">15 Days</option>
                                                         
                                                        <%}%>
                                                         <%
                                                      
                                                        if(PackageCourse.getCourseDuration() == 30 )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="30">30 Days</option>
                                                        <%}else{%>
                                                          <option value="30">30 Days</option>
                                                         
                                                        <%}%>
                                                         <%
                                                      
                                                        if(PackageCourse.getCourseDuration() == 45 )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="45">45 Days</option>
                                                        <%}else{%>
                                                          <option value="45">45 Days</option>
                                                         
                                                        <%}%>
                                                         <%
                                                      
                                                        if(PackageCourse.getCourseDuration() == 60 )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="60">60 Days</option>
                                                        <%}else{%>
                                                           <option value="60">60 Days/2 Month</option>
                                                         
                                                        <%}%>
                                                         <%
                                                      
                                                        if(PackageCourse.getCourseDuration() == 90 )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="90">90 Days</option>
                                                        <%}else{%>
                                                            <option value="90">90 Days/3 Month</option>
                                                         
                                                        <%}%>
                                                      
                                                         <%
                                                      
                                                        if(PackageCourse.getCourseDuration() == 120 )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="120">120 Days</option>
                                                        <%}else{%>
                                                            <option value="120">120 Days/4 Month</option>
                                                         
                                                        <%}%>
                                                         <%
                                                      
                                                        if(PackageCourse.getCourseDuration() == 150 )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="150">150 Days</option>
                                                        <%}else{%>
                                                          <option value="150">150 Days/5 Month</option>
                                                         
                                                        <%}%>
                                                         <%
                                                      
                                                        if(PackageCourse.getCourseDuration() == 180 )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="180">180 Days</option>
                                                        <%}else{%>
                                                          <option value="180">180 Days/6 Month</option>
                                                         
                                                        <%}%>
                                                         <%
                                                      
                                                        if(PackageCourse.getCourseDuration() == 270 )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="270">270 Days</option>
                                                        <%}else{%>
                                                       <option value="270">270 Days/9 Month</option>
                                                         
                                                        <%}%> <%
                                                      
                                                        if(PackageCourse.getCourseDuration() == 365 )
                                                        {
                                                        %>
                                                       
                                                        <option selected="selected" value="365">365 Days</option>
                                                        <%}else{%>
                                                         <option value="365">Year</option>
                                                         
                                                        <%}%>
                                                        
                                                        
                                                        
                                                       
                                                    </select> </div>
                                            </div>
                                            

                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adminEmail"> Fee <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="Fee" name="Fee" value="<%=PackageCourse.getFee()%>" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                    <button class="btn btn-primary"  type="button">Cancel</button>
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
                  
                    </div>
                </div>
            
                <!-- /page content -->


                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
            </div>
        </div>
        <script src="../production/js/Alertajax.js" type="text/javascript"></script>
        <script src="../production/js/Swal.js" type="text/javascript"></script>
        <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
                                                    $('#document').ready(function() {



                                                        $('.edit_prd1').click(function(event) {
                                                            var i = this.id;
                                                            var j = $('#prd_id' + i).val();


                                                            $('#modal_prd_id1').val($('#prd_id' + i).val());


                                                            $('#modal_prd_add').val($('#prd_add' + i).val());

                                                            $('#modal_prd_name').val($('#prd_name' + i).text());

                                                            $('#modal_admin_name').val($('#admin_designation' + i).text());


                                                            $('#modal_admin_mob').val($('#admin_mob' + i).text());


                                                            $('#modal_admin_email').val($('#admin_email' + i).text());



                                                        });


                                                    });

        </script>
        <script type="text/javascript">


            function alpha(e) {
                var k;
                document.all ? k = e.keyCode : k = e.which;
                return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32);
            }
            function alpha1(e) {
                var k;
                document.all ? k = e.keyCode : k = e.which;
                return ((k > 64 && k < 91) || (k > 47 && k < 58) || (k > 96 && k < 123) || k == 8 || k == 32);
            }
            $('#adminMobileNo').blur(function() {

                var contact = $('#adminMobileNo').val().length;
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

                                    $('#adminMobileNo').val(value);
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

            function valid()
            {
                var contact = $('#adminMobileNo').val().length;
                var rollno = /^[0-9]*$/;
                // var phoneno = /^\d{10}$/; 
                var branchname = document.getElementById('branchname').value;
                var adminName = document.getElementById('adminName').value;
                var branchAddress = document.getElementById('branchAddress').value;
                var branchAddress1 = document.getElementById('branchAddress1').value;
                var branchAddress2 = document.getElementById('branchAddress2').value;

                var letters = /^[A-Za-z]+$/;


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

                                    $('#adminMobileNo').val(value);
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

        </script>
     
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
        <script type="text/javascript">
            $('#document').ready(function() {
                $('#branch_name').hide();
                $('#branch_Address').hide();
                $('#branch_Address1').hide();
                $('#branch_Address2').hide();
                $('#admin_Name').hide();


//                $("#sub").click(function(event) {
//                    var branchname = $('#branchname').val();
//                    var branchAddress = $('#branchAddress').val();
//                    var branchAddress1 = $('#branchAddress1').val();
//                    var branchAddress2 = $('#branchAddress2').val();
//                    var format = /[ !@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
//                    if ((format.test(branchname))) {
//
//                        var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
//
//                        jPrompt('You Entered:', branchname, msg, function(r) {
//
//                            if (r) {
////                            alert('You entered ' + branchname);
//                                $('#branchname').val(r);
//                                if ((format.test(r))) {
//
//                                    var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
//
//                                    jPrompt('You Entered:', branchname, msg, function(s) {
//
//                                        if (s) {
//                                            $('#branchname').val(r);
//                                            document.getElementById('demo-form2').submit();
//                                        }
//                                    })
//                                }
//                                else
//                                {
//                                    document.getElementById('demo-form2').submit();
//                                }
//
//
//                            }
//                        })
//                    } else {
//
//
//                        if (branchAddress.matches(".*[a-z].*")) {
//                            if (branchAddress1.matches(".*[a-z].*")) {
//                                if (branchAddress2.matches(".*[a-z].*")) {
//
//                                    document.getElementById('demo-form2').submit();
//                                }
//                                else
//                                {
//                                    var msg = "The Branch Address  has No characters. \nThese are not allowed.\n"
//
//                                    jPrompt('You Entered:', branchAddress2, msg, function(r) {
//
//                                        if (r) {
////                            alert('You entered ' + branchname);
//                                            $('#branchAddress2').val(r);
//                                            if (r.matches(".*[a-z].*")) {
//                                                document.getElementById('demo-form2').submit();
//
//                                            }
//                                            else
//                                            {
//                                                var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
//
//                                                jPrompt('You Entered:', r, msg, function(s) {
//
//                                                    if (s) {
//                                                        $('#branchAddress2').val(s);
//                                                        document.getElementById('demo-form2').submit();
//                                                    }
//                                                })
//                                            }
//
//
//
//                                        }
//                                    })
//                                }
//
//                            }
//                            else
//                            {
//                                var msg = "The Branch Address  has No characters. \nThese are not allowed.\n"
//
//                                jPrompt('You Entered:', branchAddress1, msg, function(r) {
//
//                                    if (r) {
////                            alert('You entered ' + branchname);
//                                        $('#branchAddress1').val(r);
//                                        if (r.matches(".*[a-z].*")) {
//                                            document.getElementById('demo-form2').submit();
//
//                                        }
//                                        else
//                                        {
//                                            var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
//
//                                            jPrompt('You Entered:', r, msg, function(s) {
//
//                                                if (s) {
//                                                    $('#branchAddress1').val(s);
//                                                    document.getElementById('demo-form2').submit();
//                                                }
//                                            })
//                                        }
//
//
//
//                                    }
//                                })
//                            }
//                        }
//                        else
//                        {
//                            var msg = "The Branch Address  has No characters. \nThese are not allowed.\n"
//
//                            jPrompt('You Entered:', branchAddress, msg, function(r) {
//
//                                if (r) {
////                            alert('You entered ' + branchname);
//                                    $('#branchAddress').val(r);
//                                    if (r.matches(".*[a-z].*")) {
//                                        document.getElementById('demo-form2').submit();
//
//                                    }
//                                    else
//                                    {
//                                        var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
//
//                                        jPrompt('You Entered:', r, msg, function(s) {
//
//                                            if (s) {
//                                                $('#branchAddress').val(s);
//                                                document.getElementById('demo-form2').submit();
//                                            }
//                                        })
//                                    }
//
//
//
//                                }
//                            })
//                        }
//
//                    }
//                });
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