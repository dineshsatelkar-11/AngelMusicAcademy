
<%@page import="java.text.SimpleDateFormat"%>
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
        long invoiceid = 0;

        Rent ad = new RentDao().getRentByID(id);


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
                                                    <strong>  <%=ad.getAdminOfBranch().getAdminOfBranch().getBranchName().toUpperCase()%></strong>

                                                </h1>
                                                <h4  style=""></h4>


                                                <span style="color:#0275BA;"> ALL MUSICAL  INSTRUMENT,</span>    
                                                <br> <span style="color:#0275BA;"> BAND, ACCESSORIES , SALES , SERVICE & CLASSES</span> 
                                                <br> <span style="color:#0275BA;">  <%=ad.getAdminOfBranch().getAdminOfBranch().getBranchAddress()%>&nbsp;<%=ad.getAdminOfBranch().getAdminOfBranch().getBranchAddress1()%></span> 

                                                <br> <span style="color:#0275BA;"><%=ad.getAdminOfBranch().getAdminOfBranch().getBranchAddress2()%>.E-Mail:-<%=ad.getAdminOfBranch().getAdminEmail()%></span> 
                                                <br> <span style="color:#0275BA;">Contact:- <%=ad.getAdminOfBranch().getAdminOfBranch().getAdminMobileNo()%> &nbsp;&nbsp;GST:-<%=ad.getAdminOfBranch().getAdminOfBranch().getGstNo().toUpperCase()%></span> 




                                            </div>



                                        </div>

                                    </div>



                                    <div class="ln_solid"></div>
                                    <div class="row">
                                        <div class="col-xs-12 " >



                                            <div class="col-xs-10 " >

                                                <div class="row"><strong>Rent No:<%=ad.getRentNo()%></strong></div>
                                                <div class="row"><strong>Name:<%=ad.getCustomerAccount().getName()%></strong></div>
                                                <div class="row"><strong>Mobile No:<%=ad.getCustomerAccount().getMobileNo()%></strong></div>






                                            </div>
                                            <div class="col-xs-2  "  style="float: right">

                                                <%
                                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");

                                                    String date = DATE_FORMAT.format(ad.getFromDate());
                                                %>
                                                <div class="row"><strong>Date :<%=date%></strong></div>
                                                <div class="row"><strong>Invoice No:<%=ad.getRentNo()%></strong></div>
                                                <div class="row"><strong>No of Days:<%=ad.getNoOfDays()%></strong></div>


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
                                                    <th class="table_center" style="width:120px;text-align: center">No of Days</th>

                                                    <%
                                                        if (ad.getExtraDays() > 0) {

                                                    %>
                                                    <th class="table_center" style="width:120px;text-align: center">Extra Days</th>
                                                        <%}%>
                                                    <th class="table_center" style="width:120px;text-align: center">Amount</th>

                                                </tr>
                                            </thead>
                                            <tbody>






                                                <%
                                                    int i = 0;
                                                    for (RentDetails RentDetails : ad.getRentDetails()) {
                                                        i++;
                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=i%></td>
                                                    <td class="table_center" style="text-align: center"><%=RentDetails.getInstrumentName()%></td>
                                                    <td class="table_center" style="text-align: center"><%=RentDetails.getInstrumentRentCost()%></td>  
                                                    <td class="table_center" style="text-align: center"><%=RentDetails.getNoofdays()%></td>

                                                    <%
                                                        if (ad.getExtraDays() > 0) {

                                                    %> 
                                                    <td class="table_center" style="text-align: center"><%=ad.getExtraDays()%></td> 
                                                    <%}%>

                                                    <td class="table_center" style="text-align: center"><%=RentDetails.getInstrumentRentCost() * (ad.getExtraDays() + RentDetails.getNoofdays())%></td> 
                                                </tr> 
                                                <%}%>
                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=++i%></td> 
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"   ></th>
                                                        <%
                                                            if (ad.getExtraDays() > 0) {

                                                        %> 
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <%}%>
                                                    <th class="table_center"  style="text-align: center"  ><span  >Total</span></th>

                                                    <td class="table_center" style="text-align: center"><%=ad.getTotalamt()%></td>



                                                </tr>
                                                <%
                                                    if (ad.getOther() > 0) {

                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=++i%></td> 
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <%
                                                        if (ad.getExtraDays() > 0) {

                                                    %> 
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <%}%>

                                                    <th class="table_center" style="text-align: center"><span  >Other Charges</span  ></th>

                                                    <td class="table_center" style="text-align: center"><%=ad.getDiscamt()%></td> 
                                                </tr> 
                                                <%}%>
                                                <%
                                                    if (ad.getDiscamt() > 0) {

                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=++i%></td> 
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <%
                                                        if (ad.getExtraDays() > 0) {

                                                    %> 
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <%}%>
                                                    <td class="table_center" style="text-align: center">Discount</td>

                                                    <td class="table_center" style="text-align: center"><%=ad.getDiscamt()%></td> 
                                                </tr> 
                                                <%}%>
                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=++i%></td> 
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"   ></th>
                                                        <%
                                                            if (ad.getExtraDays() > 0) {

                                                        %> 
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <%}%>
                                                    <th class="table_center"  style="text-align: center"  ><span  >Final Amount</span></th>

                                                    <td class="table_center" style="text-align: center"><%=ad.getFinalAmount()%></td>



                                                </tr>

                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=++i%></td> 
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"   ></th>
                                                        <%
                                                            if (ad.getExtraDays() > 0) {

                                                        %> 
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <%}%>
                                                    <th class="table_center"  style="text-align: center"  ><span  >Paid</span></th>

                                                    <td class="table_center" style="text-align: center"><%=ad.getSecurityDeposite()%></td>



                                                </tr>
                                                <%
                                                    if (ad.getPaid_ByCust() > 0) {

                                                %> 
                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=++i%></td> 
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"   ></th>
                                                        <%
                                                            if (ad.getExtraDays() > 0) {

                                                        %> 
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <%}%>
                                                    <th class="table_center"  style="text-align: center"  ><span  >Remaining Balance</span></th>

                                                    <td class="table_center" style="text-align: center"><%=ad.getPaid_ByCust()%></td>



                                                </tr>
                                                <%}%>
                                                <%
                                                    if (ad.getReturn_by_Shop() > 0) {
                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=++i%></td>   <td class="table_center" style="text-align: center"></td>
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <%
                                                        if (ad.getExtraDays() > 0) {

                                                    %> 
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <%}%>
                                                    <th class="table_center"  style="text-align: center"  ><span  >Return Amount</span></th>

                                                    <td class="table_center" style="text-align: center"><%=ad.getReturn_by_Shop()%></td> 
                                                </tr> 
                                                <%}%>


                                            </tbody>

                                        </table>

                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 " >
                                            <div class="col-xs-8 " >
                                                <div class="row"
                                                     ><strong>

                                                    </strong></div>
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

</html>