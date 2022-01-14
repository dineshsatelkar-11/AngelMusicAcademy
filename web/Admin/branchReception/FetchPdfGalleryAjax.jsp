



<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.AddPdfGalleryDao"%>
<%@page import="com.accede.angel.admin.model.AddPdfGallery"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%
    String course = request.getParameter("course");
    String lesson = request.getParameter("lesson");

    long id = Long.parseLong(course);
    int lessonid = Integer.parseInt(lesson);
   
    AddPdfGallery apg=new  AddPdfGallery();
    AddPdfGalleryDao apd=new AddPdfGalleryDao();
    List<AddPdfGallery> ap=apd.getAllAddPdfGallery();
    
    


%>


<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Select PDF  <span class="required">*</span>
    </label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <select class="form-control" required="" id="PDF" name="PDF" style="width:326px;">
            <option value="">-Select PDF-</option> 
  <%    for(AddPdfGallery a:ap)
  {
      if(a.getCourseid()== id && a.getLessonno()== lessonid)
      {
            %>

            <option value="<%=a.getLessonid()%>">  <%=a.getPdfname()%> </option> 
            <%}}%>
        </select>
    </div>
    </div>