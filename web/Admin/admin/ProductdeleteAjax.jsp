
<script src="../production/css/Alertajax.js" type="text/javascript"></script>
<link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>
<script src="../production/js/Swal.js" type="text/javascript"></script>

<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.model.TempSaleforBranch"%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>

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


            quantityid = quantityid.concat(res[1]);

//            discount = discount.concat(res[1]);
            productid = productid.concat(res[1]);
            var quantity = $("#" + quantityid).val();
//            var disc = $("#" + discount).val();
            var id = $("#" + productid).val();
//alert(prdID);
//alert(res);
//alert(quantityid);
//alert(quantityid);
//alert(productid);
//alert(quantity);
//alert(id);

            $.ajax({
                url: "UpdateQuantity.jsp",
                type: "post",
                data: { id: id,quantity:quantity},
                success: function(response) {
                    //   alert('success1');
                   $(".output1").html(response);
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
    System.out.println("garimaaaaaaa");
    String productId = request.getParameter("prdID");
    int productid = Integer.parseInt(productId);

    System.out.println("productid====" + productId);
    TempproductDao tem = new TempproductDao();

    Boolean i2 = tem.deleteProductByID(productid);
    System.out.println("product deleted");

%>


<table id="datatable" class="table table-striped table-bordered output1">
    <tr>
        <th  class="data_center" >Sr No.</th>
        <th  class="data_center">Delete</th>
        <th class="text-center" >Model No</th>
        <th class="text-center" >Brand</th>
        <th class="text-center" >Color</th>
        <th class="text-center" >Category</th>
        <th class="text-center" >Barcode</th>
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
<td  class="data_center"><%=c.getProductModel().getModel().getModelName()  %></td>
<td  class="data_center"><%=c.getProductModel().getBrand().getBrand() %></td>
<td  class="data_center"><%=c.getProductModel().getColorModel().getColorName()  %></td>
<td  class="data_center"><%=c.getProductModel().getCategory().getCategory() %></td>
<td  class="data_center"><%=c.getProductModel().getProductBarcode()%></td>
<td  class="data_center"><input type="text" name="quantity-<%=i%>" class="productchange" value="<%= c.getProductquantity()%>" id="quantity-<%=i%>"></td>                



</tr>

<%}%>


</tbody>
</table>

<script type="text/javascript">
    $(document).ready(function() {
  
    });

</script>