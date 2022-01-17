<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
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
    <%    if (session.getAttribute("printInvoiceID") != null) {
            long celloId = (Long) session.getAttribute("printInvoiceID");
            session.removeAttribute("printInvoiceID");
    %>
    <script>
        window.open("Invoice_Rent.jsp?rentid=<%=celloId%>");

    </script>
    <%
        }


    %>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <!--            <div class="page-title">
                                      <div class="title_left">
                                        <h3>Form Wizards</h3>
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

                        <div class="row">

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <!--<h2>Admission Details <small></small></h2>-->
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <h4>Rent Details</h4>
                                        </div>

                                        <!--                    <ul class="nav navbar-right panel_toolbox">
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
                                                            </ul>-->
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">

                                        <form class="form-horizontal form-label-left"  action="../../BranchRent" onsubmit="return valid();" method="post">
                                            <%                                                String Name = "";
                                                String Contact = "";
                                                String Email = "";

                                                if (request.getParameter("asd") != null) {
                                                    int asd = Integer.parseInt(request.getParameter("asd"));

                                            %>
                                            <input type="hidden" name="inquiryid" value="<%=asd%>">
                                            <%
                                                Enquiry en = new Enquiry();
                                                en = new EnquiryDao().getEnquiryByID(asd);
                                                Name = en.getName();
                                                Contact = en.getMobile();
                                                Email = en.getEmail();

                                            } else {%>
                                            <input type="hidden" name="inquiryid" value="0">

                                            <%   }
                                                if (session.getAttribute("i") != null) {
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
                                            <!-- Smart Wizard -->
                                            <div id="wizard" class="form_wizard wizard_horizontal">
                                                <ul class="wizard_steps">
                                                    <li>
                                                        <a href="#step-1">
                                                            <span class="step_no">1</span>
                                                            <span class="step_descr">
                                                                Step 1<br />
                                                                <small>Details</small>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#step-2">
                                                            <span class="step_no">2</span>
                                                            <span class="step_descr">
                                                                Step 2<br />
                                                                <small>Personal Details</small>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#step-3">
                                                            <span class="step_no">3</span>
                                                            <span class="step_descr">
                                                                Step 3<br />
                                                                <small>Payment Details</small>
                                                            </span>
                                                        </a>
                                                    </li>

                                                </ul>

                                                <div id="step-1">

                                                    <div id="output">

                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="fname" name="fname" placeholder=" Name" onkeypress="return alpha(event)" value="<%=Name%>" class="form-control">
                                                                <center > <span id="name" style="color:red"></span></center >
                                                            </div>
                                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="contact" maxlength="10" name="contact" placeholder="Contact No." value="<%=Contact%>" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                                <center > <span id="contact1" style="color:red"></span></center >
                                                            </div>

                                                            <!--                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                                                                            <input type="email" id="email" name="email" placeholder="Email" value="<%=Email%>" class="form-control">
                                                                                                                        </div>-->

                                                        </div> 
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="customerAddress" name="customerAddress" placeholder="Customer Address"  class="form-control">
                                                            </div>



                                                        </div> 

                                                        <div class="row">


                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <select class="form-control" id="IdProofType" name="IdProofType" >
                                                                    <option value="">-Select ID Proof-</option> 

                                                                    <option value="Pan Card">Pan Card</option>
                                                                    <option value="Adhar Card">Adhar Card</option>
                                                                    <option value="Driving Licenece">Driving Licenece</option>


                                                                </select>
                                                            </div>
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="customerIdProof" name="customerIdProof" placeholder="customer Id Number"  class="form-control">
                                                            </div>
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <input type="text" id="Paymentmode" name="noOfDays" placeholder="No Of Days"  class="form-control">
                                                                <center > <span id="no_of_day" style="color:red"></span></center >
                                                            </div>
                                                        </div>
                                                        <div class="row">


                                                            <br>
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group"></div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <dl class="dropdown "> 

                                                                    <dt class="form-control">
                                                                    <a href="#">
                                                                        <span class="hida1">-Select Instrument List -</span>    
                                                                        <p class="multiSel1"></p>  
                                                                    </a>
                                                                    </dt>

                                                                    <dd>
                                                                        <div class="mutliSelect1 ">
                                                                            <ul>


                                                                                <%
                                                                                    List<Instrument> inst = new InstrumentDao().getAllInstrumene();

                                                                                    for (Instrument c : inst) {

                                                                                %>
                                                                                <li>
                                                                                    <input type="checkbox"  name="InstrumentName" value="<%=c.getInstrumentName()%>" /><%=c.getInstrumentName()%></li>


                                                                                <%                                                                               }

                                                                                %>


                                                                            </ul>
                                                                        </div>
                                                                    </dd>

                                                                </dl>   </div>

                                                        </div>



                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                    </div>
                                                </div>

                                                <div id="step-2">
                                                    <div class="row">
                                                        <div class="col-md-4"></div>
                                                        <div class="col-md-4">
                                                            <h3><b>FEES & PAYMENT</b></h3>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4"></div>
                                                        <div class="col-md-4">
                                                            <label >Security Deposite : </label>
                                                            <input type="text" class="form-control priceup row0"   id="adfee" name="adfee" placeholder="Enter Fee" required>
                                                        </div>
                                                        <div class="col-md-4"></div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4"></div>
                                                        <div class="col-md-4">
                                                            <h4><strong>Instrument FEES PAYMENT</strong></h4>
                                                        </div>
                                                    </div><br>
                                                    <input type="hidden" id="rowcount" name="rowcount" value="0">
                                                    <div class="row form-group" id="allfees0">
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename0" id="Coursename0" class="form-control priceup "   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control row0 priceup" value="0" name="CourseFee0" id="CourseFee0" placeholder="Instrument Fee" required>
                                                        </div>
                                                    </div><br>
                                                    <div class="row form-group" id="allfees1">
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename1" id="Coursename1" class="form-control priceup"   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control row0 row1 priceup"  value="0" name="CourseFee1" id="CourseFee1" placeholder="Instrument Fee" required>
                                                        </div>
                                                    </div><br>
                                                    <div class="row form-group" id="allfees2">
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename2" id="Coursename2" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control coursefee row0 priceup row2"  value="0" name="CourseFee2" id="CourseFee2" placeholder="Instrument Fee" required>
                                                        </div>
                                                    </div><br>
                                                    <div class="row form-group" id="allfees3">
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename3" id="Coursename3" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control row0 priceup row3"  value="0" name="CourseFee3" id="CourseFee3" placeholder="Instrument Fee" required>
                                                        </div>
                                                    </div><br>
                                                    <div class="row form-group" id="allfees4">
                                                        <div class="col-md-6" >
                                                            <input type="text"   name="Coursename4" id="Coursename4" class="form-control"   readonly>
                                                        </div>
                                                        <div class="col-md-6" >
                                                            <input type="text"   class="form-control priceup row0 row4"  value="0" name="CourseFee4" id="CourseFee4" placeholder="Instrument Fee" required>
                                                        </div>
                                                    </div><br>
                                                    <br>
                                                    </br>
                                                    <div class="row form-group" id="allfees">

                                                        <div class="col-md-4" id="cTotalFee">
                                                            <p><strong>Instrument Fee:</strong></p>
                                                            <input type="text" class="form-control" placeholder=""   name="coursetotalfee" id="coursetotalfee" value="0" readonly="readonly" required>
                                                        </div>
                                                        <div class="col-md-4" id="cTotalFee">
                                                            <p><strong>Security Deposite:</strong></p>
                                                            <input type="text" class="form-control" placeholder=""   name="admissonnfee" id="admissonnfee" value="0" readonly="readonly" required>
                                                        </div>
                                                        <div class="col-md-4" id="cTotalFee">
                                                            <p><strong>Total Fee:</strong></p>
                                                            <input type="text" class="form-control" placeholder=""   name="totalfee" id="totalfee" value="0" readonly="readonly" required>
                                                        </div>


                                                    </div>

                                                    <div class="row form-group" id="allfees">
                                                        <div class="col-md-4 remsinglefee" id="cFeeRem">
                                                            <p><strong>Discount in Percentage</strong></p>
                                                            <input type="text" placeholder="" name="discper" class="form-control priceup row0"  value="0"   id="discper"  required>
                                                        </div>
                                                        <div class="col-md-4 remsinglefee" id="cFeeRem">
                                                            <p><strong>Discount Amount</strong></p>
                                                            <input type="text" placeholder="" name="disamount" class="form-control" readonly="" value="0"   id="disamount"  required>
                                                        </div>
                                                        <div class="col-md-4 remsinglefee" id="cFeeRem">
                                                            <p><strong>Amount After Discount</strong></p>
                                                            <input type="text" placeholder="" name="finalamount" class="form-control" readonly="" value="0"  id="finalamount"  required>
                                                        </div>
                                                    </div>

                                                    <div class="row form-group" id="allfees">
                                                        <div class="col-md-4" id="cFeePaid">
                                                            <p><strong>Total Advanced Fee</strong></p>
                                                            <input type="text"  class="form-control priceup row0" style="background-color: antiquewhite" name="totaladvancedfee" id="totaladvancedfee" value="0"  placeholder=""  required>
                                                            <input type="hidden" onkeypress="return isNumberKey(event)" name="recadv" id="recadv">
                                                            <center > <span id="adva_paid" style="color:red"></span></center >
                                                        </div>

                                                        <div class="col-md-4 remsinglefee" id="cFeeRem">
                                                            <p><strong>Total Remaining Fee</strong></p>
                                                            <input type="text" placeholder="" name="totalremfee" style="background-color: aquamarine" class="form-control" value="0" onkeypress="return isNumberKey(event)" readonly="readonly" id="totalremfee"required>
                                                        </div>
                                                        <div class="col-md-4 ">
                                                            <p><strong>Due Date</strong></p>
                                                            <input type="text" id="datetimepicker4" required="" name="duedate0"  placeholder="Due Date" class="form-control">
                                                        </div>

                                                    </div>


                                                </div>

                                                <div id="step-3">
                                                    <div class="row form-group" >

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <select class="form-control" id="paymode" name="paymode">
                                                                <option value="">Select Payment Type</option>
                                                                <option value="Card">Card</option>
                                                                <option value="Cash">Cash</option>
                                                                <option value="Paytm">Paytm</option>
                                                                <option value="Net Banking">Net Banking</option>
                                                                <option value="Net Banking">Cheque</option>
                                                            </select>
                                                            <center > <span id="pay_mode" style="color:red"></span></center >
                                                        </div>
                                                        <div class="col-md-4 " >

                                                            <input type="text" placeholder="Cheque No/Transction No" name="chequeno" class="form-control"     id="chequeno"  required>
                                                        </div>
                                                        <div class="col-md-4 remsinglefee" id="cFeeRem">

                                                            <input type="text" placeholder="Bank Name" name="bankname" class="form-control"   id="bankname"  required>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                </div>

                                            </div>
                                            <input type="hidden" value="" placeholder="Bank Name" name="amountinword" class="form-control"   id="amountinword"  required>
                                            <!-- End SmartWizard Content -->
                                        </form>
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
            </div>
        </div>


        <!-- bootstrap-daterangepicker -->
        <script src="../vendors/moment/min/moment.min.js"></script>
        <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- jQuery Smart Wizard -->
        <script src="../vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
        <!-- Multiple Select Script -->
        <script src="../production/js/multipleselect.js" type="text/javascript"></script>
        <link href="../production/js/multiple_select.css" rel="stylesheet" type="text/css"/>
        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
        <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
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




            .dropdown {
                position: absolute;
                top:50%;
                transform: translateY(-50%);
            }

            a {
                color: #fff;
            }

            .dropdown dd,
            .dropdown dt {
                margin: 0px;
                padding: 0px;
            }

            .dropdown ul {
                margin: -1px 0 0 0;
            }

            .dropdown dd {
                position: relative;
            }

            .dropdown a,
            .dropdown a:visited {
                color: #000000;
                text-decoration: none;
                outline: none;
                font-size: 12px;
            }

            .dropdown dt a {
                background-color: #ccc;
                display: block;
                /*                padding: 8px 0px 5px 10px;*/
                min-height: 25px;
                line-height: 24px;
                overflow: hidden;
                border: 1;
                border-color: black;
                width: 100%;
            }

            .dropdown dt a span,
            .multiSel span {
                cursor: pointer;
                display: inline-block;
                padding: 0 3px 2px 0;
            }
            .multiSel1 span {
                cursor: pointer;
                display: inline-block;
                padding: 0 3px 2px 0;
            }

            .dropdown dd ul {
                background-color: #fff;
                border: 0;
                color: #000000;
                display: none;
                left: 0px;
                padding: 2px 0px 2px 5px;
                position: absolute;
                /*                top: 2px;*/
                width: 280px;
                list-style: none;
                height: 100px;
                overflow: auto;
            }

            .dropdown span.value {
                display: none;
            }

            .dropdown dd ul li a {
                padding: 5px;
                display: block;
            }
            /*            .dropdown
                        {
                            padding-top: 40px;
                        }*/


        </style>
        <script type="text/javascript">

                                                                function alpha(e) {
                                                                    var k;
                                                                    document.all ? k = e.keyCode : k = e.which;
                                                                    return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32);
                                                                }

                                                                function valid()
                                                                {

                                                                    var rollno = /^[0-9]*$/;
                                                                    // var phoneno = /^\d{10}$/;
                                                                    var letters = /^[A-Za-z]+$/;
                                                                    var name = document.getElementById('fname').value;
                                                                    var lname = document.getElementById('paymode').value;
                                                                    var contact = document.getElementById('contact').value.length;
                                                                    document.getElementById("name").innerHTML = "";
                                                                    document.getElementById("pay_mode").innerHTML = "";
                                                                    document.getElementById("contact1").innerHTML = "";
                                                                    var rowcount = document.getElementById('rowcount').value;
                                                                    var datetimepicker4 = document.getElementById('datetimepicker4').value;



                                                                    if (contact == 10)
                                                                    {
                                                                        if (lname == 0)
                                                                        {
                                                                            swal({
                                                                                title: 'Select Payment Type ',
                                                                                input: 'select',
                                                                                inputOptions: {
                                                                                    'Card': 'Card',
                                                                                    'Paytm': 'Paytm',
                                                                                    'Net Banking': 'Net Banking',
                                                                                    'Cheque': 'Cheque',
                                                                                    'Cash': 'Cash'
                                                                                },
                                                                                inputPlaceholder: 'Select Payment Type',
                                                                                showCancelButton: true, inputValidator: function(value) {
                                                                                    return new Promise(function(resolve, reject) {
                                                                                        if (value === 'Card' || value === 'Paytm' || value === 'Net Banking' || value === 'Cheque' || value === 'Cash')
                                                                                        {

                                                                                            $('#paymode').val(value);
                                                                                            resolve()
                                                                                        } else {
                                                                                            reject('You need to select Payment Type :)')
                                                                                        }
                                                                                    })
                                                                                }
                                                                            }).then(function(result) {
                                                                                swal({
                                                                                    type: 'success',
                                                                                    html: 'You selected: ' + result
                                                                                })
                                                                            })
                                                                            return false;

                                                                           
                                                                        }
                                                                        else
                                                                         {
                                                                            if (rowcount == 0)
                                                                            {
                                                                                swal({
                                                                                    title: 'These is not allowed.!',
                                                                                    html: $('<div>')
                                                                                            .addClass('some-class')
                                                                                            .text('Add Atleast One Instrument.....'),
                                                                                    animation: false,
                                                                                    customClass: 'animated tada'
                                                                                })
                                                                                return false;
                                                                            } else
                                                                            {
                                                                                if(datetimepicker4=="")
                                                                                {
                                                                                    swal({
                                                                                    title: 'These is not allowed.!',
                                                                                    html: $('<div>')
                                                                                            .addClass('some-class')
                                                                                            .text('Select Due Date.....'),
                                                                                    animation: false,
                                                                                    customClass: 'animated tada'
                                                                                })
                                                                                return false;
                                                                                }
                                                                                else
                                                                                {
                                                                                     return true;
                                                                                }
                                                                               
                                                                            }

                                                                        }
                                                                    }
                                                                    else
                                                                    {
                                                                        swal({
                                                                            title: 'Enter Correct Mobile No',
                                                                            input: 'number',
                                                                            showCancelButton: true,
                                                                            animation: false,
                                                                            inputValidator: function(value) {
                                                                                return new Promise(function(resolve, reject) {
                                                                                    if (value.length == 10)
                                                                                    {

                                                                                        $('#contact').val(value);

                                                                                        resolve()
                                                                                    } else {
                                                                                        reject('You need to Enter Mobile No :)')
                                                                                    }
                                                                                })
                                                                            }
                                                                        }).then(function(result) {
                                                                            swal({
                                                                                type: 'success',
                                                                                html: 'You Enter ' + result
                                                                            })
                                                                        })

                                                                        return false;
                                                                    }


                                                                }
        </script>
    </script><script src="../production/js/Swal.js" type="text/javascript"></script>
    <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript">
                                                                $('#document').ready(function() {
                                                                    $('.amounthide').hide();
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
                                                                    $('#datetimepicker8').datetimepicker({
                                                                        format: 'DD/MM/YYYY',
                                                                        viewMode: "years"
                                                                    });
                                                                    $('#datetimepicker9').datetimepicker({
                                                                        format: 'DD/MM/YYYY',
                                                                        viewMode: "years"
                                                                    });
                                                                    $('#allfees1').hide();
                                                                    $('#allfees2').hide();
                                                                    $('#allfees3').hide();
                                                                    $('#allfees4').hide();
                                                                    $('#allfees0').hide();


                                                                    $(".dropdown dt a").on('click', function() {
                                                                        $(".dropdown dd ul").slideToggle('fast');
                                                                    });

                                                                    $(".dropdown dd ul li a").on('click', function() {
                                                                        $(".dropdown dd ul").hide();
                                                                    });

                                                                    function getSelectedValue(id) {
                                                                        return $("#" + id).find("dt a span.value").html();
                                                                    }

                                                                    $(document).bind('click', function(e) {
                                                                        var $clicked = $(e.target);
                                                                        if (!$clicked.parents().hasClass("dropdown"))
                                                                            $(".dropdown dd ul").hide();
                                                                    });

                                                                    $('.mutliSelect input[type="checkbox"]').on('click', function() {

                                                                        var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
                                                                                title = $(this).val() + ",";

                                                                        if ($(this).is(':checked')) {
                                                                            var html = '<span title="' + title + '">' + title + '</span>';
                                                                            $('.multiSel').append(html);
                                                                            $(".hida").hide();
                                                                        } else {
                                                                            $('span[title="' + title + '"]').remove();
                                                                            var ret = $(".hida");
                                                                            $('.dropdown dt a').append(ret);

                                                                        }
                                                                    });
                                                                    $('.mutliSelect1 input[type="checkbox"]').on('click', function() {
                                                                        $('#allfees1').hide();
                                                                        $('#allfees2').hide();
                                                                        $('#allfees3').hide();
                                                                        $('#allfees4').hide();
                                                                        $('#allfees5').hide();
                                                                        var Paymentmode = $('#Paymentmode').val();
                                                                        document.getElementById("no_of_day").innerHTML = "";
                                                                        if (Paymentmode == "")
                                                                        {
                                                                            swal({
                                                                                title: 'Enter No of Days First',
                                                                                input: 'number',
                                                                                showCancelButton: true, inputValidator: function(value) {
                                                                                    return new Promise(function(resolve, reject) {
                                                                                        if (value != 0)
                                                                                        {
                                                                                            $('#Paymentmode').val(value);

                                                                                            resolve()
                                                                                        } else {
                                                                                            reject('You need to Enter No of Days :)')
                                                                                        }
                                                                                    })
                                                                                }
                                                                            }).then(function(result) {
                                                                                swal({
                                                                                    type: 'success',
                                                                                    html: 'You Enter ' + result
                                                                                })
                                                                            })


                                                                        }
                                                                        else
                                                                        {
                                                                            var title = $(this).closest('.mutliSelect1').find('input[type="checkbox"]').val(),
                                                                                    title = $(this).val() + ",";
                                                                            var rowcount = 0;
                                                                            if ($(this).is(':checked')) {
                                                                                var html = '<span title="' + title + '">' + title + '</span>';
                                                                                $('.multiSel1').append(html);
                                                                                $(".hida1").hide();

                                                                                var id_menu = $('.multiSel1').text();
                                                                                //                                                                            alert(id_menu);
                                                                                var ss = id_menu.split(",");
                                                                                var rowcount = 0;
                                                                                for (var i in ss) {
                                                                                    if (ss[i])
                                                                                    {
                                                                                        rowcount++;
//                                                                                alert(rowcount);
                                                                                        //                                                                                    alert(ss[i])
                                                                                        $("#allfees" + i).show();
                                                                                        $('#Coursename' + i).val(ss[i]);
                                                                                        //                                                                                 alert(rowcount);
                                                                                    }
                                                                                }
                                                                                $('#rowcount').val(rowcount);

                                                                            } else {
                                                                                $('span[title="' + title + '"]').remove();
                                                                                var ret = $(".hida1");
                                                                                $('.dropdown dt a').append(ret);



                                                                                var id_menu = $('.multiSel1').text();
                                                                                //                                                                            alert(id_menu);
                                                                                var ss = id_menu.split(",");
                                                                                var rowcount = 0;
                                                                                for (var i in ss) {
                                                                                    if (ss[i])
                                                                                    {
                                                                                        rowcount++;
//                                                                                alert(rowcount);
                                                                                        alert(ss[i])
                                                                                        $("#allfees" + i).show();
                                                                                        $('#Coursename' + i).val(ss[i]);
                                                                                        //                                                                                 alert(rowcount);
                                                                                    }
                                                                                }
                                                                                $('#rowcount').val(rowcount);
                                                                            }
                                                                        }
                                                                    });




                                                                    $('#paymode').change(function() {

                                                                        var paymode = $('#paymode').val();

                                                                        $('#chequeno').show();
                                                                        $('#bankname').show();
                                                                        if (paymode == "Cash")
                                                                        {
                                                                            $('#chequeno').hide();
                                                                            $('#bankname').hide();
                                                                        }
                                                                    });
                                                                    $('.row0').on('keyup change', function() {


                                                                        var adfee = $('#adfee').val();
                                                                        var Paymentmode = $('#Paymentmode').val();
                                                                        var discper = $('#discper').val();
                                                                        var totaladvancedfee = $('#totaladvancedfee').val();
                                                                        var rowcount = $('#rowcount').val();
                                                                        var totalcoursefee = 0;
                                                                        var i = 0;
                                                                        for (i = 0; i < rowcount; i++)
                                                                        {
                                                                            var cou = $('#CourseFee' + i).val();
                                                                            if (cou) {
                                                                                cou = parseInt(cou) * parseInt(Paymentmode);
                                                                                //                                                                                alert(cou);
                                                                                totalcoursefee = parseInt(totalcoursefee) + parseInt(cou);
                                                                            }
                                                                        }
                                                                        $('#coursetotalfee').val(totalcoursefee);
                                                                        //                                                                                alert(totalcoursefee);
                                                                        $('#admissonnfee').val(adfee);
                                                                        var totalfee = parseInt(adfee) + parseInt(totalcoursefee);
                                                                        $('#totalfee').val(totalfee);
                                                                        var discountamount = discper * totalcoursefee / 100;
                                                                        $('#disamount').val(discountamount);
                                                                        $('#finalamount').val(parseInt(totalfee) - parseInt(discountamount));

                                                                        document.getElementById("adva_paid").innerHTML = "";
                                                                        if ((parseInt(totalcoursefee) + parseInt(adfee) - parseInt(discountamount)) >= parseInt(totaladvancedfee))
                                                                        {
                                                                            $('#totalremfee').val(parseInt(totalcoursefee) + parseInt(adfee) - parseInt(discountamount) - parseInt(totaladvancedfee));
                                                                            $('#amountinword').val(converAmount(parseInt(totaladvancedfee)));
                                                                        } else
                                                                        {
                                                                            swal({
                                                                                title: 'Enter Correct Advanced Payment',
                                                                                html: $('<div>')
                                                                                        .addClass('some-class')
                                                                                ,
                                                                                animation: false,
                                                                                customClass: 'animated tada'
                                                                            })

                                                                            $('#totalremfee').val(0);
                                                                        }
                                                                    });
                                                                    $("#datetimepicker1").on("dp.change", function(e) {
                                                                        var year = new Date(e.date).getFullYear();
                                                                        var month = new Date(e.date).getMonth() + 1;
                                                                        var currentYear = new Date().getFullYear();
                                                                        var currentMonth = new Date().getMonth() + 1;
                                                                        var age = currentYear - year;
                                                                        if ((currentMonth - month) < 0)
                                                                            age--;
                                                                        $('#age').val(age);
                                                                    });
                                                                    $("#datetimepicker2").on("dp.change", function(e) {
                                                                        var duration = $('#duration').val();
                                                                        duration = parseInt(duration);
                                                                        var today = new Date(e.date);
                                                                        var currMonth = today.getMonth() + duration;
                                                                        var secondInstallmentDate = new Date(today.setMonth(currMonth));
                                                                        var month = secondInstallmentDate.getMonth() + 1;
                                                                        var year = new Date(secondInstallmentDate).getFullYear();
                                                                        var date5 = new Date(secondInstallmentDate).getDate();
                                                                        $('#DueDate').val(date5 + "/" + month + "/" + year);
                                                                    });
                                                                    $("#duration").on("change", function(e) {
                                                                        var duration = $('#duration').val();
                                                                        duration = parseInt(duration);
                                                                        var today = new Date(e.date);
                                                                        //                                                                        alert(e.date);
                                                                        if (e.date != null)
                                                                        {
                                                                            var currMonth = today.getMonth() + duration;
                                                                            var secondInstallmentDate = new Date(today.setMonth(currMonth));
                                                                            var month = secondInstallmentDate.getMonth() + 1;
                                                                            var year = new Date(secondInstallmentDate).getFullYear();
                                                                            var date5 = new Date(secondInstallmentDate).getDate();
                                                                            $('#DueDate').val(date5 + "/" + month + "/" + year);
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

                                                                            if (places == 6) {
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


                                                                });</script>


    <script type="text/javascript">
        $(document).ready(function() {
            // alert('fsdfsdf');
            $('#mob_email').blur(function() {

                var studEmail = $('#mob_email').val();
                $.get("StudentEnquiryAjax.jsp", {studEmail: studEmail}, function(data) {
                    //   alert('sucess');
                    $('#output').html(data);
                });
            });
//                $('#coursename').change(function() {
//                    $('#allfees1').hide();
//                    $('#allfees2').hide();
//                    $('#allfees3').hide();
//                    $('#allfees4').hide();
//                    var id_menu = $(this).val().join();
//                    var ss = id_menu.split(",");
//                    var rowcount = 0;
//                    $('#allfees0').hide();
//                    var id_menu = $(this).val().join();
//                    var ss = id_menu.split(",");
//                    var rowcount = 0;
//                    for (var i in ss) {
//                        rowcount++;
//                        //                    alert(ss[i])
            //                        $("#allfees" + i).show();
            //                        $('#Coursename' + i).val(ss[i]);
//                    }
            //                    $('#rowcount').val(rowcount);
//                });
            function isNumberKey(evt) {

                var charCode = (evt.which) ? evt.which : evt.keyCode
                if (charCode != 46 && charCode > 31
                        && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }

        });
    </script>

</body>
</html>