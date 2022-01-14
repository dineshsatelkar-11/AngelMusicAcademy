<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
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

                                        <%                     
                                        long id = Long.parseLong(request.getParameter("asd"));
                                        
                                            AdmissionDao cd = new AdmissionDao();
                                            Admission ad = cd.getAdmissionByID(id);
                                        %>
                                        <div class="col-md-6"> 
                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">First Name <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="first-name" value="<%=ad.getFirstName()%>" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Middle Name <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="last-name" value="<%=ad.getMiddleName()%>" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Email</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="middle-name" class="form-control col-md-7 col-xs-12" value="<%=ad.getEmail()%>"  type="text" name="middle-name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Date of Birth</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="middle-name" class="form-control col-md-7 col-xs-12" value="<%=ad.getDateofBirth()%>"  type="text" name="middle-name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Occupation</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="middle-name" class="form-control col-md-7 col-xs-12" value="<%=ad.getOccupation()%>"  type="text" name="middle-name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Parents Contact No</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="middle-name" class="form-control col-md-7 col-xs-12" value="<%=ad.getParentsNo()%>"  type="text" name="middle-name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Religion</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="middle-name" class="form-control col-md-7 col-xs-12" value="<%=ad.getReligion()%>"  type="text" name="middle-name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Name of Mother</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="middle-name" class="form-control col-md-7 col-xs-12" value="<%=ad.getMothersName()%>"  type="text" name="middle-name">
                                                    </div>
                                                </div>
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
                                                <div class="form-group">
                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Course Duration</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="middle-name" class="form-control col-md-7 col-xs-12" value="<%=Datee%>"  type="text" name="middle-name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Due Date</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="middle-name" class="form-control col-md-7 col-xs-12" value="<%=ad.getDueDate()%>"  type="text" name="middle-name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Select Days</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="middle-name" class="form-control col-md-7 col-xs-12" value="<%=ad.getDaysInWeek()%>"  type="text" name="middle-name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Admission Fee</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="middle-name" class="form-control col-md-7 col-xs-12" value="<%=ad.getAdmissionFee()%>"  type="text" name="middle-name">
                                                    </div>
                                                </div>





                                            </form></div>
                                        <div class="col-md-6">  <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Last Name <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="first-name" required="required" value="<%=ad.getLastName()%>"  class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Mobile No<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="last-name" name="last-name"  value="<%=ad.getContactNo()%>"  required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Gender</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="middle-name" class="form-control col-md-7 col-xs-12" value="<%=ad.getGender()%>"  type="text" name="middle-name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Age<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="last-name" name="last-name"  value="<%=ad.getAge()%>"  required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Nationality<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="last-name" name="last-name"  value="<%=ad.getNationality()%>"  required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Qualification<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="last-name" name="last-name"  value="<%=ad.getQualification()%>"  required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Mobile No<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="last-name" name="last-name"  value="<%=ad.getContactNo()%>"  required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Mother Tongue<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="last-name" name="last-name"  value="<%=ad.getMotherTongue()%>"  required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Joining Date<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="last-name" name="last-name"  value="<%=ad.getJoiningDate()%>"  required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Batch Time<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="last-name" name="last-name"  value="<%=ad.getBatchTimings()%>"  required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <%
                                                    int paymentmode = ad.getPaymentmodecount();
                                                    String paymentm = "";
                                                    if (paymentmode == 1) {
                                                        paymentm = "Monthly";
                                                    } else if (paymentmode == 3) {
                                                        paymentm = "Three Month";
                                                    } else if (paymentmode == 6) {
                                                        paymentm = "Six Month";
                                                    } else {
                                                        paymentm = "One Year";
                                                    }

                                                %>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Payment Mode<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="last-name" name="last-name"  value="<%=paymentm%>"  required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>






                                            </form></div>

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
        <script type="text/javascript">
            $('#document').ready(function () {
                $('.amounthide').hide();
                $('.buttonFinish').hide();
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
                $(".dropdown dt a").on('click', function () {
                    $(".dropdown dd ul").slideToggle('fast');
                });

                $(".dropdown dd ul li a").on('click', function () {
                    $(".dropdown dd ul").hide();
                });

                function getSelectedValue(id) {
                    return $("#" + id).find("dt a span.value").html();
                }

                $(document).bind('click', function (e) {
                    var $clicked = $(e.target);
                    if (!$clicked.parents().hasClass("dropdown"))
                        $(".dropdown dd ul").hide();
                });

                $('.mutliSelect input[type="checkbox"]').on('click', function () {

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

                $('#otherfees').on('keyup change', function () {

                    var otherfees = $('#otherfees').val();
                    var totalremfee = $('#totalremfee').val();
                    var finalamount = $('#finalamount').val();
                    var discount = $('#discount').val();
                    var totalamount = parseInt(totalremfee) + parseInt(otherfees);
                    var disamount = discount * totalamount / 100;
                    var afterdiscountamount = totalamount - disamount;
                    $('#finalamount').val(afterdiscountamount);

                });
                $('#discount').on('keyup change', function () {

                    var otherfees = $('#otherfees').val();
                    var totalremfee = $('#totalremfee').val();
                    var finalamount = $('#finalamount').val();
                    var discount = $('#discount').val();
                    var totalamount = parseInt(totalremfee) + parseInt(otherfees);
                    var disamount = discount * totalamount / 100;
                    var afterdiscountamount = totalamount - disamount;
                    $('#finalamount').val(afterdiscountamount);

                });

                $('.row0').on('keyup change', function () {

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
                $('.row1').on('keyup change', function () {

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
                $('.row2').on('keyup change', function () {

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
                $('.row3').on('keyup change', function () {

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
                $('.row4').on('keyup change', function () {

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
                $("#datetimepicker1").on("dp.change", function (e) {
                    var year = new Date(e.date).getFullYear();
                    var month = new Date(e.date).getMonth() + 1;
                    var currentYear = new Date().getFullYear();
                    var currentMonth = new Date().getMonth() + 1;
                    var age = currentYear - year;
                    if ((currentMonth - month) < 0)
                        age--;
                    $('#age').val(age);
                });
                $("#datetimepicker2").on("dp.change", function (e) {
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
                $("#duration").on("change", function (e) {
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
                $('#regfees').on('keyup change', function () {
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

                $('#advpay').on('keyup change', function () {
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
                $(".priceup").keypress(function (event) {
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
            $(document).ready(function () {
                // alert('fsdfsdf');
                $('#mob_email').blur(function () {

                    var studEmail = $('#mob_email').val();

                    $.get("StudentEnquiryAjax.jsp", {studEmail: studEmail}, function (data) {
                        //   alert('sucess');
                        $('#output').html(data);
                    });

                });
                $('#coursename').change(function () {
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
                close[i].onclick = function () {
                    var div = this.parentElement;
                    div.style.opacity = "0";
                    setTimeout(function () {
                        div.style.display = "none";
                    }, 600);
                }
            }
        </script>
    </body>
</html>