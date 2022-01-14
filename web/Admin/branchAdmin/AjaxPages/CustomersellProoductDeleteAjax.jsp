
<%@page import="com.accede.angel.sell.model.TempCustomerSell"%>
<%@page import="com.accede.angel.sell.dao.CustomerSellDAO"%>

<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.model.TempSaleforBranch"%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
<%@page import="com.accede.angel.admin.dao.ProductDao"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.sell.dao.TempproductDao"%>

<script src="../../production/css/Alertajax.js" type="text/javascript"></script>
<link href="../../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>
<script src="../../production/js/Swal.js" type="text/javascript"></script>

<script>

    $(document).ready(function() {
 $('.priceup').keyup(function() {
        
                    var Other_Charges = $('#Other_Charges').val();
                    var Discount_Amount = $('#Discount_Amount').val();
                    var GrossAmount = $('#GrossAmount').val();

                 
                   $('#Net_Amount').val(parseInt(GrossAmount)+parseInt(Other_Charges)-parseInt(Discount_Amount));

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
                    data: {prdID: prdID , Other_Charges : Other_Charges , Discount_Amount : Discount_Amount},
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
   
    String productId = request.getParameter("prdID");
    
String Other_Charges = request.getParameter("Other_Charges");
    String Discount_Amount = request.getParameter("Discount_Amount");
   
    float otheramount = Float.parseFloat(Other_Charges);
    float discountamo = Float.parseFloat(Discount_Amount);
    System.out.println("productid====" + productId);
    CustomerSellDAO tem = new CustomerSellDAO();

    Boolean i2 = tem.deleteProductByID(productId);
    System.out.println("product deleted");

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
                    <%    
                       float grosstotal=0;
                        TempCustomerSell p = new TempCustomerSell();
                        CustomerSellDAO b1 = new CustomerSellDAO();
                        List<TempCustomerSell> AllBrand1 = b1.getAllProduct();
                        int i = 0;
                        for (TempCustomerSell c1 : AllBrand1) {
grosstotal=c1.getTotal()+grosstotal;
                                i++;
                    %>                                                       
                    <tr>


                        <td  class="data_center"><%=i%></td>
                        <td   class="data_center"> <i id="<%=c1.getProductBarcode()%>"  class="fa fa-remove remove_prd text-danger "></i> </td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getModel().getModelName() %></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getBrand().getBrand()%></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getColorModel().getColorName()%></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getCategory().getCategory()%></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getProductBarcode()%></td>
       
                        <td  class="data_center"><%=c1.getProductquantity()%></td>
                        <td  class="data_center"><%=c1.getBranchProduct().getProduct().getUnitPrice() %></td>
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

                <input type="text" id="Net_Amount" name="Net_Amount" value="<%=grosstotal+otheramount-discountamo%>"  readonly="" required="required" placeholder="Net_Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
            </div>




        </div>
    </div>
    
</div>