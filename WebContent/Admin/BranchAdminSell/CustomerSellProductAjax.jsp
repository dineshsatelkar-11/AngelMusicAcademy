
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.dao.CustomerSellDAO"%>
<%@page import="com.accede.angel.sell.dao.TempSaleforBranchDAO"%>
<%@page import="com.accede.angel.sell.model.TempCustomerSell"%>
<%@page import="com.accede.angel.sell.dao.BranchProductDao"%>
<%@page import="com.accede.angel.sell.model.BranchProduct"%>
<script src="../production/css/Alertajax.js" type="text/javascript"></script>
<link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>
<script src="../production/js/Swal.js" type="text/javascript"></script>

<script>

    $(document).ready(function() {

$('.productchange3').blur(function(event) {
           alert("productchange3");
            var prdID = this.id;
             var adminid = $("#adminid").val();
           
            var res = prdID.split("-");
          
            var quantityid = "quantity-";
//          var discount = "discount-";
            var productid = "product-";
            var price = "price-";
            var discountprice="disprice-";
           
            quantityid = quantityid.concat(res[1]);
            price = price.concat(res[1]);
//          discount = discount.concat(res[1]);
            productid = productid.concat(res[1]);
            discountprice=discountprice.concat(res[1]);
            
           
            
            var quantity = $("#" + quantityid).val();
            
//          var disc = $("#" + discount).val();
            var id = $("#" + productid).val();
            var discountprice1 = $("#" + discountprice).val();
           
            var price1 = $("#" + price).val();
          

//alert(res);
//alert(quantityid);
//alert(quantityid);
//alert(productid);
//alert(quantity);
//alert(id);

            $.ajax({
                url: "UpdateDiscountPrice.jsp",
                type: "post",
               data: {id: id, quantity: quantity,price1:price1,adminid:adminid,discountprice1:discountprice1},
                success: function(response) {
                    //   alert('success1');
                    $(".output2").html(response);
                    //  alert('success2');
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });



        });
    


        $('.productchange').blur(function(event) {
          alert("Productchengeeee");
             var prdID = this.id;
             var adminid = $("#adminid").val();
           
            var res = prdID.split("-");
          
            var quantityid = "quantity-";
          
            var productid = "product-";
    //          var discount = "discount-";
            var productid = "product-";
            var price = "price-";
            var discount="dis-";
            quantityid = quantityid.concat(res[1]);
            price = price.concat(res[1]);
//          discount = discount.concat(res[1]);
            productid = productid.concat(res[1]);
            discount=discount.concat(res[1]);
          
        
            var quantity = $("#" + quantityid).val();

            var id = $("#" + productid).val();
            var discount1 = $("#" + discount).val();
         
            var price1 = $("#" + price).val();

//alert(res);
//alert(quantityid);
//alert(quantityid);
//alert(productid);
//alert(quantity);
//alert(id);

            $.ajax({
                url: "UpdateQuantityForCustomerSale.jsp",
                type: "post",
               data: {id: id, quantity: quantity,price1:price1,adminid:adminid,discount1:discount1},
                success: function(response) {
                    //   alert('success1');
                    $(".output2").html(response);
                    //  alert('success2');
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });



        });

        $('.remove_prd').click(function(event) {


            var prdID = this.id;

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
                    url: "CustomersellProoductDeleteAjax.jsp",
                    type: "post",
                    data: {prdID: prdID},
                })
                        .done(function(data) {
                            swal("Deleted!", " Product was successfully deleted!", "success");
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

    });

</script>

<%
    String productbarcode = request.getParameter("Productname");
    String adminid = request.getParameter("adminid");
    int admin = Integer.parseInt(adminid);
    System.out.println(productbarcode);
    BranchProduct bp1 = new BranchProduct();

    BranchProductDao bpd1 = new BranchProductDao();
    bp1.setProductBarcode(productbarcode);
    bp1.setAdminid(admin);
    bp1 = bpd1.getproductdetails(bp1);

    if (bp1 != null) {
        int productid = bp1.getProductid();
        long quantity = 1;
                float disocunt=0.0f;
                float discountamount =0.0f;
        String productname = bp1.getProduct().getProductname();
        System.out.println("PRODUCT" + productname);
        String productdescription = bp1.getProduct().getDiscription();
        float productprice = bp1.getProduct().getUnitPrice();
     
        long productquantity = bp1.getProductquantity();

        CustomerSellDAO tsd = new CustomerSellDAO();
        TempCustomerSell tc1 = new TempCustomerSell();
        TempCustomerSell tc = new TempCustomerSell();
        tc1 = tsd.getTempProduct(productbarcode);
        if (tc1 == null) {
          
          
            tc.setProductBarcode(productbarcode);
           
            tc.setProductquantity(quantity);
            
            float price = productprice * quantity;
          
            tc.setTotal(price);
          

            boolean b = tsd.SaveProduct(tc);
        } else {

            quantity = tc1.getProductquantity() + 1;
                tc1.setProductquantity(quantity);
                float finalquantity = tc1.getProductquantity();
                float price = productprice * finalquantity;
                tc1.setTotal(price);
                boolean b = tsd.SaveProduct(tc1);
        }
    }

%>
<table id="datatable-buttons" class="table table-striped table-bordered output2">
    <thead>
        <tr>
            <th  class="data_center" >Sr No.</th>
            <th  class="data_center">Delete</th>
            <th  class="data_center">Product Name</th>
            <th  class="data_center">Product Description</th> 
               <th  class="data_center">Product MRP Price</th>
            <th  class="data_center">Product Discount(%)</th> 
            
            <th  class="data_center"> Discount Amount</th> 
        
            <th  class="data_center">Product Quantity </th>
         
            <th  class="data_center">Total</th>

        </tr>
    </thead>
    <tbody>
        <%    
    
            TempCustomerSell p = new TempCustomerSell();
            CustomerSellDAO b1 = new CustomerSellDAO();
            List<TempCustomerSell> AllBrand1 = b1.getAllProduct();
            int i = 0;
            for (TempCustomerSell c1 : AllBrand1) {

                    i++;
        %>                                                       
        <tr>
  

    <td  class="data_center"><%=i%></td>
    <td   class="data_center"> <i id="<%=c1.getId()%>"  class="fa fa-remove remove_prd text-danger "></i> </td>
    <td  class="data_center"><%=c1.getProductname()%></td>
    <td  class="data_center"><%=c1.getDescription()%></td>
    <td  class="data_center"><input type="text" name="price-<%=i%>" class="productchange" value="<%= c1.getProductprice()%>" id="price-<%=i%>"></td>   
    <td  class="data_center"><input type="text" name="dis-<%=i%>" class="productchange" value="<%= c1.getDiscount()%>" id="dis-<%=i%>"></td>                
    <td  class="data_center"><input type="text" name="disprice-<%=i%>" class="productchange3" value="<%= c1.getDiscountamount()%>" id="disprice-<%=i%>"></td>                
  
    <td  class="data_center"><input type="text" name="quantity-<%=i%>" class="productchange" value="<%= c1.getProductquantity()%>" id="quantity-<%=i%>"></td>                
   
    <td  class="data_center"><%=c1.getTotal()%></td>
        </tr>                                    
        <%
            }

        %>                              



    </tbody>
</table>
