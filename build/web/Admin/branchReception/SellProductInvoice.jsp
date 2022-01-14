
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.accede.angel.sell.model.CustomerSaleDetails"%>
<%@page import="com.accede.angel.sell.dao.CustomerSaleDAO"%>
<%@page import="com.accede.angel.sell.model.CustomerSale"%>
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

        int id = Integer.parseInt(request.getParameter("sellid"));
//        long id = 4;
        CustomerSale ad = new CustomerSaleDAO().getpurchaseByID(id);
     
           
           
           


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
                                                <br> <span style="color:#0275BA;">  <%=ad.getAdmin().getAdminOfBranch().getBranchAddress()%>&nbsp;<%=ad.getAdmin().getAdminOfBranch().getBranchAddress1()%></span> 

                                                <br> <span style="color:#0275BA;"><%=ad.getAdmin().getAdminOfBranch().getBranchAddress2()%>.E-Mail:-<%=ad.getAdmin().getAdminEmail()%></span> 
                                                <br> <span style="color:#0275BA;">Contact:- 9049976912/9762465737 &nbsp;&nbsp;GST:-27AINPD8826EIZ4</span> 




                                            </div>



                                        </div>

                                    </div>



                                    <div class="ln_solid"></div>
                                    <div class="row">
                                        <div class="col-xs-12 " >



                                            <div class="col-xs-10 " >

                                                <div class="row"><strong>Sell No:<%=ad.getId()%></strong></div>
                                                <div class="row"><strong>Name:<%=ad.getCustomername()%></strong></div>
                                                <div class="row"><strong>Mobile No:<%=ad.getMobilenumber()%></strong></div>






                                            </div>
                                            <div class="col-xs-2  "  style="float: right">

<%
                                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");

                                                    String date = DATE_FORMAT.format(ad.getDate());
                                                %>
                                                <div class="row"><strong>Date :<%=date%></strong></div>
                                                <div class="row"><strong>Invoice No:<%=ad.getId() %></strong></div>
                                                


                                            </div>

                                        </div>
                                    </div>
                                    <br>



                                    <div class="row">
                                        <table id="datatable-buttons"  class="table table-striped table-bordered tablesize">
                                            <thead>
                                                <tr>
                                                    <th class="table_center " style="width:100px;text-align: center"> No</th>
                                                    <th class="table_center " > Barcode</th>
                                                    <th class="table_center " > Category</th>
                                                    <th class="table_center " > Sub Category</th>
                                                     <th class="table_center" >Brand</th>
                                                    <th class="table_center" >Model No</th>
                                                   
                                                    <th class="table_center" >Color</th>
                                                    <th class="table_center" >Quantity</th>
                                                    <th class="table_center" >MRP</th>
                                                    <th class="table_center" >Net Amount</th>

                                                </tr>
                                            </thead>
                                            <tbody>

                                              <%
                                              int i=0;
                                              for(CustomerSaleDetails c:ad.getCustomerSaleDetails() )
                                              {
                                                  i++;
                                              
                                              %>


                                                <tr>
                                                    <td class="table_center" style="text-align: center"><%=i%></td>
                                                    <td class="table_center" style="text-align: center"><%=c.getProduct().getBarcode().getBarcode()%></td>
                                                    <td class="table_center" style="text-align: center"><%=c.getProduct().getCategory().getCategory()%></td>
                                                    <td class="table_center" style="text-align: center"><%=c.getProduct().getSubCategory().getSubCategory()%></td>
                                                               <td class="table_center" style="text-align: center"><%=c.getProduct().getBrand().getBrand()%></td>
                                                    <td class="table_center" style="text-align: center"><%=c.getProduct().getModel().getModelName()%></td>
                                       
                                                    <td class="table_center" style="text-align: center"><%=c.getProduct().getColorModel().getColorName()%></td>
                                                    <td class="table_center" style="text-align: center"><%=c.getProductquantity() %></td>
                                                    <td class="table_center" style="text-align: center"><%=c.getMrpprice() %></td>
                                                    <td class="table_center" style="text-align: center"><%=c.getGross_amount() %></td>
                                                  



                                                </tr> 
                                                <%     }

                                                %>
                                        
                                             
                                               
                                                <%
                                                    if (ad.getDiscount_amount() > 0) {
                                                %>
                                                <tr>
                                                    <td class="table_center" colspan="6"></td>
                                                   
                                                    <td class="table_center" colspan="2">Discount</td>  
                                                    <td class="table_center" style="text-align: center"><%=ad.getDiscount_amount()%></td> 
                                                </tr> 
                                                <%}%>
                                                 
                                                <%
                                                    if (ad.getOther_charges()> 0) {
                                                %>
                                                <tr>
                                                    <th class="table_center" colspan="6"  ></th>
                                                  
                                                    <th class="table_center"  style="text-align: center"  colspan="2"><span  >Other Charges</span></th>

                                                    <td class="table_center" style="text-align: center"><%=ad.getOther_charges()%></td>



                                                </tr>
                                                <%}%>
                          
                                              <tr>
                                                    <th class="table_center"  colspan="7" ></th>
                                      
                                                    <th class="table_center"  style="text-align: center"  colspan="2"><span  >Gross Amount</span></th>

                                                    <td class="table_center" style="text-align: center"><%=ad.getGrosstotal()%></td>



                                                </tr>
                                                
                                                
                                                <tr>
                                                    <th class="table_center"  colspan="7" ></th>
                                      
                                                    <th class="table_center"  style="text-align: center"  colspan="2"><span  >Paid Amount</span></th>

                                                    <td class="table_center" style="text-align: center"><%=ad.getPaidamt()%></td>



                                                </tr>
                                                 <%
                                                    if (ad.getBalamt()> 0) {
                                                %>
                                              <tr>
                                                    <th class="table_center"  colspan="7" ></th>
                                      
                                                    <th class="table_center"  style="text-align: center"  colspan="2"><span  >Balance Amount</span></th>

                                                    <td class="table_center" style="text-align: center"><%=ad.getBalamt()%></td>



                                                </tr>
<%}%>

                                            </tbody>

                                        </table>

                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 " >
                                            <div class="col-xs-8 " >
                                                <div class="row"><strong>Total Amount in words:-Rs <%=ad.getAmount_inword()%> only&nbsp;</strong></div>
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