 


<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%
    String userID = request.getParameter("userID");
    int adminidd = Integer.parseInt(request.getParameter("adminidd"));

%>

<div id="studentfetch">
    
    <div class="x_content">
        <!--                                        <p class="text-muted font-13 m-b-30">
                                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                </p>-->
        <div class="table-responsive">
        <table id="datatable-buttons" class="table table-striped table-bordered">
            <thead>
                <tr>

                    <th class="table_center">Admission Date</th>
                    <th class="table_center">Profile Pic</th>
                    <th class="table_center">Name</th>
                    <th class="table_center">Admission No</th>
                    <th class="table_center">Due Date</th>
                    <th class="table_center">Mobile No.</th>
                    <th class="table_center">Date of Birth</th>
                    <th class="table_center">Course</th>
                    <th class="table_center">Balance Fee</th>
                    <th class="table_center">Profile</th>

                
                    <th class="table_center">Payment</th>
                    <th class="table_center">Courses</th>
                  

                </tr>
            </thead>
            <tbody >

                <%                                                    AdmissionDao cd = new AdmissionDao();
                    AdminDao addd = new AdminDao();
                    Admin aaaa = addd.getAdminByID(adminidd);
                    int i = 0;
                    List<Admission> cl = null;
                    if (userID.equals("All")) {
                        cl = cd.getAllDueDateStudent(aaaa);
                    } else if (userID.equals("Yesterday")) {
                        cl = cd.getYesterdatDueDateStudent(aaaa);
                    } else if (userID.equals("Today")) {
                        cl = cd.getTodayDueDateStudent(aaaa);
                    } else {
                        cl = cd.getTommorowDueDateStudent(aaaa);
                    }
                    System.out.print(cl.size());
                    if (cl != null && cl.size() > 0) {
                        for (Admission p : cl) {

                            i++;

                            String ImgPath1 = p.getImage();


                %>
                <tr >
                    <td class="table_center"><%=p.getAdmissionDate()%></td> 

                    <td class="table_center"> <img onclick="openmodel(this.id)" id="myImg<%=i%>" width="40" height="40" src="../../StudentImages/<%=ImgPath1%>" alt="..." class="myImg" ></td>
                    <td class="table_center"><%=p.getFirstName()%>&nbsp;<%=p.getLastName()%> </td>
                    <td class="table_center"><%=p.getAdmissionNo()%></td> 
                    <td class="table_center"><%=p.getDueDate()%></td> 
                    <td class="table_center"><%=p.getContactNo()%></td> 
                    <td class="table_center"><%=p.getDateofBirth()%></td> 
                    <td class="table_center"><%=p.getCourseName()%></td> 
                    <td class="table_center"><%=p.getRemaininFee()%></td> 
                    <td class="table_center"><a href="StudentProfile.jsp?asd=<%=p.getAdmissionId()%>" class="btn btn-round btn-success btn-xs">Profile</a></td>

          
            <td class="table_center"><a href="PaymentDetail.jsp?asd=<%=p.getAdmissionId()%>" class="btn btn-round btn-success btn-xs">Payment Details</a></td>
            <td class="table_center"><a href="CourseDetails.jsp?asd=<%=p.getAdmissionId()%>" class="btn btn-round btn-success btn-xs">Course Details</a></td>
          


            </tr> 
            <%}
                }

            %>

            </tbody>
        </table>
           
    </div>
           
    </div>
</div>
            
            
          
<script>

    $.fn.popover.Constructor.prototype.leave = function(a) {
        var c, d, b = a instanceof this.constructor ? a : $(a.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
        originalLeave.call(this, a), a.currentTarget && (c = $(a.currentTarget).siblings(".popover"), d = b.timeout, c.one("mouseenter", function() {
            clearTimeout(d), c.one("mouseleave", function() {
                $.fn.popover.Constructor.prototype.leave.call(b,b)
            })
        }))
    },
            $(document).ready(function() {
        init_wysiwyg(), init_InputMask(), init_JQVmap(), init_cropper(), init_knob(), init_IonRangeSlider(), init_ColorPicker(), init_TagsInput(), init_parsley(), init_daterangepicker(), init_daterangepicker_right(),   init_EasyPieChart(), init_charts(), init_echarts(), init_morris_charts(), init_skycons(), init_select2(), init_validator(), init_DataTables(), init_chart_doughnut(), init_gauge(), init_PNotify(), init_starrr(), init_calendar(), init_compose(), init_CustomNotification(), init_autosize(), init_autocomplete()
    });





</script>

