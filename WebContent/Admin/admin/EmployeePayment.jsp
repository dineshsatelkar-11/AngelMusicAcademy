
<%@page import="com.accede.angel.admin.model.EmployeePayment"%>
<%@page import="com.accede.angel.admin.model.EmployeeSalary"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDao"%>
<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.dao.ColorDao"%>
<%@page import="com.accede.angel.sell.dao.BrandDao"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<!DOCTYPE html>
<html lang="en">
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

                        <div class="page-title">
                            <div class="title_left">
                                <h3>Employee Payment History</h3>
                            </div>


                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Add Payment Report </h2>
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
                                        <form method="post" action="../../EmployeePaymentSave" id="demo-form2"  onsubmit="return valid();" data-parsley-validate class="form-horizontal form-label-left">
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
                                                long Eid = Long.parseLong(request.getParameter("asd"));
                                                EmployeeDao bd = new EmployeeDao();
                                                Employee ee = bd.getEmployeeByID(Eid);


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
                                                                <label >Employee Salary<span class="required">*</span>
                                                                </label>
                                                                <input type="text" id="employeesalary" name="employeesalary" value="<%=ee.getSalary()%>" readonly required="required" onkeypress="return alpha(event)" class="form-control col-md-7 col-xs-12">

                                                            </div>

                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                <label >Select Month of the Salary<span class="required">*</span>
                                                                </label>
                                                                <select class="form-control row0" required="" id="Month" name="Month" >
                                                                    <option value="">Select Month</option>

                                                                    <option value="January">January</option>
                                                                    <option value="February">February</option>
                                                                    <option value="March">March</option>
                                                                    <option value="April">April</option>
                                                                    <option value="May">May</option>
                                                                    <option value="June">June</option>
                                                                    <option value="July">July </option>
                                                                    <option value="August">August</option>
                                                                    <option value="September">September</option>
                                                                    <option value="October">October</option>
                                                                    <option value="November">November</option>
                                                                    <option value="December">December</option>

                                                                </select>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                            </div> 







                                                        </div>

                                                    </div><br>

                                                    <div class="row" >
                                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   


                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                <label >No of days<span class="required">*</span>
                                                                </label>
                                                                <input type="text" id="noOfDays" name="noOfDays" required="required" value="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">

                                                            </div> 

                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                <label >Payment Amount<span class="required">*</span>
                                                                </label>
                                                                <input type="text" id="paymentamt" readonly="" name="paymentamt" required="required" value="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">

                                                            </div>

                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                <label >Incentive Amount<span class="required">*</span>
                                                                </label>
                                                                <input type="text" id="incntamt" name="incntamt" required="required" value="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">

                                                            </div> 







                                                        </div>

                                                    </div><br>
                                                    <div class="row" >
                                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   


                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                <label >Extra Hours/Over Time<span class="required">*</span>
                                                                </label>
                                                                <input type="text" id="extrahours" name="extrahours" required="required" value="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">
                                                                <input type="hidden" id="workingtypes" name="workingtypes" required="required" value="<%=ee.getWorkingType()%>"  class="form-control col-md-7 col-xs-12 row0">

                                                            </div> 

                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                <label >Overtime Amount<span class="required">*</span>
                                                                </label>
                                                                <input type="text" id="overtime" name="overtime" readonly="" required="required" value="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">

                                                            </div>

                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                <label >Total Amount<span class="required">*</span>
                                                                </label>
                                                                <input type="text" id="totalamt" name="totalamt" readonly="" value="0" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12">

                                                            </div> 







                                                        </div>

                                                    </div><br>
                                                    <div class="row" >
                                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   


                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                <label >Employee Advance<span class="required">*</span>
                                                                </label>
                                                                <input type="text" id="employeeadvance" name="employeeadvance" value="<%=ee.getAdvance()%>" readonly required="required" onkeypress="return alpha(event)" class="form-control col-md-7 col-xs-12">

                                                            </div> 

                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                <label >Final Amount<span class="required">*</span>
                                                                </label>
                                                                <input type="text" id="finalamt" name="finalamt" readonly="" value="0" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12">

                                                            </div>

                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                <label >Balance Advance Amount<span class="required">*</span>
                                                                </label>
                                                                <input type="text" id="baladvamt" name="baladvamt" readonly="" value="0" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12">

                                                            </div> 







                                                        </div>

                                                    </div>
                                                </div>  <br>





                                                <div class="form-group">
                                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">

                                                        <button class="btn btn-primary" type="reset">Reset</button>
                                                        <button type="submit" class="btn btn-success" >Update</button>
                                                    </div>
                                                </div>


                                            </div>




                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
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
                                                    <th class="table_center">Balance Advance Payment </th>

                                                </tr>
                                            </thead>
                                            <tbody>

                                                <% int j = 0;
                                                    List<EmployeePayment> c = bd.getAllEmployeePayment();
                                                    for (EmployeePayment p : c) {
                                                        if (Eid == p.getEmployee().getId()) {
                                                            j++;
 String dateee  = DATE_FORMAT.format(p.getSalaryDate());
                                                %>
                                                <tr>

                                                    <td class="table_center"><%=j%> </td>
                                                    <td class="table_center"><%=p.getEmployee().getName()%></td> 
                                                    <td class="table_center"><%=dateee%></td> 
                                                    <td class="table_center"><%=p.getActualSalary()%></td> 
                                                    <td class="table_center"><%=p.getMonth()%></td> 
                                                    <td class="table_center"><%=p.getNoOfDays()%></td> 
                                                    <td class="table_center"><%=p.getPayment()%></td> 
                                                    <td class="table_center"><%=p.getIncentive()%></td> 
                                                    <td class="table_center"><%=p.getExtrahours()%></td> 
                                                    <td class="table_center"><%=p.getOvertimeamt()%></td> 
                                                    <td class="table_center"><%=p.getTotalamount()%></td> 
                                                    <td class="table_center"><%=p.getAdvance()%></td> 
                                                    <td class="table_center"><%=p.getFinalamount()%></td> 
                                                    <td class="table_center"><%=p.getBalanceadvanceamt()%></td> 



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
                <!-- /page content -->


                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
            </div>
        </div>
        <script src="../production/css/Alertajax.js" type="text/javascript"></script>

        <script src="../production/js/Swal.js" type="text/javascript"></script>
        <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>

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


        <style>

            .table_center{

                text-align: center;
            }

        </style>

        <script type="text/javascript">
                                                                    $('#document').ready(function() {


                                                                        $('.row0').on('keyup change', function() {

                                                                            var Month = $('#Month').val();
                                                                            if (Month != "")
                                                                            {
                                                                                var noOfDays = $('#noOfDays').val();
                                                                                var baladvamt = $('#baladvamt').val();
                                                                                var finalamt = $('#finalamt').val();
                                                                                var extrahours = $('#extrahours').val();
                                                                                var overtime = $('#overtime').val();
                                                                                var workingtypes = $('#workingtypes').val();
                                                                                var employeeadvance = $('#employeeadvance').val();
                                                                                var Month = $('#Month').val();
                                                                                var employeesalary = $('#employeesalary').val();
                                                                                var incntamt = $('#incntamt').val();
                                                                                var days = 0;
                                                                                if (Month == "January" || Month == "May" || Month == "March" || Month == "July" || Month == "August" || Month == "October" || Month == "December")
                                                                                {
                                                                                    days = 31;
                                                                                }
                                                                                else if (Month == "April" || Month == "June" || Month == "September" || Month == "November")
                                                                                {
                                                                                    days = 30;
                                                                                }
                                                                                else
                                                                                {
                                                                                    days = 28;
                                                                                }
                                                                                var c = parseInt(employeesalary) / days;
                                                                                var workinghours = 0;
                                                                                if (workingtypes == "Part")
                                                                                {
                                                                                    workinghours = 5;
                                                                                } else {

                                                                                    workinghours = 9;
                                                                                }

                                                                                var perhouramt = c / workinghours;
                                                                                var overtime = perhouramt * extrahours;
//                                                                    alert(c);
                                                                                c = Math.round(c);
                                                                                overtime = Math.round(overtime);
//                                                                    alert("hgadf="+c)
                                                                                var cd = parseInt(c) * parseInt(noOfDays);

                                                                                var cou = Math.round(cd);

                                                                                $('#paymentamt').val(cou);
                                                                                $('#overtime').val(overtime);
                                                                                var cou1 = parseInt(cou) + parseInt(incntamt) + parseInt(overtime);

                                                                                $('#totalamt').val(cou1);
                                                                                var finalamttt = parseInt(cou1) - parseInt(employeeadvance);
                                                                                if (finalamttt < 0)
                                                                                {
                                                                                    $('#finalamt').val(0);
                                                                                    finalamttt = parseInt(employeeadvance) - parseInt(cou1);

                                                                                    $('#baladvamt').val(finalamttt);

                                                                                } else
                                                                                {
                                                                                    $('#finalamt').val(finalamttt);
                                                                                    $('#baladvamt').val(0);
                                                                                }




                                                                                //                                                                                alert(totalcoursefee);
                                                                            } else
                                                                            {
                                                                                swal({
                                                                                    title: 'These is not allowed.!',
                                                                                    html: $('<div>')
                                                                                            .addClass('some-class')
                                                                                            .text('Select Month of the Salary.....'),
                                                                                    animation: false,
                                                                                    customClass: 'animated tada'
                                                                                });
                                                                            }

                                                                        });


                                                                        $('#Month').on('keyup change', function() {

                                                                     

                                                                $('#noOfDays').val(0);
                                                                           $('#baladvamt').val(0);
                                                                           $('#finalamt').val(0);
                                                                         $('#extrahours').val(0);
                                                                          $('#overtime').val(0);
                                                                        
                                                                             $('#incntamt').val(0);
                                                                            
                                                                           
                                                                           
                                                                        
                                                                            $('#paymentamt').val(0);
                                                                            $('#overtime').val(0);
                                                                           
                                                                            $('#totalamt').val(0);
                                                                           
                                                                                $('#finalamt').val(0);
                                                                              
                                                                                $('#baladvamt').val(0);

                   
                                                                                $('#finalamt').val(0);
                                                                                $('#baladvamt').val(0);
                                                                            





                                                                        });



                                                                    });

        </script>

    </body>
</html>