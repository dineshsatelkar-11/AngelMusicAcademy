<%@page import="com.accede.angel.sell.model.Venderregistration"%>
<%@page import="com.accede.angel.sell.dao.VendorDao"%>
<%@page import="com.accede.angel.sell.model.Venderregistration"%>
<%@page import="com.accede.angel.sell.model.PurchaseProduct"%>
<%@page import="com.accede.angel.sell.dao.PurchaseDao"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.accede.angel.admin.model.Payment"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
    <%    if (session.getAttribute("printInvoiceID2") != null) {
            long celloId = (Long) session.getAttribute("printInvoiceID2");
            session.removeAttribute("printInvoiceID");
            session.removeAttribute("printInvoiceID2");
    %>
    <script>
        window.open("Class_invoice.jsp?admissionid=<%=celloId%>");</script>
        <%
            }


        %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <style> 
        .studentimage {
            width: 50px;
            hight: 50px;


            -webkit-transition: width 2s; /* For Safari 3.1 to 6.0 */
            transition: width 2s;
        }
        .studentimage:hover {
            width: 300px;
            hight: 300px;

        }
    </style>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">

                <%@ include file = "../comman_files/adminSideBarFile.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div  role="main">
                    <div class="">

                        <div class="clearfix"></div>
                        <!-- Modal -->


                        <div class="modal fade" id="CustomeDate" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" style="margin-right: -240px" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title"> Custom Filter</h4>
                                    </div>
                                    <form class="form-horizontal form-label-left input_mask" method="post"  action="PurchaseReport.jsp"  data-parsley-vdalidate>


                                        <div class="modal-body">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">From Date <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input  type="date" value=""  name="FDate" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                                            </div>
                                            <br>

                                            <!--          <p>Some text in the modal.</p>-->
                                        </div>
                                        <div class="modal-body">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">To Date<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input  type="date" value=""  name="TDate" id="uploadFile" required="" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                                            </div>
                                            <br>

                                            <!--          <p>Some text in the modal.</p>-->
                                        </div>
                                        <div class="modal-body">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Select Vendor<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                 <select class="form-control" id="id" name="id" >
                                                    <option value="">Select Vendor</option>
                                                    <%                                                        VendorDao VendorDao = new VendorDao();
                                                        List<Venderregistration> allVenderregistration = null;
                                                        allVenderregistration = VendorDao.getAllVendor();
                                                        if (allVenderregistration != null && allVenderregistration.size() > 0) {
                                                            for (Venderregistration p : allVenderregistration) {

                                                    %>
                                                    <option value="<%=p.getId()%>"><%=p.getVendorname()%></option>
                                                    <%
                                                            }
                                                        }%>

                                                </select> </div>
                                            <br>
                                            <br>
                                            <br>

                                            <!--          <p>Some text in the modal.</p>-->
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <!--                          <p><button class="btn btn-primary" type="button">Cancel</button></p>-->
                                                <table>
                                                    <tr>
                                                        <td> <button class="btn btn-primary" type="reset">Reset</button></td>
                                                        <td> <button type="submit" id="myEnquirybtn" class="btn btn-success">Submit</button></td>


                                                    </tr>
                                                </table>



                                            </div>
                                        </div>

                                    </form>
                                    <br>
                                    <br>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" style="width:20%" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <!--                                        <h2>All Account Details </h2> -->
                                        <div class="row">
                                            <!--<div class="btn-group">-->
                                            <!--<div class="btn btn-default">-->
                                            <button onclick='window.top.location.href = "PurchaseReport.jsp?Days=0&id=" + document.getElementById("Vendor_Id").value;' class="btn btn-default" name="Today" value="1" type="button">Today</button>
                                            <button onclick='window.top.location.href = "PurchaseReport.jsp?Days=1&id=" + document.getElementById("Vendor_Id").value;' class="btn btn-default" name="Today" value="1" type="button">Yesterday</button>
                                            <button onclick='window.top.location.href = "PurchaseReport.jsp?Days=7&id=" + document.getElementById("Vendor_Id").value;' class="btn btn-default" name="Today" value="1" type="button">Last 7 Days</button>
                                            <!--                                                </div>
                                                                                            <div class="btn btn-default">-->
                                            <button onclick='window.top.location.href = "PurchaseReport.jsp?Days=30&id=" + document.getElementById("Vendor_Id").value;'  class="btn btn-default" name="Today" value="1" type="button">Last 30 Days</button>
                                            <button onclick='window.top.location.href = "PurchaseReport.jsp?Days=-1&id=" + document.getElementById("Vendor_Id").value;' class="btn btn-default" name="Today" value="1" type="button">This Month</button>
                                            <button onclick='window.top.location.href = "PurchaseReport.jsp?Days=-2&id=" + document.getElementById("Vendor_Id").value;' class="btn btn-default" name="Today" value="1" type="button">Last Month</button>
                                            <!--                                                </div>
                                                                                            <div class="btn btn-default">-->
                                            <button class="btn btn-default" data-toggle="modal" data-target="#CustomeDate" type="button">Custom</button>

                                            <!--</div>-->

                                            <!--</div>-->
                                            <div class="   " style="float: right;margin-right: 50px">
                                                  <select class="form-control" id="Vendor_Id" name="Vendor_Id" >
                                                    <option value="">Select Vendor</option>
                                                    <%                                                       
                                                        allVenderregistration = VendorDao.getAllVendor();
                                                        if (allVenderregistration != null && allVenderregistration.size() > 0) {
                                                            for (Venderregistration p : allVenderregistration) {

                                                    %>
                                                    <option value="<%=p.getId()%>"><%=p.getVendorname()%></option>
                                                    <%
                                                            }
                                                        }%>

                                                </select>
                                            </div>





                                        </div>
                                    </div>


                                       
                                    <div id="studentfetch">
                                        <div class="x_content">

                                            <table id="datatable" class="table table-striped table-bordered tablefetch">
                                            <thead>
                                                <tr>

                                                    <th class="table_center">Sr No</th>
                                                    <th class="table_center">All Purchase Products</th>
                                                    <!--<th class="table_center">Edit Purchase Products</th>-->
                                                    <th class="table_center">Purchase  Date</th>
                                                    <th class="table_center">Vendor Name</th>
                                                    <th class="table_center">Invoice No</th>
                                                  

                                                    <th class="table_center">Grand SGST</th>
                                                    <th class="table_center">Grand CGST</th>
                                                    <th class="table_center">Grand IGST</th>
                                                    <th class="table_center">Taxable Amount</th>
                                                    <th class="table_center">Grand Quantity</th>
                                                    <th class="table_center">Grand Total</th>


                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%
                                                    PurchaseDao cd = new PurchaseDao();

                                                    int i = 0;
                                                    List<PurchaseProduct> cl = null;
                                                    String Days = request.getParameter("Days");
                                                        String vendoridd = request.getParameter("id");
                                                        String FDate = request.getParameter("FDate");
                                                        String TDate = request.getParameter("TDate");
                                                        float grandcgsi=0.0f;
                                                        float grandsgsi=0.0f;
                                                        float grandigsi=0.0f;
                                                        float grandtaxableamount=0.0f;
                                                        float grandtotalamount=0.0f;
                                                    Venderregistration Venderregistration=new Venderregistration();
                                                     if (vendoridd != null) {
                                                            if (vendoridd != "") {
                                                                Venderregistration = VendorDao.getvenderbyid(Long.parseLong(vendoridd));
                                                            }
                                                        }
                                                      int noofdays = 0;
                                                     if (Days != null) {
                                                            if (Days.equals("-1")) {

                                                                if (Venderregistration.getId()!= 0) {

                                                                    cl = cd.getPurchaseProductThisMonth(Venderregistration);
                                                                } else {
                                                                    cl = cd.getPurchaseProductThisMonth();
                                                                }
                                                            } else if (Days.equals("-2")) {

                                                                if ( Venderregistration.getId() != 0) {
                                                                    cl = cd.getPurchaseProductLastMonth(Venderregistration);

                                                                } else {
                                                                    cl = cd.getPurchaseProductLastMonth();
                                                                }

                                                            } else {
                                                                noofdays = Integer.parseInt(Days);
                                                                if (Venderregistration.getId() != 0) {
                                                                    cl = cd.getPurchaseProductInoutt(Venderregistration, noofdays);

                                                                } else {
                                                                    cl = cd.getPurchaseProductInoutt(noofdays);

                                                                }
                                                            }
                                                        } else {

                                                            if (FDate != null) {
                                                                if (FDate != "") {

                                                                    Date FromDate = new Date();
                                                                    Date ToDate = new Date();

                                                                    try {
                                                                        FromDate = new SimpleDateFormat("yyyy-MM-dd").parse(FDate);
                                                                       
                                                                    } catch (ParseException ex) {
                                                                        ex.printStackTrace();
                                                                    }
                                                                    
                                                                    try {
                                                                        ToDate = new SimpleDateFormat("yyyy-MM-dd").parse(TDate);
                                                                       
                                                                    } catch (ParseException ex) {
                                                                        ex.printStackTrace();
                                                                    }
                                                                    
                                                                    if (Venderregistration.getId() != 0) {
                                                                    cl = cd.getPurchaseProductInoutt(Venderregistration, FromDate, ToDate);

                                                                } else {
                                                                cl = cd.getPurchaseProductInoutt(FromDate, ToDate);
                                                                } 
                                                                    
                                                                    
                                                                }
                                                            } else {
                                                                cl = cd.getAllPurchaseProduct();
                                                            }

                                                        }
                                                     
                                                   
                                                   System.out.println(cl.size());
                                                    
                                                    if (cl != null && cl.size() > 0) {
                                                        for (PurchaseProduct p : cl) {

                                                            i++;

String date1 = DATE_FORMAT.format(p.getPurchase_Date());
                                                %>
                                                <tr>
                                                    <td class="table_center"><%=i%></td>
                                                    <td class="table_center"><a href="PurchaseReportAjax.jsp?id=<%=p.getPurchaseID()%>"><i class="btn btn-round btn-success">VIEW PRODUCTS</i></a></td> 
<!--<td class="table_center"><a href="EditPurchaseOrder.jsp?id=<%=p.getPurchaseID()%>" class="fa-2x glyphicon glyphicon-edit edit_prd" ></a></td>-->
  <td class="table_center"><%=date1%></td> 
                                                    <td class="table_center"><%=p.getVendorid().getVendorname()%> </td>
                                                    <td class="table_center"><%=p.getInvoiceID()%> </td>

                                                  
                                                    <td class="table_center"><%=p.getGrandsgst()%></td> 
                                                    <td class="table_center"><%=p.getGrandcgst()%></td> 
                                                    <td class="table_center"><%=p.getGrandigst()%></td> 
                                                    <td class="table_center"><%=p.getGrandTotalGst()%></td> 
                                                    <td class="table_center"><%=p.getGrandtotalquantity()%></td> 
                                                    <td class="table_center"><%=p.getGrandTotal()%></td> 



                                                </tr>  
                                                <%
                                                        
                                                        grandcgsi=grandcgsi+p.getGrandcgst();
                                                         grandsgsi=grandsgsi+p.getGrandsgst();
                                                         grandigsi=grandigsi+p.getGrandigst();
                                                         grandtaxableamount=grandtaxableamount+p.getGrandTotalGst();
                                                         grandtotalamount=grandtotalamount+p.getGrandTotal();  
                                                        }
                                                    }

                                                %>

                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th colspan="11"></th>
                                                </tr>
                                                 <tr>

                                                    <th class="table_center" colspan="5"></th>
                                                   

                                                    <th class="table_center"><%=grandcgsi%></th>
                                                    <th class="table_center"><%=grandsgsi%></th>
                                                    <th class="table_center"><%=grandigsi%></th>
                                                    <th class="table_center"><%=grandtaxableamount%></th>
                                                    <th class="table_center"></th>
                                                    <th class="table_center"><%=grandtotalamount%></th>
                                                  


                                                </tr>
                                                
                                            </tfoot>
                                        </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>
                </div>
                <script>
                    $(document).ready(function() {
                        $('[data-toggle="popover"]').popover();
                    });
                </script>

                <!-- /page content -->


                <!-- footer content -->
                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
                <!-- /footer content -->
            </div>
        </div>

        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
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
        <style>

            .table_center{

                text-align: center;
            }




        </style>


        <%@ include file = "JavaScriptFile.jsp" %>

        <script>
                    $(document).ready(function() {

                        $('.user_buttons').click(function(event) {
                            var UID = this.id;
                            var adminidd = $("#adminidd").val();
                            if (UID !== "")
                            {
                                var pos = $(this).attr("data");
                                $("#position").text("" + pos + " Due Date Student");
                                $.ajax({
                                    url: "FetchStudent.jsp",
                                    type: "post",
                                    data: {userID: UID, adminidd: adminidd},
                                    success: function(response) {
                                        $("#studentfetch").html(response);
                                    },
                                    error: function(jqXHR, textStatus, errorThrown) {
                                        console.log(textStatus, errorThrown);
                                        alert("Something Went Wrong...!!!");
                                    }
                                });
                            } else
                            {
                                alert("No Users Added...!!!");
                            }
                        });



                    });
        </script>
    </body>
</html>