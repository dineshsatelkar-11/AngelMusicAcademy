  


<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="com.accede.angel.admin.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.PackageDao"%>
<%@page import="com.accede.angel.admin.model.PackageCourse"%>
     
<%
    int id = Integer.parseInt(request.getParameter("Package"));
    int AdmissionFee = Integer.parseInt(request.getParameter("AdmissionFee"));
    PackageCourse PackageCourse = new PackageDao().getPackageCourseByID(id);
    Admin asq = (Admin) session.getAttribute("BRANCH_ADMIN");
    int q = asq.getAdminId();

%>

<input type="hidden" id="coursefee" value="<%=PackageCourse.getFee()%>">
<input type="hidden" id="noofday" value="<%=PackageCourse.getNoofdays()%>">
<input type="hidden" id="noofcours" value="<%=PackageCourse.getNoofcourse()%>">
<input type="hidden" id="noofBatchTimes" value="<%=PackageCourse.getNoofBatchTimes()%>">
<input type="hidden" id="noofcourseselect" name="noofcourseselect" value="0">
<input type="hidden" id="noofDaysselect" name="noofDaysselect" value="0">
<input type="hidden" id="noofBatchTimeselect" name="noofBatchTimeselect" value="0">
<input type="hidden" id="amountinword" name="amountinword" value="0">

<div class="row">

    <div class="col-md-4 col-sm-12 col-xs-12 form-group Days" >



        <script>
            (function($) {
                $(function() {
                    $('.multi-select-dd').fSelect();
                });
            })(jQuery);
        </script>


        <p><strong>   Select Days:</strong></p>
        <select id="Days" name="Days" class="multi-select-dd form-control" multiple="multiple">
            <%                                  List<String> Days = new UserDao().initDaysList();

                for (String b : Days) {

            %>
            <option value="<%=b.toString()%>" ><%=b.toString()%></option>

            <%                                                                               }

            %>

        </select>

    </div>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group Courses">



        <script>
            (function($) {
                $(function() {
                    $('.multi-select-dd1').fSelect();
                });
            })(jQuery);
        </script>




        <p><strong>   Select Course:-</strong></p>
        <select id="Courses" name="Courses" class="multi-select-dd1 form-control" multiple="multiple">
            <%                                                                                List<Course> cs1 = new CourseDao().getAllCourse();
                for (Course c : cs1) {

            %>

            <option value="<%=c.getCourseName()%>" ><%=c.getCourseName()%></option>



            <%                                                                               }

            %>
        </select>
    </div>


    <div class="col-md-4 col-sm-12 col-xs-12 form-group BatchTime">



        <script>
            (function($) {
                $(function() {
                    $('.multi-select-dd2').fSelect();
                });
            })(jQuery);
        </script>



        <p><strong>   Select Batch Times:-</strong></p>

        <select id="BatchTime" name="BatchTime" class="multi-select-dd2 form-control" multiple="multiple">
            <%                               List<BatchTime> batch = new BatchTimeDa0().getAllBatchTime();

                for (BatchTime b : batch) {
                    if (b.getAdminOfBranch().getAdminId() == q) {
            %>
            <option value="<%=b.getBatchTiming()%>" ><%=b.getBatchTiming()%></option>



            <%                                                                               }
                }
            %>
        </select>
    </div>
</div>

<div class="row" >


    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Discount in %:</strong></p>
            <input value="0" type="text" id="discper" name="discper" maxlength="10" placeholder="Discount in %" class="form-control admission" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Discount in Amount:</strong></p>
            <input value="0" type="text" id="discamt" name="discamt" maxlength="10" placeholder="  Discount in Amount" class="form-control admission" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

        </div>

    </div>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <p><strong>   Final Amount:</strong></p>
        <input value="<%=PackageCourse.getFee() + AdmissionFee%>" type="text" readonly="" id="FinalAmount" name="FinalAmount" maxlength="10" placeholder="Contact No." class="form-control admission" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
    </div>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>  Paid Amount:</strong></p>
            <input value="0" type="text" id="PaidAmount" name="PaidAmount" maxlength="10" placeholder=" Paid Amount" class="form-control admission" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong> Balance  Amount:</strong></p>
            <input value="<%=PackageCourse.getFee() + AdmissionFee%>"  readonly=""type="text" id="BalanceAmount" name="BalanceAmount" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

        </div> </div>


</div>




<script type="text/javascript">
    $('#document').ready(function() {
      
      
        $('#PaidAmount').on('keyup change', function() {
            var FinalAmount = $('#FinalAmount').val();
            var PaidAmount = $('#PaidAmount').val();
            var isValid = true;
            if (PaidAmount == "")
            {
                PaidAmount = 0;
                $("#PaidAmount").formError("Enter Correct Paid Amount ");
                isValid = false;
            } else
            {
                $("#PaidAmount").formError({remove: true});
                $('#BalanceAmount').val(parseInt(FinalAmount) - parseInt(PaidAmount));
                $('#amountinword').val(converAmount(parseInt(FinalAmount) - parseInt(PaidAmount)));
            }
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

            noofcourseselect = parseInt(noofcourseselect) ;
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

            noofBatchTimeselect = parseInt(noofBatchTimeselect) ;
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

            noofDaysselect = parseInt(noofDaysselect) ;
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
