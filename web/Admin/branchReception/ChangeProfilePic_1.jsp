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



                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Upload Profile Picture</h2>
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


                                        <%     AdmissionDao cd = new AdmissionDao();
                                            int id = Integer.parseInt(request.getParameter("accountid"));

                                        %>
                                        <form class="form-horizontal form-label-left" data-parsley-validate enctype="multipart/form-data" 

                                              autocomplete="off" action="../../UploadImagesServlet"
                                              method="post">

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
                                                <input type="hidden" id="customerAccountid" name="customerAccountid" value="<%=id%>">

                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Change Profile Picture<span class="required">*</span>
                                                </label>
                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                    <input type="file"  name="img" id="img" required="" class="form-control">
                                                    <center > <span id="Upload_file" style="color:red"></span></center >

                                                </div>
                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                    <a href="ChangeProfilePic1.jsp?accountid=<%=id%>" class="btn btn-primary">
                                                     Open Camera
                                                     
                                                    </a>

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

                    </div>
                </div>
                <!-- /page content -->


                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
            </div>
        </div>


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