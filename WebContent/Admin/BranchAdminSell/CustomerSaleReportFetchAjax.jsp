<%@page import="com.accede.angel.sell.dao.CustomerSaleDAO"%>
<%@page import="com.accede.angel.sell.model.CustomerSale"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.admin.model.Payment"%>
<%@page import="com.accede.angel.admin.dao.PaymentDao"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>


<%

    String start = request.getParameter("start");
    String end = request.getParameter("end").trim();
    System.out.println("start-" + start);
    System.out.println("end-" + end);
    String adminid = request.getParameter("adminid");

    int aid = Integer.parseInt(adminid);
    Admin a = new Admin();
    AdminDao ad = new AdminDao();
    a = ad.getAdminByID(aid);
    Date date = new Date();;
    try {
        date = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH).parse(start);
        System.out.println("start1-" + date);

    } catch (ParseException e) {
        e.printStackTrace();
    }

    Date date1 = new Date();
    try {
        date1 = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH).parse(end);
        System.out.println("end1-" + date1);

    } catch (ParseException e) {
        e.printStackTrace();
    }


%>
<div class="row" id="tablefetch">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_content" >
                <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Sr No.</th>
                            <th>Sale Date</th>  
                            <th>Customer Name</th>  


                            <th>Contact Number</th> 
                            <th>Total Quantity</th> 
                             <th>Grand Total</th> 
                            <th>Other Charges</th>  
                            <th>Discount Amount</th>  
                            <th>Gross Total</th>  
                            <th>More Details</th> 
                            <th>Print Invoice </th> 

                        </tr>
                    </thead>
                    <tbody>


                        <%                                        CustomerSale p = new CustomerSale();
                            CustomerSaleDAO b1 = new CustomerSaleDAO();
                            List<CustomerSale> AllBrand1 = b1.getAllCustomerSalewithfilter(date, date1, a);
                            System.out.println("Adminid=" + AllBrand1.size());
                            int i = 0;
                            long totalquantity = 0;
                            float othercharges = 0;
                            float discountamount = 0;
                            float grossamount = 0;

                            for (CustomerSale c1 : AllBrand1) {
                                totalquantity = totalquantity + c1.getProductquanity();
                                othercharges = othercharges + c1.getOther_charges();
                                discountamount = discountamount + c1.getDiscount_amount();
                                grossamount = grossamount + c1.getGrosstotal();
                                i++;
                        %>
                        <tr>
                            <td><%=i%></td>

                            <td><%=c1.getDate()%></td>
                            <td><%=c1.getCustomername()%></td>
                            <td><%=c1.getMobilenumber()%></td>
                            <td><%=c1.getProductquanity()%></td>
                                <td><%=c1.getGrandtotal()%></td>
                            <td><%=c1.getOther_charges()%></td>
                            <td><%=c1.getDiscount_amount()%></td>
                            <td><%=c1.getGrandtotal()-c1.getOther_charges()-c1.getDiscount_amount()%></td>
                            <td><a href="ViewDetailsforCustomerSaleReport.jsp?purchaseid=<%=c1.getId()%>" class="btn9 btn btn-success"><i>View Details</i></a></td>
 <td><a href="SellProductInvoice.jsp?sellid=<%=c1.getId()%>" target="blank" class="btn9 btn btn-success"><i>Print Invoice</i></a></td>
                        </tr> 
                        <%
                            }
                        %>
                             
                    </tbody>
                </table>
                <br>
                <br>
                <div class="row">
                    <div class="col-md-3">
                        <center >Total Quantity</center>
                        <input id="name" class="form-control col-md-7 col-xs-12" style="text-align: center" value="<%=totalquantity%>" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="both name(s) e.g Jon Doe" required="required" type="text"> 
                    </div>
                    <div class="col-md-3">
                        <center >Total Other Charges</center>
                        <input type="text" id="pbal" name="pbal" readonly="" style="text-align: center" value="<%=othercharges%>" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                    <div class="col-md-3">
                        <center >Total Discount Amount   </center>
                        <input type="text" id="Course_fee" readonly=""  style="text-align: center" value="<%=discountamount%>"  name="Course_fee"  class="form-control col-md-7 col-xs-12">
                    </div>
                    <div class="col-md-3">
                        <center >Total Gross  Amount   </center>
                        <input type="text" id="Course_fee" readonly=""  style="text-align: center" value="<%=grossamount%>"  name="Course_fee"  class="form-control col-md-7 col-xs-12">
                    </div>


                </div>
            </div>
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