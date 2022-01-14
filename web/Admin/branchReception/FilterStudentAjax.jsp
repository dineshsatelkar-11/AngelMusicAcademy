


<%@page import="java.util.List"%>
<!DOCTYPE html>

<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>

<%


%>                  

<div class="x_content" id="output5">
    <table id="datatable-buttons" class="table table-striped table-bordered output5">
        <thead>
            <tr>

                <th class="table_center">Sr No</th>

                <th class="table_center">Name</th>
              
                <th class="table_center">Mobile No.</th>

                <th class="table_center">Course</th>
                <th class="table_center">Days</th>
                <th class="table_center">Batch Time</th>


            </tr>
        </thead>
        <tbody>

            <%            String Day = request.getParameter("Day");
                String Branch = request.getParameter("Branch");
                String Course = request.getParameter("Course");
                String BatchTime = request.getParameter("BatchTime");
                int a = 0;
                int b = 0;
                int c = 0;
                int d = 0;
                if (!Branch.equals("")) {
                    a = 1;
                }
                if (!BatchTime.equals("")) {
                    b = 1;
                }
                if (!Day.equals("")) {
                    c = 1;
                }
                if (!Course.equals("")) {
                    d = 1;
                }
                System.out.println("Day-" + Day);
                AdmissionDao cd = new AdmissionDao();
                System.out.println("a==" + a);
                System.out.println("b==" + b);
                System.out.println("c==" + c);
                System.out.println("d==" + d);
            %>





            <%
                int i = 0;
                List<Admission> cl = null;
                cl = cd.getAllAdmission();

                if (cl != null && cl.size() > 0) {
                    for (Admission p : cl) {
                        boolean studentype = p.isShiftToOldStudent();
                        System.out.println("Student id-" + p.getAdmissionId());
                        if (studentype) {

            %>




            <%                if (a == 1 && b == 1 && c == 1 && d == 1) {
                    int q = Integer.parseInt(Branch);
                    if (q == p.getAdminOfBranch().getAdminId()) {

                        if (p.getBatchTimings().contains(BatchTime)) {
                            if (p.getDaysInWeek().contains(Day)) {
                                if (p.getCourseName().contains(Course)) {

                                    i++;


            %>
          
            
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%
                            }
                        }
                    }
                }

            } else {
                if (a == 1 && b == 1 && c == 1 && d == 0) {
                    int q = Integer.parseInt(Branch);
                    if (q == p.getAdminOfBranch().getAdminId()) {

                        if (p.getBatchTimings().contains(BatchTime)) {
                            if (p.getDaysInWeek().contains(Day)) {

                                i++;


            %>
           
          
            
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%

                        }
                    }
                }

            } else {

                if (a == 1 && b == 1&& c == 0&& d == 0) {
                    int q = Integer.parseInt(Branch);
                    if (q == p.getAdminOfBranch().getAdminId()) {

                        if (p.getBatchTimings().contains(BatchTime)) {

                            i++;


            %>
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%

                    }
                }

            } else {

                if (a == 1&& b == 0&& c == 0&& d == 0) {
                    int q = Integer.parseInt(Branch);
                    if (q == p.getAdminOfBranch().getAdminId()) {

                        i++;


            %>
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%

                }

            } else {
                if (a == 1 && b == 1 && d == 1&& c == 0) {
                    int q = Integer.parseInt(Branch);
                    if (q == p.getAdminOfBranch().getAdminId()) {

                        if (p.getBatchTimings().contains(BatchTime)) {

                            if (p.getCourseName().contains(Course)) {

                                i++;


            %>
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%

                        }
                    }
                }

            } else {
                if (a == 1 && d == 1&& b == 0&& c == 0) {
                    int q = Integer.parseInt(Branch);
                    if (q == p.getAdminOfBranch().getAdminId()) {

                        if (p.getCourseName().contains(Course)) {

                            i++;


            %>
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%

                    }
                }

            } else {
                if (d == 1&& b == 0&& c == 0&& a == 0) {

                    if (p.getCourseName().contains(Course)) {

                        i++;


            %>
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%

                }

            } else {
                if (a == 1 && c == 1 && d == 1&& b == 0) {
                    int q = Integer.parseInt(Branch);
                    if (q == p.getAdminOfBranch().getAdminId()) {

                        if (p.getDaysInWeek().contains(Day)) {
                            if (p.getCourseName().contains(Course)) {

                                i++;


            %>
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%

                        }
                    }
                }

            } else {
                if (c == 1 && d == 1&& b == 0&& a == 0) {

                    if (p.getDaysInWeek().contains(Day)) {
                        if (p.getCourseName().contains(Course)) {

                            i++;


            %>
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%

                    }
                }

            } else {
                if (b == 1 && d == 1&& a == 0&& c == 0) {

                    if (p.getBatchTimings().contains(BatchTime)) {
                        if (p.getCourseName().contains(Course)) {

                            i++;


            %>
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%
                    }

                }

            } else {
                if (c == 1&& b == 0&& a == 0&& d == 0) {

                    if (p.getDaysInWeek().contains(Day)) {

                        i++;


            %>
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%

                }

            } else {
                if (b == 1&& a == 0&& c == 0&& d == 0) {

                    if (p.getBatchTimings().contains(BatchTime)) {

                        i++;


            %>
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%

                }

            } else {
                if (b == 1 && c == 1&& a == 0&& d == 0) {

                    if (p.getBatchTimings().contains(BatchTime)) {
                        if (p.getDaysInWeek().contains(Day)) {

                            i++;


            %>
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%

                    }
                }

            } else {
                if (b == 1 && c == 1 && d == 1&& a == 0) {

                    if (p.getBatchTimings().contains(BatchTime)) {
                        if (p.getDaysInWeek().contains(Day)) {
                            if (p.getCourseName().contains(Course)) {

                                i++;
                                


            %>
            <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            <%

                            }
                        }
                    }

                }else{
                
                if(b == 0 && c == 1 && d == 0 && a == 1)
                {
                  if (p.getDaysInWeek().contains(Day)) {
                       int q = Integer.parseInt(Branch);
                    if (q == p.getAdminOfBranch().getAdminId()) {
                         i++;
                %>
            
            
             <tr>
                <td class="table_center"><%=i%></td> 
                <td class="table_center"><%=p.getFirstName()%> </td>
                 
                <td class="table_center"><%=p.getContactNo()%></td> 
                <td class="table_center"><%=p.getCourseName()%></td> 
                <td class="table_center"><%=p.getDaysInWeek()%></td> 
                <td class="table_center"><%=p.getBatchTimings()%></td> 


            </tr> 
            
            <%
                  }}
                }
                
                
                }
            %>



            <%}%>
            
            
            
            
            
            
            <%
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }

                                }

                            }
                        }
                    }
                }%>

        </tbody>
    </table>
</div>



<script>

    $.fn.popover.Constructor.prototype.leave = function(a) {
        var c, d, b = a instanceof this.constructor ? a : $(a.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
        originalLeave.call(this, a), a.currentTarget && (c = $(a.currentTarget).siblings(".popover"), d = b.timeout, c.one("mouseenter", function() {
            clearTimeout(d), c.one("mouseleave", function() {
                $.fn.popover.Constructor.prototype.leave.call(b, b)
            })
        }))
    },
            $(document).ready(function() {
        init_wysiwyg(), init_InputMask(), init_JQVmap(), init_cropper(), init_knob(), init_IonRangeSlider(), init_ColorPicker(), init_TagsInput(), init_parsley(), init_daterangepicker(), init_daterangepicker_right(), init_EasyPieChart(), init_charts(), init_echarts(), init_morris_charts(), init_skycons(), init_select2(), init_validator(), init_DataTables(), init_chart_doughnut(), init_gauge(), init_PNotify(), init_starrr(), init_calendar(), init_compose(), init_CustomNotification(), init_autosize(), init_autocomplete()
    });





</script>