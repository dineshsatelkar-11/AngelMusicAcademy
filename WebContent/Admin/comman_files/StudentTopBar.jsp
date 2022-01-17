<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.model.EnquiryDetail"%>
<%@page import="com.accede.angel.admin.model.PaymentFollowupMessage"%>
<%@page import="com.accede.angel.admin.model.PaymentFollowup"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.PaymentFollowupDao"%>


<%
  long studentiddddd= 0 ;
 if (session.getAttribute("Student") != null) {
      
       Admission Admissionstudent1= (Admission) session.getAttribute("Student");
        studentiddddd=Admissionstudent1.getCustomerAccount().getId();}
 
%>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->

        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="#">Angel Music</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse"  style="background-color: #3a3a35" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" style="margin-left:10px ">
              
                <li ><a href="StudentIndex.jsp"><span style="color: white">Home</span> <span class="sr-only">(current)</span></a></li>
                <li ><a href="StudentProfileDetails.jsp?accountid=<%=studentiddddd%>"><span style="color: white">Profile</span> <span class="sr-only">(current)</span></a></li>

              
          
           
            
            </ul>

            <ul class="nav navbar-nav navbar-right">


              

            
            

              
                <li class="">



                    <a href="ChangeProfilePic.jsp" > 
                        <!--<img src="../../images/Balance.png" title="Create Enquiry"  alt="" style="width:20px"/>-->
                        <span style="color: white">Change Profile</span>   </a>




                </li>


             
                <li><a href="../../logout.jsp"><img src="../../images/Logout.png"style="width: 20px" alt="Profile Image" /></a></li>




            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>