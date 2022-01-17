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
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String start1 = df.format(date);
    System.out.println("start1-" + start1);
    String endd = df.format(date1);
    System.out.println("endd-" + endd);
// Date st1 = new SimpleDateFormat("MM/dd/yyyy").parse(start1);
// System.out.println("st1-"+st1);
// Date end1 = new SimpleDateFormat("MM/dd/yyyy").parse(endd);
// System.out.println("end1-"+end1);
    String query1 = "from Payment where paymentDate  Between '" + start1 + "' AND '" + endd + "'  ";


%>

<div class="col-md-12 col-sm-12 col-xs-12 tablefetch">
    <div class="x_panel">

        <div class="x_content" >
            <table id="datatable-buttons" class="table table-striped table-bordered ">
                <thead>
                    <tr>

                        <th class="table_center">Sr No</th>
                        <th class="table_center">Branch Name</th>
                        <th class="table_center">Date</th>
                        <th class="table_center">Time</th>
                        <th class="table_center">Credit</th>
                        <th class="table_center">Debit</th>
                        <th class="table_center">Payment Agains</th>
                        <th class="table_center">Payment Type</th>
                        <th class="table_center">Bank Name</th>
                        <th class="table_center">Transction No</th>

                    </tr>
                </thead>
                <tbody>

                    <%                PaymentDao cd = new PaymentDao();
                        int id = Integer.parseInt(request.getParameter("Branch"));
                        int i = 0;
                        int creditamount = 0;
                        int debitamount = 0;
                        List<Payment> cl = null;
                        cl = cd.getPaymentOrder(query1);
                        if (cl != null && cl.size() > 0) {
                            for (Payment p : cl) {
                                if (id == p.getAdminOfBranch().getAdminId()) {

                                    Date dt = p.getPaymentTime();
                                    String dd = dt.toString();
                                    String[] datespilt = dd.split(" ");
                                    i++;


                    %>
                    <tr>
                        <td class="table_center"><%=i%></td>
                        <td class="table_center"><%=p.getAdminOfBranch().getAdminOfBranch().getBranchName()%></td>
                        <td class="table_center"><%=datespilt[0]%> </td>
                        <td class="table_center"><%=datespilt[1]%> </td>
                        <%if (p.getPaymentType().equals("Credit")) {%>
                        <td class="table_center"><%=p.getAmount()%></td> 
                        <td class="table_center"></td> 
                        <%} else {%>
                        <td class="table_center"></td> 
                        <td class="table_center"><%=p.getAmount()%></td>  
                        <%}%>
                        <td class="table_center"><%=p.getPaymentAgains()%></td> 
                        <td class="table_center"><%=p.getPaymentMode()%></td> 
                        <td class="table_center"><%=p.getBankName()%></td> 
                        <td class="table_center"><%=p.getTransctionNo()%></td> 



                    </tr>  
                    <%
                                    if (p.getPaymentType().equals("Credit")) {
                                        creditamount = creditamount + p.getAmount();
                                    } else {
                                        debitamount = debitamount + p.getAmount();
                                    }

                                }
                            }
                        }

                    %>
                 
                </tbody>
            </table>
           <br>
            <br>
            <div class="row">
                <div class="col-md-4">
                    <center >Credit Amount</center>
                    <input id="name" class="form-control col-md-7 col-xs-12" style="text-align: center" value="<%=creditamount%>" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="both name(s) e.g Jon Doe" required="required" type="text"> 
                </div>
                <div class="col-md-4">
                    <center >Debit Amount</center>
                    <input type="text" id="pbal" name="pbal" readonly="" style="text-align: center" value="<%=debitamount%>" required="required" class="form-control col-md-7 col-xs-12">
                </div>
                <div class="col-md-4">
                    <center >Balance   </center>
                    <input type="text" id="Course_fee" readonly=""  style="text-align: center" value="<%=creditamount - debitamount%>"  name="Course_fee"  class="form-control col-md-7 col-xs-12">
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
                $.fn.popover.Constructor.prototype.leave.call(b,b)
            })
        }))
    },
            $(document).ready(function() {
        init_wysiwyg(), init_InputMask(), init_JQVmap(), init_cropper(), init_knob(), init_IonRangeSlider(), init_ColorPicker(), init_TagsInput(), init_parsley(), init_daterangepicker(), init_daterangepicker_right(),   init_EasyPieChart(), init_charts(), init_echarts(), init_morris_charts(), init_skycons(), init_select2(), init_validator(), init_DataTables(), init_chart_doughnut(), init_gauge(), init_PNotify(), init_starrr(), init_calendar(), init_compose(), init_CustomNotification(), init_autosize(), init_autocomplete()
    });





</script>







