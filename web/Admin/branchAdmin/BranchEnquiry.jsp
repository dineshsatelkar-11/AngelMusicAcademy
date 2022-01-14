<%@page import="com.accede.angel.admin.dao.UserDao"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>
<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>
<%@page import="com.accede.angel.admin.dao.ProductDao"%>
<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.model.Product"%>
<%@page import="com.accede.angel.admin.model.Instrument"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/branchAdminSideBar.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <!--            <div class="page-title">
                                      <div class="title_left">
                                        <h3>Form Elements</h3>
                                      </div>
                        
                                      <div class="title_right">
                                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                          <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search for...">
                                            <span class="input-group-btn">
                                              <button class="btn btn-default" type="button">Go!</button>
                                            </span>
                                          </div>
                                        </div>
                                      </div>
                                    </div>-->
                        <div class="clearfix"></div>

                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Enquiry <small> </small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Settings 1</a>
                                            </li>
                                            <li><a href="#">Settings 2</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <form action="../../EnquryServlet" method="get">

                                    <%                                           if (session.getAttribute("i") != null) {
                                            int i = (Integer) session.getAttribute("i");
                                            String msg = (String) session.getAttribute("msg");
                                            if (i == 2) {

                                                System.out.println("fdgsfd");
                                    %>
                                    <div class="alert">
                                        <span class="closebtn">&times;</span>  
                                        <strong>Danger!</strong> <%=msg%>
                                    </div>
                                    <%} else {%>
                                    <div class="alert success">
                                        <span class="closebtn">&times;</span>  
                                        <strong>Success!</strong><%=msg%> 
                                    </div>
                                    <%
                                            }
                                            session.removeAttribute("i");
                                            session.removeAttribute("msg");
                                        }%>

                                    <div class="row">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <input type="text" placeholder=" Name" id="name" name="name" onkeypress="return alpha(event)" class="form-control">
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <input type="text" placeholder="Mobile" maxlength="10" id="mobile" name="mobile" class="form-control priceup">
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <input type="email" placeholder="Email" id="email" name="email" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row">


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <select id="enquiryfor" name="enquiryfor" required="" class="form-control">
                                                <option value="MusicClass">Select Enquiry Category</option>
                                                <option value="MusicClass">Music Class</option>
                                                <option value="Sell">Sell</option>
                                                <option value="Repair">Repair</option>
                                                <option value="Rent">Rent</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <input type="text" id="datetimepicker7" required="" name="follow" placeholder="Follow Up Date" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row">


                                        <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                            <textarea id="textarea" required="required" name="requirement" placeholder="Customer Requirement" class="form-control col-md-7 col-xs-12"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">


                                        <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                            <textarea id="textarea" required="required" name="offer" placeholder="Offer From Shop" class="form-control col-md-7 col-xs-12"></textarea>
                                        </div>
                                    </div>


                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                            <!--<button type="button" class="btn btn-primary">Cancel</button>-->
                                            <button type="reset" class="btn btn-primary">Reset</button>
                                            <button type="submit" class="btn btn-success">Submit</button>

                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <!-- /page content -->

            <!-- footer content -->
            <%@ include file = "../comman_files/BranchFooter.jsp" %>
            <!-- /footer content -->
        </div>


        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- bootstrap-progressbar -->
        <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <!-- iCheck -->
        <script src="../vendors/iCheck/icheck.min.js"></script>
        <!-- bootstrap-daterangepicker -->
        <script src="../vendors/moment/min/moment.min.js"></script>
        <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- bootstrap-wysiwyg -->
        <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
        <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
        <script src="../vendors/google-code-prettify/src/prettify.js"></script>
        <!-- jQuery Tags Input -->
        <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
        <!-- Switchery -->
        <script src="../vendors/switchery/dist/switchery.min.js"></script>
        <!-- Select2 -->
        <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
        <!-- Parsley -->
        <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
        <!-- Autosize -->
        <script src="../vendors/autosize/dist/autosize.min.js"></script>
        <!-- jQuery autocomplete -->
        <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
        <!-- starrr -->
        <script src="../vendors/starrr/dist/starrr.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
        <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script>
    
     
          function alpha(e) {
                 
        var k;
                   document.all ? k = e.keyCode : k = e.which;
                    return ((k > 64 && k < 91) || (k > 96 && k < 123) || (k=33) );
                }
    
    
    
        </script>
        <script type="text/javascript">
            $('#document').ready(function() {
             
       
                
                
                
        $('#datetimepicker1').datetimepicker({
                    format: 'DD/MM/YYYY',
                    viewMode: "years"
                });
                $('#datetimepicker2').datetimepicker({
                    format: 'DD/MM/YYYY',
                    viewMode: "years"
                });
                $('#datetimepicker3').datetimepicker({
                    format: 'DD/MM/YYYY',
                    viewMode: "years"
                });
                $('#datetimepicker4').datetimepicker({
                    format: 'DD/MM/YYYY',
                    viewMode: "years"
                });
                $('#datetimepicker5').datetimepicker({
                    format: 'DD/MM/YYYY',
                    viewMode: "years"
                });
                $('#datetimepicker6').datetimepicker({
                    format: 'DD/MM/YYYY',
                    viewMode: "years"
                });
                $('#datetimepicker7').datetimepicker({
                    format: 'DD/MM/YYYY',
                    viewMode: "years"
                });
              
                $("#datetimepicker1").on("dp.change", function(e) {
                    var duration = $('#noOfDays1').val();
                    alert('dfj');
                    duration = parseInt(duration);
                    var today = new Date(e.date);
                    var day = $('#datetimepicker1').val();
                    //                var currentdate=today.getDate() +duration;
                    //                alert(currentdate);
                    //                  alert(today.getDate());
                    //                var currMonth = today.getMonth() + duration;
                    //                
                    //                var secondInstallmentDate = new Date(today.setMonth(currMonth));
                    //                var month = secondInstallmentDate.getMonth() + 1;
                    //                var year = new Date(secondInstallmentDate).getFullYear();
                    //                var date5 = new Date(secondInstallmentDate).getDate();
                    //                $('.DueDate').val(date5 + "/" + month + "/" + year);

                    //                    alert(' hello' + val);
                    $.get("fetchduedate.jsp", {q: duration, w: today, v: day}, function(data) {
                        //   alert('sucess');
                        $('#datefetch').html(data);
                    });

                });

                $('#Instumentid').change(function() {
                    //   alert('hi112');

                });
                $("#output1").hide();
                $('#output2').hide();
                $('#output3').hide();
                $('#output4').hide();

                $('#quant2').on('keyup change', function() {
                    var quant1 = $('#quant2').val();
                    var advancedPaid1 = $('#advancedPaid2').val();
                    var discou1 = $('#discou2').val();
                    var unitPrice1 = $('#repcost').val();


                    if (unitPrice1 != 0)
                    {
                        if (quant1 != 0)
                        {
                            var amount = unitPrice1 * quant1;
                            var disamount = amount * discou1 / 100;
                            amount = amount - disamount;
                            amount = parseInt(amount);
                            $('#total2').val(amount);
                            amount = amount - advancedPaid1;

                            amount = parseInt(amount);
                            $('#balanceAmount2').val(amount);

                            $('#amountinwordRepair').val(converAmount(amount));
                        }
                        else
                        {


                            $('#total2').val("0");

                        }
                    }
                    else
                    {


                        $('#total2').val("0");

                    }
                });
                $('#discou2').on('keyup change', function() {
                    var quant1 = $('#quant2').val();

                    var discou1 = $('#discou2').val();
                    var unitPrice1 = $('#repcost').val();
                    var advancedPaid1 = $('#advancedPaid2').val();

                    if (unitPrice1 != 0)
                    {
                        if (quant1 != 0)
                        {
                            var amount = unitPrice1 * quant1;
                            var disamount = amount * discou1 / 100;
                            amount = amount - disamount;
                            amount = parseInt(amount);
                            $('#total2').val(amount);
                            amount = amount - advancedPaid1;

                            amount = parseInt(amount);
                            $('#balanceAmount2').val(amount);
                            $('#amountinwordRepair').val(converAmount(amount));
                        }
                        else
                        {


                            $('#total2').val("0");

                        }
                    }
                    else
                    {


                        $('#total2').val("0");

                    }
                });
                $('#quant1').on('keyup change', function() {
                    var quant1 = $('#quant1').val();
                    var advancedPaid1 = $('#advancedPaid1').val();
                    var discou1 = $('#discou1').val();
                    var unitPrice1 = $('#unitPrice1').val();


                    if (unitPrice1 != 0)
                    {
                        if (quant1 != 0)
                        {
                            var amount = unitPrice1 * quant1;
                            var disamount = amount * discou1 / 100;
                            amount = amount - disamount;
                            amount = parseInt(amount);
                            $('#total1').val(amount);
                            amount = amount - advancedPaid1;

                            amount = parseInt(amount);
                            $('#balanceAmount1').val(amount);

                            $('#amountinwordRent').val(converAmount(amount));
                        }
                        else
                        {


                            $('#total1').val("0");

                        }
                    }
                    else
                    {


                        $('#total1').val("0");

                    }
                });
                $('#discou1').on('keyup change', function() {
                    var quant1 = $('#quant1').val();

                    var discou1 = $('#discou1').val();
                    var unitPrice1 = $('#unitPrice1').val();
                    var advancedPaid1 = $('#advancedPaid1').val();

                    if (unitPrice1 != 0)
                    {
                        if (quant1 != 0)
                        {
                            var amount = unitPrice1 * quant1;
                            var disamount = amount * discou1 / 100;
                            amount = amount - disamount;
                            amount = parseInt(amount);
                            $('#total1').val(amount);
                            amount = amount - advancedPaid1;

                            amount = parseInt(amount);
                            $('#balanceAmount1').val(amount);
                            $('#amountinwordRent').val(converAmount(amount));
                        }
                        else
                        {


                            $('#total1').val("0");

                        }
                    }
                    else
                    {


                        $('#total1').val("0");

                    }
                });
                $('#unitPrice1').on('keyup change', function() {
                    var quant1 = $('#quant1').val();

                    var discou1 = $('#discou1').val();
                    var unitPrice1 = $('#unitPrice1').val();
                    var advancedPaid1 = $('#advancedPaid1').val();

                    if (unitPrice1 != 0)
                    {
                        if (quant1 != 0)
                        {
                            var amount = unitPrice1 * quant1;
                            var disamount = amount * discou1 / 100;
                            amount = amount - disamount;
                            amount = parseInt(amount);
                            $('#total1').val(amount);
                            amount = amount - advancedPaid1;

                            amount = parseInt(amount);
                            $('#balanceAmount1').val(amount);
                            $('#amountinwordRent').val(converAmount(amount));
                        }
                        else
                        {


                            $('#total1').val("0");

                        }
                    }
                    else
                    {


                        $('#total1').val("0");

                    }
                });

                $('#advancedPaid1').on('keyup change', function() {
                    var quant1 = $('#quant1').val();
                    var advancedPaid1 = $('#advancedPaid1').val();

                    var discou1 = $('#discou1').val();
                    var unitPrice1 = $('#unitPrice1').val();


                    if (unitPrice1 != 0)
                    {
                        if (quant1 != 0)
                        {
                            var amount = unitPrice1 * quant1;
                            var disamount = amount * discou1 / 100;
                            amount = amount - disamount;
                            amount = parseInt(amount);
                            $('#total').val(amount);

                            amount = amount - advancedPaid1;

                            amount = parseInt(amount);
                            $('#balanceAmount1').val(amount);
                            $('#amountinwordRent').val(converAmount(amount));
                        }
                        else
                        {


                            $('#total1').val("0");
                            $('#balanceAmount1').val("0");

                        }
                    }
                    else
                    {


                        $('#total1').val("0");
                        $('#balanceAmount1').val("0");

                    }
                });

                $('#quant').on('keyup change', function() {
                    var quant = $('#quant').val();

                    var discou = $('#discou').val();
                    var unitPrice = $('#unitPrice').val();


                    if (quant != 0)
                    {
                        var amount = quant * unitPrice;
                        var disamount = amount * discou / 100;
                        amount = amount - disamount;
                        amount = parseInt(amount);
                        $('#total').val(amount);
                        $('#amountinwordsell').val(converAmount(amount));

                    }
                    else
                    {


                        $('#total').val("0");

                    }
                });
                $('#discou').on('keyup change', function() {
                    var quant = $('#quant').val();

                    var discou = $('#discou').val();
                    var unitPrice = $('#unitPrice').val();


                    if (quant != 0)
                    {
                        var amount = quant * unitPrice;
                        var disamount = amount * discou / 100;
                        amount = amount - disamount;
                        amount = parseInt(amount);
                        $('#total').val(amount);
                        $('#amountinwordsell').val(converAmount(amount));

                    }
                    else
                    {


                        $('#total').val("0");

                    }
                });



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
                $('#pname').change(function() {
                    //   alert('hi112');
                    var val = $(this).val().trim();
                    //                alert(val);
                    $.ajax({
                        url: "productfetchajax.jsp",
                        type: "post",
                        data: {val: val},
                        success: function(response) {
                            $("#addproductfetch").html(response);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log(textStatus, errorThrown);
                            alert("Something Went Wrong...!!!");
                        }
                    });
                });
                $('#enquiryfor').change(function() {
                    //   alert('hi112');
                    var val = $(this).val().trim();
                    if (val == "MusicClass")
                    {
                        $("#output1").hide();
                        $('#output2').hide();
                        $('#output3').hide();
                        $('#output4').show();
                    }
                    else if (val == "Sell")
                    {
                        $("#output1").show();
                        $('#output2').hide();
                        $('#output3').hide();
                        $('#output4').hide();
                    }
                    else if (val == "Repair")
                    {
                        $("#output1").hide();
                        $('#output2').hide();
                        $('#output3').show();
                        $('#output4').hide();
                    }
                    else
                    {
                        $("#output1").hide();
                        $('#output2').show();
                        $('#output3').hide();
                        $('#output4').hide();
                    }

                });


                $(".priceup").keypress(function(event) {
                    var inputCode = event.which;
                    var currentValue = $(this).val();
                    if (inputCode > 0 && (inputCode < 48 || inputCode > 57)) {
                        if (inputCode == 46) {
                            if (getCursorPosition(this) == 0 && currentValue.charAt(0) == '-')
                                return false;
                            if (currentValue.match(/[.]/))
                                return false;
                        }
                        else if (inputCode == 45) {
                            if (currentValue.charAt(0) == '-')
                                return false;
                            if (getCursorPosition(this) != 0)
                                return false;
                        }
                        else if (inputCode == 8)
                            return true;
                        else
                            return false;

                    }
                    else if (inputCode > 0 && (inputCode >= 48 && inputCode <= 57)) {
                        if (currentValue.charAt(0) == '-' && getCursorPosition(this) == 0)
                            return false;
                    }
                });
            });



        </script>
        <script>
            var close = document.getElementsByClassName("closebtn");
            var i;

            for (i = 0; i < close.length; i++) {
                close[i].onclick = function() {
                    var div = this.parentElement;
                    div.style.opacity = "0";
                    setTimeout(function() {
                        div.style.display = "none";
                    }, 600);
                }
            }
        </script>
    </body>
</html>
