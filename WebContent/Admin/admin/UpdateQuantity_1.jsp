

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
          $('.productchange').blur(function(event) {

            var prdID = this.id;

            var res = prdID.split("-");
            var quantityid = "quantity-";
//            var discount = "discount-";
            var productid = "product-";
            var productavailableid = "productavailable-";


            quantityid = quantityid.concat(res[1]);

//            discount = discount.concat(res[1]);
            productid = productid.concat(res[1]);
            productavailableid = productavailableid.concat(res[1]);
            var quantity = $("#" + quantityid).val();
//            var disc = $("#" + discount).val();
            var id = $("#" + productid).val();
            var availble = $('#' + productavailableid).val();

//alert(prdID);
//alert(res);
//alert(quantityid);
//alert(quantityid);
//alert(productid);
//alert(quantity);
//alert(id);

if(quantity<=availble)
{
          

            $.ajax({
                url: "UpdateQuantity.jsp",
                type: "post",
                data: {id: id, quantity: quantity},
                success: function(response) {
                    //   alert('success1');
                    $(".output1").html(response);
                    //  alert('success2');
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });
            }
            else
            {
                 swal({
                            title: 'These is not allowed.!',
                            html: $('<div>')
                                    .addClass('some-class')
                                    .text('Stock is Less than Enter quantity .'),
                            animation: false,
                            customClass: 'animated tada'
                        }) 
            }


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
    TempproductDao tem = new TempproductDao();
    long quantity = Long.parseLong(request.getParameter("quantity"));
    System.out.println("Qty========"+quantity);
    
    String id = request.getParameter("id");
      System.out.println("id========"+id);
    ProductModel p = new ProductModel();
    ProductDao1 pro = new ProductDao1();
    p.setProductBarcode(id);
    p = pro.getproductdetails(p);
    if (p != null) {
        
        float unitprice = p.getUnitPrice();
        float MRPprice = p.getPurchasePrice();
        String productname = p.getProductname();
      

        int product_id = p.getId();
        
  
        String barcode = p.getProductBarcode();

        TempSaleforBranch tm = new TempSaleforBranch();
        TempSaleforBranch tm1 = new TempSaleforBranch();
        tm1 = tem.getTempProduct(product_id);
        if (tm1 == null) {
            tm.setProductBarcode(barcode);
          
            
            tm.setProductid(product_id);
            tm.setProductquantity(quantity);
         
            tm.setProductname(productname);

            boolean b = tem.saveBrachsale(tm);
        } else {

            System.out.println("Qty========"+quantity) ;
          
            tm1.setProductquantity(quantity);
           
          

            boolean b = tem.saveBrachsale(tm1);
        }
    }

%>


 <table id="datatable" class="table table-striped table-bordered output1">
         <tr>
            <th  class="data_center" >Sr No.</th>
            <th  class="data_center">Delete</th>
            <th  class="data_center">Product Name</th>
            <th  class="data_center">Sell Quantity</th>                
          
        </tr>
        </thead>
        <tbody> 
            <%                TempSaleforBranch p1 = new TempSaleforBranch();

                List<TempSaleforBranch> alltempProduct = null;
                alltempProduct = tem.getAllProducts();
                int i = 0;
                float Grandtotal = 0;
                for (TempSaleforBranch c : alltempProduct) {
                    i++;


            %>

            <tr>
          <input type="hidden" name="product-<%=i%>" class="productchange" value="<%= c.getProductBarcode()%>" id="product-<%=i%>">
           <input type="hidden" name="productavailable-<%=i%>" class="productchange" value="<%= c.getAvailableproductquantity()%>" id="productavailable-<%=i%>">
           <td  class="data_center"><%=i%></td>
                    <td   class="data_center"> <i id="<%=c.getId()%>"  class="fa fa-remove remove_prd text-danger "></i> </td>
                    <td  class="data_center"><%=c.getProductname()%></td>
                    <td  class="data_center"><input type="text" name="quantity-<%=i%>" class="productchange" value="<%= c.getProductquantity()%>" id="quantity-<%=i%>"></td>                
                   

               
    </tr>

<%}%>


        </tbody>
    </table>

