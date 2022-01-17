




<%@page import="com.accede.angel.sell.dao.PurchaseTempDao"%>
<%@page import="com.accede.angel.sell.dao.TempproductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.model.PurchaseTemp"%>


<script type="text/javascript">
    $(document).ready(function() {
        

        $('.remove_prd').click(function(event) {

           
            var prdID = this.id;
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
                    url: "AjaxPages/ProductdeleteAjax.jsp",
                    type: "post",
                    data: {prdID: prdID ,Other_Charges :Other_Charges ,Discount_Amount :Discount_Amount},
                })
                        .done(function(data) {
                            swal("Deleted!", "Your Product was successfully deleted!", "success");
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
    System.out.println("garimaaaaaaa");
    String productId = request.getParameter("prdID");
    int productid = Integer.parseInt(productId);
String Other_Charges = request.getParameter("Other_Charges");
    String Discount_Amount = request.getParameter("Discount_Amount");
  
    float otheramount = Float.parseFloat(Other_Charges);
    float discountamo = Float.parseFloat(Discount_Amount);
    System.out.println("productid====" + productId);
    PurchaseTempDao tem = new PurchaseTempDao();

    Boolean i2 = tem.deleteProductByID(productid);
    System.out.println("product deleted");

%>

<div class="x_content" id="output">
    <div class="x_content ">

        <div id="output1" class="table-responsive">
            <table id="datatable" class="table table-striped table-bordered">
                <thead> <tr>

                        <th  class="data_center">Delete</th>
                        <th class="text-center" >Quantity</th>
                        <th class="text-center" >Brand</th>
                        <th class="text-center" >Color</th>
                        <th class="text-center" >Model No</th>
                        <th class="text-center" >Category</th>
                        <th class="text-center" >Purchase Amount</th>

                        <th class="text-center" >Total Amount</th>
                        <th class="text-center" >CGST Amount</th>
                        <th class="text-center" >SGST Amount</th>
                        <th class="text-center" >IGST Amount</th>
                        <th class="text-center" >Gross Amount</th>






                    </tr>
                </thead>
                <tbody>
                    <%                PurchaseTemp p1 = new PurchaseTemp();

                        List<PurchaseTemp> alltempProduct = null;
                        alltempProduct = tem.getAllProducts();
                        int i = 0;
                        float Grossamount = 0;
                        float grosscgst = 0;
                        float grosssgst = 0;
                        float grossigst = 0;
                        float finalamount = 0;
                        for (PurchaseTemp c : alltempProduct) {
                            i++;
                            Grossamount = Grossamount + c.getTotal();
                            grosscgst = grosscgst + c.getCgstamount();
                            grosssgst = grosssgst + c.getSgstamount();
                            grossigst = grossigst + c.getIgstamount();
                            finalamount = finalamount + c.getFinalAmount();

                    %>  
                    <tr>

                           <td   class="data_center"> <i id="<%=c.getId()%>"  class="fa fa-remove remove_prd text-danger "></i> </td>
                        <td   class="data_center"> <%=c.getQuantity()%> </td>
                        <td   class="data_center"> <%=c.getBrand().getBrand()%> </td>
                        <td   class="data_center"> <%=c.getColorModel().getColorName() %> </td>
                        <td   class="data_center"> <%=c.getModel().getModelName() %> </td>
                        <td   class="data_center"> <%=c.getCategory().getCategory() %> </td>
                        <td   class="data_center"> <%=c.getPurchasePrice()%> </td>
                        <td   class="data_center"> <%=c.getTotal()%> </td>
                        <td   class="data_center"> <%=c.getCgstamount()%> </td>
                        <td   class="data_center"> <%=c.getSgstamount()%> </td>
                        <td   class="data_center"> <%=c.getIgstamount()%> </td>
                        <td   class="data_center"> <%=c.getFinalAmount()%> </td>
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
                <input type="text" id="GrossAmount" value="<%=Grossamount%>" name="GrossAmount"  required="required" readonly="" placeholder="Gross Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
            </div>

            <div class="col-md-6 col-sm-12 col-xs-12 text-center">


                <div class="row">  
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <label class="text-center" >CGST Amount</label>
                        <input type="text" readonly="" id="CGST_Amount" value="<%=grosscgst%>" name="CGST_Amount"  required="required" placeholder="CGST_Amount"  class="form-control">  
                    </div>          
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <label class="text-center" >SGST Amount</label>
                        <input type="text" readonly="" id="SGST_Amount" value="<%=grosssgst%>" name="SGST_Amount"  required="required" placeholder="SGST_Amount"  class="form-control">  
                    </div>          
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <label class="text-center" >IGST Amount</label>
                        <input type="text" readonly="" id="IGST_Amount" value="<%=grossigst%>" name="IGST_Amount"  required="required" placeholder="IGST_Amount"  class="form-control">  
                    </div>          
                </div>   
            </div>   




            <div class="col-md-3 col-sm-12 col-xs-12 text-center">
                <label class="text-center" >Total  Amount</label>

                <input type="text" id="Total_Amount" value="<%=finalamount%>" name="Total_Amount"  required="required" placeholder="Total Amount" readonly=""  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
            </div>

        </div>
    </div>
                <input type="hidden" name="finalamountt" value="<%=finalamount%>" id="finalamountt">
    <div class="row">
        <div class="col-md-4 col-sm-12 col-xs-12 text-center">
            <label class="text-center" >Other Charges</label>

            <input type="text" id="Other_Charges" name="Other_Charges"  required="required" placeholder="Other_Charges" value="<%=otheramount%>"  class="form-control priceup">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12 text-center">
            <label class="text-center" >Discount Amount</label>

            <input type="text" id="Discount_Amount" name="Discount_Amount"  required="required" placeholder="Discount_Amount"  value="<%=discountamo%>" class="form-control priceup">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12 text-center">
            <label class="text-center" >Net Amount</label>

            <input type="text" id="Net_Amount" readonly="" name="Net_Amount" value="<%=finalamount + otheramount - discountamo%>" required="required" placeholder="Net_Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
        </div>
    </div>
</div>