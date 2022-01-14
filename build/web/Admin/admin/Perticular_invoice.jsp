
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="com.accede.angel.admin.model.PackageCourse"%>
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

        long id = Long.parseLong(request.getParameter("admissionid"));
        long invoiceid = Long.parseLong(request.getParameter("invoiceid"));
//        long id = 4;
        
        Admission ad = new AdmissionDao().getAdmissionByID(id);
        PackageCourse PackageCourse=ad.getPackageCourse();
        StudentAccount StudentAccount=new AdmissionDao().getStudentAccountByid(invoiceid);
   
          System.out.println("=======================");
          System.out.println("======================="+StudentAccount);
           
          System.out.println("=======================");

    %>
    <body  >




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

                                                <div class="row"><strong>Admission No:<%=ad.getAdmissionNo()%></strong></div>
                                                <div class="row"><strong>Name:<%=ad.getFirstName()%>&nbsp</strong></div>
                                                <div class="row"><strong>Mobile No:<%=ad.getContactNo()%></strong></div>






                                            </div>
                                            <div class="col-xs-2  "  style="float: right">

<%

SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
        String date = DATE_FORMAT.format(StudentAccount.getNextPaymentDate());
        String date1 = DATE_FORMAT.format(ad.getAdmissionDate() );
       

%>
                                                <div class="row"><strong>Date :<%=date1%></strong></div>
                                                <div class="row"><strong>Invoice No:<%=invoiceid%></strong></div>
                                                <div class="row"><strong>Due Date:<%=date%></strong></div>

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

if(StudentAccount.getFeeType().equals("Admission"))
{

%>
                                               <tr>
                                                    <td class="table_center" style="text-align: center">1</td>
                                                    <td class="table_center" style="text-align: center">
                                                  Admission Fee
                                                   </td>
                                                   
                                                    <td class="table_center" style="text-align: center"><%=ad.getAdmissionFee()%></td> 
                                                </tr> 
                                                <tr>
                                                    <td class="table_center" style="text-align: center">2</td>
                                                    <td class="table_center" style="text-align: center">Package :-<%=StudentAccount.getPackagename()%>
                                                    <br>Courses:-<%=StudentAccount.getCourseName()%> <br>
                                                
                                                    Days:-<%=StudentAccount.getDays()%> <br>
                                                    Batch Timing:-<%=StudentAccount.getBatches()%></td>
                                                   
                                                    <td class="table_center" style="text-align: center"><%=StudentAccount.getPackageFee()%></td> 
                                                </tr> 
                                                <%}else if(StudentAccount.getFeeType().equals("Monthly Payment")){%>
                                               
                                               <tr>
                                                    <td class="table_center" style="text-align: center">1</td>
                                                    <td class="table_center" style="text-align: center">Package :-<%=StudentAccount.getPackagename()%>
                                                    <br>Courses:-<%=StudentAccount.getCourseName()%> <br>
                                                
                                                    Days:-<%=StudentAccount.getDays()%> <br>
                                                    Batch Timing:-<%=StudentAccount.getBatches()%></td>
                                                   
                                                    <td class="table_center" style="text-align: center"><%=StudentAccount.getPackageFee()%></td> 
                                                </tr> 
                                                
                                                
                                                <%}else{%>
                                                  <tr>
                                                    <td class="table_center" style="text-align: center">1</td>
                                                    <td class="table_center" style="text-align: center">Previous Balance</td>
                                                   
                                                    <td class="table_center" style="text-align: center"><%=StudentAccount.getPreviousBalance()%></td> 
                                                </tr>
                                                
                                                <%}%>
                                                
                                              <%
                                              if(StudentAccount.getDisamount() > 0)
                                              {
                                              
                                              %>
                                               
                                                <tr>
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <td class="table_center" style="text-align:right;">Discount Amount</td>
                                                    <td class="table_center" style="text-align: center"><%=StudentAccount.getDisamount()%></td> 
                                                </tr> 
                                              <%}%>
                                              
                                              
                                              
                                              <%
                                              if(StudentAccount.getPreviousBalance() >0 && StudentAccount.getFeeType().equals("Monthly Payment"))
                                              {
                                              
                                              %>
                                               
                                                <tr>
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <td class="table_center" style="text-align:right;">Last Month Balance</td>
                                                    <td class="table_center" style="text-align: center"><%=StudentAccount.getPreviousBalance()%></td> 
                                                </tr> 
                                              <%}%>
                                                <tr>
                                                    <th class="table_center"   ></th>
                                                   <th class="table_center"   style="text-align:right;"  ><span  >Total</span></th>

                                                    <td class="table_center" style="text-align: center"><%=StudentAccount.getFinalamount()%></td>



                                                </tr>
                                                <tr>
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"   style="text-align:right;"   ><span  >Paid Amount</span></th>

                                                    <td class="table_center" style="text-align: center"><%=StudentAccount.getPaid()%></td>



                                                </tr>
                                               
                                                <tr>
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"  style="text-align:right;"  ><span  >Balance Amount</span></th>

                                                    <td class="table_center" style="text-align: center"><%=StudentAccount.getTotalremfee()%></td>



                                                </tr>
                                             
                                               



                                            </tbody>

                                        </table>

                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 " >
                                            <div class="col-xs-8 " >
                                                <div class="row"><strong>Total Amount in words:-Rs <%=StudentAccount.getAmountinWord()%>&nbsp;</strong></div>
                                            </div>
                                            <div class="col-xs-4" style="text-align: center" ><strong>For</strong></div>
                                        </div>  <div class="col-xs-12 " >
                                            <div class="col-xs-8 " >
                                                <div class="row"><strong>Note:Fee will not be refundable after the admission for any Reason.</strong></div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 " >
                                            <div class="col-xs-8 " >
                                                <div class="row"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fees will not Carry forward for Next Month. </strong></div>
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