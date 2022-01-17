<%-- 
    Document   : FetchPdf
    Created on : Apr 17, 2018, 3:45:37 PM
    Author     : Admin
--%>

<%@page import="com.accede.angel.admin.dao.AssignPDFAdminDao"%>
<%@page import="com.accede.angel.admin.model.AssignPDFAdmin"%>
<%@page import="com.accede.angel.admin.model.AssignPDFAdmin"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.dao.UploadCoursePdfDao"%>
<%@page import="com.accede.angel.admin.model.UploadCoursePdfModel"%>
<%@page import="com.accede.angel.admin.model.StudentPdf"%>
<%@page import="com.accede.angel.admin.dao.StudentPDFDao"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.dao.AddPdfGalleryDao"%>
<%@page import="com.accede.angel.admin.model.AddPdfGallery"%>

     
<%
    String coursename = request.getParameter("course");
    long studentid = Long.parseLong(request.getParameter("studentid"));
    
    
    CourseDao CourseDao = new CourseDao();
    Course course = CourseDao.getCourseByName(coursename);
    List<StudentPdf> ids=null;
     List<UploadCoursePdfModel> ap=null;
     Admin adminforfetchpdf = (Admin) session.getAttribute("BRANCH_ADMIN");
    AssignPDFAdmin AssignPDFAdmin=new  AssignPDFAdminDao().getAssignPDFAdmin(adminforfetchpdf);
    if(AssignPDFAdmin.getCourse().contains(course.getCourseName()))
    {
    System.out.println("sdzjhfbsd=="+course);
    StudentPDFDao StudentPDFDao = new StudentPDFDao();
    ids = StudentPDFDao.getpdfgalleryids(course.getCourseId(), studentid);
System.out.println("StudentPdf=" +ids.size());
    UploadCoursePdfModel apg = new UploadCoursePdfModel();
    UploadCoursePdfDao apd = new UploadCoursePdfDao();
    ap = apd.getUploadCoursePdfModel(course.getCourseName());
    System.out.println("UploadCoursePdfModel=" +ap.size());
    
    }
    int q = 0;

%>
<select class="form-control" required="" id="PDF" name="PDF" style="width:326px;">
    <option value="">-Select PDF-</option> 
    <%   
    
       if (ap != null && ap.size() > 0) {
    for (UploadCoursePdfModel a : ap) {
//            q = 0;
//            for (StudentPdf a1 : ids) {
//                if (a1.getPdfGalleryid() == a.getId()) {
//                    q = 1;
//                }
//            }
//
//            if (q == 0) {

    %>

    <option value="<%=a.getId()%>">  <%=a.getNameofpdf()%> </option> 
    <%
    }
        }%>
</select>