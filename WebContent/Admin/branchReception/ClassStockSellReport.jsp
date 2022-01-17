


<%@page import="com.accede.angel.sell.dao.BranchClassDao"%>
<%@page import="com.accede.angel.sell.model.BranchClassSale"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="com.accede.angel.sell.model.BranchSale"%>
<%@page import="com.accede.angel.sell.dao.SaveBranchSaleDAO"%>
<%@page import="com.accede.angel.sell.dao.SubCatDao"%>
<%@page import="com.accede.angel.sell.model.SubCategory"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.sell.dao.ColorDao"%>
<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.dao.ModelDao"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="com.accede.angel.sell.dao.BrandDao"%>
<%@page import="com.accede.angel.sell.model.AddModel"%>
<%@page import="com.accede.angel.sell.model.BranchProduct"%>
<%@page import="com.accede.angel.sell.dao.BranchProductDao"%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.ProductDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
    <script src="../production/Validation/js/Alertajax.js" type="text/javascript"></script>


    <%    if (request.getParameter("modal_prd_id") != null) {
            int modal_prd_id = Integer.parseInt(request.getParameter("modal_prd_id"));
            int modal_prd_quant = Integer.parseInt(request.getParameter("modal_prd_quant"));

    %>
    <script>
        window.open("PrintBarcode.jsp?Barcodeid=<%=modal_prd_id%>&modal_prd_quant=<%=modal_prd_quant%>");

    </script>        <%
        }


    %>
    
    
    
    <script type="text/javascript">
        $('document').ready(function () {




            $('.Add_Product').change(function () {


                var Category = $('#Category').val();
                var Brand = $('#Brand').val();
                var Model = $('#Model').val();
                var Branch = $('#Branch').val();
                  var SubCategory = $('#SubCategory').val();
                  var ColorName = $('#ColorName').val();
         
           
                $.get("AjaxPages/FetchProductStock1.jsp",
                        {ColorName :ColorName, Category: Category, Brand: Brand, Model: Model , Branch: Branch ,SubCategory :SubCategory}, function (data) {
                
        $('#Report_Fetch').html(data);
        


                });

            });

        });

    </script> 
    
    <script>
        $('#document').ready(function() {
            //alert("ready");


            $('.createbarcode').click(function() {

                $.ajax({
                    url: "CreateBarcodeImageAjax.jsp",
                    type: "post",
                    data: {},
                    success: function(response) {


                        $("#barcodeg").html(response);

                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                        alert('something went wrong....');
                    }
                });
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
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
              
                    <%@ include file = "../comman_files/adminSideBarForBilling.jsp" %>
             

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->
     
<div class="modal fade" id="CustomeDate" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" style="margin-right: -240px" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title"> Custom Filter</h4>
                                    </div>
                                    <form class="form-horizontal form-label-left input_mask" method="post"  action="ClassStockSellReport.jsp"  data-parsley-vdalidate>


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
                                     <input type="hidden" id="id" name="id" value="<%=admin.getAdminId()%>" >
                                
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
                <!-- page content -->
                <div  role="main">
                    <div class="">
                        

                        <div class="clearfix"></div>

                        <div class="row">


                            <div class="col-md-12 col-sm-12 col-xs-12" >
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Class Stock Report</h2>
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
                                    
                                    
                                    
                                                        
                                                             <div class="row" >
                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                            <div class="form-group">
                                                    <div class="row">
                                            <!--<div class="btn-group">-->
                                            <!--<div class="btn btn-default">-->
                                            <button onclick='window.top.location.href = "ClassStockSellReport.jsp?Days=0&id=" + document.getElementById("Branch").value;' class="btn btn-default" name="Today" value="1" type="button">Today</button>
                                            <button onclick='window.top.location.href = "ClassStockSellReport.jsp?Days=1&id=" + document.getElementById("Branch").value;' class="btn btn-default" name="Today" value="1" type="button">Yesterday</button>
                                            <button onclick='window.top.location.href = "ClassStockSellReport.jsp?Days=7&id=" + document.getElementById("Branch").value;' class="btn btn-default" name="Today" value="1" type="button">Last 7 Days</button>
                                            <!--                                                </div>
                                                                                            <div class="btn btn-default">-->
                                            <button onclick='window.top.location.href = "ClassStockSellReport.jsp?Days=30&id=" + document.getElementById("Branch").value;'  class="btn btn-default" name="Today" value="1" type="button">Last 30 Days</button>
                                            <button onclick='window.top.location.href = "ClassStockSellReport.jsp?Days=-1&id=" + document.getElementById("Branch").value;' class="btn btn-default" name="Today" value="1" type="button">This Month</button>
                                            <button onclick='window.top.location.href = "ClassStockSellReport.jsp?Days=-2&id=" + document.getElementById("Branch").value;' class="btn btn-default" name="Today" value="1" type="button">Last Month</button>
                                            <!--                                                </div>
                                                                                            <div class="btn btn-default">-->
                                            <button class="btn btn-default" data-toggle="modal" data-target="#CustomeDate" type="button">Custom</button>

                                            <!--</div>-->

                                            <!--</div>-->
                                          <input type="hidden" id="Branch" name="Branch" value="<%=admin.getAdminId()%>" >
                                            





                                        </div>







                                            </div>

                                        </div>
                                    </div>
                                    <div class="x_content table-responsive">
                                        <!--                    <p class="text-muted font-13 m-b-30">
                                                              The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                            </p>-->
                                        <div id="Report_Fetch">
                                        <table id="datatable-buttons" class="table table-striped table-bordered tablefetch">
                                                <thead>
                                                    <tr>
                                                        <th>Sr No.</th>
                                                        <th>Sale Date</th>  
                                                        <th>Branch Name</th>  
                                                                                                            

                                                        <th>Total Quantity</th> 
                                                        <th>More Details</th> 

                                                    </tr>
                                                </thead>
                                                <tbody>

                                                  
                                                   
                       <%
                            BranchClassSale p = new BranchClassSale();
                            BranchClassDao cd = new BranchClassDao();
                             String Days = request.getParameter("Days");
                                                        String BranchId = request.getParameter("id");
                                                        String FDate = request.getParameter("FDate");
                                                        String TDate = request.getParameter("TDate");
                            
                             Admin adminfilter =admin;
                               List<BranchClassSale> cl = null;
                              
                           
                                                        System.out.println("adminfilter==" + adminfilter);
                                                        int noofdays = 0;

                                                        if (Days != null) {
                                                            if (Days.equals("-1")) {

                                                                if (adminfilter.getAdminId() != 0) {

                                                                    cl = cd.getBranchClassSaleThisMonth(adminfilter);
                                                                } else {
                                                                    cl = cd.getBranchClassSaleThisMonth();
                                                                }
                                                            } else if (Days.equals("-2")) {

                                                                if (adminfilter.getAdminId() != 0) {
                                                                    cl = cd.getBranchClassSaleLastMonth(adminfilter);

                                                                } else {
                                                                    cl = cd.getBranchClassSaleLastMonth();
                                                                }

                                                            } else {
                                                                noofdays = Integer.parseInt(Days);
                                                                if (adminfilter.getAdminId() != 0) {
                                                                    cl = cd.getBranchClassSaleInoutt(adminfilter, noofdays);

                                                                } else {
                                                                    cl = cd.getBranchClassSaleInoutt(noofdays);

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
                                                                    
                                                                    if (adminfilter.getAdminId() != 0) {
                                                                    cl = cd.getBranchClassSaleInoutt(adminfilter, FromDate, ToDate);

                                                                } else {
                                                                cl = cd.getBranchClassSaleInoutt(FromDate, ToDate);
                                                                } 
                                                                    
                                                                    
                                                                }
                                                            } else {
                                                                cl = cd.getAllBranchClassSale(adminfilter);
                                                            }

                                                        }
                              
                            int i = 0;
                             if (cl != null && cl.size() > 0) {
                            for (BranchClassSale c1 : cl) {
                                SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("dd-MM-yyyy");
                               String date1 = DATE_FORMAT1.format(c1.getDate());
                                i++;
                        %>
                         <tr>
                                                        <td><%=i%></td>

                                                        <td><%=date1%></td>
                                                        <td><%=c1.getAdmin().getAdminOfBranch().getBranchName()%></td>
                                                        <td><%=c1.getTotalquantity()%></td>
                                                         <td><a href="ViewDetailsofBranchClassSaleProduct.jsp?purchaseid=<%=c1.getId()%>" class="btn9 btn btn-success"><i>View Details</i></a></td>
                                                       
                                                        </tr> 
                        <%
                           }}
                        %>
                       
                                                    
                                                    
                                                </tbody>
                                            </table>
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
        </div>
    </div>



    <script type="text/javascript">
        $('#document').ready(function() {

            $('.edit_prd').click(function(event) {
                var i = this.id;
                var j = $('#prd_id' + i).val();


                $('#modal_prd_id').val($('#prd_id' + i).val());


                $('#modal_prd_name').val($('#prd_name' + i).text());
                $('#modal_prd_quant').val($('#prd_quant' + i).text());

            });

            $('.edit_prd1').click(function(event) {
                var i = this.id;
                var j = $('#prd_id' + i).val();
                var j1 = $('#prd_quant' + i).text();
                var j2 = $('#prd_name' + i).text();


                $('#modal_prd_id1').val($('#prd_id' + i).val());


                $('#modal_prd_name1').val($('#prd_name' + i).text());
                $('#modal_prd_quant1').val($('#prd_quant' + i).text());
                $('#modal_prd_bar').val($('#prd_bar' + i).text());
                $('#modal_prd_hsn').val($('#prd_hsn' + i).text());
                $('#modal_prd_mrp').val($('#prd_mrp' + i).text());
                $('#modal_prd_unit').val($('#prd_unit' + i).text());
                $('#modal_prd_cgst').val($('#prd_cgst' + i).text());
                $('#modal_prd_sgst').val($('#prd_sgst' + i).text());
                $('#modal_prd_desc').val($('#prd_desc' + i).text());
                $('#modal_prd_igst').val($('#prd_igst' + i).text());

            });


        });

    </script>
    <style>
        .data_center{

            text-align:center;

        }
    </style>  
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
</body>
<script type="text/javascript">
        $('document').ready(function() {
            $('.remove_prd').click(function() {
                var PRD_ID = this.id;
                alert(PRD_ID);
                $.get("DeleteProductAjax.jsp", {PRD_ID: PRD_ID}, function(data) {
                    $('#output1').html(data);

                });

            });

        });


</script>
<script type="text/javascript">

    function alpha(e) {
        var k;
        document.all ? k = e.keyCode : k = e.which;
        return (k > 47 && k < 58);
    }
    function coder(e1) {
        var l;
        document.all ? l = e1.keyCode : l = e1.which;
        return ((l > 47 && l < 58) || (l > 64 && l < 91) || (l > 96 && l < 123));
    }
    function alpha11(e2) {
        var l;
        document.all ? l = e2.keyCode : l = e2.which;
        return ((l > 96 && l < 123) || (l > 64 && l < 91) || k == 8 || k == 32);
    }
</script>

</html>