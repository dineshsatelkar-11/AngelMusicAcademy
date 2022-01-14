<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">

                <a href="index.html" class="site_title"><span>Angel Music</span> <img src="../production/images/angle-music-logo.png" style=" width: 50px;margin-top: 7px;margin-left: 10px "  alt="..." class="img-circle profile_img"> </a>
            </div>
<%
  if (session.getAttribute("BRANCH_ADMIN") != null) {
      
       Admin qwr= (Admin) session.getAttribute("BRANCH_ADMIN");
        int id22222=qwr.getAdminId();
       AdminDao adddd=new AdminDao();
        Admin admin=adddd.getAdminByID(id22222);
       
String ImgPath = admin.getImagename();
          if (ImgPath != null && !ImgPath.isEmpty()) 
   {
//                         ImgPath = ImgPath.substring(ImgPath.lastIndexOf("eb\\")+17);
                         System.out.println("ImgPath-"+ImgPath);
                         
                          System.out.println("ImgPath-"+ImgPath);
%>
            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                
                <img src="../../AdminImages/<%=ImgPath%>" alt="..." class="img-circle profile_img">
              </div>
              <%}else{
     %>
          <div class="clearfix"></div>
        
            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                
                <img src="../production/images/img.jpg" alt="..." class="img-circle profile_img">
              </div>     
                
                
                <%
 }%>
              <div class="profile_info">
                <span>Welcome, Branch Reception</span>
                <h2><%=admin.getAdminName() %></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                    <li><a href="branchReceptionIndex.jsp"><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a></li>
                  <li><a><i class="fa fa-external-link"></i> Admissions <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="BranchAdmission.jsp">New Admissions</a></li>
<!--                      <li><a href="allUsers.jsp">Approved Admissions</a></li>-->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Repair <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="BranchRepairing.jsp">Repairing Request</a></li>
                      <li><a href="AllRepairing.jsp">All Repairing Request</a></li>
<!--                      <li><a href="CloseRepairingRequest.jsp">Close Request</a></li>-->
<!--                      <li><a href="allUsers.jsp">Approved Admissions</a></li>-->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-exchange"></i> Rent <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="InstrumentRent.jsp">Rent Request</a></li>
                      <li><a href="AllRentRequest.jsp">All Rent Request</a></li>
<!--                      <li><a href="CloseRentRequest.jsp">Close Request</a></li>-->
<!--                      <li><a href="allUsers.jsp">Approved Admissions</a></li>-->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-question-circle-o"></i> Enquiry <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="BranchEnquiry.jsp">Enquiry</a></li>
<!--                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>-->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-folder-open"></i> Follow Up <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                   
                      <li><a href="Followupinquiry.jsp">All Inquiry</a></li>
<!--                      <li><a href="ShiftedInquiry.jsp">Shifted Inquiry</a></li>-->
<!--                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>-->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-folder-open"></i> Sell <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                   
                      <li><a href="CustomerSale.jsp">Customer Sell</a></li>
<!--                      <li><a href="ShiftedInquiry.jsp">Shifted Inquiry</a></li>-->
<!--                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>-->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-graduation-cap"></i> Student List <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="AllStudent.jsp">All Student List</a></li>
<!--                      <li><a href="OldStudentList.jsp">Old Student List</a></li>-->
<!--                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>-->
                    </ul>
                  </li>
<!--                  <li><a><i class="fa fa-desktop"></i> Payment  <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="DailyInOut.jsp">Today Payment IN/OUT</a></li>
                      <li><a href="AllPaymentHistory.jsp">All Day Payment IN/OUT</a></li>
                     
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
                  <li><a><i class="fa fa-clone"></i>Add Details <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="addBranch.jsp">Branches</a></li>
                      <li><a href="addSubject.jsp">Subjects</a></li>
                      <li><a href="addCourse.jsp">Course</a></li>
                      <li><a href="addBatchTiming.jsp">Batch Time</a></li>
                      <li><a href="addInstrument.jsp">Instruments</a></li>
                      <li><a href="addInstrumentSubcategory.jsp">Instruments Subcategory</a></li>
                      <li><a href="addProducts.jsp">Product</a></li>
                      <li><a href="addGallery.jsp">Gallery</a></li>
                    </ul>
                  </li>-->
                </ul>
              </div>
             

            </div>
            <!-- /sidebar menu -->

          
          </div>