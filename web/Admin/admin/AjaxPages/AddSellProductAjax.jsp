
<%@page import="com.accede.angel.sell.dao.SubCatDao"%>
<%@page import="com.accede.angel.sell.model.SubCategory"%>
<%@page import="com.accede.angel.sell.dao.ModelDao"%>
<%@page import="com.accede.angel.sell.dao.ColorDao"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.dao.BrandDao"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.model.AddModel"%>
<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<script src="../../production/css/Alertajax.js" type="text/javascript"></script>
<link href="../../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>
<script src="../../production/js/Swal.js" type="text/javascript"></script>
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
            var productavailableid = "productavailable-";


            quantityid = quantityid.concat(res[1]);

//            discount = discount.concat(res[1]);
            productid = productid.concat(res[1]);

            productavailableid = productavailableid.concat(res[1]);
            var quantity = $("#" + quantityid).val();
//            var disc = $("#" + discount).val();
            var id =$("#" + productid).val();

            var availble = $('#' + productavailableid).val();



//alert(quantityid);
//alert(quantityid);
//alert(productid);
//alert(quantity);
//alert(id);

            if (parseInt(availble) > parseInt(quantity) )
            {


                $.ajax({
                    url: "UpdateQuantity.jsp",
                    type: "post",
                    data: {id: id, quantity: quantity},
                    success: function(response) {
                        
                        $(".output2").html(response);
                        
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
                            .text('Stock is Less than Enter quantity .....'),
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

    long Category =Long.parseLong(request.getParameter("Category"));
    String SubCate = request.getParameter("SubCategory");
 
    long SubCategoryid = Long.parseLong(SubCate);
    int Brand =Integer.parseInt(request.getParameter("Brand"));
    int Model = Integer.parseInt(request.getParameter("Model"));
    int ColorName = Integer.parseInt(request.getParameter("ColorName"));
    long Quantity = Long.parseLong(request.getParameter("Quantity"));
    ProductDao1 pro = new ProductDao1();

    ProductModel p = new ProductModel();
    
    AddModel am = new AddModel();
    Brand bn = new Brand();
    ColorModel cm = new ColorModel();
    Category ct = new Category();
     SubCategory sc=new  SubCategory();

//    am.setModelName(Model);
//    bn.setBrand(Brand);
//    cm.setColorName(ColorName);
//    ct.setCategory(Category);

    BrandDao bd = new BrandDao();
    CategoryDao cd = new CategoryDao();
    ModelDao md = new ModelDao();
    ColorDao cdd = new ColorDao();
    SubCatDao scd=new SubCatDao();

    am = md.getelementByID(Model);
    System.out.println("am=" + am);
    bn = bd.getelementByID(Brand);
    System.out.println("bn=" + bn);
    cm = cdd.getelementByID(ColorName);
     System.out.println("cm=" + cm);
    ct = cd.getelementByID(Category);
    sc=scd.getelementByID(SubCategoryid);
     System.out.println("ct=" + ct);
 System.out.println("am=" + am.getId());
 System.out.println("bn=" + bn.getId());
 System.out.println("cm=" + cm.getId());
 System.out.println("ct=" + ct.getId());
    p.setBrand(bn);
    p.setCategory(ct);
    p.setModel(am);
    p.setColorModel(cm);
    p.setSubCategory(sc);

    p = pro.getProductModel(p);
    TempproductDao tem = new TempproductDao();
    if (p != null) {

        String Productname = request.getParameter("Productname");

        float unitprice = p.getUnitPrice();
        float MRPprice = p.getPurchasePrice();

        String productname = p.getProductname();
        long productavailablequanity = p.getProductquantity();

        long quantity = Quantity;

        int product_id = p.getId();
        String Hsn = p.getHsn();
        String Discription = p.getDiscription();
        String barcode = p.getProductBarcode();

        TempSaleforBranch tm = new TempSaleforBranch();
        TempSaleforBranch tm1 = new TempSaleforBranch();
        System.out.println("id" + tm1);
        System.out.println("product_id=" + product_id);
        tm1 = tem.getTempProduct(product_id);
        if (tm1 == null) {
%>


<script type="text/javascript">
                                $('document').ready(function() {
                                  $('.savebutton').show();
       

                                });


</script>


<%
            if (quantity <= productavailablequanity) {

                tm.setProductid(product_id);
                tm.setProductquantity(quantity);
                tm.setProductBarcode(Productname);
                tm.setProductname(productname);
                tm.setProductModel(p);
                tm.setProductBarcode(p.getProductBarcode());
                tm.setAvailableproductquantity(productavailablequanity);
                boolean b = tem.saveBrachsale(tm);

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


<%    }
} else {

    quantity = tm1.getProductquantity() + quantity;

    if (quantity <= productavailablequanity) {

        tm1.setProductquantity(quantity);
        tm1.setProductModel(p);
        boolean b = tem.saveBrachsale(tm1);

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

%>


<%} else {%>

<script>
    $('#document').ready(function() {
        swal({
            title: 'These is not allowed.!',
            html: $('<div>')
                    .addClass('some-class')
                    .text('Product is not Available For These Requirement .'),
            animation: false,
            customClass: 'animated tada'
        })
    })

</script>
<%}%>     

<table id="datatable" class="table table-striped table-bordered output1">
    <tr>
        <th  class="data_center" >Sr No.</th>
        <th  class="data_center">Delete</th>
           <th class="text-center" >Category</th>
           <th class="text-center" >Sub-Category</th>
        <th class="text-center" >Brand</th>
        <th class="text-center" >Model No</th>
        
        <th class="text-center" >Color</th>
     
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
<input type="hidden" name="product-<%=c.getId()%>" class="productchange" value="<%= c.getProductBarcode()%>" id="product-<%=c.getId()%>">
<input type="hidden" name="productavailable-<%=c.getId()%>" class="productchange" value="<%= c.getAvailableproductquantity()%>" id="productavailable-<%=c.getId()%>">
<td  class="data_center"><%=i%></td>
<td   class="data_center"> <i id="<%=c.getId()%>"  class="fa fa-remove remove_prd text-danger "></i> </td>

<td  class="data_center"><%=c.getProductModel().getCategory().getCategory() %></td>
<td  class="data_center"><%=c.getProductModel().getSubCategory().getSubCategory()%></td>
<td  class="data_center"><%=c.getProductModel().getBrand().getBrand() %></td>
<td  class="data_center"><%=c.getProductModel().getModel().getModelName()  %></td>
<td  class="data_center"><%=c.getProductModel().getColorModel().getColorName()  %></td>
<td  class="data_center"><%=c.getProductModel().getProductBarcode()%></td>
<td  class="data_center"><input type="text" name="quantity-<%=c.getId()%>" class="productchange" value="<%= c.getProductquantity()%>" id="quantity-<%=c.getId()%>"></td>                



</tr>

<%}%>


</tbody>
</table>
















