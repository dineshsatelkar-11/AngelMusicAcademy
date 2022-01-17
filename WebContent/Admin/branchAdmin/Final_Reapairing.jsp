
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.accede.angel.admin.model.RepairDetails"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
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

        long id = Long.parseLong(request.getParameter("repairing_id"));

//        long id = 4;
        Repair ad = new RepairDao().getRepairByID(id);


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

                                                <div class="row"><strong>Repair No:<%=ad.getRepairNo()%></strong></div>
                                                <div class="row"><strong>Name:<%=ad.getCustomerAccount().getName()%></strong></div>
                                                <div class="row"><strong>Mobile No:<%=ad.getCustomerAccount().getMobileNo()%></strong></div>






                                            </div>
                                            <div class="col-xs-2  "  style="float: right">


                                                <%

                                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
                                                    String date = DATE_FORMAT.format(ad.getFromDate());
                                                    String date1 = DATE_FORMAT.format(ad.getReceivedDate());


                                                %>
                                                <div class="row"><strong>Date :<%=date%></strong></div>
                                                <div class="row"><strong>Invoice No:<%=ad.getRepairId()%></strong></div>



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

                                                    <th class="table_center" style="width:120px;text-align: center">Amount</th>

                                                </tr>
                                            </thead>
                                            <tbody>




                                                <%
                                                    int i = 0;
                                                    for (RepairDetails repairdetails : ad.getRepairDetails()) {
                                                        i++;
                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=i%></td>
                                                    <td class="table_center" style="text-align: center">Instrument Name :-<%=repairdetails.getInstrumentName()%>
                                                        <br>
                                                        <%
                                                            if (repairdetails.getInstrumentBrand() != "") {%>
                                                        Brand-<%=repairdetails.getInstrumentBrand()%> <br>
                                                        <%}%>
                                                        <%
                                                            if (repairdetails.getInstrumentModel() != null) {%>                                                  
                                                        Model:-<%=repairdetails.getInstrumentModel()%> <br>
                                                        <%}%>
                                                        <%
                                                            if (repairdetails.getInstrumentRemark() != null) {%>
                                                        Remark:-<%=repairdetails.getInstrumentRemark()%>
                                                        <%}%>
                                                    </td>

                                                    <td class="table_center" style="text-align: center"><%=repairdetails.getInstrumentRepairCost()%></td>

                                                </tr> 
                                                <%}%>

                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=++i%></td>
                                                    <td class="table_center" style="text-align:right;">Total</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getTotalamt()%></td> 
                                                </tr> 

                                                <%
                                                    if (ad.getDiscamt() > 0) {

                                                %>

                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=++i%></td>
                                                    <td class="table_center" style="text-align:right;">Discount Amount</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getDiscamt()%></td> 
                                                </tr> 
                                                <%}%>
                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=++i%></td>
                                                    <td class="table_center" style="text-align:right;">Final Amount</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getFinalAmount()%></td> 
                                                </tr> 
                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=++i%></td>
                                                    <td class="table_center" style="text-align:right;">Paid Amount</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getPaid()%></td> 
                                                </tr>
                                                <%
                                                    if (ad.getBal() > 0) {

                                                %>

                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=++i%></td>
                                                    <td class="table_center" style="text-align:right;">Balance Amount</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getBal()%></td> 
                                                </tr> 
                                                <%}%>




                                            </tbody>

                                        </table>

                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 " >
                                            <div class="col-xs-8 " >
                                                <div class="row"><strong>
                                                        <!--Total Amount in words:-Rs--> 

                                                    </strong></div>
                                            </div>
                                            <div class="col-xs-4" style="text-align: center" ><strong>For</strong></div>
                                        </div>  <div class="col-xs-12 " >
                                            <div class="col-xs-8 " >
                                                <div class="row"><strong>Note:No Guaranty of the Instrument at time of Repairing.</strong></div>
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