<%@page import="com.accede.angel.admin.dao.EmployeeWeekoffDao"%>
<%@page import="com.accede.angel.admin.model.EmployeeWeekoff"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDocumentsDao"%>
<%@page import="com.accede.angel.admin.model.EmployeeDocuments"%>
<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="com.accede.angel.admin.model.EmployeeActiveHistory"%>
<%@page import="com.accede.angel.admin.model.EmployeeActiveHistory"%>
<%@page import="com.accede.angel.admin.model.EmployeeSalary"%>
<%@page import="com.accede.angel.admin.dao.EmployeeAdvanceDao"%>
<%@page import="com.accede.angel.admin.model.EmployeeAdavance"%>
<%@page import="com.accede.angel.admin.model.EmployeeAdavance"%>
<%@page import="com.accede.angel.admin.model.EmployeePayment"%>
<%@page import="com.accede.angel.admin.model.EmployeePayment"%>
<%@page import="com.accede.angel.admin.model.EmployeePayment"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDao"%>
<%@page import="java.util.Collections"%>
<%@page import="org.hibernate.mapping.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.accede.angel.admin.dao.StudentVanishHistoryDao"%>
<%@page import="com.accede.angel.admin.model.StudentVanishHistory"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
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

    <script src="../production/js/Alertajax.js" type="text/javascript"></script>
    <script type="text/javascript">
        $('#document').ready(function() {

            $("#datatable").on("click", ".edit_prd2", function() {
//                                                        $('.edit_prd2').click(function (event) {
                var i = this.id;
                //alert("id==" + this.id)

                // $('#modal_vendor_id').val($('#vendor_id' + i).text());

                $('#modal_Bank_name').val($('#BankName' + i).val());
                $('#modal_Branch_name').val($('#BranchName' + i).val());
                $('#modal_AccountNo').val($('#BankAccount' + i).val());
                $('#modal_IfscCode').val($('#BankIfsc' + i).val());
                $('#modal_PanNO').val($('#PanNumber' + i).val());
                $('#modal_AadharNo').val($('#AdharNo' + i).val());
                $('#modal_Bankaddress').val($('#BankAddress' + i).val());


                document.getElementById("Modal_Bank_Id").value = i;
                //BankName BranchName BankAccount BankIfsc PanNumber AdharNo BankAddress
            });

        });




    </script>

    <script type="text/javascript">
        $('#document').ready(function() {

            $("#datatable").on("click", ".edit_prd1", function() {

                var i = this.id;
                // alert("id==" + this.id)
                //  var j = $('#prd_id' + i).val();


                // $('#modal_vendor_id').val($('#vendor_id' + i).text());
                $('#modal_name').val($('#Company_name' + i).text());
                $('#modal_mobile').val($('#Mobile' + i).text());
                $('#modal_alternateNo').val($('#AlternateNo' + i).text());
                $('#modal_email').val($('#Email' + i).text());
                $('#modal_PermenantNO').val($('#PermanentNo' + i).text());
                $('#modal_qualification').val($('#Qualification' + i).text());
                $('#modal_address').val($('#Address' + i).text());
                $('#modal_permanentAddress').val($('#PermanentAddress' + i).text());
                $('#modal_designation').val($('#Designation' + i).text());
                $('#modal_salary').val($('#Salary' + i).text());
                $('#modal_joinDate').val($('#JoinDate' + i).text());
//                $('#modal_branch').val($('#Branch' + i).val());
                $('#modal_inTime').val($('#InTime' + i).text());
                $('#modal_outTime').val($('#OutTime' + i).text());

                document.getElementById("Modal_Employee_Id").value = i;
                //document.getElementById("Modal_Bank_Id").value = i;
                //BankName BranchName BankAccount BankIfsc PanNumber AdharNo BankAddress
            });


        });

    </script>


    <%        long Eid = Long.parseLong(request.getParameter("asd"));
        int j = 0;
        int i = 0;
        EmployeeDao bd = new EmployeeDao();
        Employee p = bd.getEmployeeByID(Eid);


    %>
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>



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


                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Employee Profile </h2>
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

                                    <%                                            if (session.getAttribute("i") != null) {
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
                                    <div class="x_content">
                                        <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                                            <div class="profile_img">
                                                <div id="crop-avatar">
                                                    <!-- Current avatar -->


                                                    <img  onclick="openmodel(this.id)" id="myImg1" class="img-responsive avatar-view" src="../../EmployeeImages/<%=p.getImage()%>" alt="Avatar" title="Change the avatar">
                                                </div>
                                            </div>
                                            <h3><%=p.getName()%> </h3>

                                            <ul class="list-unstyled user_data">


                                                <li>
                                                    <i class="fa fa-briefcase user-profile-icon"></i> <%=p.getDesignation()%>
                                                </li>

                                                <li class="m-top-xs">
                                                    <i class="fa fa-external-link user-profile-icon"></i>
                                                    <a href="EditEmployee.jsp?asd=<%=p.getId()%>" ><%=p.getEmail()%></a>
                                                </li>

                                                <li><i class="fa fa-mobile fa-2x user-profile-icon"></i> <%=p.getMobileNo()%>
                                                </li>


                                                <%

                                                    String date1 = DATE_FORMAT.format(p.getJoiningDate());


                                                %>
                                                <li><i class="fa  fa-calendar  user-profile-icon"></i> Joining Date <%=date1%>
                                                </li>
                                            </ul>

                                            <a href="EditEmployee.jsp?asd=<%=p.getId()%>" class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>Edit Profile</a>
                                            <a href="ChangeEmployeePic.jsp?asd=<%=p.getId()%>" class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>Change Profile Pic</a>
                                            <br />



                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-12">



                                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                <ul id="myTab" class="nav nav-tabs bar_tabs responsive" role="tablist">
                                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Payment Details</a>
                                                    </li>

                                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Advance Payment</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Salary Increment</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab3" data-toggle="tab" aria-expanded="false">Active History</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content5" role="tab" id="profile-tab4" data-toggle="tab" aria-expanded="false">Upload Document</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content6" role="tab" id="profile-tab5" data-toggle="tab" aria-expanded="false">Add Leaves</a>
                                                    </li>



                                                </ul>
                                                <div id="myTabContent" class="tab-content">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                                                        <div class="x_content">
                                                            <form method="post" action="../../EmployeePaymentSave" id="demo-form2"  onsubmit="return valid();" data-parsley-validate class="form-horizontal form-label-left">
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

                                                                    Employee ee = p;


                                                                %>  

                                                                <input type="hidden" id="empid" name="empid" readonly="" value="<%=ee.getId()%>"  >

                                                                <div class="col-md-12 col-sm-12 col-xs-12">

                                                                    <div  id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" >
                                                                        <div class="row" >
                                                                            <div class="col-md-12 col-sm-12 col-xs-12">                                                   


                                                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                    <label >Employee Name<span class="required">*</span>
                                                                                    </label>
                                                                                    <input type="text" id="ColorName" name="ColorName" readonly="" value="<%=ee.getName()%>" required="required" onkeypress="return alpha(event)" class="form-control col-md-7 col-xs-12">

                                                                                </div> 

                                                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                    <label >Employee Salary<span class="required">*</span>
                                                                                    </label>
                                                                                    <input type="text" id="employeesalary" name="employeesalary" value="<%=ee.getSalary()%>" readonly required="required" onkeypress="return alpha(event)" class="form-control col-md-7 col-xs-12">

                                                                                </div>

                                                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                    <label >Select Month of the Salary<span class="required">*</span>
                                                                                    </label>
                                                                                    <select class="form-control row0" required="" id="PaymnentMonth" name="Month" >
                                                                                        <option value="">Select Month</option>
                                                                                        <option value="Jan">Jan</option>
                                                                                        <option value="Feb">Feb</option>
                                                                                        <option value="Mar">Mar</option>
                                                                                        <option value="Apr">Apr</option>
                                                                                        <option value="May">May</option>
                                                                                        <option value="Jun">Jun</option>
                                                                                        <option value="Jul">Jul</option>
                                                                                        <option value="Aug">Aug</option>
                                                                                        <option value="Sep">Sep</option>
                                                                                        <option value="Oct">Oct</option>
                                                                                        <option value="Nov">Nov</option>
                                                                                        <option value="Dec">Dec</option>

                                                                                    </select>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                                                </div> 

                                                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                    <label >Select Year of the Salary<span class="required">*</span>
                                                                                    </label>
                                                                                    <select class="form-control row0" required="" id="PaymnentYear" name="Year" >
                                                                                        <option value="">Select Year</option>
                                                                                        <%Calendar now = Calendar.getInstance();   // Gets the current date and time
                                                                                            int year = now.get(Calendar.YEAR);%>
                                                                                        <option value="<%=year%>"><%=year%></option>
                                                                                        <option value="<%=year - 1%>"><%=year - 1%></option>



                                                                                    </select>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                                                </div> 





                                                                            </div>

                                                                        </div><br>
                                                                        <div id="paymentdetailsfetch">

                                                                        </div>  </div>  <br>








                                                                </div>




                                                            </form>
                                                        </div>  
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel">
                                                                    <div class="x_title">
                                                                        <h2>All Payment Details </h2>   
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
                                                                        <table id="datatable" class="table table-striped table-bordered">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th class="table_center">Sr No</th>

                                                                                    <th class="table_center">Name  </th>
                                                                                    <th class="table_center">Salary_Date  </th>


                                                                                    <th class="table_center">Actual Salary  </th>
                                                                                    <th class="table_center">Month of Salary</th>


                                                                                    <th class="table_center">No of Days Work  </th>
                                                                                    <th class="table_center">Salary  </th>
                                                                                    <th class="table_center">Incentive </th>
                                                                                    <th class="table_center">Extra Hours/Overtime </th>
                                                                                    <th class="table_center">Overtime Amount </th>
                                                                                    <th class="table_center">Total Payment </th>
                                                                                    <th class="table_center">Advance Amount </th>
                                                                                    <th class="table_center">Final Payment </th>
                                                                                    <!--<th class="table_center">Balance Advance Payment </th>-->

                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>

                                                                                <%  j = 0;
                                                                                    List<EmployeePayment> c = bd.getAllEmployeePayment();
                                                                                    for (EmployeePayment p1 : c) {
                                                                                        if (Eid == p1.getEmployee().getId()) {
                                                                                            j++;
                                                                                            String dateee = DATE_FORMAT.format(p1.getSalaryDate());
                                                                                %>
                                                                                <tr>

                                                                                    <td class="table_center"><%=j%> </td>
                                                                                    <td class="table_center"><%=p1.getEmployee().getName()%></td> 
                                                                                    <td class="table_center"><%=dateee%></td> 
                                                                                    <td class="table_center"><%=p1.getActualSalary()%></td> 
                                                                                    <td class="table_center"><%=p1.getMonthinword()%></td> 
                                                                                    <td class="table_center"><%=p1.getNoOfDays()%></td> 
                                                                                    <td class="table_center"><%=p1.getPayment()%></td> 
                                                                                    <td class="table_center"><%=p1.getIncentive()%></td> 
                                                                                    <td class="table_center"><%=p1.getExtrahours()%></td> 
                                                                                    <td class="table_center"><%=p1.getOvertimeamt()%></td> 
                                                                                    <td class="table_center"><%=p1.getTotalamount()%></td> 
                                                                                    <td class="table_center"><%=p1.getAdvance()%></td> 
                                                                                    <td class="table_center"><%=p1.getFinalamount()%></td> 
                                                                                    <!--<td class="table_center"><%=p1.getBalanceadvanceamt()%></td>--> 



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


                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                                        <div class="x_content">
                                                            <form method="post" action="../../EmployeeAdvanceSave" id="AdvanceForm"   data-parsley-validate class="form-horizontal form-label-left">
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


                                                                %>  

                                                                <input type="hidden" id="empid" name="empid" readonly="" value="<%=ee.getId()%>"  >
                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Employee Name<span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                        <input type="text" id="ColorName" name="ColorName" readonly="" value="<%=ee.getName()%>" required="required" onkeypress="return alpha(event)" class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Employee Salary<span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                        <input type="text" id="employeesalary" name="employeesalary" value="<%=ee.getSalary()%>" readonly required="required" onkeypress="return alpha(event)" class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                </div>



                                                                <div class="form-group"> 
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Against Month <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                        <select class="form-control row0" required="" id="Monthforadavance" name="Monthforadavance" >
                                                                            <option value="">Select Month</option>
                                                                            <option value="Jan">Jan</option>
                                                                            <option value="Feb">Feb</option>
                                                                            <option value="Mar">Mar</option>
                                                                            <option value="Apr">Apr</option>
                                                                            <option value="May">May</option>
                                                                            <option value="Jun">Jun</option>
                                                                            <option value="Jul">Jul</option>
                                                                            <option value="Aug">Aug</option>
                                                                            <option value="Sep">Sep</option>
                                                                            <option value="Oct">Oct</option>
                                                                            <option value="Nov">Nov</option>
                                                                            <option value="Dec">Dec</option>

                                                                        </select>  </div>
                                                                </div>


                                                                <div class="form-group"> 
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Against Year <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                        <select class="form-control row0" required="" id="Yearforadavance" name="Yearforadavance" >
                                                                            <option value="">Select Year</option>
                                                                            <option value="<%=year%>"><%=year%></option>
                                                                            <option value="<%=year - 1%>"><%=year - 1%></option>


                                                                        </select>  </div>
                                                                </div>
                                                                <div id="fetchadavanceamt">
                                                               
                                                                </div>

                                                            </form>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel">
                                                                    <div class="x_title">
                                                                        <h2>All Advance Payment Details </h2>   
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
                                                                        <table id="datatable-responsive" class="table table-striped table-bordered">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th class="table_center">Sr No</th>

                                                                                    <th class="table_center">Name  </th>


                                                                                    <th class="table_center">Amount  </th>
                                                                                    <th class="table_center">Date</th>


                                                                                    <th class="table_center">Time </th>
                                                                                    <th class="table_center">Month </th>
                                                                                    <th class="table_center">Year </th>


                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>

                                                                                <%  j = 0;

                                                                                    List<EmployeeAdavance> EmployeeAdavance = new EmployeeAdvanceDao().getAllEmployeeAdavance(ee);
                                                                                    for (EmployeeAdavance p2 : EmployeeAdavance) {

                                                                                        String dateee = DATE_FORMAT.format(p2.getActivedate());
                                                                                        j++;

                                                                                %>
                                                                                <tr>

                                                                                    <td class="table_center"><%=j%> </td>
                                                                                    <td class="table_center"><%=p2.getEmployee().getName()%></td> 
                                                                                    <td class="table_center"><%=p2.getAdvance()%></td> 
                                                                                    <td class="table_center"><%=dateee%></td> 
                                                                                    <td class="table_center"><%=p2.getActivetime()%></td> 
                                                                                    <td class="table_center"><%=p2.getMonthinword()%></td> 
                                                                                    <td class="table_center"><%=p2.getYear()%></td> 



                                                                                </tr> 
                                                                                <%}

                                                                                %>

                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">

                                                        <div class="x_panel">
                                                            <div class="x_title">
                                                                <div class="col-md-3">
                                                                </div>
                                                                <div class="col-md-6"> <h2 >Payment Details </h2> </div>
                                                                <ul class="nav panel_toolbox">
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
                                                                <table id="datatable-checkbox" class="table table-striped table-bordered">
                                                                    <thead>
                                                                        <tr>
                                                                            <th class="table_center">Sr No</th>

                                                                            <th class="table_center">Name  </th>


                                                                            <th class="table_center">Date</th>


                                                                            <th class="table_center">Salary  </th

                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>

                                                                        <%                                                                            j = 0;

                                                                            List<EmployeeSalary> EmployeeSalary = bd.getAllEmployeeSalary(p);
                                                                            for (EmployeeSalary p3 : EmployeeSalary) {

                                                                                date1 = DATE_FORMAT.format(p3.getSalaryUpdateDate());
                                                                                j++;


                                                                        %>
                                                                        <tr>

                                                                            <td class="table_center"><%=j%> </td>
                                                                            <td class="table_center" ><%=p3.getEmployee().getName()%></td> 
                                                                            <td class="table_center" ><%=date1%></td> 
                                                                            <td class="table_center" ><%=p.getSalary()%></td> 





                                                                        </tr> 
                                                                        <%}

                                                                        %>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>



                                                    </div>
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel">
                                                                    <div class="x_title">
                                                                        <h2>All Employee Active/De-active History </h2>   
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
                                                                        <%                                            if (session.getAttribute("i") != null) {
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
                                                                    </div>
                                                                    <div class="x_content">
                                                                        <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                                                </p>-->
                                                                        <table id="datatable-keytable" class="table table-striped table-bordered">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th class="table_center">Sr No</th>
                                                                                    <th class="table_center">Date</th>
                                                                                    <th class="table_center">Time</th>
                                                                                    <th class="table_center">Status</th>




                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <%  j = 0;
                                                                                    // AdminDao aa = new AdminDao();

                                                                                    Employee b2 = p;
                                                                                    System.out.print(b2);
                                                                                    List<EmployeeActiveHistory> EmployeeActiveHistory = bd.getAllEmployeeActiveHistory(b2);
                                                                                    for (EmployeeActiveHistory p4 : EmployeeActiveHistory) {
                                                                                        j++;

                                                                                        date1 = DATE_FORMAT.format(p4.getActivedate());
                                                                                %>
                                                                                <tr>

                                                                                    <td class="table_center"><%=j%></td>
                                                                                    <td class="table_center"><%=date1%></td>
                                                                                    <td class="table_center"><%=p4.getActivetime()%></td>
                                                                                    <td class="table_center"><%=p4.getStatus()%></td>



                                                                                </tr>  
                                                                                <%}%>

                                                                            </tbody>

                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content5" aria-labelledby="profile-tab">
                                                        <div class="x_panel">
                                                            <div class="x_title">
                                                                <h2>Upload Documents </h2>
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

                                                                <form class="form-horizontal form-label-left" data-parsley-validate enctype="multipart/form-data" 

                                                                      autocomplete="off" action="../../EmployeeDocumentsSave"
                                                                      method="post">


                                                                    <input type="hidden" id="empid" name="empid" readonly="" value="<%=ee.getId()%>"  >
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Document Type</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12" >
                                                                            <input type="text" required="" id="docname" style="width:326px;" class="form-control col-md-3 col-xs-12" name="docname">
                                                                        </div>
                                                                    </div>
                                                                    <div id="output11">




                                                                        <div id="output12">
                                                                            <div class="form-group">
                                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Choose File<span class="required">*</span>
                                                                                </label>
                                                                                <div class="col-md-9 col-sm-9 col-xs-12" id="pdfoutput">
                                                                                    <input type="file"  name="img"  id="img" required="" style="width:326px;" class="form-control">


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

                                                            <div class="row" id="tablefetch">
                                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="x_panel">

                                                                        <div class="x_content">
                                                                            <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                                                        The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                                                    </p>-->
                                                                            <table id="datatable-fixed-header" class="table table-striped table-bordered">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th class="table_center">Sr No</th>
                                                                                        <th class="table_center">Document Uploaded Date</th>
                                                                                        <th class="table_center">Document Uploaded Time</th>
                                                                                        <th class="table_center">Document</th> 

                                                                                        <th class="table_center">Download</th>



                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>

                                                                                    <%                                                                                        List<EmployeeDocuments> allEmployeeDocuments = null;
                                                                                        EmployeeDocumentsDao EmployeeDocumentsDao = new EmployeeDocumentsDao();
                                                                                        j = 0;
                                                                                        for (EmployeeDocuments p1 : EmployeeDocumentsDao.getAllEmployeeDocuments(p)) {
                                                                                            j++;
                                                                                            date1 = DATE_FORMAT.format(p1.getUploadesDate());

                                                                                    %>
                                                                                    <tr>

                                                                                        <td class="table_center"><%=j%> </td>
                                                                                        <td class="table_center"><%=date1%> </td>


                                                                                        <td class="table_center"><%=p1.getUploadesTime()%></td> 


                                                                                        <td class="table_center"><%=p1.getDocumentType()%></td> 

                                                                                        <td class="table_center">

                                                                                            <a href="DownloadDocument.jsp?asd=<%=p1.getId()%>" target="blank" class="btn btn-primary btn-sm">Download </a>

                                                                                        </td> 



                                                                                    </tr> 
                                                                                    <%}

                                                                                    %>

                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div role="tabpanel" class="tab-pane fade " id="tab_content6" aria-labelledby="home-tab">

                                                        <div class="x_content">
                                                            <form method="post" action="../../AddLeaves" id="LeaveForm"  onsubmit="return valid();" data-parsley-validate class="form-horizontal form-label-left">
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


                                                                %>  

                                                                <input type="hidden" id="empid" name="empid" readonly="" value="<%=ee.getId()%>"  >

                                                                <div class="col-md-12 col-sm-12 col-xs-12">

                                                                    <div  id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" >
                                                                        <div class="row" >
                                                                            <div class="col-md-12 col-sm-12 col-xs-12">                                                   


                                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                                    <label >Employee Name<span class="required">*</span>
                                                                                    </label>
                                                                                    <input type="text" id="ColorName" name="ColorName" readonly="" value="<%=ee.getName()%>" required="required" onkeypress="return alpha(event)" class="form-control col-md-7 col-xs-12">

                                                                                </div> 



                                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                                    <label >Select Leave Type<span class="required">*</span>
                                                                                    </label>
                                                                                    <select class="form-control row0" required="" id="Leave" name="Leave" >
                                                                                        <option value="">Select Leave Type</option>

                                                                                        <option value="Casual leave">Casual leave </option>
                                                                                        <option value="Sick leave">Sick leave</option>
                                                                                        <option value="Privilege leave">Privilege leave</option>
                                                                                        <option value="Maternity Leave">Maternity Leave</option>
                                                                                        <option value="Other Leave">Other Leave</option>


                                                                                    </select>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                                                </div> 

                                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                                    <label >Select No of Days<span class="required">*</span>
                                                                                    </label>
                                                                                    <select class="form-control row0" required="" id="noOfDaysforleave" name="noOfDays" >
                                                                                        <option value="">Select No of Days</option>
                                                                                        <%
                                                                                            for (int ii = 1; ii < 32; ii++) {
                                                                                        %>
                                                                                        <option value="<%=ii%>"><%=ii%></option>
                                                                                        <%}%>



                                                                                    </select>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                                                </div> 





                                                                            </div>

                                                                        </div><br>

                                                                        <div class="row" >
                                                                            <div class="col-md-12 col-sm-12 col-xs-12">                                                   


                                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                                    <label >From Date<span class="required">*</span>
                                                                                    </label>
                                                                                    <select class="form-control" id="dayfrom" name="day">
                                                                                        <option value="">Day</option>
                                                                                        <%                                                                            for (int q = 1; q < 32; q++) {%>
                                                                                        <option value="<%=q%>"><%=q%></option>
                                                                                        <%}%>

                                                                                    </select>
                                                                                </div> 

                                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                                    <label >From Month<span class="required">*</span>
                                                                                    </label>
                                                                                    <select class="form-control" id="Monthfrom" name="Month">
                                                                                        <option value="">Month</option>
                                                                                        <option value="Jan">Jan</option>
                                                                                        <option value="Feb">Feb</option>
                                                                                        <option value="Mar">Mar</option>
                                                                                        <option value="Apr">Apr</option>
                                                                                        <option value="May">May</option>
                                                                                        <option value="Jun">Jun</option>
                                                                                        <option value="Jul">Jul</option>
                                                                                        <option value="Aug">Aug</option>
                                                                                        <option value="Sep">Sep</option>
                                                                                        <option value="Oct">Oct</option>
                                                                                        <option value="Nov">Nov</option>
                                                                                        <option value="Dec">Dec</option>

                                                                                    </select>
                                                                                </div>

                                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                                    <label >From Year<span class="required">*</span>
                                                                                    </label>
                                                                                    <select class="form-control row0" required="" id="Yearfrom" name="Year" >
                                                                                        <option value="">Select Year</option>
                                                                                        <option value="<%=year%>"><%=year%></option>
                                                                                        <option value="<%=year - 1%>"><%=year - 1%></option>



                                                                                    </select> 
                                                                                </div> 







                                                                            </div>

                                                                        </div><br>
                                                                        <div class="row" >
                                                                            <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                                                <label >Reason<span class="required">*</span>
                                                                                </label>
                                                                                <textarea  id="Reason" name="Reason" required="required"  class="form-control col-md-7 col-xs-12 ">
                                                                                </textarea>









                                                                            </div>

                                                                        </div>
                                                                    </div>  <br>





                                                                    <div class="form-group">
                                                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">

                                                                            <button class="btn btn-primary" type="reset">Reset</button>
                                                                            <button type="submit" class="btn btn-success" id="leaveaddbutton" >Submit</button>
                                                                        </div>
                                                                    </div>


                                                                </div>




                                                            </form>
                                                        </div>  
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel">
                                                                    <div class="x_title">
                                                                        <h2>All Leave Details </h2>   
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
                                                                        <table id="datatable-buttons" class="table table-striped table-bordered">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th class="table_center">Sr No</th>

                                                                                    <th class="table_center">Type_of_Leave  </th>
                                                                                    <th class="table_center">No_of_Days </th>


                                                                                    <th class="table_center">From_Date</th>
                                                                                    <th class="table_center">Till_Date</th>
                                                                                    <th class="table_center">Month</th>


                                                                                    <th class="table_center">Reason</th>


                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>

                                                                                <%  j = 0;
                                                                                    List<EmployeeWeekoff> allEmployeeWeekoff = new EmployeeWeekoffDao().getAllEmployeeWeekoff(ee);
                                                                                    for (EmployeeWeekoff p1 : allEmployeeWeekoff) {

                                                                                        j++;
                                                                                        String dateee = DATE_FORMAT.format(p1.getWeekoffDate());
                                                                                        
                                                                                %>
                                                                                <tr>
                                                                                    <td><%=j%></td>
                                                                                    <td><%=p1.getTypeofLeave()%></td>
                                                                                    <td><%=p1.getNoofday()%></td>
                                                                                    <td><%=dateee%></td>
                                                                                    <td><%=p1.getTillDate()%></td>
                                                                                    <td><%=p1.getMonth()%></td>
                                                                                    <td><%=p1.getReason()%></td>



                                                                                </tr><%}%>
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

                                        <div class="clearfix"></div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="example-modal">
                    <div class="modal" id="UpdateEmployee">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="../../UpdateEmployee" method="post" name="update" class="form-horizontal form-label-left">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">Update Employee</h4>
                                    </div>
                                    <input type="hidden" id="Modal_Employee_Id" name="Modal_Employee_Id">
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_name">Company Name <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_name"  name="modal_name" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_mobile">Mobile<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_mobile"  name="modal_mobile" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_alternateNo">Alternate No<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_alternateNo"  name="modal_alternateNo" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_email">Email<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_email"  name="modal_email" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_PermenantNO">Permanent No<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_PermenantNO"  name="modal_PermenantNO" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_qualification">Qualification<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_qualification"  name="modal_qualification" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_address">Address<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_address"  name="modal_address" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_permanentAddress">Permanent Address<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_permanentAddress"  name="modal_permanentAddress" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_designation">Designation<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_designation"  name="modal_designation" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_salary">Salary<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_salary"  name="modal_salary" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_joinDate">Join Date<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" readonly="" id="modal_joinDate"  name="modal_joinDate" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <!--                                    <div class="form-group">
                                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_branch">Branch<span class="required"></span>
                                                                                </label>
                                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                                                                                            <input type="text" id="modal_branch"  name="modal_branch" required="required" class="form-control col-md-7 col-xs-12">
                                                                                    <select class="form-control" id="modal_branch" name="modal_branch" >
                                                                                                                                                                    <option value="1">Select Branch</option>
                                        <%                                                                                BranchDao ad1 = new BranchDao();
                                            List<Branch> b1 = null;
                                            b1 = ad1.getAllBranch();
                                            if (b1
                                                    != null && b1.size()
                                                    > 0) {
                                                for (Branch p1 : b1) {

                                        %>
                                        <option value="<%=p1.getBranchId()%>"><%= p1.getBranchName()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>-->
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_inTime">Intime<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_inTime"  name="modal_inTime" readonly="" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_outTime">OutTime<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="time" id="modal_outTime"  name="modal_outTime" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>


                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary" id="updateProduct">Update</button>
                                        </div>
                                </form>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                </div>
            </div>
            <div class="modal fade" id="myModal22" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">

                        <div class="modal-body">
                            <form action="../../UpdateBankDetails" method="post" name="update" class="form-horizontal form-label-left">
                                <%                                          if (session.getAttribute(
                                            "i") != null) {
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
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Update Bank Details</h4>
                                </div>
                                <input type="hidden" id="Modal_Bank_Id"  name="Modal_Bank_Id">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_name">Bank Name <span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_Bank_name"  name="modal_Bank_name" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_mobile">Branch Name<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_Branch_name"  name="modal_Branch_name" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group"> 
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_alternateNo">Account No<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_AccountNo"  name="modal_AccountNo" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_email">Ifsc Code<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_IfscCode"  name="modal_IfscCode" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_PermenantNO">PAN No<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_PanNO"  name="modal_PanNO" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_qualification">Aadhar No<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_AadharNo"  name="modal_AadharNo" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_address">Bank Address<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_Bankaddress"  name="modal_Bankaddress" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>



                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary" id="updateProduct">Update</button>
                                    </div>
                            </form>
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




<!-- jQuery -->
<script src="../vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../vendors/fastclick/lib/fastclick.js"></script>
<script src="../production/js/jquery.formError.js" type="text/javascript"></script>
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




<%@ include file = "JavaScriptFile.jsp" %>



<script type="text/javascript">
                                                                                        $(document).ready(function() {


                                                                                            $('#Yearforadavance').change(function() {

                                                                                                var PaymnentMonth = $('#Monthforadavance').val();
                                                                                                var PaymnentYear = $('#Yearforadavance').val();
                                                                                                var empid = $('#empid').val();
                                                                                                if (PaymnentMonth != "")
                                                                                                {
                                                                                                    $.get("AjaxPages/FetchAdavance.jsp", {empid: empid, PaymnentMonth: PaymnentMonth, PaymnentYear: PaymnentYear}, function(data) {
                                                                                                        //   alert('sucess');
                                                                                                        $('#fetchadavanceamt').html(data);


                                                                                                    });

                                                                                                } else
                                                                                                {

                                                                                                    $("#Monthforadavance").formError("Please Select Month For Salary  ");
                                                                                                }
                                                                                            });





                                                                                        });
</script>





<script type="text/javascript">
    $(document).ready(function() {


        $('#PaymnentYear').change(function() {

            var PaymnentMonth = $('#PaymnentMonth').val();
            var PaymnentYear = $('#PaymnentYear').val();
            var empid = $('#empid').val();
            if (PaymnentMonth != "")
            {
                $.get("AjaxPages/FetchEmployeePayment.jsp", {empid: empid, PaymnentMonth: PaymnentMonth, PaymnentYear: PaymnentYear}, function(data) {
                    //   alert('sucess');
                    $('#paymentdetailsfetch').html(data);


                });

            } else
            {

                $("#PaymnentMonth").formError("Please Select Month For Salary  ");
            }
        });





    });
</script>
<script type="text/javascript">
    $(document).ready(
            function()
            {
                $("#Leave").change(validateform.controls.Leave);
                $("#noOfDaysforleave").change(validateform.controls.noOfDaysforleave);
                $("#Reason").change(validateform.controls.Reason);
                $("#leaveaddbutton").click(
                        function(event)
                        {

                            event.preventDefault();

                            if (validateform.all())
                            {



                                document.getElementById("LeaveForm").submit();

                            }
                        });
            });

    var validateform =
            (function()
            {
                var _regex =
                        {
                            emailAddressIsValid:
                                    function(emailAddress)
                                    {
                                        // http://stackoverflow.com/questions/2855865/jquery-validate-e-mail-address-regex
                                        var pattern = new RegExp(/^(("[\w-+\s]+")|([\w-+]+(?:\.[\w-+]+)*)|("[\w-+\s]+")([\w-+]+(?:\.[\w-+]+)*))(@((?:[\w-+]+\.)*\w[\w-+]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][\d]\.|1[\d]{2}\.|[\d]{1,2}\.))((25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\.){2}(25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\]?$)/i);

                                        return pattern.test(emailAddress);
                                    },
                            isWholeNumber:
                                    function(age)
                                    {
                                        var pattern = new RegExp(/^\d+$/);

                                        return pattern.test(age);
                                    }
                        };

                var all =
                        function()
                        {
                            var invalidControls = [];

                            var i = 0;
                            for (var controlValidationMethod in validateform.controls)
                            {


                                if (!validateform.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
                                {
                                    invalidControls.push(controlValidationMethod);
                                }
                            }

                            if (invalidControls.length > 0)
                            {
                                // Set focus on the first erroneous control
                                $("#" + invalidControls[0]).focus();
                            }
                            return invalidControls.length == 0;
                        };

                var controls =
                        {
                            Reason:
                                    function()
                                    {

                                        var $input = $(this);
                                        var isValid = true;

                                        if ($input.val() === "" || $input.val() == undefined)
                                        {

                                            $input.formError("Please Enter a Reason For LEave");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            noOfDaysforleave:
                                    function()
                                    {
                                        var $input = $(this);
                                        var isValid = true;

                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please Select No of Days For Leave");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            Leave:
                                    function()
                                    {
                                        var $input = $(this);
                                        var isValid = true;

                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please Select Leave Type");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            BirthDate:
                                    function()
                                    {


                                        var isValid = true;

                                        var Year = $('#Yearfrom').val();
                                        var Month = $('#Monthfrom').val();
//                                                                                                    alert(Month);
                                        var day = $('#dayfrom').val();
                                        $("#dayfrom").formError({remove: true});
                                        $("#Yearfrom").formError({remove: true});
                                        $("#Monthfrom").formError({remove: true});

                                        if (day == "")
                                        {
                                            $("#dayfrom").formError("Please Select Day ");

                                            isValid = false;
                                        }
                                        else if (Month == "")
                                        {
                                            $("#Monthfrom").formError("Please Select Month ");
                                            isValid = false;

                                        }
                                        else if (Year == "")
                                        {
                                            $("#Yearfrom").formError("Please Select Year ");
                                            isValid = false;
                                        }
                                        else if (Month === "Apr" || Month === "Jun" || Month === "Sep" || Month === "Nov")
                                        {

                                            if (day > 30)
                                            {

                                                $("#dayfrom").formError("Please Select Correct Date ");
                                                isValid = false;
                                            }
                                        }
                                        else if (Month === "Feb")
                                        {
//                                                                                                        alert("Dinesh");
                                            if (day > 28)
                                            {
                                                var x = Year % 4;
                                                if (x == 0)
                                                {
                                                    if (day != 29)
                                                    {
                                                        $("#dayfrom").formError("Please Select Correct Date ");
                                                        isValid = false;
                                                    }
                                                } else
                                                {

                                                    $("#dayfrom").formError("Please Select Correct Date ");
                                                    isValid = false;
                                                }
                                            }
                                        }


                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $("#Yearfrom").formError({remove: true});
                                            $("#Monthfrom").formError({remove: true});
                                            $("#dayfrom").formError({remove: true});

                                        }

                                        return isValid;
                                    }

                        };

                return {
                    "all": all,
                    "controls": controls};
            })();






</script>



</body>




</html>