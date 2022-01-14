  <%@page import="com.accede.angel.sell.dao.PurchaseTempDao"%>
<%        PurchaseTempDao td = new PurchaseTempDao();
        td.deleteProduct();

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
                 
                </tbody>
            </table>

        </div>
    </div>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">     
            <div class="col-md-3 col-sm-12 col-xs-12">
                <label>Gross Amount</label>
                <input type="text" id="GrossAmount"  name="GrossAmount" readonly="" required="required" readonly="" placeholder="Gross Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
            </div>

            <div class="col-md-6 col-sm-12 col-xs-12 text-center">


                <div class="row">  
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <label class="text-center" >CGST Amount</label>
                        <input type="text" id="CGST_Amount"  name="CGST_Amount" readonly=""  required="required" placeholder="CGST_Amount"  class="form-control">  
                    </div>          
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <label class="text-center" >SGST Amount</label>
                        <input type="text" id="SGST_Amount" name="SGST_Amount"  readonly="" required="required" placeholder="SGST_Amount"  class="form-control">  
                    </div>          
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <label class="text-center" >IGST Amount</label>
                        <input type="text" id="IGST_Amount"  name="IGST_Amount" readonly="" required="required" placeholder="IGST_Amount"  class="form-control">  
                    </div>          
                </div>   
            </div>   




            <div class="col-md-3 col-sm-12 col-xs-12 text-center">
                <label class="text-center" >Total  Amount</label>

                <input type="text" id="Total_Amount"  name="Total_Amount" readonly="" required="required" placeholder="Total Amount" readonly=""  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
            </div>

        </div>
    </div>
            
            <input type="hidden" name="finalamountt"  id="finalamountt">
    <div class="row">
        <div class="col-md-4 col-sm-12 col-xs-12 text-center">
            <label class="text-center" >Other Charges</label>

            <input type="text" id="Other_Charges" name="Other_Charges" readonly="" required="required" placeholder="Other_Charges"   class="form-control priceup">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12 text-center">
            <label class="text-center" >Discount Amount</label>

            <input type="text" id="Discount_Amount" name="Discount_Amount" readonly="" required="required" placeholder="Discount_Amount"   class="form-control priceup">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12 text-center">
            <label class="text-center" >Net Amount</label>

            <input type="text" id="Net_Amount" name="Net_Amount" readonly="" required="required" placeholder="Net_Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
        </div>
    </div>
</div>