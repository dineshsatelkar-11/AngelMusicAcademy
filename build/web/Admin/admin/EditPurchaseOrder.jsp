

<%@page import="com.accede.angel.sell.model.PurchaseTemp"%>
<%@page import="com.accede.angel.sell.model.PurchaseDetails"%>
<%@page import="com.accede.angel.sell.model.PurchaseProduct"%>
<%@page import="com.accede.angel.sell.dao.SubCatDao"%>
<%@page import="com.accede.angel.sell.model.SubCategory"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.dao.ColorDao"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="com.accede.angel.sell.dao.BrandDao"%>
<%@page import="com.accede.angel.sell.model.AddModel"%>
<%@page import="com.accede.angel.sell.dao.ModelDao"%>
<%@page import="com.accede.angel.sell.dao.PurchaseTempDao"%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.sell.model.Venderregistration"%>
<%@page import="com.accede.angel.sell.dao.VendorDao"%>
<%@page import="com.accede.angel.sell.dao.PurchaseDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
    <script src="../production/Validation/js/Alertajax.js" type="text/javascript"></script>



    <script type="text/javascript">
        $('#document').ready(function() {

            $('.totalamount').keyup(function() {

                var purchase_price = $('#purchase_price').val();
                var Quantity = $('#Quantity').val();


                if (!(Quantity == null || purchase_price == null))
                {
                    $('#Total_Amount').val(purchase_price * Quantity);
                }
                //alert("1");
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
    <script type="text/javascript">
        $('document').ready(function() {

            $('#Vendor_Id').change(function() {
                var vendor = $('#Vendor_Id').val();

                // alert("id==="+vendor);
                $.get("SelectVendorGetDetailsAjax.jsp", {vendor: vendor}, function(data) {
                    $('#output').html(data);


                });

            });



            $('#gst_type').change(function() {
                var gst_type = $('#gst_type').val();

                $.get("AjaxPages/Refrshpurchasejsp.jsp", {gst_type: gst_type}, function(data) {

                    $('#Report_Fetch').html(data);

                });

            });

        });

    </script>


    <script type="text/javascript">
        $('document').ready(function() {




            $('#Add_Product').click(function() {

                var gst_type = $('#gst_type').val();
                var GSt_per = $('#GSt_per').val();
                var Category = $('#Category').val();
                var Brand = $('#Brand').val();
                var Model = $('#Model').val();
                var SubCategory = $('#SubCategory').val();
                var ColorName = $('#ColorName').val();
                var MRP_PRice = $('#MRP_PRice').val();
                var purchase_price = $('#purchase_price').val();
                var Quantity = $('#Quantity').val();
                var Other_Charges = $('#Other_Charges').val();
                var Discount_Amount = $('#Discount_Amount').val();
               
                if (Other_Charges === "")
                {
                    Other_Charges = 0;
                }
                if (Discount_Amount === "")
                {
                    Discount_Amount = 0;
                }
                if (!(gst_type === ""))
                {

                    if (!(GSt_per === ""))
                    {
                        if (!(purchase_price === ""))
                        {
                            if (!(Quantity === ""))
                            {

                                if (!(MRP_PRice === ""))
                                {
                                    if (!(Category === ""))
                                    {
                                        if (!(Brand === ""))
                                        {
                                            if (!(Model === ""))
                                            {
                                                if (!(ColorName === ""))
                                                {

                                                    $.get("AjaxPages/AdProducTempEdit.jsp",
                                                            { Other_Charges: Other_Charges, Discount_Amount: Discount_Amount, gst_type: gst_type, GSt_per: GSt_per, Category: Category, Brand: Brand, Model: Model, ColorName: ColorName, MRP_PRice: MRP_PRice, purchase_price: purchase_price, Quantity: Quantity, SubCategory: SubCategory}, function(data) {
                                                        $('#Report_Fetch').html(data);


                                                    });
                                                }
                                                else
                                                {
                                                    swal({
                                                        title: 'These is not allowed.!',
                                                        html: $('<div>')
                                                                .addClass('some-class')
                                                                .text('Select Color '),
                                                        animation: false,
                                                        customClass: 'animated tada'
                                                    })
                                                }
                                            }
                                            else
                                            {
                                                swal({
                                                    title: 'These is not allowed.!',
                                                    html: $('<div>')
                                                            .addClass('some-class')
                                                            .text('Select Model '),
                                                    animation: false,
                                                    customClass: 'animated tada'
                                                })
                                            }
                                        }
                                        else
                                        {
                                            swal({
                                                title: 'These is not allowed.!',
                                                html: $('<div>')
                                                        .addClass('some-class')
                                                        .text('Select Brand '),
                                                animation: false,
                                                customClass: 'animated tada'
                                            })
                                        }
                                    }
                                    else
                                    {
                                        swal({
                                            title: 'These is not allowed.!',
                                            html: $('<div>')
                                                    .addClass('some-class')
                                                    .text('Select Category '),
                                            animation: false,
                                            customClass: 'animated tada'
                                        })
                                    }
                                }
                                else
                                {
                                    swal({
                                        title: 'Enter MRP Price',
                                        input: 'number',
                                        showCancelButton: true,
                                        animation: false,
                                        inputValidator: function(value) {
                                            return new Promise(function(resolve, reject) {
                                                if (!(isNaN(value)))
                                                {

                                                    $('#MRP_PRice').val(value);
                                                    resolve()
                                                } else {
                                                    reject('You need to Enter MRP PRice  :)')
                                                }
                                            })
                                        }
                                    }).then(function(result) {
                                        swal({
                                            type: 'success',
                                            html: 'You Enter MRP Price is ' + result
                                        })
                                    })
                                }
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
                                                if (purchase_price === "")
                                                {
                                                    $('#Total_Amount').val(Quantity * 0);
                                                }
                                                else
                                                {
                                                    $('#Total_Amount').val(purchase_price * Quantity);
                                                }
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
                                title: 'Enter Purchase Price',
                                input: 'number',
                                showCancelButton: true,
                                animation: false,
                                inputValidator: function(value) {
                                    return new Promise(function(resolve, reject) {
                                        if (!(isNaN(value)))
                                        {

                                            $('#purchase_price').val(value);
                                            if (Quantity === "")
                                            {
                                                $('#Total_Amount').val(purchase_price * 0);
                                            }
                                            else
                                            {
                                                $('#Total_Amount').val(purchase_price * Quantity);
                                            }
                                            resolve()
                                        } else {
                                            reject('You need to Enter Purchase Price :)')
                                        }
                                    })
                                }
                            }).then(function(result) {
                                swal({
                                    type: 'success',
                                    html: 'You Enter Purchase Price is ' + result
                                })
                            })
                        }
                    }
                    else
                    {
                        swal({
                            title: 'Enter GST Percentage',
                            input: 'number',
                            showCancelButton: true,
                            animation: false,
                            inputValidator: function(value) {
                                return new Promise(function(resolve, reject) {
                                    if (!(isNaN(value)))
                                    {

                                        $('#GSt_per').val(value);
                                        resolve()
                                    } else {
                                        reject('You need to Enter GST Percentage :)')
                                    }
                                })
                            }
                        }).then(function(result) {
                            swal({
                                type: 'success',
                                html: 'You Enter GST Percenatge is ' + result
                            })
                        })
                    }

                }
                else
                {
                    swal({
                        title: 'Select GST Type',
                        input: 'select',
                        inputOptions: {
                            'CGST & SGST': 'CGST & SGST',
                            'IGST': 'IGST',
                            'With Out GST': 'With Out GST',
                            'Include CGST & SGST': 'Include CGST & SGST',
                            'Include IGST': 'Include IGST'
                        },
                        inputPlaceholder: 'Select GST Type',
                        showCancelButton: true,
                        inputValidator: function(value) {
                            return new Promise(function(resolve, reject) {
                                if (value === 'CGST & SGST' || value === 'IGST' || value === 'With Out GST' || value === 'Include CGST & SGST' || value === 'Include IGST')
                                {
                                    if (value === 'CGST & SGST') {
                                        $('#gst_type').val(1);
                                    } else if (value === 'IGST') {
                                        $('#gst_type').val(2);
                                    }
                                    else if (value === 'With Out GST') {
                                        $('#gst_type').val(3);
                                    }
                                    else if (value === 'Include CGST & SGST') {
                                        $('#gst_type').val(4);
                                    }
                                    else
                                    {
                                        $('#gst_type').val(5);
                                    }
                                    resolve()

                                } else {
                                    reject('You need to select Ukraine :)')
                                }
                            })
                        }
                    }).then(function(result) {
                        swal({
                            type: 'success',
                            html: 'You selected: ' + result
                        })
                    })
                }
            });

        });

    </script> 



    <script type="text/javascript">

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
        function valid()
        {

            var Vendor_Id = document.getElementById('Vendor_Id').value;

            var InvoiceNo = document.getElementById('InvoiceNo').value;
            var paymentmode = document.getElementById('paymentmode').value;
            var amountinword = document.getElementById('amountinword').value;
            var Net_Amount = document.getElementById('Net_Amount').value;


            if (!(InvoiceNo === ""))
            {
                if (!(Vendor_Id === ""))
                {
                    if (!(paymentmode === ""))
                    {
                        $('#amountinword').val(converAmount(parseInt(Net_Amount)));
                        return true;
                    }
                    else
                    {
                        swal({
                            title: 'Select Payment Mode',
                            input: 'select',
                            inputOptions: {
                                'Cash': 'Cash',
                                'Credit': 'Credit'

                            },
                            inputPlaceholder: 'Select Payment Mode',
                            showCancelButton: true,
                            inputValidator: function(value) {
                                return new Promise(function(resolve, reject) {
                                    if (value === 'Cash' || value === 'Credit')
                                    {
                                        if (value === 'Cash') {
                                            $('#paymentmode').val("Cash");
                                        }
                                        else
                                        {
                                            $('#paymentmode').val("Credit");
                                        }
                                        resolve()
                                        return true;

                                    } else {
                                        reject('You need to select Ukraine :)')
                                    }
                                })
                            }
                        }).then(function(result) {
                            swal({
                                type: 'success',
                                html: 'You selected: ' + result
                            })
                        })
                    }

                } else
                {
                    swal({
                        title: 'These is not allowed.!',
                        html: $('<div>')
                                .addClass('some-class')
                                .text('Select Vendor '),
                        animation: false,
                        customClass: 'animated tada'
                    })
                    return false;
                }
            }
            else
            {
                swal({
                    title: 'Enter Invoice No',
                    input: 'number',
                    showCancelButton: true,
                    animation: false,
                    inputValidator: function(value) {
                        return new Promise(function(resolve, reject) {
                            if (!(isNaN(value)))
                            {

                                $('#InvoiceNo').val(value);
                                resolve()
                                return false;
                            } else {
                                reject('You need to Enter InvoiceNo  :)')
                                return false;
                            }
                        })
                    }
                })

            }
        }





    </script>
    <script type="text/javascript">


        function alpha(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32);
        }
        function alpha1(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || (k > 47 && k < 58) || (k > 96 && k < 123) || k == 8 || k == 32);
        }
        $('#adminMobileNo').blur(function() {

            var contact = $('#adminMobileNo').val().length;
            if (contact == 10)
            {
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

                                $('#adminMobileNo').val(value);
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


            }
        });




    </script>
    <script type="text/javascript">

        $(document).ready(function() {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                //viewMode: "years"
                defaultDate: new Date(),
                sideBySide: true
            });


        });
    </script>

    <%        PurchaseTempDao td = new PurchaseTempDao();
        td.deleteProduct();

    %>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">

                <%@ include file = "../comman_files/adminSideBarForBilling.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div  role="main">
                    <div class="">



                        <div class="clearfix"></div>

                        <div class="row">

                            <form action="../../SaveOrder" method="post" onsubmit="return valid();">

                                <%                                          if (session.getAttribute("i") != null) {
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


                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="x_panel">
                                            <div class="x_title">
                                                <h2>Purchase Details</h2>
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






                                                <div class="row" >
                                                    <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                        <div class="form-group">
                                                            <div class="col-md-3 col-sm-12 col-xs-12">




                                                                <%
                                                                    PurchaseDao cd = new PurchaseDao();
                                                                    long id = Long.parseLong(request.getParameter("id"));
                                                                    System.out.println("id=" + id);
                                                                    PurchaseProduct p = new PurchaseProduct();
                                                                    p = cd.getProductById2(id);
                                                                    System.out.println("p=" + p);
                                                                    int i = 0;
                                                                    float finalAmount = 0;


                                                                %>
                                                                <input type="text" id="BillNo" name="BillNo" readonly="" value="Bill No-<%=id%>" required="required" placeholder="Bill No"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                <input type="hidden" id="purchaseid" name="purchaseid" readonly="" value="<%=id%>" required="required" placeholder="Bill No"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                            </div>
                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                <select type="text" id="gst_type" name="gst_type"  required="required" placeholder="Invoice Number"  class="form-control"> 
                                                                    <%
                                                                        if (p.getGSTType().equals("1")) {
                                                                    %>

                                                                    <option selected="selected" value="1">CGST & SGST</option>
                                                                    <option value="2">IGST</option>
                                                                    <option value="3">With Out GST</option>
                                                                    <option value="4">Include CGST & SGST</option>
                                                                    <option value="5">Include IGST</option>


                                                                    <%} else if (p.getGSTType().equals("2")) {
                                                                    %>
                                                                    <option value="1">CGST & SGST</option>
                                                                    <option selected="selected" value="2">IGST</option>
                                                                    <option value="3">With Out GST</option>
                                                                    <option value="4">Include CGST & SGST</option>
                                                                    <option value="5">Include IGST</option>
                                                                    <%} else if (p.getGSTType().equals("3")) {
                                                                    %>
                                                                    <option value="1">CGST & SGST</option>
                                                                    <option value="2">IGST</option>
                                                                    <option selected="selected" value="3">With Out GST</option>
                                                                    <option value="4">Include CGST & SGST</option>
                                                                    <option value="5">Include IGST</option>
                                                                    <%} else if (p.getGSTType().equals("4")) {
                                                                    %>
                                                                    <option value="1">CGST & SGST</option>
                                                                    <option value="2">IGST</option>
                                                                    <option value="3">With Out GST</option>
                                                                    <option selected="selected" value="4">Include CGST & SGST</option>
                                                                    <option value="5">Include IGST</option>
                                                                    <%} else {
                                                                    %>
                                                                    <option value="1">CGST & SGST</option>
                                                                    <option value="2">IGST</option>
                                                                    <option value="3">With Out GST</option>
                                                                    <option value="4">Include CGST & SGST</option>
                                                                    <option selected="selected" value="5">Include IGST</option>
                                                                    <%}%>
                                                                </select>
                                                            </div>


                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                <input placeholder="Date Of Purchase" value="<%=p.getPurchase_Date()%>" type="text" id="datetimepicke" required=""  name="DateOfPurchase"  class="form-control ">
                                                            </div>
                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                <input type="text" id="InvoiceNo" name="InvoiceNo" value="<%=p.getInvoiceID()%>"  required="required" placeholder="Invoice  No"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <br>
                                                <div class="row">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">     
                                                        <div class="col-md-3 col-sm-12 col-xs-12">
                                                            <select type="text"  id="Vendor_Id" name="Vendor_Id" onkeypress="return alpha(event)" required="required"   class="form-control priceup"> 

                                                                <%                                                                Venderregistration v = new Venderregistration();
                                                                    VendorDao vdo = new VendorDao();
                                                                    List<Venderregistration> vr = vdo.getAllVendor();
                                                                    for (Venderregistration vv : vr) {

                                                                        if (p.getVendorid().getId() == vv.getId()) {


                                                                %>
                                                                <option selected="selected" value="<%=vv.getId()%>"><%=vv.getVendorname()%></option>

                                                                <%

                                                                } else {
                                                                %>
                                                                <option  value="<%=vv.getId()%>"><%=vv.getVendorname()%></option>
                                                                <%
                                                                        }
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>
                                                        <div id="output">
                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                <input type="text" value="<%=p.getVendorid().getVendorname()%>" id="Hsn" name="Hsn" readonly="" required="required" placeholder="Vendor Name"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                            </div>   



                                                        </div>
                                                        <div class="col-md-3 col-sm-12 col-xs-12">


                                                            <select type="text" id="paymentmode" name="paymentmode"  required="required" placeholder="Invoice Number"  class="form-control"> 

                                                                <%
                                                                    if (p.getPaymentmode().equals("Cash")) {
                                                                %>
                                                                <option selected="selected" value="Cash">Cash</option>
                                                                <%} else {%>
                                                                <option value="Credit">Credit</option>
                                                                <%}%>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-3 col-sm-12 col-xs-12">
                                                            <input placeholder="GST Percentage" type="text" value="<%=p.getGstpercenatge()%>" id="GSt_per" name="GSt_per"  class="form-control ">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="clearfix"></div>

                                            </div>

                                            <div class="x_content">






                                                <div class="row" >
                                                    <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                        <div class="form-group" id="productfetch">

                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                <select type="text" name="Category" id="Category"  class="form-control product">
                                                                    <option value="">Select Category</option>
                                                                    <%  CategoryDao dao = new CategoryDao();
                                                                        Category bm = new Category();
                                                                        List<Category> model = dao.getAllCategory(bm);
                                                                        for (Category gm : model) {


                                                                    %>
                                                                    <option value="<%=gm.getId()%>"><%=gm.getCategory()%></option>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </select>    
                                                            </div>

                                                            <div id="output1">
                                                                <div class="col-md-2 col-sm-12 col-xs-12">

                                                                    <select type="text" name="SubCategory" id="SubCategory" required="" class="form-control product">
                                                                        <option value="">Select Sub category</option>
                                                                    </select>
                                                                </div>
                                                                <div id="output2">


                                                                    <div class="col-md-2 col-sm-12 col-xs-12">
                                                                        <select type="text" name="Brand" id="Brand"  class="form-control productsearch product">
                                                                            <option value="">Select Brand</option>

                                                                        </select>  
                                                                    </div>
                                                                    <div id="output2">
                                                                        <div class="col-md-2 col-sm-12 col-xs-12">
                                                                            <select type="text" name="Model" id="Model"  class="form-control productsearch product">
                                                                                <option value="">Select Model</option>

                                                                            </select>    
                                                                        </div> 
                                                                        <div id="output3">
                                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                                <select type="text" name="ColorName" id="ColorName"  class="form-control productsearch product">
                                                                                    <option value="">Select Color</option>


                                                                                </select>     
                                                                            </div></div>
                                                                    </div>
                                                                </div>
                                                            </div>



                                                        </div>

                                                    </div>
                                                </div>
                                                <br>
                                                <div class="row">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">   
                                                        <div class="col-md-9 col-sm-12 col-xs-12">  
                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                <input type="text" id="Quantity" name="Quantity"   placeholder="Quantity"  class="form-control totalamount ">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                            </div>

                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                <input type="text" id="purchase_price" name="purchase_price" placeholder="Purchase Price"  class="form-control totalamount ">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                            </div>

                                                            <div class="col-md-3 col-sm-12 col-xs-12">
                                                                <input type="text" id="MRP_PRice" name="MRP_PRice"   placeholder="MRP"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                            </div>   




                                                            <div class="col-md-3 col-sm-12 col-xs-12">


                                                                <input type="text" id="Total_Amount" name="Total_Amount"  required="required" placeholder="Total Amount" readonly=""  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                            </div>
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
                                                        <table id="datatable-buttons" class="table table-striped table-bordered">
                                                            <thead>
                                                                <tr>

                                                                    <th class="table_center">Sr No</th>
                                                                    <th class="table_center">Model No </th>
                                                                    <th class="table_center">Category </th>
                                                                    <th class="table_center">Brand </th>
                                                                    <th class="table_center">Color </th>
                                                                    <th class="table_center">Purchase Price</th>
                                                                    <th class="table_center">Quantity</th>
                                                                    <th class="table_center">Barcode No</th>
                                                                    <th class="table_center">CGST %</th>
                                                                    <th class="table_center">CGST Amount</th>
                                                                    <th class="table_center">SGST %</th>
                                                                    <th class="table_center">SGST Amount</th>
                                                                    <th class="table_center">IGST %</th>

                                                                    <th class="table_center">IGST Amount</th>
                                                                    <th class="table_center">Taxable Amount</th>
                                                                    <th class="table_center">Total Amount</th>
                                                                    <th class="table_center">Final Amount</th>




                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                                <%
                                                                    float Grossamount = 0;
                                                                    float grosscgst = 0;
                                                                    float grosssgst = 0;
                                                                    float grossigst = 0;
                                                                    float finalamount = 0;
                                                                    for (PurchaseDetails pp : p.getPurchaseDetails()) {
                                                                        Grossamount = Grossamount + pp.getTotal();
                                                                        grosscgst = grosscgst + pp.getCgstamount();
                                                                        grosssgst = grosssgst + pp.getSgstamount();
                                                                        grossigst = grossigst + pp.getIgstamount();
                                                                        finalamount = finalamount + pp.getFinalAmount();

                                                                        PurchaseTemp pt = new PurchaseTemp();
                                                                        PurchaseTempDao pd = new PurchaseTempDao();

                                                                        pt.setBrand(pp.getProductModel().getBrand());
                                                                        pt.setCategory(pp.getProductModel().getCategory());
                                                                        pt.setSubCategory(pp.getProductModel().getSubCategory());
                                                                        pt.setCgstamount(pp.getCgstamount());
                                                                        pt.setCgstper(pp.getCgstper());
                                                                        pt.setColorModel(pp.getProductModel().getColorModel());
                                                                        pt.setFinalAmount(pp.getFinalAmount());
                                                                        pt.setIgstamount(pp.getIgstamount());
                                                                        pt.setIgstper(pp.getIgstper());
                                                                        pt.setModel(pp.getProductModel().getModel());
//    pt.setProduct_id(product_id);
                                                                        pt.setPurchasePrice(pp.getPurchasePrice());
                                                                        pt.setQuantity(pp.getQuantity());
                                                                        pt.setSgstamount(pp.getCgstamount());
                                                                        pt.setSgstper(pp.getSgstper());
                                                                        pt.setTaxableAmount(pp.getTaxableAmount());
                                                                        pt.setTotal(pp.getTotal());
                                                                        pt.setMrpprice(pp.getProductModel().getUnitPrice());
                                                                        pd.Addproduct(pt);

                                                                        i++;


                                                                %>
                                                                <tr>
                                                                    <td class="table_center"><%=i%></td>

                                                                    <td class="table_center"><%=pp.getProductModel().getModel().getModelName()%> </td>
                                                                    <td class="table_center"><%=pp.getProductModel().getCategory().getCategory()%> </td>
                                                                    <td class="table_center"><%=pp.getProductModel().getBrand().getBrand()%> </td>
                                                                    <td class="table_center"><%=pp.getProductModel().getColorModel().getColorName()%> </td>
                                                                    <td class="table_center"><%=pp.getPurchasePrice()%> </td>
                                                                    <td class="table_center"><%=pp.getQuantity()%> </td>
                                                                    <td class="table_center"><%=pp.getProductModel().getProductBarcode()%> </td>
                                                                    <td class="table_center"><%=pp.getCgstper()%></td>
                                                                    <td class="table_center"><%=pp.getCgstamount()%></td> 
                                                                    <td class="table_center"><%=pp.getSgstper()%></td> 
                                                                    <td class="table_center"><%=pp.getSgstamount()%></td> 
                                                                    <td class="table_center"><%=pp.getIgstper()%></td>

                                                                    <td class="table_center"><%=pp.getIgstamount()%></td> 
                                                                    <td class="table_center"><%=pp.getTaxableAmount()%></td> 
                                                                    <td class="table_center"><%=pp.getTotal()%></td> 
                                                                    <td class="table_center"><%=finalAmount%></td> 



                                                                </tr> 
                                                                <%

                                                                    }
                                                                %>

                                                            </tbody>
                                                        </table>

                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">     
                                                        <div class="col-md-3 col-sm-12 col-xs-12">
                                                            <label>Gross Amount</label>
                                                            <input type="text" id="GrossAmount" name="GrossAmount" value="<%=Grossamount%>" required="required" readonly="" placeholder="Gross Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                        </div>

                                                        <div class="col-md-6 col-sm-12 col-xs-12 text-center">


                                                            <div class="row">  

                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                    <label class="text-center" >CGST Amount</label>
                                                                    <input type="text" id="CGST_Amount" name="CGST_Amount" value="<%=p.getGrandcgst()%>" readonly=""  placeholder="CGST_Amount"  class="form-control">  
                                                                </div>          
                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                    <label class="text-center" >SGST Amount</label>
                                                                    <input type="text" id="SGST_Amount" name="SGST_Amount" value="<%=p.getGrandsgst()%>" readonly="" placeholder="SGST_Amount"  class="form-control">  
                                                                </div>          
                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                    <label class="text-center" >IGST Amount</label>
                                                                    <input type="text" id="IGST_Amount" name="IGST_Amount"  value="<%=p.getGrandigst()%>" readonly="" placeholder="IGST_Amount"  class="form-control">  
                                                                </div>          
                                                            </div>   
                                                        </div>   




                                                        <div class="col-md-3 col-sm-12 col-xs-12 text-center">
                                                            <label class="text-center" >Total  Amount</label>

                                                            <input type="text" id="Total_Amount" name="Total_Amount"  value="<%=p.getGrandTotal()%>" required="required" placeholder="Total Amount" readonly=""  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 text-center">
                                                        <label class="text-center" >Other Charges</label>

                                                        <input type="text" id="Other_Charges" name="Other_Charges" value="<%=p.getOthercharges()%>" readonly="" required="required" placeholder="Other_Charges"   class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 text-center">
                                                        <label class="text-center" >Discount Amount</label>

                                                        <input type="text" id="Discount_Amount" name="Discount_Amount" value="<%=p.getDiscountamount()%>" readonly="" required="required" placeholder="Discount_Amount"   class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 text-center">
                                                        <label class="text-center" >Net Amount</label>

                                                        <input type="text" id="Net_Amount" name="Net_Amount" value="<%=finalamount + p.getOthercharges() - p.getDiscountamount()%>" readonly="" required="required" placeholder="Net_Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="x_content">
                                                <div class="row">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 text-center"></div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 text-center">
                                                        <input type="hidden" name="amountinword" id="amountinword">
                                                        <input type="submit"  class="btn1 btn btn-success hidebutton Save" value="Save Order"   name="Save_Order">

                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 text-center"></div>
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
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

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
    <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
    <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>


    <!-- Custom Theme Scripts -->

    <script src="../production/js/Swal.js" type="text/javascript"></script>

    <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>

</body>


<script type="text/javascript">
                                                                $(document).ready(function() {
                                                                    // alert('fsdfsdf');
                                                                    $('.product').change(function() {
                                                                        var id = this.id;

                                                                        var count = 0;
                                                                        if (id == "Category")
                                                                        {
                                                                            count = 1;
                                                                        } else if (id == "SubCategory")
                                                                        {
                                                                            count = 2;
                                                                        }
                                                                        else if (id == "Brand")
                                                                        {
                                                                            count = 3;
                                                                        }
                                                                        else if (id == "Model")
                                                                        {
                                                                            count = 4;
                                                                        }
                                                                        else
                                                                        {
                                                                            count = 5;
                                                                        }

                                                                        var Category = $('#Category').val();
                                                                        var SubCategory = $('#SubCategory').val();
                                                                        var Model = $('#Model').val();
                                                                        var Brand = $('#Brand').val();
                                                                        var ColorName = $('#ColorName').val();

                                                                        $.get("AjaxPages/FetchSubCategoryInPurchase.jsp", {SubCategory: SubCategory, Model: Model, Brand: Brand, ColorName: ColorName, Category: Category, count: count}, function(data) {

                                                                            $('#productfetch').html(data);
                                                                        });

                                                                    });
                                                                });
</script>
<script type="text/javascript">
    $('document').ready(function() {
        $SIDEBAR_MENU.find("li.active ul").hide();

        $(".hidebutton").hide();



    });</script>



</html>