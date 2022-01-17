


<%@page import="com.accede.angel.admin.model.RentDetails"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.model.Instrument"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>
<%

    String extraDays = request.getParameter("extraDays");
    String otheramount = request.getParameter("other");
    long rentid = Long.parseLong(request.getParameter("rentid"));
    RentDao RentDao = new RentDao();
    Rent Rent = RentDao.getRentByID(rentid);
    int extra = 0;
    int other = 0;
    if (!extraDays.equals("")) {
        extra = Integer.parseInt(extraDays);

    }
    if (!otheramount.equals("")) {
        other = Integer.parseInt(otheramount);

    }


%>
<style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }





    tr:nth-child(even) {
        background-color: #dddddd;
    }
</style>



<table id="datatable-checkbox"  class="table table-striped table-bordered bulk_action  text-center">
    <thead >
        <tr >

            <th class="text-center">Instrument Name</th>
            <th class="text-center">Instrument Cost</th>
            <th class="text-center">No of Days</th>
            <th class="text-center">Extra  Days</th>
            <th class="text-center">Total</th>

        </tr>
    </thead>

    <tbody>

        <% int j = 0;
            int totalamount = 0;
            int disamount = 0;
            int Finalamount = 0;
            int Paid_ByCust = 0;
            int Return_by_Shop = 0;
            for (RentDetails p : Rent.getRentDetails()) {
                j++;

        %>
        <tr  >

            <td ><%=p.getInstrumentName()%></td>
            <td ><%=p.getInstrumentRentCost()%></td>
            <td><%=Rent.getNoOfDays()%></label></td>
            <td><%=extra%></label></td>
            <td ><%=p.getInstrumentRentCost() * (Rent.getNoOfDays() + extra)%></td>

        </tr>
        <%
                totalamount = totalamount + p.getInstrumentRentCost() * (Rent.getNoOfDays() + extra);

            }
            disamount = totalamount * Rent.getDiscper() / 100;
            Finalamount = totalamount - disamount + other;

            if (Finalamount > Rent.getSecurityDeposite()) {
                Paid_ByCust = Finalamount - Rent.getSecurityDeposite();
            } else {
                Return_by_Shop = Rent.getSecurityDeposite() - Finalamount;
            }
        %>
    </tbody>

</table>

<div class="row" >
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <p><strong>   Total Amount:</strong></p>
        <input  type="text" value="<%=totalamount%>" readonly="" id="totalamt" name="totalamt" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Discount in %:</strong></p>
            <input value="<%=Rent.getDiscper()%>"  type="text"  id="discper" name="discper" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Discount in Amount:</strong></p>
            <input value="<%=disamount%>"  type="text" id="discamt" name="discamt" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

        </div>

    </div>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <p><strong>   Final Amount after Discount:</strong></p>
        <input value="<%=Finalamount%>" type="text" readonly="" id="FinalAmount" name="FinalAmount" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
    </div>


</div>
<div class="row" >

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Deposit Amount:</strong></p>
            <input value="<%=Rent.getSecurityDeposite()%>" type="text" readonly id="Deposit" name="Deposit" maxlength="10" placeholder="Enter Deposite Amount" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Payment Type:</strong></p>
            <select class="form-control" required=""  id="paymode" name="paymode">
                <option value="">Select Payment Type</option>
                <option value="Card">Card</option>
                <option value="Cash">Cash</option>
                <option value="Paytm">Paytm</option>
                <option value="Net Banking">Net Banking</option>
                <option value="Net Banking">Cheque</option>
            </select> </div>
    </div>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Paid By Customer:</strong></p>
            <input value="<%=Paid_ByCust%>" readonly="" type="text" id="Paid_ByCust" name="Paid_ByCust" maxlength="10" placeholder="Contact No." class="form-control" >

        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Return By Shop:</strong></p>
            <input value="<%=Return_by_Shop%>" readonly="" type="text" id="Return_by_Shop" name="Return_by_Shop" maxlength="10" placeholder="Contact No." class="form-control" >

        </div>

    </div>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <p><strong>   Return Date & Time:</strong></p>
        <input  type="date" readonly="" value="<%=Rent.getDuedateSmsdate()%>" id="Return_by_Date" name="Return_by_Date" maxlength="10" placeholder="Contact No." class="form-control" >
    </div>


</div>
<input value="0" readonly="" type="hidden" id="amountinword" name="amountinword"  class="form-control" >




<script type="text/javascript">
    $(document).ready(function() {





        $('#discper').on('change', function() {
         
        var discper = $('#discper').val();

            var isValid = true;
s
            if (discper === "")
            {
                discper = 0;

                $("#discper").formError("Enter Correct Discount Percentage ");
                isValid = false;
            }
            else
            {

                var totalamt = $('#totalamt').val();
                var other = $('#other').val();
                if (other == "")
                {
                    other = 0;
                }

                var discamt = (discper / 100) * totalamt;

                $('#FinalAmount').val(parseInt(totalamt) - parseInt(discamt) + parseInt(other));
                $('#discamt').val(parseInt(discamt));
                var Deposit = $('#Deposit').val();
                if (Deposit > (parseInt(totalamt) - parseInt(discamt) + parseInt(other)))
                {
                    $('#Return_by_Shop').val(parseInt(Deposit) - (parseInt(totalamt) - parseInt(discamt) + parseInt(other)));
                    $('#Paid_ByCust').val(0);
                } else {
                    $('#Paid_ByCust').val((parseInt(totalamt) - parseInt(discamt) + parseInt(other)) - parseInt(Deposit));
                    $('#Return_by_Shop').val(0);
                }

                $('#amountinword').val(converAmount(parseInt(Deposit)));
                $("#discper").formError({remove: true});
            }
            return isValid;
        });
        $('#discamt').on('keyup change', function() {
            var discamt = $('#discamt').val();

            var isValid = true;

            if (discamt === "")
            {
                discamt = 0;

                $("#discamt").formError("Enter Correct Discount Amount ");
                isValid = false;
            }
            else
            {

                var totalamt = $('#totalamt').val();
                var other = $('#other').val();
                var disper = (discamt / totalamt) * 100;

                $('#FinalAmount').val(parseInt(totalamt) - parseInt(discamt) + parseInt(other));
                $('#discper').val(parseInt(disper));
                var Deposit = $('#Deposit').val();
                if (Deposit > (parseInt(totalamt) - parseInt(discamt) + parseInt(other)))
                {
                    $('#Return_by_Shop').val(parseInt(Deposit) - (parseInt(totalamt) - parseInt(discamt) + parseInt(other)));
                    $('#Paid_ByCust').val(0);
                } else {
                    $('#Paid_ByCust').val((parseInt(totalamt) - parseInt(discamt) + parseInt(other)) - parseInt(Deposit));
                    $('#Return_by_Shop').val(0);
                }
                $('#amountinword').val(converAmount(parseInt(Deposit)));
                $("#discamt").formError({remove: true});
            }
            return isValid;
        });



    });
</script>


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



    $("#cbSolid").is(':checked') == true

</script>
