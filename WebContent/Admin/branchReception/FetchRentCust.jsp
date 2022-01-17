


<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
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
                        <th class="table_center">Receipt No</th>
                        <th class="table_center">Name</th>
                        <th class="table_center">Mobile No.</th>
                        <th class="table_center">Balance Fee</th>
                        <th class="table_center">Return Date</th>
                        <th class="table_center">Instrument List</th>
                        <th class="table_center">Payment Details</th>
                        <th class="table_center">Delete </th>
                        <!--<th class="table_center">Email </th>-->

                    </tr>
                </thead>
                <tbody>

                    <%                                                    RentDao cd = new RentDao();
                        AdminDao addd = new AdminDao();
                        Admin aaaa = addd.getAdminByID(adminidd);
                        int i = 0;
                        List<Rent> cl = null;
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
                            for (Rent p : cl) {

                                i++;

                    %>
                    <tr>

                        <td class="table_center"><%=p.getRentNo()%> </td>
                        <td class="table_center"><%=p.getCustomerFirstName()%> </td>
                        <td class="table_center"><%=p.getCustomerMobileNo()%></td> 
                        <td class="table_center"><%=p.getRemaininFee()%></td> 
                        <td class="table_center"><%=p.getReceivedDate()%></td> 
                        <td class="table_center"><%=p.getInstrumentName()%></td> 

                        <td class="table_center"><a href="RentPaymentDetails.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">Payment </a></td>

                <form class="form-horizontal form-label-left"  action="../../DeleteRentRequest" method="get">
                    <input type="hidden" value="<%=p.getId()%>" id="studentidd" name="studentidd">
                    <td class="table_center"><input type="submit" class="btn btn-round btn-success btn-xs" value="Delete "></td>
                </form>

                </tr> 
                <%}
                    }%>

                </tbody>
            </table></div>
       
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










