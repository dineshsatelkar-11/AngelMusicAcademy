
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
//        long id = 4;
        Admission ad = new AdmissionDao().getAdmissionByID(id);
          String coursename1 = "";
        String coursename2 = "";
        String coursename3 = "";
        String coursename4 = "";
        String coursename5 = "";
        int noofcoursee = 0;
        int paymentmodecount = 0;
        int noofcoursee1 = 0;
        int coursefee1 = 0;
        int coursefee2 = 0;
        int coursefee3 = 0;
        int coursefee4 = 0;
        int coursefee5 = 0;
        if (ad != null) {
            int admissionfee = 0;
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
            Date admissiondate = new Date();
            String amountinword = "";
             Date DueDate=new Date();
            for (StudentAccount a : ad.getStudentAccount()) {
                admissionfee = a.getAdmissonnfee();
                amountinWord = a.getAmountinWord();
                bankname = a.getBankname();
                PaymentMode = a.getPaymentMode();
                chequeno = a.getChequeno();

                coursetotalfee = a.getCoursetotalfee();
                System.out.println("coursetotalfee"+coursetotalfee);
                disamount = a.getDisamount();
                discper = a.getDiscper();
                finalamount = a.getFinalamount();
                totaladvancedfee = a.getTotaladvancedfee();
                totalfee = a.getTotalfee();
                totalremfee = a.getTotalremfee();
                course = a.getCourse();
                previousBalance = a.getPreviousBalance();
                billno = a.getAccountId();
                admissiondate = a.getPaymentDate();
                amountinword = a.getAmountinWord();
                 DueDate=a.getDueDate();
                  coursename1 = a.getCourseName1();
         coursename2 = a.getCourseName2();
         coursename3 = a.getCourseName3();
         coursename4 = a.getCourseName4();
         coursename5 = a.getCourseName5();
         noofcoursee = a.getCourse();
         noofcoursee1 = a.getCourse();
         coursefee1=a.getCourseFee1();
         coursefee2=a.getCourseFee2();
         coursefee3=a.getCourseFee3();
         coursefee4=a.getCourseFee4();
         coursefee5=a.getCourseFee5();
         paymentmodecount=a.getPaymentmodecount();
               
            }


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
                                                    <strong>  ANGEL MUSIC</strong>

                                                </h1>
                                                <h4  style=""></h4>


                                                <span style="color:#0275BA;"> ALL MUSICAL  INSTRUMENT,</span>    
                                                <br> <span style="color:#0275BA;"> BAND, ACCESSORIES , SALES , SERVICE & CLASSES</span> 
                                                <br> <span style="color:#0275BA;">  <%=ad.getAdminOfBranch().getAdminOfBranch().getBranchAddress()%>&nbsp;<%=ad.getAdminOfBranch().getAdminOfBranch().getBranchAddress1()%></span> 
                                                
                                                <br> <span style="color:#0275BA;"><%=ad.getAdminOfBranch().getAdminOfBranch().getBranchAddress2()%>.E-Mail:-<%=ad.getAdminOfBranch().getAdminEmail() %></span> 
                                                <br> <span style="color:#0275BA;">Contact:- 9049976912/9762465737 &nbsp;&nbsp;GST:-27AINPD8826EIZ4</span> 
                                             



                                            </div>



                                        </div>

                                    </div>



                                    <div class="ln_solid"></div>
                                    <div class="row">
                                        <div class="col-xs-12 " >



                                            <div class="col-xs-10 " >

                                                <div class="row"><strong>Admission No:<%=ad.getAdmissionNo()%></strong></div>
                                                <div class="row"><strong>Name:<%=ad.getFirstName()%>&nbsp;<%=ad.getMiddleName()%>&nbsp;<%=ad.getLastName()%></strong></div>
                                                <div class="row"><strong>Mobile No:<%=ad.getContactNo()%></strong></div>






                                            </div>
                                            <div class="col-xs-2  "  style="float: right">


                                                <div class="row"><strong>Date :<%=admissiondate%></strong></div>
                                                <div class="row"><strong>Invoice No:<%=billno%></strong></div>
 <div class="row"><strong>Due Date:<%=DueDate%></strong></div>

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
                                                   
                                                    int q =1;
                                                    if(coursetotalfee>0){
                                                     noofcoursee = noofcoursee1;
                                                     q = noofcoursee + 1;
                                                    }
                                                    
                                                %>


                                              
                                                <%      if (noofcoursee >= 1) {

                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center">1</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseName1()%></td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseFee1()%></td>  
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseFee1() * ad.getPaymentmodecount()%></td> 
                                                </tr> 
                                                <%     }
                                                    if (noofcoursee >= 2) {

                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center">2</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseName2()%></td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseFee2()%></td>  
                                                    <td class="table_center"style="text-align: center"><%=ad.getCourseFee2() * ad.getPaymentmodecount()%></td> 
                                                </tr> 
                                                <%     }
                                                    if (ad.getNoofCourse() >= 3) {

                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center">3</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseName3()%></td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseFee3()%></td>  
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseFee3() * ad.getPaymentmodecount()%></td> 
                                                </tr> 
                                                <%     }
                                                    if (noofcoursee >= 4) {

                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center">4</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseName4()%></td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseFee4()%></td>  
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseFee4() * ad.getPaymentmodecount()%></td> 
                                                </tr> 
                                                <%     }
                                                    if (noofcoursee >= 5) {

                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center">5</td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseName5()%></td>
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseFee5()%></td>  
                                                    <td class="table_center" style="text-align: center"><%=ad.getCourseFee5() * ad.getPaymentmodecount()%></td> 
                                                </tr> 
                                                <%}%>
                                                 <tr>
                                                    <td class="table_center" style="text-align: center"><%=q%></td>
                                                    <td class="table_center" style="text-align: center">Last Month Balance </td>
                                                    <td class="table_center" style="text-align: center"><%=previousBalance%></td>  
                                                    <td class="table_center" style="text-align: center"><%=previousBalance%></td> 
                                                </tr> 
                                                <%
                                                    if (disamount > 0) {
                                                %>
                                                <tr>
                                                    <td class="table_center" style="text-align: center"></td>
                                                    <td class="table_center" style="text-align: center">Discount</td>
                                                    <td class="table_center" style="text-align: center"><%=disamount%></td>  
                                                    <td class="table_center" style="text-align: center"><%=disamount%></td> 
                                                </tr> 
                                                <%}%>
                                                <tr>
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"  style="text-align: center"  ><span  >Total</span></th>

                                                    <td class="table_center" style="text-align: center"><%=totalfee%></td>



                                                </tr>
                                                <tr>
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"   ></th>
                                                    <th class="table_center"  style="text-align: center"  ><span  >Paid Amount</span></th>

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
                                                <div class="row"><strong>Total Amount in words:-<%=amountinword%>&nbsp;Rs Only</strong></div>
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
<%}%>
</html>