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


%>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Employee Advance Taken<span class="required">*</span>
    </label>
    <div class="col-md-6 col-sm-6 col-xs-12">
        <input type="text" id="employeeadvancetaken" name="employeesalary" value="<%=advanceamt%>" readonly required="required" onkeypress="return alpha(event)" class="form-control col-md-7 col-xs-12">
    </div>
</div>

<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Payment Amount<span class="required">*</span>
    </label>
    <div class="col-md-6 col-sm-6 col-xs-12">
        <input type="text" id="Advance"  name="Advance" required="required" value="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12 row0">
    </div>
</div>




<div class="ln_solid"></div>
<div class="form-group">
    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
        <!--<button class="btn btn-primary" type="button">Cancel</button>-->
        <button class="btn btn-primary" type="reset">Reset</button>
        <button type="submit" class="btn btn-success" id="advancebtn">Submit</button>
    </div>
</div>



<script>
    $('#document').ready(function() {

        $("#Monthforadavance").formError({remove: true});
    });

</script>

<%} else {%>

<script>
    $('#document').ready(function() {

        $("#Monthforadavance").formError("Payment Already Given For Thesse Month and Year  ");
    });

</script>

<%}%>


<script type="text/javascript">
    $(document).ready(function() {


        $('#Monthforadavance').change(function() {

            var PaymnentMonth = $('#Monthforadavance').val();
            var PaymnentYear = $('#Yearforadavance').val();
            var empid = $('#empid').val();
            if (PaymnentYear != "")
            {
                $.get("AjaxPages/FetchAdavance.jsp", {empid: empid, PaymnentMonth: PaymnentMonth, PaymnentYear: PaymnentYear}, function(data) {
                    //   alert('sucess');
                    $('#fetchadavanceamt').html(data);


                });

            } else
            {

                $("#Yearforadavance").formError("Please Select Year For Salary  ");
            }
        });





    });
</script>



<script type="text/javascript">
    $(document).ready(
            function()
            {

                $("#advancebtn").click(
                        function(event)
                        {

                            event.preventDefault();

                            if (validateformadvance.all())
                            {



                                document.getElementById("AdvanceForm").submit();

                            }
                        });
            });

    var validateformadvance =
            (function()
            {
                var _regex =
                        {
                            emailAddressIsValid:
                                    function(emailAddress)
                                    {
                                        // http://stackoverflow.com/questions/2855865/jquery-validate-e-mail-address-regex
                                        var pattern = new RegExp(/^(("[\w-+\s]+")|([\w-+]+(?:\.[\w-+]+)*)|("[\w-+\s]+")([\w-+]+(?:\.[\w-+]+)*))(@((?:[\w-+]+\.)*\w[\w-+]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][\d]\.|1[\d]{2}\.|[\d]{1,2}\.))((25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\.){2}(25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\]?$)/i);

                                        return pattern.test(emailAddress);
                                    },
                            isWholeNumber:
                                    function(age)
                                    {
                                        var pattern = new RegExp(/^\d+$/);

                                        return pattern.test(age);
                                    }
                        };

                var all =
                        function()
                        {
                            var invalidControls = [];

                            var i = 0;
                            for (var controlValidationMethod in validateformadvance.controls)
                            {


                                if (!validateformadvance.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
                                {
                                    invalidControls.push(controlValidationMethod);
                                }
                            }

                            if (invalidControls.length > 0)
                            {
                                // Set focus on the first erroneous control
                                $("#" + invalidControls[0]).focus();
                            }
                            return invalidControls.length == 0;
                        };

                var controls =
                        {
                            Advance:
                                    function()
                                    {

                                        var employeeadvancetaken = $('#employeeadvancetaken').val();
                                        var Advance = $('#Advance').val();
                                        if(Advance== "")
                                        {
                                            Advance=0;
                                        }
                                        var employeesalary = $('#employeesalary').val();

                                        var isValid = true;

                                        if (employeesalary < (parseInt(Advance)+parseInt(employeeadvancetaken)))
                                        {

                                             $("#Advance").formError("Adavance is Grater Than Salary Amount");
                                            isValid = false;
                                        }
 else  if ((parseInt(Advance))==0)
                                        {

                                             $("#Advance").formError("Enter Adavance Payment");
                                            isValid = false;
                                        }

                                        else 
                                        {
                                            // Valid, remove any existing form error message for this input
                                             $("#Advance").formError({remove: true});
                                        }

                                        return isValid;
                                    }



                        };

                return {
                    "all": all,
                    "controls": controls};
            })();






</script>