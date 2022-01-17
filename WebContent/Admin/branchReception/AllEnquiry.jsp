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
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Enquiry Details </h2>   
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

                                    <!--                                           <div class="x_title">
                                                                        <div class="btn-group">
                                                                            <button class="btn btn-default user_buttons" data="All" id="All" type="button">All</button>
                                                                           
                                                                            <button class="btn btn-default user_buttons" data="Yesterday" id="Yesterday" type="button">Yesterday</button>
                                                                            <button class="btn btn-default user_buttons" data="Today" id="Today" type="button">Today</button>
                                                                           
                                                                          
                                                                            <button class="btn btn-default user_buttons" data="Tommorow" id="Tommorow" type="button">Tommorow</button>
                                                                          
                                                                        </div>
                                                                        <label class="col-md-offset-6" id="position">All Followup Request</label>
                                                                        <div class="clearfix"></div>
                                    
                                                                    </div>-->
                                    <input type="hidden" id="adminidd" name="adminidd" value="<%=admin.getAdminId()%>">
                                    <div id="studentfetch">    


                                        <div class="x_content">
                                            <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                        The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                    </p>-->
                                            <table id="datatable-buttons" class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>

                                                        <th class="table_center">Sr No</th>
                                                        <th class="table_center">Status</th>
                                                        <th class="table_center">Name</th>
                                                        <th class="table_center">Mobile No.</th>
                                                        <th class="table_center">Type of Enquiry</th>
                                                        <th class="table_center">Follow up</th>
                                                        <th class="table_center">Follow Up</th>
                                                        <!--<th class="table_center">Shift</th>-->
                                                        <!--<th class="table_center">Delete</th>-->
                                                        <th class="table_center">Email</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <%
                                                        EnquiryDao cd = new EnquiryDao();
                                                   
                                                            int i = 0;
                                                            List<Enquiry> cl = null;
                                                            cl = cd.getAllEnquiryFollowup1(admin);
                                                            if (cl != null && cl.size() > 0) {
                                                                for (Enquiry p : cl) {
                                                                  
String date1 = DATE_FORMAT.format(p.getFollowupDate());
                                                                 
                                                                        i++;

                                                    %>
                                                    <tr>

                                                        <td class="table_center"><%=i%> </td>
                                                       <td class="table_center">   <%if(p.isRemove())
                                                        {%>
                                                        <button class="btn btn-round btn-success btn-sm"> Open </button>
                                                    <%}else{%>
                                                      <button class="btn btn-round btn-danger btn-xs">Closed</button>
                                                    <%}%></td>
                                                        <td class="table_center"><%=p.getName()%> </td>
                                                        <td class="table_center"><%=p.getMobile()%></td> 
                                                        <td class="table_center"><%=p.getEnquiryType()%></td> 
                                                        <td class="table_center"><%=date1%></td> 
                                                        <td class="table_center"><a href="followup.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">Follow Up</a></td>
                                                        <!--                                                 <%
                                                            if (p.getEnquiryType().equals("MusicClass")) {
                                                        %>
                                                         <td class="table_center"><a href="BranchAdmission.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-primary btn-xs">Shift To Admission</a></td>
                                                        <%} else if (p.getEnquiryType().equals("Sell")) {%>
                                                       
                                                        <td class="table_center"><a href="BranchSell.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-info btn-xs">Shift To Sell</a></td>
                                                        <%} else if (p.getEnquiryType().equals("Repair")) {%>
                                                        <td class="table_center"><a href="BranchRepairing.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-warning btn-xs">Shift To Repair</a></td>
                                                        <%} else {%>
                                                        <td class="table_center"><a href="InstrumentRent.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-default btn-xs">Shift To Rent</a></td>
                                                        <%}%>
                                                          <form class="form-horizontal form-label-left"  action="../../DeleteInquiry" method="get">
                                                    <input type="hidden" value="<%=p.getId()%>" id="studentidd" name="studentidd">
                                                    <td class="table_center"><input type="submit" class="btn btn-round btn-success btn-xs" value="Delete Inquiry"></td>
                                                </form>-->
                                                        <td class="table_center"><%=p.getEmail()%></td> 
                                                    </tr> 
                                                    <%}
                                                            
                                                        }%>

                                                </tbody>
                                            </table>
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


        <script>
            $(document).ready(function() {

                $('.user_buttons').click(function(event) {
                    var UID = this.id;
                    var adminidd = $("#adminidd").val();
                    if (UID !== "")
                    {
                        var pos = $(this).attr("data");
                        $("#position").text("" + pos + " Follow-Up Customer");
                        $.ajax({
                            url: "followupajax.jsp",
                            type: "post",
                            data: {userID: UID, adminidd: adminidd},
                            success: function(response) {
                                $("#studentfetch").html(response);
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                console.log(textStatus, errorThrown);
                                alert("Something Went Wrong...!!!");
                            }
                        });
                    } else
                    {
                        alert("No Users Added...!!!");
                    }
                });



            });
        </script>


    </body>
</html>