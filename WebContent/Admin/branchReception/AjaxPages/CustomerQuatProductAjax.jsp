
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.dao.CustomerSellDAO"%>
<%@page import="com.accede.angel.sell.dao.TempSaleforBranchDAO"%>
<%@page import="com.accede.angel.sell.model.TempCustomerSell"%>
<%@page import="com.accede.angel.sell.dao.BranchProductDao"%>
<%@page import="com.accede.angel.sell.model.BranchProduct"%>
<script src="../../production/css/Alertajax.js" type="text/javascript"></script>
<link href="../../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>
<script src="../../production/js/Swal.js" type="text/javascript"></script>

<script>

    $(document).ready(function() {



        $('#Discount_Per').keyup(function() {

            var GrossAmount = $('#GrossAmount').val();
            var Other_Charges = $('#Other_Charges').val();


            var Discount_Per = $('#Discount_Per').val();
            if (Discount_Per == "")
            {
                Discount_Per = 0;
            }
            var Advance_Amount = $('#Advance_Amount').val();
            var net_Advance_Amount = $('#net_Advance_Amount').val();
            var balamt = $('#balamt').val();
            var paidamt = $('#paidamt').val();
            if (paidamt == "")
            {
                paidamt = 0;
            }
            var net_Advance_Amount = $('#net_Advance_Amount').val();

            var Discount_Amount = parseInt(parseInt(GrossAmount) * parseInt(Discount_Per) / 100);
            $('#Net_Amount').val(parseInt(GrossAmount) + parseInt(Other_Charges) - parseInt(Discount_Amount));

            $('#Discount_Amount').val(parseInt(parseInt(GrossAmount) * parseInt(Discount_Per) / 100));
            $('#paidamt').val(parseInt(paidamt));

            $('#net_Advance_Amount').val(parseInt(GrossAmount) + parseInt(Other_Charges) - parseInt(Discount_Amount) - parseInt(Advance_Amount));
            $('#paidamt').val(parseInt(paidamt));
            $('#balamt').val(parseInt(GrossAmount) + parseInt(Other_Charges) - parseInt(Discount_Amount) - parseInt(Advance_Amount) - parseInt(paidamt));
            $('#amountinword').val(parseInt(paidamt));



        });



        $('.priceup').keyup(function() {

            var GrossAmount = $('#GrossAmount').val();
            var Other_Charges = $('#Other_Charges').val();
            var Discount_Amount = $('#Discount_Amount').val();
            if (Discount_Amount == "")
            {
                Discount_Amount = 0;
            }
            var Discount_Per = $('#Discount_Per').val();
            var Advance_Amount = $('#Advance_Amount').val();
            var net_Advance_Amount = $('#net_Advance_Amount').val();
            var balamt = $('#balamt').val();
            var paidamt = $('#paidamt').val();
            if (paidamt == "")
            {
                paidamt = 0;
            }
            var net_Advance_Amount = $('#net_Advance_Amount').val();
            var disper = (Discount_Amount / GrossAmount) * 100;


            $('#Net_Amount').val(parseInt(GrossAmount) + parseInt(Other_Charges) - parseInt(Discount_Amount));
            $('#Discount_Per').val(parseInt(disper));
            $('#paidamt').val(parseInt(paidamt));

            $('#net_Advance_Amount').val(parseInt(GrossAmount) + parseInt(Other_Charges) - parseInt(Discount_Amount) - parseInt(Advance_Amount));
            $('#paidamt').val(parseInt(paidamt));
            $('#balamt').val(parseInt(GrossAmount) + parseInt(Other_Charges) - parseInt(Discount_Amount) - parseInt(Advance_Amount) - parseInt(paidamt));

            $('#amountinword').val(parseInt(paidamt));


        });




        $('.remove_prd').click(function(event) {


            var prdID = this.id;
            var Other_Charges = $('#Other_Charges').val();
            var Discount_Amount = $('#Discount_Amount').val();
            var Discount_Per = $('#Discount_Per').val();
             var paidamt = $("#paidamt").val();
                var advance = $("#advance").val();
                  if (Other_Charges === "")
                {
                    Other_Charges = 0;
                }
                  if (Discount_Per === "")
                {
                    Discount_Per = 0;
                }
                if (Discount_Amount === "")
                {
                    Discount_Amount = 0;
                }
                
                
                  if (paidamt === "")
                {
                    paidamt = 0;
                }
                  if (advance === "")
                {
                    advance = 0;
                }
            swal({
                title: "Are you sure?",
                text: "Are you sure, that you want to delete this Product?",
                type: "warning",
                showCancelButton: true,
                closeOnConfirm: false,
                confirmButtonText: "Yes, delete it!",
                confirmButtonColor: "#ec6c62"
            }).then(function() {
                $.ajax({
                    url: "AjaxPages/CustomerQuatProoductDeleteAjax.jsp",
                    type: "post",
                    data: {Discount_Per : Discount_Per ,prdID: prdID, Other_Charges: Other_Charges, Discount_Amount: Discount_Amount , paidamt: paidamt,advance:advance},
                })
                        .done(function(data) {
                            swal("Deleted!", " Product was successfully deleted!", "success");
                            $("#Report_Fetch").html(data);
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
    });

</script>

<%
    String productbarcode = request.getParameter("Productname").trim();
    String adminid = request.getParameter("adminid");
    String advance = request.getParameter("advance");
    String paidamt = request.getParameter("paidamt");
    int admin = Integer.parseInt(adminid);
    int paid = Integer.parseInt(paidamt);
    System.out.println(productbarcode);
    BranchProduct bp1 = new BranchProduct();
    String Other_Charges = request.getParameter("Other_Charges");
    String Discount_Amount = request.getParameter("Discount_Amount");
    String Quantity = request.getParameter("Quantity");
    String Discount_P = request.getParameter("Discount_Per");
    long quant = Long.parseLong(Quantity);
    float otheramount = Float.parseFloat(Other_Charges);
    float advanceamount = Float.parseFloat(advance);
    float discountamo = Float.parseFloat(Discount_Amount);
    float Discount_Per = Float.parseFloat(Discount_P);
    BranchProductDao bpd1 = new BranchProductDao();
    bp1.setProductBarcode(productbarcode);
    bp1.setAdminid(admin);
    bp1 = bpd1.getproductdetailsbybarcodeandadmin(bp1);
    long quantity = 0;
    if (bp1 != null) {
        int productid = bp1.getProductid();
        if (quant == 0) {
            quantity = 1;
        } else {
            quantity = quant;
        }

        float productprice = bp1.getProduct().getUnitPrice();

        long productquantity = bp1.getProductquantity();

        CustomerSellDAO tsd = new CustomerSellDAO();
        TempCustomerSell tc1 = new TempCustomerSell();
        TempCustomerSell tc = new TempCustomerSell();
        tc1 = tsd.getTempProduct(productbarcode);
        if (tc1 == null) {
          
                tc.setProductBarcode(productbarcode);

                tc.setProductquantity(quantity);
                tc.setBranchProduct(bp1);
                float price = productprice * quantity;

                tc.setTotal(price);

                boolean b = tsd.SaveProduct(tc);

%>



<script>
    $('#document').ready(function() {
        $(".btn1").show();
    })

</script>




<%    
} else {
    quantity = tc1.getProductquantity() + quantity;
   

        tc1.setProductquantity(quantity);
        float finalquantity = tc1.getProductquantity();
        float price = productprice * quantity;
        tc1.setTotal(price);
        boolean b = tsd.SaveProduct(tc1);
   
        

%>



<%        
    }
} else {

%>





<script>
    $('#document').ready(function() {
        swal({
            title: 'These is not allowed.!',
            html: $('<div>')
                    .addClass('some-class')
                    .text('Enter Correct Barcode....'),
            animation: false,
            customClass: 'animated tada'
        })
    })

</script>




<%    }

%>


<div  id="Report_Fetch">
    <div class="x_content ">

        <div id="output1">
            <table id="datatable" class="table table-striped table-bordered">
                <thead> <tr>

                        <th  class="data_center">Sr No</th>
                        <th  class="data_center">Delete</th>
                        <th class="text-center" >Category</th>
                        <th class="text-center" >Sub-Category</th>
                        <th class="text-center" >Brand</th>
                        <th class="text-center" >Model No</th>

                        <th class="text-center" >Color</th>

                        <th class="text-center" >Barcode</th>
                        <th class="text-center" >Quantity</th>



                        <th class="text-center" >MRP</th>


                        <th class="text-center" >Net Amount</th>






                    </tr>
                </thead>
                <tbody>
                    <%                        float grosstotal = 0;
                        TempCustomerSell p = new TempCustomerSell();
                        CustomerSellDAO b1 = new CustomerSellDAO();
                        List<TempCustomerSell> AllBrand1 = b1.getAllProduct();
                        int i = 0;
                        for (TempCustomerSell c1 : AllBrand1) {
                            grosstotal = c1.getTotal() + grosstotal;
                            i++;
                    %>                                                       
                    <tr>


                        <td  class="data_center"><%=i%></td>
                        <td   class="data_center"> <i id="<%=c1.getProductBarcode()%>"  class="fa fa-remove remove_prd text-danger "></i> </td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getCategory().getCategory()%></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getSubCategory().getSubCategory()%></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getBrand().getBrand()%></td>

                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getModel().getModelName()%></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getColorModel().getColorName()%></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getProductBarcode()%></td>

                        <td  class="data_center"><%=c1.getProductquantity()%></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getUnitPrice()%></td>
                        <td  class="data_center"><%=c1.getTotal()%></td>
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
            <div class="col-md-4 col-sm-12 col-xs-12 text-center">
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <label>Gross Amount</label>
                    <input type="text" id="GrossAmount" name="GrossAmount"   value="<%=grosstotal%>" readonly="" placeholder="Gross Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                </div>



                <div class="col-md-6 col-sm-12 col-xs-12 text-center">
                    <label class="text-center" >Other Charges</label>

                    <input type="text" id="Other_Charges" name="Other_Charges" onkeypress='return event.charCode >= 48 && event.charCode <= 57' value="<%=otheramount%>" required="required" placeholder="Other_Charges"   class="form-control priceup">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                </div>
            </div>
            <div class="col-md-8 col-sm-12 col-xs-12 text-center">
                <div class="col-md-4 col-sm-12 col-xs-12 text-center">
                    <label class="text-center" >Discount Per</label>

                    <input type="text" id="Discount_Per" name="Discount_Per" onkeypress='return event.charCode >= 48 && event.charCode <= 57' value="<%=Discount_Per%>"  required="required" placeholder="Discount_Amount"   class="form-control priceup">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                </div>
                <div class="col-md-4 col-sm-12 col-xs-12 text-center">
                    <label class="text-center" >Discount Amount</label>

                    <input type="text" id="Discount_Amount" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="Discount_Amount" value="<%=discountamo%>"  required="required" placeholder="Discount_Amount"   class="form-control priceup">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                </div>
                <div class="col-md-4 col-sm-12 col-xs-12 text-center">
                    <label class="text-center" >Net Amount</label>

                    <input type="text" id="Net_Amount" name="Net_Amount" value="<%=grosstotal + otheramount - discountamo%>"  readonly="" required="required" placeholder="Net_Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                </div>
            </div>




        </div>
    </div>
    <br>

    <div class="row">
       
                    <input type="hidden" id="Advance_Amount" name="Advance_Amount" value="<%=advanceamount%>"  readonly="" required="required" placeholder="Net_Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
               

                    <input type="hidden" id="net_Advance_Amount" name="net_Advance_Amount" value="<%=grosstotal + otheramount - discountamo - advanceamount%>"  readonly="" required="required" placeholder="Net_Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
               

               
                    <input type="hidden" placeholder="Paid Amount" name="paidamt" onkeypress='return event.charCode >= 48 && event.charCode <= 57' value="<%=paid%>" class="form-control priceup"   id="paidamt"  required>
              <input type="hidden" id="paymode" name="paymode" value="Cash"  readonly="" required="required" placeholder="Net_Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
              
                    <input type="hidden" placeholder=" Balance Amount" readonly="" name="balamt" class="form-control"  value="<%=grosstotal + otheramount - discountamo - advanceamount - paid%>"  id="balamt"  required>
               
                  </div>
          
</div>
<input type="hidden" name="amountinword" id="amountinword">


