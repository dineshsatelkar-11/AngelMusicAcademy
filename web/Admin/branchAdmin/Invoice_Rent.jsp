
<%@page import="com.accede.angel.admin.model.RentDetails"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.model.StudentAccount"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style type="text/css" media="print">
            @page {
                size: auto;   /* auto is the initial value */
                margin-top:  0;

                margin-bottom:   0;
            }
        </style> 
        <title>Tax Invoice </title>

        <!-- Bootstrap -->
        <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">

        <!-- Custom styling plus plugins -->
        <link href="../build/css/custom.min.css" rel="stylesheet">

    </head>


    <%

        long id = Long.parseLong(request.getParameter("rentid"));
//        long id = 4;
        Rent ad = new RentDao().getRentByID(id);
        if (ad != null) {
            int admissionfee = ad.getSecurityDeposite();
            String amountinWord = "";
            String bankname = "";
            String PaymentMode = "";
            String chequeno = "";

            int coursetotalfee = 0;
            int disamount = 0;
            int discper = 0;
            int finalamount = 0;
            int totaladvancedfee = 0;
            int totalfee = 0;
            int totalremfee = 0;
            int course = 0;
            int previousBalance = 0;
            long billno = 0;
            int noofdays = 0;
            Date admissiondate = new Date();
            String amountinword = "";
            for (RentDetails a : ad.getRentDetails()) {

                amountinWord = a.getAmountinWord();
                bankname = a.getBankname();
                PaymentMode = a.getPaymentMode();
                chequeno = a.getChequeno();

                coursetotalfee = a.getInstrumenttotalfee();
                disamount = a.getDisamount();
                discper = a.getDiscper();
                finalamount = a.getFinalamount();
                totaladvancedfee = a.getTotaladvancedfee();
                noofdays = a.getNoofdays();
                totalremfee = a.getTotalremfee();
                course = a.getNoofinstument();
                previousBalance = a.getPreviousBalance();
                billno = a.getAccountId();
                admissiondate = a.getPaymentDate();
                amountinword = a.getAmountinWord();
                break;
            }


    %>
    <body onload="window.print();" >




        <div class="right_col " role="main">
            <div class="">





                <div >
                    <div class="col-md-12">
                        <div class="x_panel">

                            <div class="x_content">

                                <section class="content invoice">
                                    <!-- title row -->



                                    <div class="row" >
                                        <div class="col-xs-12 invoice-header">  
                                            <div class="col-xs-5 invoice-header">

                                                <img src="../production/images/angle-music-logo.png"   alt=""/>
                                            </div>


                                            <div class="col-xs-7 invoice-header"  >
                                                <h1 style="color:red; ">
                                                    <strong>  ANGEL MUSIC</strong>

                                                </h1>
                                                <h4  style=""></h4>


                                                <span style="color:#0275BA;"> ALL MUSICAL  INSTRUMENT,</span>    
                                                <br> <span style="color:#0275BA;"> BAND, ACCESSORIES , SALES , SERVICE & CLASSES</span> 
                                                <br> <span style="color:#0275BA;">  <%=ad.getAdminOfBranch().getAdminOfBranch().getBranchAddress()%>&nbsp;<%=ad.getAdminOfBranch().getAdminOfBranch().getBranchAddress1()%></span> 

                                                <br> <span style="color:#0275BA;"><%=ad.getAdminOfBranch().getAdminOfBranch().getBranchAddress2()%>.E-Mail:-<%=ad.getAdminOfBranch().getAdminEmail()%></span> 
                                                <br> <span style="color:#0275BA;">Contact:- 9049976912/9762465737 &nbsp;&nbsp;GST:-27AINPD8826EIZ4</span> 




                                            </div>



                                        </div>

                                    </div>



                                    <div class="ln_solid"></div>
                                    <div class="row">
                                        <div class="col-xs-12 " >



                                            <div class="col-xs-10 " >

                                                <div class="row"><strong>Rent No:<%=ad.getRentNo()%></strong></div>
                                                <div class="row"><strong>Name:<%=ad.getCustomerFirstName()%></strong></div>
                                                <div class="row"><strong>Mobile No:<%=ad.getCustomerMobileNo()%></strong></div>






                                            </div>
                                            <div class="col-xs-2  "  style="float: right">


                                                <div class="row"><strong>Date :<%=admissiondate%></strong></div>
                                                <div class="row"><strong>Invoice No:<%=billno%></strong></div>
                                                <div class="row"><strong>No of Days:<%=noofdays%></strong></div>


                                            </div>

                                        </div>
                                    </div>
                                    <br>



                                    <div class="row">
                                        <table id="datatable-buttons"  class="table table-striped table-bordered tablesize">
                                            <thead>
                                                <tr>
                                                    <th class="table_center " style="width:100px;text-align: center"> No</th>
                                                    <th class="table_center" style="width:700px;text-align: center">Particular</th>
                                                    <th class="table_center" style="width:120px;text-align: center">Fee</th>
                                                    <th class="table_center" style="width:120px;text-align: center">Amount</th>

                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%
                                                    String coursename1 = ad.getInstrumentName1();
                                                    String coursename2 = ad.getInstrumentName2();
                                                    String coursename3 = ad.getInstrumentName3();
                                                    String coursename4 = ad.getInstrumentName4();
                                                    String coursename5 = ad.getInstrumentName5();
                                                    int noofcoursee = ad.getNoofinstrument();
                                                    int q = noofcoursee + 2;
                                                %>


                                                <tr>
                                                    <td class="table_center" style="text-align: center">1</td>
                                                    <td class="table_center" style="text-align: center">Security Deposit</td>
                                                    <td class="table_center" style="text-align: center"><%=admissionfee%></td>  
                                                    <!--                                                    <td class="table_center"></td>  -->
                                                    <td class="table_center" style="text-align: center"><%=admissionfee%></td> 




                                                </tr> 
                                                <%      if (ad.getNoofinstrument() >= 1) {

                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center">2</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentName1()%></td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentFee1()%></td>  
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentFee1() * noofdays%></td> 
                                                </tr> 
                                                <%     }
                                                    if (ad.getNoofinstrument() >= 2) {

                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center">3</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentName2()%></td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentFee2()%></td>  
                                                    <td class="table_center"style="text-align: center"><%=ad.getInstrumentFee2() * noofdays%></td> 
                                                </tr> 
                                                <%     }
                                                    if (ad.getNoofinstrument() >= 3) {

                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center">4</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentName3()%></td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentFee3()%></td>  
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentFee3() * noofdays%></td> 
                                                </tr> 
                                                <%     }
                                                    if (ad.getNoofinstrument() >= 4) {

                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center">5</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentName4()%></td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentFee4()%></td>  
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentFee4() * noofdays%></td> 
                                                </tr> 
                                                <%     }
                                                    if (ad.getNoofinstrument() >= 5) {

                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center">5</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentName5()%></td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentFee5()%></td>  
                                                    <td class="table_center" style="text-align: center"><%=ad.getInstrumentFee5() * noofdays%></td> 
                                                </tr> 
                                                <%}%>
                                                <%
                                                    if (disamount > 0) {
                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center">q</td>
                                                    <td class="table_center" style="text-align: center">Discount</td>
                                                    <td class="table_center" style="text-align: center"><%=disamount%></td>  
                                                    <td class="table_center" style="text-align: center"><%=disamount%></td> 
                                                </tr> 
                                                <%}%>
                                                <tr>
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"  style="text-align: center"  ><span  >Total</span></th>

                                                    <td class="table_center" style="text-align: center"><%=finalamount%></td>



                                                </tr>
                                                <tr>
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"  style="text-align: center"  ><span  >Paid</span></th>

                                                    <td class="table_center" style="text-align: center"><%=totaladvancedfee%></td>



                                                </tr>
                                                <!--                                                <tr>
                                                                                                    <th class="table_center" colspan="2" >Total Amount in words:-&nbsp;Rs only</th>
                                                                                                    <th class="table_center"  >Discount Amount </th>
                                                                                                    <td class="table_center" colspan="1"><%=disamount%></td>
                                                
                                                
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th class="table_center" colspan="2" ></th>
                                                                                                    <th class="table_center"  >Total Amount After Discount  </th>
                                                                                                    <td class="table_center" ><%=finalamount%></td>
                                                
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th class="table_center" colspan="2" ></th>
                                                                                                    <th class="table_center"  >Paid Amount  </th>
                                                                                                    <td class="table_center" ><%=totaladvancedfee%></td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th class="table_center" colspan="2" ></th>
                                                                                                    <th class="table_center"  >Balance Amount  </th>
                                                                                                    <td class="table_center" ><%=totalremfee%></td>
                                                                                                </tr>
                                                
                                                                                                <tr>
                                                                                                    <th class="table_center" colspan="3" ><span style="text-align: center">Bank Details</span></th>
                                                
                                                                                                    <th class="table_center"  ><span style="text-align: center;font-size: 10px; ">Ceritified that the particulars given above are true and correct</span></th>
                                                
                                                
                                                
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th class="table_center" colspan="2" >Bank A/C:50200025250642</th>
                                                                                                    <th class="table_center"  >GSTIN No:27AINPD8826EIZ4</th>
                                                
                                                                                                    <th class="table_center"  >For Angel Music</th>
                                                
                                                
                                                
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th class="table_center" colspan="2" >Bank IFSC: HDFC0001791 </th>
                                                                                                    <th class="table_center"  >Pan No:</th>
                                                                                                    <th class="table_center"  ></th>
                                                
                                                
                                                
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th class="table_center" colspan="3" >Terms & conditions:<span style="text-align: center;font-size: 10px; "> 1)Fees will not be refundable.</span><span style="text-align: center;font-size: 10px; ">2)Fees will not be Carry Forward Any Reason.</span></th>
                                                
                                                
                                                                                                    <th class="table_center"  >Authorized signatory:</th>
                                                
                                                
                                                
                                                                                                </tr>-->



                                            </tbody>

                                        </table>

                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 " >
                                            <div class="col-xs-8 " >
                                                <div class="row"><strong>Total Amount in words:-Rs <%=amountinword%>&nbsp;</strong></div>
                                            </div>
                                            <div class="col-xs-4" style="text-align: center" ><strong>For</strong></div>
                                        </div>  <div class="col-xs-12 " >
                                            <div class="col-xs-8 " >
                                                <div class="row"><strong>Note:If any Instrument get damaged then customer have to pay for the damage</strong></div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 " >
                                            <div class="col-xs-8 " >
                                                <!--<div class="row"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fees will not Carry forward for Next Month. </strong></div>-->
                                            </div>
                                            <div class="col-xs-4" style="text-align: center" ><strong>Angel Music</strong></div>
                                        </div>
                                    </div>
                            </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /page content -->





    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>

</body>
<%}%>
</html>