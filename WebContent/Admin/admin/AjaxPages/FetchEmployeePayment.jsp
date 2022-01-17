
<%@page import="java.time.YearMonth"%>
<%@page import="com.accede.angel.admin.dao.EmployeeWeekoffDao"%>
<%@page import="com.accede.angel.admin.dao.EmployeeAdvanceDao"%>
<%@page import="com.accede.angel.admin.model.EmployeePayment"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDao"%>
<script src="../../production/css/Alertajax.js" type="text/javascript"></script>

<link href="../../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>
<script src="../../production/js/Swal.js" type="text/javascript"></script>
<%
    String Months = request.getParameter("PaymnentMonth");
    String year = request.getParameter("PaymnentYear");
    String empid = request.getParameter("empid");
    EmployeeDao EmployeeDao = new EmployeeDao();
    Employee Employee = EmployeeDao.getEmployeeByID(Long.parseLong(empid));
    EmployeePayment EmployeePayment = new EmployeePayment();
    EmployeePayment.setYear(Integer.parseInt(year));
    String monthno = "0";

    if (Months.equals("Jan")) {
        monthno = "1";
    } else if (Months.equals("Feb")) {
        monthno = "2";
    } else if (Months.equals("Mar")) {
        monthno = "3";
    } else if (Months.equals("Apr")) {
        monthno = "4";
    } else if (Months.equals("May")) {
        monthno = "5";
    } else if (Months.equals("Jun")) {
        monthno = "6";
    } else if (Months.equals("Jul")) {
        monthno = "7";
    } else if (Months.equals("Aug")) {
        monthno = "8";
    } else if (Months.equals("Sep")) {
        monthno = "9";
    } else if (Months.equals("Oct")) {
        monthno = "10";
    } else if (Months.equals("Nov")) {
        monthno = "11";
    } else {
        monthno = "12";
    }
    EmployeePayment.setMonth(monthno);
    EmployeePayment.setEmployee(Employee);
    boolean b = EmployeeDao.isEmployeePaymentExist(EmployeePayment);
    if (b) {
        long advanceamt = new EmployeeAdvanceDao().getTotalAdvance(EmployeePayment);
             int totalleaves = new EmployeeWeekoffDao().getTotalLeavs(EmployeePayment);
              YearMonth yearMonthObject = YearMonth.of(Integer.parseInt(year), Integer.parseInt(monthno));
        int daysInMonth = yearMonthObject.lengthOfMonth(); //28
        String workingtype = Employee.getWorkingType();
        double perhoursalary = 0.0;

        double perdaysalary = (double) ((double) Employee.getSalary() / (double) daysInMonth);
        if (workingtype.equals("Full")) {
            perhoursalary = perdaysalary / 9;
        } else {
            perhoursalary = perdaysalary / 6;
        }
        daysInMonth = daysInMonth - totalleaves;
        double paymentforthesemonth = (double) ((double) perdaysalary * (double) daysInMonth);


%>


<div class="row" >
    <div class="col-md-12 col-sm-12 col-xs-12">


        <div class="col-md-4 col-sm-4 col-xs-12">
            <label >No of days Leaves<span class="required">*</span>
            </label>
            <input type="text" readonly="" value="<%=totalleaves%>" id="noOfDaysLeaves" name="noOfDaysLeaves" required="required" value="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">
            <input type="hidden" readonly="" value="<%=Math.round(perhoursalary)%>" id="perhoursalary" name="perhoursalary" required="required" value="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">

        </div>
        <div class="col-md-4 col-sm-4 col-xs-12">
            <label >No of Days Paid<span class="required">*</span>
            </label>
            <input type="text" id="noOfDays" name="noOfDays" required="required" value="<%=daysInMonth%>" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">

        </div>

        <div class="col-md-4 col-sm-4 col-xs-12">
            <label >Payment Amount<span class="required">*</span>
            </label>
            <input type="text" id="paymentamt" readonly="" name="paymentamt" required="required" value="<%=Math.round(paymentforthesemonth)%>" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">

        </div>









    </div>

</div><br>
<div class="row" >
    <div class="col-md-12 col-sm-12 col-xs-12">

        <div class="col-md-4 col-sm-4 col-xs-12">
            <label >Incentive Amount<span class="required">*</span>
            </label>
            <input type="text" id="incntamt" name="incntamt" required="required" value="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 extra">

        </div>
        <div class="col-md-4 col-sm-4 col-xs-12">
            <label >Extra Hours/Over Time<span class="required">*</span>
            </label>
            <input type="text" id="extrahours" name="extrahours" required="required" value="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 extra">

        </div>

        <div class="col-md-4 col-sm-4 col-xs-12">
            <label >Overtime Amount<span class="required">*</span>
            </label>
            <input type="text" id="overtime" name="overtime" readonly="" required="required" value="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">

        </div>









    </div>

</div><br>
<div class="row" >
    <div class="col-md-12 col-sm-12 col-xs-12">

        <div class="col-md-4 col-sm-4 col-xs-12">
            <label >Total Amount After Overtime and Incentive<span class="required">*</span>
            </label>
            <input type="text" id="totalamt" name="totalamt" readonly="" value="<%=Math.round(paymentforthesemonth)%>" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12">

        </div>
        <div class="col-md-4 col-sm-4 col-xs-12">
            <label >Employee Advance<span class="required">*</span>
            </label>
            <input type="text" id="employeeadvance" name="employeeadvance" value="<%=advanceamt%>" readonly required="required" onkeypress="return alpha(event)" class="form-control col-md-7 col-xs-12">

        </div>

        <div class="col-md-4 col-sm-4 col-xs-12">
            <label >Final Amount<span class="required">*</span>
            </label>
            <input type="text" id="finalamt" name="finalamt" readonly="" value="<%=Math.round(paymentforthesemonth)-advanceamt%>" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12">

        </div>









    </div>

</div><br>
<div class="form-group">
    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">

        <button class="btn btn-primary" type="reset">Reset</button>
        <button type="submit" class="btn btn-success" >Update</button>
    </div>
</div>

<script>
    $('#document').ready(function() {
   
       $("#PaymnentMonth").formError({remove: true});
    });

</script>

<%} else {%>

<script>
    $('#document').ready(function() {
      
       $("#PaymnentMonth").formError("Payment Already Given For Thesse Month and Year  ");
    });

</script>

<%}%>




<script type="text/javascript">
    $('#document').ready(function() {

        $('.extra').on('keyup change', function() {
            var incntamt = $('#incntamt').val();
           
            var extrahours = $('#extrahours').val();
            if (incntamt == "")
            {
                incntamt = 0;
            }
            if (extrahours == "")
            {
                extrahours = 0;
            }
            var perhoursalary = $('#perhoursalary').val();
            var paymentamt = $('#paymentamt').val();
            var employeeadvance = $('#employeeadvance').val();
            var isValid = true;
         var  overtime =extrahours*perhoursalary;
       
           $('#overtime').val(parseInt(overtime)+parseInt(incntamt));  
         
           $('#totalamt').val(parseInt(paymentamt)+parseInt(overtime)+parseInt(incntamt));      
           $('#finalamt').val(parseInt(paymentamt)+parseInt(incntamt)+parseInt(overtime)-parseInt(employeeadvance));      
      
          
            return isValid;
        });


        function converAmount(amount)
        {
            var grandtotal = amount;
            var r = 0;
            var txter = grandtotal.toString();
            var sizer = txter.toString().length;
            var numStr = "";
            var n = parseInt(grandtotal);
            var places = 0;
            var str = "";
            var entry = 0;
            while (n >= 1)
            {
                r = parseInt(n % 10);
                if (places < 3 && entry == 0)
                {

                    numStr = txter.substring(txter.toString().length - 0, txter.toString().length - 3) // Checks for 1 to 999.

                    str = onlyDigit(numStr); //Calls function for last 3 digits of the value.

                    entry = 1;
                }

                if (places == 3)
                {

                    var size1 = txter.toString().length - 5;
                    var size2 = txter.toString().length - 3;
                    numStr = txter.substring(size1, size2)

                    if (numStr != "")
                    {
                        str = onlyDigit(numStr) + " Thousand " + str;
                    }
                }

                if (places == 5)
                {

                    numStr = txter.substring(txter.toString().length - 7, txter.toString().length - 5) //Substring for 5 place to 7 place of the string

                    if (numStr != "")
                    {
                        str = onlyDigit(numStr) + " Lakhs " + str; //Appends the word lakhs to it

                    }
                }

                if (places == 6)
                {
                    numStr = txter.substring(txter.toString().length - 9, txter.toString().length - 7)  //Substring for 7 place to 8 place of the string

                    if (numStr != "")
                    {
                        str = onlyDigit(numStr) + " Crores " + str;
                    }
                }

                n = parseInt(n / 10);
                places++;
            }

            return str;
        }
        function onlyDigit(n)
        {

            var units = ['', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine'];
            var randomer = ['', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen'];
            var tens = ['', 'Ten', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];
            var r = 0;
            var num = parseInt(n);
            var str = "";
            var pl = "";
            var tenser = "";
            while (num >= 1)
            {
                r = parseInt(num % 10);
                tenser = r + tenser;
                if (tenser <= 19 && tenser > 10)
                {
                    str = randomer[tenser - 10];
                }
                else
                {
                    if (pl == 0)
                    {
                        str = units[r];
                    }
                    else if (pl == 1)
                    {
                        str = tens[r] + " " + str;
                    }
                }
                if (pl == 2)
                {
                    str = units[r] + " Hundred " + str;
                }

                num = parseInt(num / 10);
                pl++;
            }
            return str;
        }
        $('#discper').on('keyup change', function() {
            var discper = $('#discper').val();
            var isValid = true;
            if (discper == "")
            {
                discper = 0;
                $("#discper").formError("Enter Correct Discount Percentage ");
                isValid = false;
            }
            else {

                $("#discper").formError({remove: true});
                var coursefee = $('#coursefee').val();
                var AdmissionFee = $('#AdmissionFee').val();


                var FinalAmount = $('#FinalAmount').val();

                FinalAmount = parseInt(coursefee) - (parseInt(coursefee) * parseInt(discper) / 100) + parseInt(AdmissionFee);

                var PaidAmount = $('#PaidAmount').val();
                $('#discamt').val(parseInt(parseInt(coursefee) * parseInt(discper) / 100));
                $('#FinalAmount').val(parseInt(FinalAmount));
                $('#BalanceAmount').val(parseInt(FinalAmount) - parseInt(PaidAmount));
                $('#amountinword').val(converAmount(parseInt(FinalAmount) - parseInt(PaidAmount)));

            }
            return isValid;

        });
        $('#discamt').on('keyup change', function() {
            var discamt = $('#discamt').val();
            var isValid = true;
            if (discamt == "")
            {
                discamt = 0;
                $("#discamt").formError("Enter Correct Discount Amount ");
                isValid = false;
            }
            else
            {
                $("#discamt").formError({remove: true});
                var coursefee = $('#coursefee').val();
                var AdmissionFee = $('#AdmissionFee').val();


                var FinalAmount = $('#FinalAmount').val();
                var disper = (discamt / coursefee) * 100;
                FinalAmount = parseInt(coursefee) - (parseInt(discamt)) + parseInt(AdmissionFee);
                var PaidAmount = $('#PaidAmount').val();

                $('#discper').val(parseInt(disper));
                $('#FinalAmount').val(parseInt(FinalAmount));
                $('#BalanceAmount').val(parseInt(FinalAmount) - parseInt(PaidAmount));
                $('#amountinword').val(converAmount(parseInt(FinalAmount) - parseInt(PaidAmount)));
            }
            return isValid;
        });
        $('#Courses').change(function() {


            var noofcourseselect = $(this).val().length;
            var noofcours = $('#noofcours').val();
            var isValid = true;

            noofcourseselect = parseInt(noofcourseselect);
            if (noofcourseselect != noofcours)
            {


                $("#Courses").formError("Select Only " + noofcours + " Course");
                isValid = false;


                $('#noofcourseselect').val(parseInt(noofcourseselect));



            } else
            {
                // Valid, remove any existing form error message for this input
                $("#Courses").formError({remove: true});
                $('#noofcourseselect').val(parseInt(noofcourseselect));
            }


        });


        $('#BatchTime').change(function() {


            var noofBatchTimeselect = $(this).val().length;
            var noofBatchTimes = $('#noofBatchTimes').val();
            var isValid = true;

            noofBatchTimeselect = parseInt(noofBatchTimeselect);
            if (noofBatchTimeselect != noofBatchTimes)
            {

                $(".BatchTime").formError("Select Only " + noofBatchTimes + " Batch Time");
                isValid = false;


                $('#noofBatchTimeselect').val(parseInt(noofBatchTimeselect));



            } else
            {
                // Valid, remove any existing form error message for this input
                $(".BatchTime").formError({remove: true});
                $('#noofBatchTimeselect').val(parseInt(noofBatchTimeselect));
            }

            return isValid;
        });

        $('#Days').change(function() {


            var noofDaysselect = $(this).val().length;
            var noofday = $('#noofday').val();
            var isValid = true;

            noofDaysselect = parseInt(noofDaysselect);
            if (noofDaysselect != noofday)
            {

                $(".Days").formError("Select Only " + noofday + " Days");
                isValid = false;


                $('#noofDaysselect').val(parseInt(noofDaysselect));



            } else
            {
                // Valid, remove any existing form error message for this input
                $(".Days").formError({remove: true});
                $('#noofDaysselect').val(parseInt(noofDaysselect));
            }

            return isValid;
        });



    });




</script>

<script type="text/javascript">
                                                                                        $(document).ready(function() {


                                                                                            $('#PaymnentMonth').change(function() {

                                                                                                var PaymnentMonth = $('#PaymnentMonth').val();
                                                                                                var PaymnentYear = $('#PaymnentYear').val();
                                                                                                var empid = $('#empid').val();
                                                                                                if (PaymnentYear != "")
                                                                                                {
                                                                                                    $.get("AjaxPages/FetchEmployeePayment.jsp", {empid:empid,PaymnentMonth: PaymnentMonth,PaymnentYear:PaymnentYear}, function(data) {
                                                                                                        //   alert('sucess');
                                                                                                        $('#paymentdetailsfetch').html(data);

                                                                                                       
                                                                                                        });
                                                                                                   
                                                                                                }else
                                                                                                {
                                                                                                   
                                                                                                  $("#PaymnentYear").formError("Please Select Year For Salary  ");  
                                                                                                }
                                                                                            });





                                                                                        });
</script>
