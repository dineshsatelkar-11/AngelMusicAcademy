<%@page import="com.accede.angel.services.DynamicGenerator"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<!--<div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">

                <a href="#" class="site_title"><span>Angel Music</span> <img src="../production/images/angle-music-logo.png" style=" width: 50px;margin-top: 7px;margin-left: 10px "  alt="..." class="img-circle profile_img"> </a>
            </div>-->
<%
  if (session.getAttribute("BRANCH_ADMIN") != null) {
      
       Admin qwr= (Admin) session.getAttribute("BRANCH_ADMIN");
       int id22222=qwr.getAdminId();
       AdminDao adddd=new AdminDao();
        Admin admin=adddd.getAdminByID(id22222);
    String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
           
            DynamicGenerator dg = new DynamicGenerator();
            String no = dg.passwordGenerator();
            String sessionidd = no + timeStamp+admin.getAdminId();
            
            System.out.println("sessionidd=" + sessionidd);
       
 String ImgPath = admin.getImagename();
   System.out.println("ImgPath-"+ImgPath);
   if (ImgPath != null && !ImgPath.isEmpty()) 
   {
//                         ImgPath = ImgPath.substring(ImgPath.lastIndexOf("eb\\")+17);
                         System.out.println("ImgPath-"+ImgPath);
                         
                          System.out.println("ImgPath-"+ImgPath);
%>
<!--            <div class="clearfix"></div>

             menu profile quick info 
            <div class="profile clearfix">
              <div class="profile_pic">
                
                <img src="../../AdminImages/<%=ImgPath%>" alt="..." class="img-circle profile_img">
              </div>-->
              <%}else{
     %>
<!--          <div class="clearfix"></div>
        
             menu profile quick info 
            <div class="profile clearfix">
              <div class="profile_pic">
                
                <img src="../production/images/img.jpg" alt="..." class="img-circle profile_img">
              </div>     -->
                
                
                <%
 }%>
<!--              <div class="profile_info">
                <span>Welcome, </span>
                <h2><%=admin.getAdminName() %></h2>
              </div>
            </div>
             /menu profile quick info 

            <br />-->

            <!-- sidebar menu -->
<!--        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                    <li><a href="adminIndex.jsp"><i class="fa fa-home"></i> Home For Student </a></li>
                    <li><a href="../AdminSell/adminSellDashboard.jsp"><i class="fa fa-home"></i> Home For Billing </a></li>-->
<!--                  <li><a><i class="fa fa-edit"></i> Admissions <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="BranchAdmission.jsp">New Admissions</a></li>
                      <li><a href="allUsers.jsp">Approved Admissions</a></li>
                    </ul>
                  </li>-->
<!--                  <li><a><i class="fa fa-edit"></i> Repair <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="BranchRepairing.jsp">Repairing Request</a></li>
                      <li><a href="AllRepairing.jsp">All Repairing Request</a></li>
                      <li><a href="CloseRepairingRequest.jsp">Close Request</a></li>
                      <li><a href="allUsers.jsp">Approved Admissions</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-exchange"></i> Rent <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="InstrumentRent.jsp">Rent Request</a></li>
                      <li><a href="AllRentRequest.jsp">All Rent Request</a></li>
                      <li><a href="CloseRentRequest.jsp">Close Request</a></li>
                      <li><a href="allUsers.jsp">Approved Admissions</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-user"></i> Profile Picture <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="InstrumentRent.jsp">Rent Request</a></li>
                      <li><a href="SuperAdminProfilePic.jsp">Change Profile Picture</a></li>
                    
                      <li><a href="allUsers.jsp">Approved Admissions</a></li>
                    </ul>
                  </li>-->
<!--                  <li><a><i class="fa fa-question-circle-o"></i> Inquiry <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="BranchEnquiry.jsp">Inquiry</a></li>
                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>
                    </ul>
                  </li>-->
<!--                  <li><a><i class="fa fa-desktop"></i> Follow Up <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="TodayEnquiry.jsp">Today Inquiry</a></li>
                      <li><a href="Followupinquiry.jsp">All Inquiry</a></li>
                      <li><a href="ShiftedInquiry.jsp">Shifted Inquiry</a></li>
                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>
                    </ul>
                  </li>-->
<!--                  <li><a><i class="fa fa-graduation-cap"></i> Student List <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="All_Student.jsp">All Student List</a></li>
                      <li><a href="OldStudentList.jsp">Old Student List</a></li>
                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-credit-card"></i> Payment  <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="DailyInOut.jsp">Print Today Payment IN/OUT</a></li>
                      <li><a href="FilterInOut.jsp">Filter  Payment IN/OUT</a></li>
                      <li><a href="AllPaymentHistory.jsp">All Day Payment IN/OUT</a></li>
                     
                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-calendar"></i> Create TimeTable  <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="FilterStudent.jsp">Create Time Table</a></li>
                     
                     
                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>
                    </ul>
                  </li>-->
<!--                  <li><a><i class="fa fa-desktop"></i> Daily Expense Entry <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="Expense.jsp">Expense</a></li>
                      <li><a href="AllPaymentHistory.jsp">All Day Payment IN/OUT</a></li>
                     
                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>
                    </ul>
                  </li>-->
                  <!--
                  <li><a><i class="fa fa-table"></i> Exam <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="addExam.jsp">Add Exam</a></li>
                      <li><a href="getAllExamApplicationList.jsp">Exam Applications</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> Purchase<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="addPurchaseOrder.jsp">Purchase Order</a></li>
                    </ul>
                  </li>
-->                 
<!--<li><a><i class="fa fa-plus-circle"></i>Add Details <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="addBranch.jsp">Branches</a></li>
                      <li><a href="addSubject.jsp">Subjects</a></li>
                      <li><a href="addCourse.jsp">Course</a></li>
                      <li><a href="Package.jsp">Package</a></li>
                    
                      <li><a href="addInstrument.jsp">Instruments</a></li>
                      <li><a href="InstrumentRepair.jsp">Instruments Repair</a></li>
                      <li></li>
                      <li><a>Employee<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                           
                            <li><a href="EmployeeRegistr.jsp">Add Employee</a>
                            </li>
                            
                          </ul>
                        </li>
                     <li><a>PDF<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="AddPDFbyLesson.jsp">Add PDF</a>
                            </li>
                            <li><a href="UpdatePdf.jsp">Update PDF</a>
                            </li>
                            
                          </ul>
                        </li>
                        
                        
                        
                       
                        
                         <li><a>Video<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="UploadVideo.jsp">Upload Video</a>
                            </li>
                            <li><a href="UpdateVideo.jsp">Update Video</a>
                            </li>
                            
                          </ul>
                        </li>
                        
                        <li><a>Previous Student<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="PreviousStudent_1.jsp">Add Previous Student</a>
                            </li>
                            <li><a href="PreviousStudentReport.jsp">Previous  Student Report</a>
                            </li>
                            
                          </ul>
                        </li>
                     
                      
                      <li><a href="AddGallery.jsp">Pdf Gallery </a></li>
                    </ul>
                  </li>-->
                  
<!--                  
                  <li><a><i class="fa fa-plus-circle"></i>Account Report <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="AllAccount.jsp">All Account</a></li>

                    
                     
                    </ul>
                  </li>
                </ul>
              </div>
             

            </div>
             /sidebar menu 

          
          </div>
          </div>-->