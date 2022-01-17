


<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%
    String course = request.getParameter("course");

    long id = Long.parseLong(course);
    Course cr = new CourseDao().getCourseBylongID(id);
    long nooflesson = cr.getNooflesson();


%>

<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Lesson</label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <select class="form-control" id="lesson" name="lesson" style="width:326px;">
            <option value="">-Select Lesson-</option> 
            <%    for (int i = 1; i < nooflesson+1; i++) {
            %>

            <option value="<%=i%>"> Lesson <%=i%> </option> 
            <%}%>
        </select>
    </div>
</div>
