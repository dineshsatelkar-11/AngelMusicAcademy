<%@page import="com.accede.angel.admin.model.RentDetails"%>
<%@page import="com.accede.angel.admin.model.RentDetails"%>
<%@page import="com.accede.angel.admin.model.RentDetails"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.dao.PackageDao"%>
<%@page import="com.accede.angel.admin.model.PackageCourse"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>

<%@page import="com.accede.angel.admin.dao.UserDao"%>
<%@page import="com.accede.angel.admin.model.Instrument"%>

<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
 
     <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                
                    <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
             

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div role="main">
                    <div class="">



                        <div class="row">



                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Rent Form<small>new Customer</small></h2>


                                    </div>


                                    <div class="x_content">
                                        <%     AdmissionDao cd = new AdmissionDao();
                                            long id = Long.parseLong(request.getParameter("accountid"));
                                            RentDao RentDao = new RentDao();
                                            Rent Rent = RentDao.getRentByID(id);


                                        %>
                                        <form class="form-horizontal form-label-left input_mask" action="../../CustRentPaymentUpdate" id="CustRentPayment" data-parsley-vdalidate>
                                            <input type="hidden" id="rentid" name="rentid" value="<%=id%>">
                                            <div class="row">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" id="fname" name="fname" onkeypress="return alpha(event)" value="<%=Rent.getCustomerAccount().getName()%>" placeholder="First Name" class="form-control">

                                                </div>

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" id="contact" readonly="" value="<%=Rent.getCustomerAccount().getMobileNo()%>" name="contact" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="email" id="email" name="email" value="<%=Rent.getCustomerAccount().getEmail()%>" placeholder="Email" class="form-control">
                                                </div>

                                            </div>




                                            <div class="row">


                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p><strong> No of Days</strong></p>
                                                    <input type="text" readonly="" value="<%=Rent.getNoOfDays()%>" id="noofdays" name="noofdays"  placeholder="No. of Days" class="form-control">

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p><strong>   Extra No of Days</strong></p>
                                                    <input type="text" id="extraDays" name="extraDays" value="<%=Rent.getExtraDays()%>"  placeholder="Extra  Days" class="form-control details">

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p><strong>  Other / Damage </strong></p>
                                                    <input type="text" id="other" name="other" value="<%=Rent.getOther()%>"  placeholder="Other Charges " class="form-control details">

                                                </div>
                                            </div>
                                            <div id="FetchAmount" >


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
                                                            <td><%=Rent.getExtraDays()%></label></td>
                                                            <td ><%=p.getInstrumentRentCost() * (Rent.getNoOfDays() + Rent.getExtraDays())%></td>

                                                        </tr>
                                                        <%
                                                                totalamount = totalamount + p.getInstrumentRentCost() * (Rent.getNoOfDays() + Rent.getExtraDays());

                                                            }
                                                            disamount = Rent.getDiscamt();
                                                            Finalamount = totalamount - disamount + Rent.getOther();

                                                            if (Finalamount > Rent.getSecurityDeposite()) {
                                                                Paid_ByCust = Finalamount - Rent.getSecurityDeposite();
                                                            } else {
                                                                Return_by_Shop = Rent.getSecurityDeposite() - Finalamount;
                                                            }
                                                            
                                                            
                                                             Date dt = Rent.getReceivedDate();
                                                                String dd = dt.toString();
                                                                String[] datespilt = dd.split(" ");
    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");  
    String strDate = formatter.format(Rent.getReceivedDate());  
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
                                                            <input value="<%=Rent.getSecurityDeposite()%>" type="text" readonly id="Deposit" name="Deposit" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                        </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Payment Type:</strong></p>
                                                            <select class="form-control" required=""  id="paymode" name="paymode">
                                                                <option selected="" value="<%=Rent.getPaymode()%>"><%=Rent.getPaymode()%></option>
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
                                                            <input value="<%=Paid_ByCust%>" readonly="" type="text" id="Paid_ByCust1" name="Paid_ByCust1" maxlength="10" placeholder="Contact No." class="form-control" >

                                                        </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Return By Shop:</strong></p>
                                                            <input value="<%=Return_by_Shop%>" readonly="" type="text" id="Return_by_Shop" name="Return_by_Shop" maxlength="10" placeholder="Contact No." class="form-control" >

                                                        </div>

                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                          <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                                <p><strong>   Paid By Customer</strong></p>
                                                                <input value="<%=Paid_ByCust%>" required  type="text" id="Paid_ByCust" name="Paid_ByCust" maxlength="10" placeholder="Contact No." class="form-control" >

                                                          </div>
                                                              
                                                              
                                                          <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                              <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                                   <p><strong>   Return Date </strong></p>
                                                        <input  type="text" readonly="" value="<%=strDate%>" id="Return_by_Date" name="Return_by_Date" maxlength="10" placeholder="Contact No." class="form-control" >
                                                  
                                                              </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                                   <p><strong>   Return Time </strong></p>
                                                        <input  type="text" readonly="" value="<%=datespilt[1]%>" id="Return_by_Date" name="Return_by_Date" maxlength="10" placeholder="Contact No." class="form-control" >
                                                  
                                                              </div>
                                                         </div>
                                                    </div>


                                                </div>
                                                <input value="0" readonly="" type="hidden" id="amountinword" name="amountinword"  class="form-control" >

                                            </div>   <div class="ln_solid"></div>
<%
if(Rent.isCloseRequest())
{
%>
                                            <div class="form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                    <button type="button" class="btn btn-primary">Cancel</button>
                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <button type="submit" id="CustRentPaymentBtn" class="btn btn-success">Submit</button>
                                                </div>
                                            </div>
<%}%>
                                        </form>
                                    </div>
                                    <div class="x_content">

                                    </div>
                                </div>
                            </div>




                        </div>





                    </div>
                </div>
            </div>
        </div>



        <!-- /page content -->

        <!-- footer content -->
        <%@ include file = "../comman_files/BranchFooter.jsp" %>
        <!-- /footer content -->



        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <script src="../production/js/jquery.formError.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- iCheck -->
        <script src="../vendors/iCheck/icheck.min.js"></script>
        <!-- Datatables -->
        <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
        <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
        <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
        <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
        <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
        <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
        <script src="../vendors/jszip/dist/jszip.min.js"></script>
        <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
        <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
    
   <%@ include file = "JavaScriptFile.jsp" %>
        <script type="text/javascript">

                function alpha(e) {
                    var k;
                    document.all ? k = e.keyCode : k = e.which;
                    return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8);
                }



        </script>

   
        <script type="text/javascript">
                $(document).ready(
                        function()
                        {
                        
                            $("#paymode").change(validate.controls.paymode);
                           
                         
                        

                            $("#CustRentPaymentBtn").click(
                                    function(event)
                                    {


                                        event.preventDefault();

                                        if (validate.all())
                                        {



                                            document.getElementById("CustRentPayment").submit();

                                        }
                                    });
                        });

                var validate =
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
                                        for (var controlValidationMethod in validate.controls)
                                        {

                                            if (!validate.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
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
                                       
                                       
                                        paymode:
                                                function()
                                                {

                                                    var $input = $(this);
                                                    var isValid = true;

                                                    if ($input.val() === "")
                                                    {
                                                        $input.formError("Please Select Payment Mode");
                                                        isValid = false;
                                                    }

                                                    else
                                                    {
                                                        // Valid, remove any existing form error message for this input
                                                        $input.formError({remove: true});
                                                    }

                                                    return isValid;
                                                }
                                     
                                    };

                            return {
                                "all": all,
                                "controls": controls};
                        })();






        </script>

        <style>
            .alert {
                padding: 20px;
                background-color: #f44336;
                color: white;
                opacity: 1;
                transition: opacity 0.6s;
                margin-bottom: 15px;
            }

            .alert.success {background-color: #4CAF50;}
            .alert.info {background-color: #2196F3;}
            .alert.warning {background-color: #ff9800;}

            .closebtn {
                margin-left: 15px;
                color: white;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }

            .closebtn:hover {
                color: black;
            }




            .validation{
                marging-top:100px;
            }



        </style>


      

        <script type="text/javascript">
                $(document).ready(function() {
                    $('.dataTables_length').hide();


                    $('.details').keyup(function() {

                        var extraDays = $('#extraDays').val();
                        var rentid = $('#rentid').val();
                        var other = $('#other').val();



                        $.get("AjaxPages/RentInstrumentPaymentFetch.jsp", {extraDays: extraDays, other: other, rentid: rentid}, function(data) {
                            //   alert('sucess');
                            $('#FetchAmount').html(data);

                        });

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

    </body>
</html>