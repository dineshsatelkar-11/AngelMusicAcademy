<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<!--<div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">

                <a href="#" class="site_title"><span>Angel Music</span> <img src="../production/images/angle-music-logo.png" style=" width: 50px;margin-top: 7px;margin-left: 10px "  alt="..." class="img-circle profile_img"> </a>
            </div>-->
<%
  if (session.getAttribute("Student") != null) {
      
       Admission student1= (Admission) session.getAttribute("Student");
       long studentid=student1.getAdmissionId();
        Admission student=new AdmissionDao().getAdmissionByID(studentid);
   String ImgPath = student.getImage();
//                         ImgPath = ImgPath.substring(ImgPath.lastIndexOf("eb\\")+17);
//                         System.out.println("ImgPath-"+ImgPath);
//                         
                          System.out.println("ImgPath-"+ImgPath);
        
%>
            <!--<div class="clearfix"></div>-->

            <!-- menu profile quick info -->
<!--            <div class="profile clearfix">
              <div class="profile_pic">
                
                  <img src="../../StudentImages/<%=ImgPath%>" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome, Student</span>
                <h2><%=student.getFirstName()%></h2>
              
              
               
                
              </div>
            </div>-->
            <!-- /menu profile quick info -->

            <!--<br />-->

            <!-- sidebar menu -->
<!--        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                    <li><a href="StudentIndex.jsp"><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a></li>
                  
                   <li><a><i class="fa fa-user"></i> Student Profile <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="StudentProfile.jsp">Profile  </a></li>
                      <li><a href="ChangeProfilePic.jsp">Change Profile Picture  </a></li>-->
<!--                      <li><a href="OldStudentList.jsp">Old Student List</a></li>-->
<!--                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>-->
<!--                    </ul>
                  </li>
                   <li><a><i class="fa fa-info-circle"></i> Student Course <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="CourseDetails.jsp">Course Details  </a></li>-->
<!--                      <li><a href="OldStudentList.jsp">Old Student List</a></li>-->
<!--                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>-->
<!--                    </ul>
                  </li>
                   <li><a><i class="fa fa-money"></i> Student Payment  <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="PaymentDetail.jsp">Payment Details  </a></li>-->
<!--                      <li><a href="OldStudentList.jsp">Old Student List</a></li>-->
<!--                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>-->
<!--                    </ul>
                  </li>
                   <li><a><i class="fa fa-money"></i> PDF Gallery <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="LessonPDF.jsp">PDF Details  </a></li>-->
<!--                      <li><a href="OldStudentList.jsp">Old Student List</a></li>-->
<!--                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>-->
<!--                    </ul>
                  </li>
                   <li><a><i class="fa fa-money"></i> Video Gallery  <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="LessonVideo.jsp">Video Details  </a></li>-->
<!--                      <li><a href="OldStudentList.jsp">Old Student List</a></li>-->
<!--                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>-->
<!--                    </ul>
                  </li>
                   <li><a><i class="fa fa-money"></i>  Student Video  <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="StudentVideo.jsp">Student Video   </a></li>-->
<!--                      <li><a href="OldStudentList.jsp">Old Student List</a></li>-->
<!--                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>-->
<!--                    </ul>
                  </li>
                  
                   <li><a><i class="fa fa-money"></i>  Student PDF  <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="StudentsUploadedPDF.jsp">Student PDF   </a></li>-->
<!--                      <li><a href="OldStudentList.jsp">Old Student List</a></li>-->
<!--                      <li><a href="getAllEventApplicationList.jsp">Event Applications</a></li>-->
<!--                    </ul>
                  </li>
                 -->
                 
                 
               
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
<!--                </ul>
              </div>
             

            </div>-->
            <!-- /sidebar menu -->

<!--          
          </div>-->