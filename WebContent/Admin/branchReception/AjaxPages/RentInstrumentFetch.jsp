



<%@page import="com.accede.angel.services.Dates"%>
<%@page import="java.util.Date"%>
<%@page import="com.accede.angel.admin.model.Instrument"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>

<%

    int noofdays = Integer.parseInt(request.getParameter("noofdays"));
    Date d = Dates.getEndingDate1(new Date(), noofdays);
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


<table id="datatable-checkbox"  class="table table-striped table-bordered bulk_action">
    <thead >
        <tr>
            <th>
            <th><input type="checkbox" id="check-all"  class="flat"></th>
            </th>
            <th>Instrument Name</th>
            <th>Instrument Cost</th>
            <th>No of Days</th>
            <th>Total</th>

        </tr>
    </thead>


    <tbody>

        <% int j = 0;
            InstrumentDao bd = new InstrumentDao();

            List<Instrument> c = bd.getAllInstrumene();
            for (Instrument p : c) {
                j++;

        %>
        <tr  >
            <td>
            <th><input type="checkbox" id="<%=p.getInstrumentId()%>" name="<%=p.getInstrumentId()%>" value="1" class="flat instrument "> </th>
            </td>
            <td><%=p.getInstrumentName()%></td>
            <td ><%=p.getInstrumentRentCost()%></td>
            <td><%=noofdays%></label></td>
            <td id="cost<%=p.getInstrumentId()%>"><%=p.getInstrumentRentCost() * noofdays%></td>

        </tr>
        <%}%>
    </tbody>
</table>

<div class="row" >
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <p><strong>   Total Amount:</strong></p>
        <input value="0" type="text" readonly="" id="totalamt" name="totalamt" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Discount in %:</strong></p>
            <input value="0"  type="text" id="discper" name="discper" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Discount in Amount:</strong></p>
            <input value="0"  type="text" id="discamt" name="discamt" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

        </div>

    </div>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <p><strong>   Final Amount after Discount:</strong></p>
        <input value="0" type="text" readonly="" id="FinalAmount" name="FinalAmount" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
    </div>


</div>
<div class="row" >

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Deposit Amount:</strong></p>
            <input value="0" type="text"  id="Deposit" name="Deposit" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Payment Type:</strong></p>
            <select class="form-control" required="" id="paymode" name="paymode">
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
            <input value="0" readonly="" type="text" id="Paid_ByCust" name="Paid_ByCust" maxlength="10" placeholder="Contact No." class="form-control" >

        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Return By Shop:</strong></p>
            <input value="0" readonly="" type="text" id="Return_by_Shop" name="Return_by_Shop" maxlength="10" placeholder="Contact No." class="form-control" >

        </div>

    </div>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <p><strong>   Return Date & Time:</strong></p>
        <input value="<%=d%>" type="text" readonly="" id="Return_by_Date" name="Return_by_Date" maxlength="10" placeholder="Contact No." class="form-control" >
    </div>


</div>
<input value="0" readonly="" type="hidden" id="amountinword" name="amountinword"  class="form-control" >
 <input value="" type="hidden" id="selectedchekbox" name="selectedchekbox"  class="form-control" >
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


<script type="text/javascript">
    $(document).ready(function() {
        $('.dataTables_length').hide();
        
var mySet = new Set();
    $("#datatable-checkbox").on("click", ".instrument", function(){
//        $('.instrument').click(function() {

            var id = this.id;
               
            var totalamt = $('#totalamt').val();
          
            var total = ($('#cost' + id).text());
            if ($('#' + id).prop('checked')) {
                  
mySet.add(id);
                totalamt = parseInt(totalamt) + parseInt(total);

                $('#totalamt').val(parseInt(totalamt));
                var discper = $('#discper').val();
                var discamt = (discper / 100) * totalamt;
                $('#FinalAmount').val(parseInt(totalamt) - parseInt(discamt));
                var Deposit = $('#Deposit').val();
                   $('#discamt').val(parseInt(discamt));
                if (Deposit > (parseInt(totalamt) - parseInt(discamt)))
                {
                    $('#Return_by_Shop').val(parseInt(Deposit) - parseInt(totalamt) - parseInt(discamt));
                    $('#Paid_ByCust').val(0);
                } else {
                    $('#Paid_ByCust').val(parseInt(totalamt) - parseInt(discamt) - parseInt(Deposit));
                    $('#Return_by_Shop').val(0);
                }
            } else {
                
                               
mySet.delete(id);
                totalamt = parseInt(totalamt) - parseInt(total);
                $('#totalamt').val(parseInt(totalamt));
                var discper = $('#discper').val();

                var discamt = (discper / 100) * totalamt;
                  $('#discamt').val(parseInt(discamt));
                $('#FinalAmount').val(parseInt(totalamt) - parseInt(discamt));
                var Deposit = $('#Deposit').val();
                if (Deposit > (parseInt(totalamt) - parseInt(discamt)))
                {
                    $('#Return_by_Shop').val(parseInt(Deposit) - parseInt(totalamt) - parseInt(discamt));
                    $('#Paid_ByCust').val(0);
                } else {
                    $('#Paid_ByCust').val(parseInt(totalamt) - parseInt(discamt) - parseInt(Deposit));
                    $('#Return_by_Shop').val(0);
                }
            }

  var myArr = Array.from(mySet);
 $('#selectedchekbox').val(myArr);


        });
        $('#discper').on('keyup change', function() {
            var discper = $('#discper').val();

            var isValid = true;

            if (discper === "")
            {
                discper = 0;

                $("#discper").formError("Enter Correct Discount Percentage ");
                isValid = false;
            }
            else
            {

                var totalamt = $('#totalamt').val();

                var discamt = (discper / 100) * totalamt;

                $('#FinalAmount').val(parseInt(totalamt) - parseInt(discamt));
                $('#discamt').val(parseInt(discamt));
                var Deposit = $('#Deposit').val();
                 if (Deposit > (parseInt(totalamt) - parseInt(discamt)))
                {
                    $('#Return_by_Shop').val(parseInt(Deposit) - (parseInt(totalamt) - parseInt(discamt)));
                    $('#Paid_ByCust').val(0);
                } else {
                    $('#Paid_ByCust').val((parseInt(totalamt) - parseInt(discamt)) - parseInt(Deposit));
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

                var disper = (discamt / totalamt) * 100;

                $('#FinalAmount').val(parseInt(totalamt) - parseInt(discamt));
                $('#discper').val(parseInt(disper));
                var Deposit = $('#Deposit').val();
                 if (Deposit > (parseInt(totalamt) - parseInt(discamt)))
                {
                    $('#Return_by_Shop').val(parseInt(Deposit) - (parseInt(totalamt) - parseInt(discamt)));
                    $('#Paid_ByCust').val(0);
                } else {
                    $('#Paid_ByCust').val((parseInt(totalamt) - parseInt(discamt)) - parseInt(Deposit));
                    $('#Return_by_Shop').val(0);
                }
                $('#amountinword').val(converAmount(parseInt(Deposit)));
                $("#discamt").formError({remove: true});
            }
            return isValid;
        });
        $('#Deposit').on('keyup change', function() {
            var Deposit = $('#Deposit').val();

            var isValid = true;

            if (Deposit === "")
            {
                Deposit = 0;

                $("#Deposit").formError("Enter Correct Deposit Amount ");
                isValid = false;
            }
            else
            {

                var totalamt = $('#totalamt').val();
                var discamt = $('#discamt').val();



                $('#FinalAmount').val(parseInt(totalamt) - parseInt(discamt));

                var Deposit = $('#Deposit').val();
                if (Deposit > (parseInt(totalamt) - parseInt(discamt)))
                {
                    $('#Return_by_Shop').val(parseInt(Deposit) - (parseInt(totalamt) - parseInt(discamt)));
                    $('#Paid_ByCust').val(0);
                } else {
                    $('#Paid_ByCust').val((parseInt(totalamt) - parseInt(discamt)) - parseInt(Deposit));
                    $('#Return_by_Shop').val(0);
                }

                $('#amountinword').val(converAmount(parseInt(Deposit)));
                $("#Deposit").formError({remove: true});
            }
            return isValid;
        });



    });
</script>


