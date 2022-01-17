


<%@page import="com.accede.angel.admin.model.LessonPdf"%>
<%@page import="com.accede.angel.admin.dao.LessonDao"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.model.Course"%>

<%@page import="java.util.List"%>
<%
    String course = request.getParameter("course");

    long id = Long.parseLong(course);

    LessonDao ld = new LessonDao();
    LessonPdf lf = new LessonPdf();
    List<LessonPdf> lessons = ld.getAllLessonPdf();


%>

                       
                           <!--                                        <p class="text-muted font-13 m-b-30">
                                                                        The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                              <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                </p>-->
                                        <table id="datatable" class="output11 table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="table_center">Sr No</th>
                                                    
                                                    <th class="table_center">Lesson No </th>
                                                    <th class="table_center">PDF Name</th>
                                                    <th class="table_center">Download</th>
                                                    

                                                </tr>
                                                
                                                
                                                
                                            </thead>
                                            <tbody >

                                              
                        <%     int i = 0;
                            for (LessonPdf l : lessons) {
                                if (l.getCourseid() == id) {
                                    i++;
                        %>
                                                <tr>

                                                  <td class="table_center"><%=i%> </td>
                            <td class="table_center"><%=l.getLessonno()%> </td>
                            <td class="table_center"> <%=l.getPdfname()%></td>

                            <td>
                                  <!--<a href="../../DownLoadPdfLessons?asd=<%=l.getLessonid()%>" class="btn btn-primary btn-sm">Download </a>-->
                                <form action="DownloadPDF.jsp" method="post">
                                    <button type="submit" name="asd" value="<%=l.getLessonid()%>" id="asd" class="btn btn-primary btn-sm">Download</button>
                                </form>
                            </td>

                                                </tr> 
                                                <%
                                }
                            }
                        %>

                                            </tbody>
                                        </table>
                                   
                                   


