<%@page import="com.accede.angel.admin.dao.PreviliageLevelDao"%>
<%@page import="com.accede.angel.admin.model.PreviliageLevel"%>
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

                <%@ include file = "../comman_files/adminSideBarFile.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div role="main">
                    <div class="">

                        <div class="page-title">
                            <div class="title_left">
                                <h3>Branch Details </h3>
                            </div>


                        </div>
                        <div class="clearfix"></div>

                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <%                                         
                                            Admin branchh = admin;
                                            AdminPrevilleagesDao apd = new AdminPrevilleagesDao();
                                            AdminPrevilleages p1 = apd.getAdminPrevilleages(admin, "2");
                                            AdminPrevilleages p2 = apd.getAdminPrevilleages(admin, "3");

                                        %>
                                        <input type="hidden" id="adminid" name="adminid" value="<%=branchh.getAdminId()%>">
                                        <h2>Branch Name:- <%=branchh.getAdminOfBranch().getBranchName()%></h2>   
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


                                                    <th class="table_center">Name </th>


                                                    <th class="table_center">Reception Previliage</th>




                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    int i = 0;
                                                    i++;
                                                %>

                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">ALL ACCOUNT REPORT</td>
                                                  
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isAllAccounts()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">ALL STUDENT REPORT</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isAllStudent()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>

                                                    <td class="table_center" id="">VANISH HISTORY REPORT</td>
                                                    
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isVanished()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>

                                                    <td class="table_center" id="">ALL RENT REQUEST</td>
                                                    
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isAllRentRequest()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">ALL REPAIR REQUEST</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isAllRepairing()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">ALL EMPLOYEE ACCOUNT REPORT</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isAllEmployee()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">ALL PAYMENT IN/OUT REPORT</td>
                                                    
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isDailyInOut()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">ALL ENQUIRY REPORT</td>
                                                    
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isAllEnquiry()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">ADD BATCH TIMING</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isBatch_Timing()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">ADD PACKAGE</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isPackage()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">ALL VENDOR ACCOUNT</td>
                                                 
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isVendor_Account()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">ADD SMS</td>
                                                  
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isSMS()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">SEND PROMOTIONAL SMS</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isSend_Promotional_SMS()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">BRANCH SELL REPORT</td>
                                                  
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isBranch_Sell_Report()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">CLASS BRANCH SELL REPORT</td>
                                                  
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isClass_Branch_Sell_Report()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">CUSTOMER SELL REPORT</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isCustomer_Sell_Report()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">BRANCH PRODUCT REPORT</td>
                                                  
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isBranch_Product_Report()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">BRANCH PRODUCT AVAILABLE REPORT	</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isAvailable_Product()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">CLASS PRODUCT STOCK REPORT</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isClass_Product_Stock_Report()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">TIMETABLE DISPLAY</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isTime_Table()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">EXPENSE DETAILS</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isExpense()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">NEW ENQUIRY</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isEnquiry()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">NEW ACCOUNT</td>
                                                    
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isNew_Account()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">BALANCE SHOW</td>
                                                    
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isBalance()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">ENQUIRY FOLLOWUP REPORT</td>
                                                    
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isEnquiryReport()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">PAYMENT FOLLOWUP REPORT</td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isPayemtReport()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
<tr>
                                                    <td class="table_center"><%=i++%></td>
                                                    <td class="table_center" id="">ASSIGN PREVILIAGE </td>
                                                   
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isPreviliageTab()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                     <td class="table_center" id="">ACTIVE PACKAGE </td>
                                        
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isActivePackage()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                     <td class="table_center" id="">INSTRUMENT RENT LIST  </td>
                                                
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isRentCostReport()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td class="table_center"><%=i++%></td>
                                                     <td class="table_center" id="">INSTRUMENT REPAIR LIST </td>
                                
                                                    <td class="table_center">
                                                        <input type="checkbox" <%if (p2.isRepairCostReport()) {%>checked="checked" <%}%> id="reception-<%=i%>" class="reception" name="reception-<%=i%>" value="<%=i%>" class=" instrumentCheck ">
                                                    </td>
                                                </tr>
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
        <script src="../production/js/Alertajax.js" type="text/javascript"></script>
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
                $("#datatable").on("click", ".admin", function() {

                    if ($(this).prop("checked") == true) {
                        var id = this.id;
//                           alert("id-"+id);
                        var checkboxval=this.value;
//                         alert("checkboxval-"+id);
                         var adminid = $('#adminid').val();
//                          alert("adminid-"+id);
                         var Checkstatus="1";
                         var typeofadmin="2";
//                          alert("checkedval="+id);
                        
//                      alert("type="+typeofadmin);
                       $.get("AjaxPages/Previliage.jsp", {typeofadmin:typeofadmin,adminid:adminid ,checkboxval:checkboxval ,Checkstatus:Checkstatus}, function(data) {
//                       alert('sucess');
                  
                });
                    } else if ($(this).prop("checked") == false) {
                        var id = this.id;
//                           alert("id-"+id);
                        var checkboxval=this.value;
//                         alert("checkboxval-"+id);
                         var adminid = $('#adminid').val();
//                          alert("adminid-"+id);
                         var Checkstatus="2";
                         var typeofadmin="2";
//                          alert("checkedval="+id);
                       $.get("AjaxPages/Previliage.jsp", {typeofadmin:typeofadmin,adminid:adminid ,checkboxval:checkboxval ,Checkstatus:Checkstatus}, function(data) {
//                       alert('sucess');
                  
                });
                    }
                });
                 $("#datatable").on("click", ".reception", function() {

                    if ($(this).prop("checked") == true) {
                        var id = this.id;
//                           alert("id-"+id);
                        var checkboxval=this.value;
//                         alert("checkboxval-"+id);
                         var adminid = $('#adminid').val();
//                          alert("adminid-"+id);
                         var Checkstatus="1";
                         var typeofadmin="3";
//                          alert("checkedval="+id);
                        
//                      alert("type="+typeofadmin);
                       $.get("AjaxPages/Previliage.jsp", {typeofadmin:typeofadmin,adminid:adminid ,checkboxval:checkboxval ,Checkstatus:Checkstatus}, function(data) {
//                       alert('sucess');
                  
                });
                    } else if ($(this).prop("checked") == false) {
                        var id = this.id;
//                           alert("id-"+id);
                        var checkboxval=this.value;
//                         alert("checkboxval-"+id);
                         var adminid = $('#adminid').val();
//                          alert("adminid-"+id);
                         var Checkstatus="2";
                         var typeofadmin="3";
//                          alert("checkedval="+id);
                       $.get("AjaxPages/Previliage.jsp", {typeofadmin:typeofadmin,adminid:adminid ,checkboxval:checkboxval ,Checkstatus:Checkstatus}, function(data) {
//                       alert('sucess');
                  
                });
                    }
                });
                
                
            });
        </script>
        <style>

            .table_center{

                text-align: center;
            }

        </style>

    </body>
</html>