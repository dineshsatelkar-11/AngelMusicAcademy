

<%@page import="com.accede.angel.sell.dao.CustomerSaleDAO"%>
<%@page import="com.accede.angel.sell.dao.PurchaseDao"%>
<%@page import="com.accede.angel.sell.dao.BranchProductDao"%>
<%@page import="com.accede.angel.sell.model.BranchProduct"%>
<%@page import="com.accede.angel.sell.dao.CustomerSellDAO"%>
<%@page import="com.accede.angel.sell.model.TempCustomerSell"%>
<%@page import="com.accede.angel.sell.dao.TempproductDao"%>
<%@page import="com.accede.angel.sell.dao.TempSaleforBranchDAO"%>
<%@page import="com.accede.angel.sell.model.TempSaleforBranch"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.admin.dao.ProductDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
    <script src="../production/Validation/js/Alertajax.js" type="text/javascript"></script>
    <script>

     
        function valid()
        {
          
            var amountinword = document.getElementById('amountinword').value;
            var Other_Charges = document.getElementById('Other_Charges').value;
            var Net_Amount = document.getElementById('Net_Amount').value;


            if (!(Other_Charges === ""))
            {

                $('#amountinword').val(converAmount(parseInt(Net_Amount)));
                return true;


            }
            else
            {

                swal({
                    title: 'These is not allowed.!',
                    html: $('<div>')
                            .addClass('some-class')
                            .text('Select One Product '),
                    animation: false,
                    customClass: 'animated tada'
                })
                return false;
            }
        }



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

                if (places == 6)
                {
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


    </script>
  <%    if (session.getAttribute("saleno") != null) {
            int sellid = (Integer) session.getAttribute("saleno");
            session.removeAttribute("saleno");
    %>
    <script>
        window.open("SellProductInvoice.jsp?sellid=<%=sellid%>");</script>
        <%
            }


        %>
    <script>
        $('#document').ready(function() {

            $('#barcode').blur(function() {

                var Productname = $("#barcode").val();
                var adminid = $("#adminid").val();
                var Other_Charges = $('#Other_Charges').val();
                var Discount_Amount = $('#Discount_Amount').val();
                var Quantity = $('#Quantity').val();
                if (Quantity === "")
                {
                    Quantity = 0;
                }
                if (Other_Charges === "")
                {
                    Other_Charges = 0;
                }
                if (Discount_Amount === "")
                {
                    Discount_Amount = 0;
                }


                $.ajax({
                    url: "AjaxPages/CustomerSellProductAjax.jsp",
                    type: "post",
                    data: {Productname: Productname, adminid: adminid, Other_Charges: Other_Charges, Discount_Amount: Discount_Amount, Quantity: Quantity},
                    success: function(response) {


                        $("#Report_Fetch").html(response);
//                        alert('success');
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                    }
                });
            });
            $('#Add_Product').click(function() {

                var Productname = $("#barcode").val();
                var adminid = $("#adminid").val();
                var Other_Charges = $('#Other_Charges').val();
                var Discount_Amount = $('#Discount_Amount').val();
                var Quantity = $('#Quantity').val();
                if (Other_Charges === "")
                {
                    Other_Charges = 0;
                }
                if (Discount_Amount === "")
                {
                    Discount_Amount = 0;
                }
                if (!(Productname === ""))
                {

                    if (!(Quantity === ""))
                    {
                        $.ajax({
                            url: "AjaxPages/CustomerSellProductAjax.jsp",
                            type: "post",
                            data: {Productname: Productname, adminid: adminid, Other_Charges: Other_Charges, Discount_Amount: Discount_Amount, Quantity: Quantity},
                            success: function(response) {


                                $("#Report_Fetch").html(response);
//                        alert('success');
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                console.log(textStatus, errorThrown);
                            }
                        });
                    } else
                    {
                        swal({
                            title: 'Enter Quantity',
                            input: 'number',
                            showCancelButton: true,
                            animation: false,
                            inputValidator: function(value) {
                                return new Promise(function(resolve, reject) {
                                    if (!(isNaN(value)))
                                    {

                                        $('#Quantity').val(value);
                                        resolve()
                                    } else {
                                        reject('You need to Enter Quantity  :)')
                                    }
                                })
                            }
                        }).then(function(result) {
                            swal({
                                type: 'success',
                                html: 'You Enter Quantity is ' + result
                            })
                        })
                    }
                }
                else
                {
                    swal({
                        title: 'Scan Barcode First',
                        input: 'number',
                        showCancelButton: true,
                        animation: false,
                        inputValidator: function(value) {
                            return new Promise(function(resolve, reject) {
                                if (!(isNaN(value)))
                                {

                                    $('#barcode').val(value);
                                    resolve()
                                } else {
                                    reject('You need to Enter Barcode  :)')
                                }
                            })
                        }
                    }).then(function(result) {
                        swal({
                            type: 'success',
                            html: 'You Enter Barcode is ' + result
                        })
                    })
                }
            }
            );
            $('.remove_prd').click(function(event) {


                var prdID = this.id;
                swal({
                    title: "Are you sure?",
                    text: "Are you sure that you want to delete this Product?",
                    type: "warning",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    confirmButtonText: "Yes, delete it!",
                    confirmButtonColor: "#ec6c62"
                }).then(function() {
                    $.ajax({
                        url: "CustomersellProoductDeleteAjax.jsp",
                        type: "post",
                        data: {prdID: prdID},
                    })
                            .done(function(data) {
                                swal("Deleted!", "Your Product was successfully deleted!", "success");
                                $(".output2").html(data);
                            })
                            .error(function(data) {
                                swal("Oops", "We couldn't connect to the server!", "error");
                            });
                }, function(dismiss) {
                    // dismiss can be 'cancel', 'overlay',
                    // 'close', and 'timer'
                    if (dismiss === 'cancel') {
                        swal(
                                'Cancelled',
                                'Your imaginary file is safe :)',
                                'error'
                                )
                    }
                })





            });
        });</script>
        <%        CustomerSellDAO td = new CustomerSellDAO();
            td.deleteProduct();
        %>
    <body class="nav-sm">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/branchAdminSideBar.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">



                        <div class="clearfix"></div>

                        <div class="row">

                            <form action="../../CustomerSaleServletforreception" method="post" onsubmit="return valid();">
                              
                                  <%                                               if (request.getParameter("asd") != null) {
                                                    int asd = Integer.parseInt(request.getParameter("asd"));

                                            %>
                                            <input type="hidden" name="inquiryid" value="<%=asd%>">
                                            <%} else {%>
                                            <input type="hidden" name="inquiryid" value="0">

                                            
                                <%}
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
                                <div>
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>Customer Sell Details</h2>
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

                                                <div class="x_content">



                                                    <input type="hidden" id="adminid" name="adminid" value="<%=admin.getAdminId()%>">


                                                    <div class="row" >
                                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                            <div class="form-group">
                                                                <div class="col-md-4 col-sm-12 col-xs-12">

                                                                    <input type="text" id="BillNo" name="BillNo" readonly="" value="Bill No-<%=new CustomerSaleDAO().getLastBillSaleID()+1%>" required="required" placeholder="Bill No"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                </div>
                                                                <!--                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                
                                                                
                                                                                                                                      <input type="text" id="BillNo" name="BillNo" readonly="" value="Cash"  placeholder="Bill No"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                                                                                </div>
                                                                
                                                                
                                                                                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                                                                    <input placeholder="Date Of Purchase" type="date" id="datetimepicker1" required=""  name="DateOfPurchase"  class="form-control ">
                                                                                                                                </div>-->
                                                                <div id="output">
                                                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                                                        <input type="text" id="customer_name" name="customer_name"  required="required" placeholder="Customer Name"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                    </div>   



                                                                </div>

                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                    <input placeholder="Mobile No" maxlength="10" type="text" required="" id="Mobile_no" name="Mobile_no"  class="form-control " onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="row">
                                                        <div class="col-md-12 col-sm-12 col-xs-12">     


                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="row">
                                                        <div class="col-md-12 col-sm-12 col-xs-12">     

                                                            <div class="col-md-12 col-sm-12 col-xs-12"> 

                                                                <input type="text" id="Cust_Address" name="Cust_Address" required="required" placeholder="Customer Address"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 




                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>

                                                </div>

                                                <div class="x_content">







                                                    <br>
                                                    <div class="row">
                                                        <div class="col-md-12 col-sm-12 col-xs-12">   
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <input type="text"  id="barcode"  name="barcode"  placeholder=" Enter Barcode "  class="form-control priceup">
                                                            </div>
                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                <input type="text" id="Quantity" name="Quantity"   placeholder="Quantity"  class="form-control totalamount ">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                            </div>








                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                <input  type="button" id="Add_Product" name="Add_Product"  value="Add" class="form-control btn btn-success">
                                                            </div>
                                                        </div>
                                                    </div>



                                                </div>


                                                <div  id="Report_Fetch">
                                                    <div class="x_content ">

                                                        <div id="output1">
                                                            <table id="datatable" class="table table-striped table-bordered">
                                                                <thead> <tr>

                                                                        <th  class="data_center">Sr No</th>
                                                                        <th  class="data_center">Delete</th>
                                                                        <th class="text-center" >Model No</th>
                                                                        <th class="text-center" >Brand</th>
                                                                        <th class="text-center" >Color</th>
                                                                        <th class="text-center" >Category</th>
                                                                        <th class="text-center" >Barcode</th>
                                                                        <th class="text-center" >Quantity</th>



                                                                        <th class="text-center" >MRP</th>


                                                                        <th class="text-center" >Net Amount</th>






                                                                    </tr>
                                                                </thead>

                                                            </table>

                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-12 col-sm-12 col-xs-12">     
                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                <label>Gross Amount</label>
                                                                <input type="text" id="GrossAmount" name="GrossAmount"  required="required" readonly="" placeholder="Gross Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                            </div>



                                                            <div class="col-md-3 col-sm-12 col-xs-12 text-center">
                                                                <label class="text-center" >Other Charges</label>

                                                                <input type="text" id="Other_Charges" name="Other_Charges" readonly="" required="required" placeholder="Other_Charges"   class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                            </div>
                                                            <div class="col-md-3 col-sm-12 col-xs-12 text-center">
                                                                <label class="text-center" >Discount Amount</label>

                                                                <input type="text" id="Discount_Amount" name="Discount_Amount" readonly="" required="required" placeholder="Discount_Amount"   class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                            </div>
                                                            <div class="col-md-3 col-sm-12 col-xs-12 text-center">
                                                                <label class="text-center" >Net Amount</label>

                                                                <input type="text" id="Net_Amount" name="Net_Amount" readonly="" required="required" placeholder="Net_Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                            </div>




                                                        </div>
                                                    </div>
                                                    <div class="row">

                                                    </div>
                                                </div>

                                                <div class="x_content">
                                                    <div class="row">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 text-center"></div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 text-center">
                                                            <input type="hidden" name="amountinword" id="amountinword">
                                                            <input type="submit"  class="btn1 btn btn-success Save" value="Save Order"   name="Save_Order">

                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 text-center"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>



                            </form> 
                        </div>
                    </div>                                 
                </div>

            </div>




            <!-- footer content -->
            <%@ include file = "../comman_files/BranchFooter.jsp" %>
            <!-- /footer content -->
        </div>
    </div>


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
    <script src="../production/js/Swal.js" type="text/javascript"></script>

    <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>

</body>
<script type="text/javascript">
                                $('document').ready(function() {
                                    $SIDEBAR_MENU.find("li.active ul").hide();
                                    $(".btn1").hide();
                                    $('.remove_prd').click(function() {

                                        var PRD_ID = this.id;
                                        alert(PRD_ID);
                                        $.get("DeleteProductAjax.jsp", {PRD_ID: PRD_ID}, function(data) {
                                            $('#output1').html(data);
                                        });
                                    });




                                });</script>
<script type="text/javascript">

    function alpha(e) {
        var k;
        document.all ? k = e.keyCode : k = e.which;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32);
    }
    function coder(e1) {
        var l;
        document.all ? l = e1.keyCode : l = e1.which;
        return ((l > 47 && l < 58) || (l > 64 && l < 91) || (l > 96 && l < 123));
    }
    function alpha11(e2) {
        var l;
        document.all ? l = e2.keyCode : l = e2.which;
        return ((l > 96 && l < 123) || (l > 64 && l < 91));
    }
</script>

</html>