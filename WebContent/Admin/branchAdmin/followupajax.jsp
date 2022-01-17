 


<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
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


                        <th class="table_center">Name</th>
                        <th class="table_center">Mobile No.</th>
                        <th class="table_center">Type of Enquiry</th>
                        <th class="table_center">Follow up</th>
                        <th class="table_center">Follow Up</th>
                        <th class="table_center">Shift</th>
                       
                        <th class="table_center">Email</th>


                    </tr>
                </thead>
                <tbody >

                    <%                        EnquiryDao cd = new EnquiryDao();

                        AdminDao addd = new AdminDao();
                        Admin aaaa = addd.getAdminByID(adminidd);
                        int i = 0;
                        List<Enquiry> cl = null;
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
                            for (Enquiry p : cl) {

                                i++;

                               

                    %>
                    <tr >
                        <td class="table_center"><%=p.getName()%> </td>
                        <td class="table_center"><%=p.getMobile()%></td> 
                        <td class="table_center"><%=p.getEnquiryType()%></td> 
                        <td class="table_center"><%=p.getFollowupDate()%></td> 
                        <td class="table_center"><a href="followup.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">Follow Up</a></td>
                        <%
                            if (p.getEnquiryType().equals("MusicClass")) {
                        %>
                        <td class="table_center"><a href="BranchAdmission.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-primary btn-xs">Shift To Admission</a></td>
                        <%} else if (p.getEnquiryType().equals("Sell")) {%>

                        <td class="table_center"><a href="CustomerSale.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-info btn-xs">Shift To Sell</a></td>
                        <%} else if (p.getEnquiryType().equals("Repair")) {%>
                        <td class="table_center"><a href="BranchRepairing.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-warning btn-xs">Shift To Repair</a></td>
                        <%} else {%>
                        <td class="table_center"><a href="InstrumentRent.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-default btn-xs">Shift To Rent</a></td>
                        <%}%>
               
                <td class="table_center"><%=p.getEmail()%></td> 


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
                $.fn.popover.Constructor.prototype.leave.call(b, b)
            })
        }))
    },
            $(document).ready(function() {
        init_wysiwyg(), init_InputMask(), init_JQVmap(), init_cropper(), init_knob(), init_IonRangeSlider(), init_ColorPicker(), init_TagsInput(), init_parsley(), init_daterangepicker(), init_daterangepicker_right(), init_EasyPieChart(), init_charts(), init_echarts(), init_morris_charts(), init_skycons(), init_select2(), init_validator(), init_DataTables(), init_chart_doughnut(), init_gauge(), init_PNotify(), init_starrr(), init_calendar(), init_compose(), init_CustomNotification(), init_autosize(), init_autocomplete()
    });





</script>

