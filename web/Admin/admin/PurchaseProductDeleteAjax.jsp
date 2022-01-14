

<%@page import="com.accede.angel.sell.dao.PurchaseTempDao"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.model.PurchaseTemp"%>
<link href="../../css/SwalCss.css" rel="stylesheet" type="text/css"/>
<script src="../../js/Swal.js" type="text/javascript"></script>
<script src="../Alertajax.js" type="text/javascript"></script>
<!-- Custom Theme Style -->
<link href="../build/css/custom.min.css" rel="stylesheet">


<script type="text/javascript">
    $(document).ready(function() {
        
        $('.productchange').blur(function(event) {
            
            var prdID = this.id;
             
            
            var res = prdID.split("-");
            var quantityid = "quantity-";
          
            var productid = "product-";
            var PurchasePrice = "PurchasePrice-";
            //var UnitPrice = "UnitPrice-";
            var CGSTPerc = "CGSTrate-";
            var SGSTPerc = "SGSTrate-";
            var IGSTPerc = "IGSTrate-";
            
            
            quantityid = quantityid.concat(res[1]);
            productid = productid.concat(res[1]);
            PurchasePrice = PurchasePrice.concat(res[1]);
            
            //UnitPrice = UnitPrice.concat(res[1]);
            CGSTPerc = CGSTPerc.concat(res[1]);
            SGSTPerc = SGSTPerc.concat(res[1]);
            IGSTPerc = IGSTPerc.concat(res[1]);
            
            var quantity = $("#" + quantityid).val();
       
            var id = $("#" + productid).val().trim();
           
            var PurchasePrice1= $("#" + PurchasePrice).val().trim();
          //alert("Purchase===="+PurchasePrice1)
            //var UnitPrice1 = $("#" + UnitPrice).val().trim();
           
            var CGSTPerc1 = $("#" + CGSTPerc).val().trim();
         
            var SGSTPerc1 = $("#" + SGSTPerc).val().trim();
            var IGSTPerc1 = $("#" + IGSTPerc).val().trim();
           
            $.ajax({
                url: "UpdatePurchaseAjax.jsp",
                type: "get",
                data: {quantity: quantity,CGSTPerc1 :CGSTPerc1,SGSTPerc1 :SGSTPerc1,PurchasePrice1 :PurchasePrice1, IGSTPerc1 :IGSTPerc1,  id: id},
                success: function(response) {
                       
                    $("#output2").html(response);
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
                    url: "PurchaseProductDeleteAjax.jsp",
                    type: "post",
                    data: {prdID: prdID}
                })
                        .done(function(data) {
                            swal("Deleted!", "Your Product was successfully deleted!", "success");
                            $("#output2").html(data);
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
                            'Your Product  is safe :)',
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
    PurchaseTempDao tem = new PurchaseTempDao();

    Boolean i2 = tem.deleteProductByID(productid);
    System.out.println("product deleted");

%>




<div class="row" id="output2">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>All Invoice Details </h2>   
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
                <!--                                        <p class="text-muted font-13 m-b-30">
                                                            The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                        </p>-->
                <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center" >Sr.No</th>
                            <th class="text-center" >Delete</th>
                                                        <th class="text-center" >Product Name</th>
                                                        <th class="text-center" >Purchase Price</th>
                                                        <th class="text-center" >Quantity</th>
                                                        <th class="text-center" >Total Amount</th>
                                                        <th class="text-center" >CGST (%)</th>
                                                        <th class="text-center" >CGST Amount</th>
                                                        <th class="text-center" >SGST (%)</th>
                                                        <th class="text-center" >SGST Amount</th>
                                                        <th class="text-center" >IGST (%)</th>
                                                        <th class="text-center" >IGST Amount</th>
                                                        <th class="text-center" >Taxable Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                PurchaseTemp p1 = new PurchaseTemp();
                            
                            List<PurchaseTemp> alltempProduct = null;
                            alltempProduct = tem.getAllProducts();
                            int i = 0;
                            float Grandtotal = 0;
                            for (PurchaseTemp c : alltempProduct) {
                                i++;
                                Grandtotal = Grandtotal + c.getTaxableAmount();

                        %>
                        <tr>
                    <input type="hidden" name="product-<%=i%>" class="productchange" value="<%= c.getBarcode()%>" id="product-<%=i%>">
                  <td class="data_center"><%=i%></td>  
                  <td   class="data_center"> <i id="<%=c.getId()%>"  class="fa fa-remove remove_prd text-danger "></i> </td>
                    <td class="data_center" id="prd_name<%=i%>"><%=c.getProductName()%></td>                                                   
                    <td  class="data_center"><input type="text" name="PurchasePrice-<%=i%>" id="PurchasePrice-<%=i%>" class="productchange" value="<%=c.getPurchasePrice()%>"></td>         
                                                <td class="data_center"><input type="text" name="quantity-<%=i%>" style="width: 35px" class="productchange" id="quantity-<%=i%>" value="<%=c.getQuantity()%>"></td>                                                   
                                                <td class="data_center" ><%=c.getTotal()%></td>                                                   
                                                <td class="data_center"><input type="text" style="width: 35px" name="CGSTrate-<%=i%>" class="productchange" id="CGSTrate-<%=i%>" value="<%=c.getCgstper()%>"></td>                                                 
                                                <td class="data_center"><%=c.getCgstamount()%></td>                                                   
                                                <td class="data_center"><input type="text" name="SGSTrate-<%=i%>" style="width: 35px" class="productchange" id="SGSTrate-<%=i%>" value="<%=c.getSgstper()%>"></td>                                                   
                                                <td class="data_center"><%=c.getSgstamount()%></td>                                                   
                                                <td class="data_center"><input type="text" name="IGSTrate-<%=i%>" style="width: 35px" class="productchange" id="IGSTrate-<%=i%>" value="<%=c.getIgstper()%>"></td>                                                   

                                                <td class="data_center"><%=c.getIgstamount()%></td>                                 
                                                <td class="data_center"><%=c.getTaxableAmount()%></td>                                 

                    </tr>

                    <%
                            
                        }
                        

                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="row">

        <div style="font-size: 30px; text-align:center; " class="col-md-12 col-sm-12 col-xs-12 ">
            Grand Total :-<span id="Grand_total"><%=Grandtotal%></span>
            <input type="hidden"  id="totalamounttt"  value="<%=Grandtotal%>" name="totalamounttt" placeholder=" Shop Name"  class="form-control">                               
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function() {
  
    });

</script>