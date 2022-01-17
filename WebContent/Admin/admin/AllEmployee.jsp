<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDao"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
   <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
<%    if (session.getAttribute("printInvoiceID") != null) {
            long celloId = (Long) session.getAttribute("printInvoiceID");
            session.removeAttribute("printInvoiceID");
    %>
    <script>
        window.open("Final_Reapairing.jsp?repairing_id=<%=celloId%>");</script>
        <%
            }


        %>
    <script src="../production/js/Alertajax.js" type="text/javascript"></script>
     <script type="text/javascript">
                                                    $('#document').ready(function () {

$("#datatable").on("click", ".edit_prd2", function(){
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
        $('#document').ready(function () {

 $("#datatable").on("click", ".edit_prd1", function(){
         
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
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
               
                    <%@ include file = "../comman_files/adminSideBarFile.jsp" %>
         

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div role="main">
                    <div class="">
                      
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Employee Details </h2>  
                                         <ul class="nav navbar-right panel_toolbox">

                                          
                                             <li> <p><a href="EmployeeRegistr.jsp"><button type="button" class="btn btn-round btn-sm btn-info "  >Create Employee Account</button> </a></p>
                                           </li>
                                        </ul>
                               
                                        <div class="clearfix"></div>
                                        <%

                                            if (session.getAttribute("i") != null) {
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
                                    </div>
                                    <div class="x_content">
                                        <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                </p>-->
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="table_center">Sr No</th>
                                                     <th class="table_center">Profile Pic</th>
                                                     <th class="table_center">Name</th>
                                                    <!--<th class="table_center">Edit</th>-->
                                                    <!--<th class="table_center">Delete</th>-->
                                                     <th class="table_center">Profile</th>
<!--                                                     <th class="table_center">Salary Details</th>
                                                    <th class="table_center">Payment Details</th>
                                                    <th class="table_center">Advance Payment </th>
                                                    <th class="table_center">Bank Details</th>-->
                                                    <th class="table_center">Status </th>
                                                    <th class="table_center">Active/Deactive </th>
                                                    <!--<th class="table_center">Active/Deactive History</th>-->
                                                   
                                                    <th class="table_center">Mobile</th>
<!--                                                    <th class="table_center">Email</th>
                                                    <th class="table_center">Alternate NO.</th>
                                                    <th class="table_center">Permanent No</th>
                                                    <th class="table_center">Qualification</th>
                                                    <th class="table_center">Address</th>
                                                    <th class="table_center">Permanent Address</th>-->
                                                    <th class="table_center">Designation</th>
                                                    <th class="table_center">Salary</th>                                                       
                                                    <th class="table_center">Joining Date</th>                                                       
                                                    <th class="table_center">Branch</th>                                                       
<!--                                                    <th class="table_center">In Time</th>                                                       
                                                    <th class="table_center">Out Time</th> -->


                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% int j = 0;
                                                    // AdminDao aa = new AdminDao();
                                                    EmployeeDao bd = new EmployeeDao();
                                                    Employee b2 = new Employee();
                                                    List<Employee> c = bd.getAllEmployee();
                                                    for (Employee p : c) {
                                                        j++;
                                                        boolean b5 = p.isEmp_Status();
                                                        if (b5) {

String date1 = DATE_FORMAT.format(p.getJoiningDate());
                                                %>
                                                <tr>
                                                    <td class="table_center"  ><%=j%>

                                                        <input type="hidden" name="vendor_id" value="<%=p.getId()%>">
                                                        <input type="hidden"  id="Branch<%=j%>" value="<%=p.getBranchid()%>">
                                                        <input type="hidden" name="bank_id" value="<%=p.getBankDetailId().getId()%>">
                                                    </td> 
                                                    <td class="table_center"> <img onclick="openmodel(this.id)"  width="40" height="40" src="../../EmployeeImages/<%=p.getImage()%>" alt="..." class="myImg" ></td>
                                                       
                                                     <td class="table_center" id="Company_name<%=j%>"><%=p.getName()%></td> 
                                                    <!--<td class="table_center"><a href="#UpdateEmployee" role="button" data-toggle="modal" data-id="<%=j%>"><i id="<%=j%>" class="fa-2x glyphicon glyphicon-edit edit_prd1"></i></a></td>-->
<!--                                            <form action="../../DeleteEmplpoyee" method="post">
                                                <td class="table_center">
                                                    <input type="hidden" value="<%=p.getId()%>" id="deleteEmployee" name="deleteEmployee">
                                                    <button class="btn btn-danger table_center">Delete</button>

                                                </td>

                                            </form>-->
                                             <td> <a href="EmployeeDetails.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">Profile</a></td>
<!--                                             <td> <a href="ViewSalary.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">View Salary Increment</a></td>
                                              <td> <a href="EmployeePayment.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">Payment Details</a></td>
                                              <td> <a href="EmployeeAdvance.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">Advance Payment </a></td>
                                           
                                            <td><button type="button" id="<%=j%>" class="btn btn-success  edit_prd2" data-toggle="modal" data-target="#myModal22">View Bank</button></td>-->
  <!--                                           <td><button class="btn btn-success table_center edit_bank" <a href="#myModal22"  role="button" data-toggle="modal" data-id="<%=j%>"><i id="<%=j%>">View Bank</i></a></button></td>-->
                                            <%
                                                if (p.isStatus()) {
                                            %>
                                            <td class="table_center">Active </td>
                                            <form action="../../EmployeeActive" method="post">
                                                <input type="hidden" name="empid" name="empid" value="<%=p.getId()%>">
                                                <input type="hidden" name="status" name="status" value="1" >


                                                <td class="table_center"><button type="submit" class="btn btn-round btn-danger btn-xs">Deactivate</button></td>
                                            </form>
                                            <%} else {%>
                                            <td class="table_center">Deactive </td>
                                            <form action="../../EmployeeActive" method="post">
                                                <input type="hidden" name="empid" name="empid" value="<%=p.getId()%>">
                                                <input type="hidden" name="status" name="status" value="2" >

                                                <td class="table_center"><button type="submit" class="btn btn-round btn-success btn-xs">Activate</button></td>
                                            </form>
                                            <% }%>
  <!--<td class="table_center"><a href="ActiveHistory.jsp?Employeeid=<%=p.getId()%>" role="button" class="btn btn-round btn-success btn-xs">Active History</a></td>-->

                                           
                                            <td class="table_center" id="Mobile<%=j%>"><%=p.getMobileNo()%></td> 
<!--                                            <td class="table_center" id="Email<%=j%>"><%=p.getEmail()%></td> 
                                            <td class="table_center" id="AlternateNo<%=j%>"><%=p.getAlternateNo()%></td> 
                                            <td class="table_center" id="PermanentNo<%=j%>"><%=p.getPermanentNo()%></td> 
                                            <td class="table_center" id="Qualification<%=j%>"><%=p.getQualification()%></td> 
                                            <td class="table_center" id="Address<%=j%>" ><%=p.getAddress()%></td> 
                                            <td class="table_center" id="PermanentAddress<%=j%>"><%=p.getPermanentAddress()%></td> -->
                                            <td class="table_center" id="Designation<%=j%>"><%=p.getDesignation()%></td> 
                                            <td class="table_center" id="Salary<%=j%>"><%=p.getSalary()%></td> 
                                            <td class="table_center" id="JoinDate<%=j%>"><%=date1%></td>
                                            <td class="table_center" >
                                                
                                                <%
                                                

int branch_id=p.getBranchid();
if(branch_id== 1)
{
                                                %>
                                               Main Branch
                                               <%}else{%>
                                                <%=p.getAdmin().getAdminOfBranch().getBranchName()%>
                                            <%}%></td> 
<!--                                            <td class="table_center" id="InTime<%=j%>"><%=p.getIntime()%></td> 
                                            <td class="table_center" id="OutTime<%=j%>"><%=p.getOuttime()%></td> -->
                                            <input type="hidden" id="BankName<%=j%>" style="display: none" value="<%=p.getBankDetailId().getBankName()%>"</td> 
                                            <input type="hidden" class="table_center" id="BranchName<%=j%>" style="display: none" value="<%=p.getBankDetailId().getBankName()%>">
                                            <input type="hidden" class="table_center" id="BankAccount<%=j%>" style="display: none" value="<%=p.getBankDetailId().getBankAccountNo()%>">
                                            <input type="hidden" class="table_center" id="BankIfsc<%=j%>" style="display: none" value="<%=p.getBankDetailId().getIfscCode()%>">
                                            <input type="hidden" class="table_center" id="PanNumber<%=j%>" style="display: none" value="<%=p.getBankDetailId().getPanNumber()%>">
                                            <input type="hidden" class="table_center" id="AdharNo<%=j%>" style="display: none" value="<%=p.getBankDetailId().getAadharNo()%>">
                                            <input type="hidden" class="table_center" id="BankAddress<%=j%>" style="display: none" value="<%=p.getBankDetailId().getBankAddress()%>">
                                            
                                            </tr>  
                                            <%
                                                    }
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
                                                    if (b1 != null && b1.size() > 0) {
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
    </body>
</html>