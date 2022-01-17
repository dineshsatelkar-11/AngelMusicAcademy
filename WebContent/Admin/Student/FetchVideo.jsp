


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
    LessonVideoDao ld = new LessonVideoDao();
    LessonVideo lf = new LessonVideo();
    List<LessonVideo> lessons = ld.getAllLessonVideo();


%>




<div class="x_content" id="output11">
    <!--                                        <p class="text-muted font-13 m-b-30">
                                                The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                            </p>-->


    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
        <thead>
            <tr>
                <th class="table_center">Sr No</th>

                <th class="table_center">Lesson No </th>
                <th class="table_center">Video Name</th>
                <th class="table_center">View</th>


            </tr>
        </thead>
        <tbody>




            <%     int i = 0;
                for (LessonVideo l : lessons) {
                    if (l.getCourseid() == id) {
                        i++;
            %>
            <tr class="odd gradeX">
                 <td class="table_center"><%=i%> </td>
                <td class="table_center"><%=l.getLessonno()%> </td>
                <td class="table_center"> <%=l.getVideoname()%></td>
          <td class="table_center"><a href="ViewVideo.jsp?asd=<%=l.getId()%>" class="btn btn-round btn-success btn-xs">View Video</a></td>
           
     
        </tr>
        <%
            }}
        %>
        <!--                                            <tr class="even gradeC">
                                                    <td>Trident</td>
                                                    <td >5</td>
                                                    <td> <textarea class="form-control" style="width: 100%" rows="2"></textarea></td>
                                                    
                                                     <td> <button class="btn btn-primary btn-sm">Comment</button></td>
                                                </tr>-->

        </tbody>
    </table>
    
</div>
