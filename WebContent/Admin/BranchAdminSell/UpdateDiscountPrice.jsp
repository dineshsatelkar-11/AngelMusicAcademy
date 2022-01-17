

<%@page import="com.accede.angel.sell.model.TempCustomerSell"%>
<%@page import="com.accede.angel.sell.dao.CustomerSellDAO"%>
<%@page import="com.accede.angel.sell.dao.BranchProductDao"%>
<%@page import="com.accede.angel.sell.model.BranchProduct"%>
<script src="../production/css/Alertajax.js" type="text/javascript"></script>
<link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>
<script src="../production/js/Swal.js" type="text/javascript"></script>

<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.model.TempSaleforBranch"%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
<%@page import="com.accede.angel.admin.dao.ProductDao"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.sell.dao.TempproductDao"%>

<script type="text/javascript">
    $(document).ready(function() {
        //  alert('adsjhfgadsf');
        $('.productchange3').blur(function(event) {
        
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
            alert("discountprice1"+discountprice1);
            var price1 = $("#" + price).val();
            alert("price1"+price1); 

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

        $('.productchange1').blur(function(event) {
           
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
         
            var price1 = $("#" + price).val();
  var discountprice1 = $("#" + discountprice).val();
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
   
       
       
   
        $('.remove_prd').click(function(event) {

            //alert("aaaaaaaaaaaaaaaaaaa");
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
                    url: "ProductdeleteAjax.jsp",
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

    });
</script>

<%
   long quantity = Long.parseLong(request.getParameter("quantity"));
    System.out.println("Qty========"+quantity);
    String adminid = request.getParameter("adminid");
    System.out.println("adminid========"+adminid);
    String productbarcode = request.getParameter("id");
    float mrpprice = Float.parseFloat(request.getParameter("price1"));
    float discountprice1 = Float.parseFloat(request.getParameter("discountprice1"));
    System.out.println("discount========"+discountprice1);
    System.out.println(productbarcode);
    BranchProduct bp1=new BranchProduct();
    int admin = Integer.parseInt(adminid);
   
    BranchProductDao bpd1=new BranchProductDao();
    bp1.setProductBarcode(productbarcode);
    bp1.setAdminid(admin);
    bp1 = bpd1.getproductdetails(bp1);
    
   
    int productid=bp1.getProductid();
    
    if(bp1!=null)
    {
   String productname=bp1.getProduct().getProductname();
   System.out.println("PRODUCTBAMW"+productname);
   String productdescription=bp1.getProduct().getDiscription();
   float productprice=bp1.getProduct().getUnitPrice();
  
   
   CustomerSellDAO tsd = new CustomerSellDAO();
   TempCustomerSell tc1 = new TempCustomerSell();
   TempCustomerSell tc = new TempCustomerSell();
   tc1=tsd.getTempProduct(productid);
   float price1=0.0f;
   float discount=0.0f;
   if(tc1==null)
   {
   
   
      
       tc.setProductBarcode(productbarcode);
       tc.setProductname(productname);
       tc.setProductprice(productprice);
      
       tc.setProductquantity(quantity);
      
       
       
       tc.setDiscountamount(discountprice1);
       float price = mrpprice*quantity;
       discount = (100 * discountprice1)/price;
       float total =price-discountprice1;
       tc.setDiscount(discount);
   
       tc.setDescription(productdescription);
       tc.setTotal(total);
    
   
    boolean  b = tsd.SaveProduct(tc);
   }
    else
    {
        
        
      tc1.setDiscountamount(discountprice1);
      tc1.setProductquantity(quantity);
      float finalquantity=tc1.getProductquantity();
      float price = mrpprice*finalquantity;
       discount = (100 * discountprice1)/price;
      tc1.setDiscount(discount);
    float total =price-discountprice1;
    
      tc1.setTotal(total);
    
      boolean  b = tsd.SaveProduct(tc1);
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
                                                                        <th  class="data_center"> Discount Amount </th> 
          
                                                                        <th  class="data_center">Product Quantity </th>
                                                                     
                                                                        <th  class="data_center"> Total </th>

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
                                                      
                                       <input type="hidden" name="product-<%=i%>" id="product-<%=i%>" value="<%=c1.getProductBarcode()%>">
                                       <td  class="data_center"><%=i%></td>
                                       <td   class="data_center"> <i id="<%=c1.getId()%>"  class="fa fa-remove remove_prd text-danger "></i> </td>
                                       <td  class="data_center"><%=c1.getProductname()%></td>
                                       <td  class="data_center"><%=c1.getDescription()%></td>
                                        <td  class="data_center"><input type="text" name="price-<%=i%>" class="productchange1" value="<%= c1.getProductprice()%>" id="price-<%=i%>"></td>   
                                       <td  class="data_center"><input type="text" name="dis-<%=i%>" class="productchange1" value="<%= c1.getDiscount()%>" id="dis-<%=i%>"></td>                
                                       <td  class="data_center"><input type="text" name="disprice-<%=i%>" class="productchange3" value="<%= c1.getDiscountamount()%>" id="disprice-<%=i%>"></td>                
                                      
                                       <td  class="data_center"><input type="text" name="quantity-<%=i%>" class="productchange1" value="<%= c1.getProductquantity()%>" id="quantity-<%=i%>"></td>                
                                     
                                       <td  class="data_center"><%=c1.getTotal()%></td>
                                 </tr>                                    
                                      <%
                            }
                                      
                                      %>                              
                                                                    
                                                                    
                                                                    
                                                                </tbody>
                                                            </table>
