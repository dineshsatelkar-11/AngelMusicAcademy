


<%@page import="com.accede.angel.admin.model.LessonVideo"%>
<%@page import="com.accede.angel.admin.dao.LessonVideoDao"%>
<%@page import="com.accede.angel.admin.model.LessonPdf"%>
<%@page import="com.accede.angel.admin.dao.LessonDao"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.model.Course"%>

<%@page import="java.util.List"%>
<%
    String course = request.getParameter("course");

    long id = Long.parseLong(course);
    Course cr = new CourseDao().getCourseBylongID(id);
    long nooflesson = cr.getNooflesson();
    LessonVideoDao ld=new LessonVideoDao();
    LessonVideo lf=new LessonVideo();
    List<LessonVideo> lessons=ld.getAllLessonVideo();


%>

<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Lesson</label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <select class="form-control" id="lesson" name="lesson" style="width:326px;">
            <option value="">-Select Lesson-</option> 
            <%    for (LessonVideo l:lessons) {
                if(id==l.getCourseid())
                {
            %>

            <option value="<%=l.getId()%>"> Lesson <%=l.getLessonno()%> </option> 
            <%}}%>
        </select>
    </div>
</div>
