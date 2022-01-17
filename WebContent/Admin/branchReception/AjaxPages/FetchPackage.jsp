<%@page import="com.accede.angel.admin.dao.PackageDao"%>
<%@page import="com.accede.angel.admin.model.PackageCourse"%>
<%
    int id = Integer.parseInt(request.getParameter("Package"));
    PackageCourse PackageCourse = new PackageDao().getPackageCourseByID(id);
String days=Integer.toString(PackageCourse.getNoofdays());
String courses=Integer.toString(PackageCourse.getNoofcourse());
String PaymentMode=Integer.toString(PackageCourse.getPaymentMode());
String CourseDuration=Integer.toString(PackageCourse.getCourseDuration());
String fee=Integer.toString(PackageCourse.getFee());
String packagename=  "Package Fee=" +  fee +"Rs, Days=" +  days + " ,No of Course=" +  courses + ", Payment Mode=" +  PaymentMode +" Month"+ ", Course Duration=" +  CourseDuration+" Days" ;
String Coursefee= "Package Fee=" +  fee  ;

%>


<div id="fetchpackage">
    <div class="col-md-8 col-sm-12 col-xs-12 form-group">
        <input type="text" id="email" name="email" readonly="" placeholder="Email" value="<%=packagename%>" class="form-control">
    </div>

  