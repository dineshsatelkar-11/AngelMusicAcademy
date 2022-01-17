
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
        
        
        
 $('#paymode').change(function() {

                    var paymode = $('#paymode').val();
                    $('#chequeno').show();
                    $('#bankname').show();
                    if (paymode == "Cash")
                    {
                        $('#chequeno').hide();
                        $('#bankname').hide();
                    }
                });
                
                
        $('.priceup').keyup(function() {

            var Other_Charges = $('#Other_Charges').val();
            var Discount_Amount = $('#Discount_Amount').val();
            var GrossAmount = $('#GrossAmount').val();


            $('#Net_Amount').val(parseInt(GrossAmount) + parseInt(Other_Charges) - parseInt(Discount_Amount));

        });




        $('.remove_prd').click(function(event) {


            var prdID = this.id;
            var Other_Charges = $('#Other_Charges').val();
            var Discount_Amount = $('#Discount_Amount').val();
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
                    url: "AjaxPages/CustomersellProoductDeleteAjax.jsp",
                    type: "post",
                    data: {prdID: prdID, Other_Charges: Other_Charges, Discount_Amount: Discount_Amount},
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

    });

</script>

<%
    String productbarcode = request.getParameter("Productname").trim();
    String adminid = request.getParameter("adminid");
    int admin = Integer.parseInt(adminid);
    System.out.println(productbarcode);
    BranchProduct bp1 = new BranchProduct();
    String Other_Charges = request.getParameter("Other_Charges");
    String Discount_Amount = request.getParameter("Discount_Amount");
    String Quantity = request.getParameter("Quantity");
    long quant = Long.parseLong(Quantity);
    float otheramount = Float.parseFloat(Other_Charges);
    float discountamo = Float.parseFloat(Discount_Amount);
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
            if ((quantity < productquantity) || quantity == productquantity) {
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



<%} else {

%>




<script>
    $('#document').ready(function() {
        swal({
            title: 'These is not allowed.!',
            html: $('<div>')
                    .addClass('some-class')
                    .text('Stock is Less than Enter quantity .'),
            animation: false,
            customClass: 'animated tada'
        })
    })

</script>



<%    }
} else {
    quantity = tc1.getProductquantity() + quantity;
    if ((quantity < productquantity) || quantity == productquantity) {

        tc1.setProductquantity(quantity);
        float finalquantity = tc1.getProductquantity();
        float price = productprice * quantity;
        tc1.setTotal(price);
        boolean b = tsd.SaveProduct(tc1);
    } else {

%>





<script>
    $('#document').ready(function() {
        swal({
            title: 'These is not allowed.!',
            html: $('<div>')
                    .addClass('some-class')
                    .text('Stock is Less than Enter quantity .'),
            animation: false,
            customClass: 'animated tada'
        })
    })

</script>


<%        }
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
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getModel().getModelName()%></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getBrand().getBrand()%></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getColorModel().getColorName()%></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getCategory().getCategory()%></td>
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
            <div class="col-md-3 col-sm-12 col-xs-12">
                <label>Gross Amount</label>
                <input type="text" id="GrossAmount" name="GrossAmount"   value="<%=grosstotal%>" readonly="" placeholder="Gross Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
            </div>



            <div class="col-md-3 col-sm-12 col-xs-12 text-center">
                <label class="text-center" >Other Charges</label>

                <input type="text" id="Other_Charges" name="Other_Charges" value="<%=otheramount%>" required="required" placeholder="Other_Charges"   class="form-control priceup">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
            </div>
            <div class="col-md-3 col-sm-12 col-xs-12 text-center">
                <label class="text-center" >Discount Amount</label>

                <input type="text" id="Discount_Amount" name="Discount_Amount" value="<%=discountamo%>"  required="required" placeholder="Discount_Amount"   class="form-control priceup">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
            </div>
            <div class="col-md-3 col-sm-12 col-xs-12 text-center">
                <label class="text-center" >Net Amount</label>

                <input type="text" id="Net_Amount" name="Net_Amount" value="<%=grosstotal + otheramount - discountamo%>"  readonly="" required="required" placeholder="Net_Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
            </div>




        </div>
    </div>
<br>
    
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12"> 
           <div class="col-md-4 col-sm-12 col-xs-12 text-center">
               <select class="form-control" required="" id="paymode" name="paymode">
                    <option value="">Select Payment Type</option>
                    <option value="Card">Card</option>
                    <option value="Cash">Cash</option>
                    <option value="Paytm">Paytm</option>
                    <option value="Net Banking">Net Banking</option>
                    <option value="Net Banking">Cheque</option>
                </select>
                <center > <span id="Pay_mode" style="color:red"> </span></center >
            </div>
         <div class="col-md-4 col-sm-12 col-xs-12 text-center">

                <input type="text" placeholder="Cheque No/Transction No" name="chequeno" class="form-control"     id="chequeno"  required>
            </div>
             <div class="col-md-4 col-sm-12 col-xs-12 text-center remsinglefee" id="cFeeRem">
           

                <input type="text" placeholder="Bank Name" name="bankname" class="form-control"   id="bankname"  required>
            </div>  



        </div>
    </div>
</div>


