


<%@page import="com.accede.angel.sell.dao.ColorDao"%>
<%@page import="com.accede.angel.sell.dao.ModelDao"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.dao.BrandDao"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="com.accede.angel.sell.model.AddModel"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.dao.PurchaseTempDao"%>
<%@page import="com.accede.angel.sell.dao.PurchaseDao"%>
<%@page import="com.accede.angel.sell.model.PurchaseTemp"%>


<script type="text/javascript">
    $(document).ready(function() {
        $(".hidebutton").show();
  $('.priceup').keyup(function() {

            var Other_Charges = $('#Other_Charges').val();
            var Discount_Amount = $('#Discount_Amount').val();
            var GrossAmount = $('#finalamountt').val();

            $('#Net_Amount').val(parseInt(GrossAmount) + parseInt(Other_Charges) - parseInt(Discount_Amount));

        });
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
    String gst_type = request.getParameter("gst_type");
    String GSt_per = request.getParameter("GSt_per");
    String Other_Charges = request.getParameter("Other_Charges");
    String Discount_Amount = request.getParameter("Discount_Amount");
    float gstpercentage = Float.parseFloat(GSt_per);
    float otheramount = Float.parseFloat(Other_Charges);
    float discountamo = Float.parseFloat(Discount_Amount);
    String Category = request.getParameter("Category");
    String Brand = request.getParameter("Brand");
    String Model = request.getParameter("Model");
    String ColorName = request.getParameter("ColorName");
    int Brandid=Integer.parseInt(Brand);
    int Modelid=Integer.parseInt(Model);
    int ColorNameid=Integer.parseInt(ColorName);
    long Categoryid=Long.parseLong(Category);
    String MRP_PRice = request.getParameter("MRP_PRice");
    String purchase_price = request.getParameter("purchase_price");
    float purchaseamt = Float.parseFloat(purchase_price);
    float mrpprice = Float.parseFloat(MRP_PRice);

    String Quantity = request.getParameter("Quantity");
    long quant = Long.parseLong(Quantity);
    float cgstper = 0;
    float sgstper = 0;
    float igstper = 0;
    float cgstamt = 0;
    float sgstamt = 0;
    float igstamt = 0;

    if (gst_type.equals("1")) {
        cgstper = gstpercentage / 2;
        sgstper = gstpercentage / 2;
        cgstamt = quant * (cgstper * purchaseamt) / 100;
        sgstamt = quant * (sgstper * purchaseamt) / 100;
    } else if (gst_type.equals("2")) {

        igstper = gstpercentage;
        igstamt = quant * (igstper * purchaseamt) / 100;
    } else if (gst_type.equals("3")) {

    } else if (gst_type.equals("4")) {

        cgstamt = quant * (purchaseamt * gstpercentage) / (100 + gstpercentage);
        cgstamt = cgstamt / 2;
        sgstamt = cgstamt;

        purchaseamt = purchaseamt - (cgstamt / quant) - (sgstamt / quant);

    } else {

        igstper = gstpercentage;
        float amount = purchaseamt * igstper;
        System.out.println("amount=" + amount);
        igstamt = amount / (100 + igstper);
        purchaseamt = purchaseamt - igstamt;
        System.out.println("igstamt=" + igstamt);
        System.out.println("purchaseamt=" + purchaseamt);
        igstamt = igstamt * quant;
        System.out.println("igstamt=" + igstamt);

        System.out.println("igstper=" + igstper);
        System.out.println("igstamt=" + igstamt);

        System.out.println("purchaseamt=" + purchaseamt);
    }
    float totalgstamount = cgstamt + sgstamt + igstamt;
    float grossamount = (purchaseamt * quant) + cgstamt + sgstamt + igstamt;
    float total = (purchaseamt * quant);
    PurchaseTemp pt = new PurchaseTemp();
    PurchaseTempDao pd = new PurchaseTempDao();
    
     AddModel am = new AddModel();
                Brand bn = new Brand();
                ColorModel cm = new ColorModel();
                Category ct = new Category();
    BrandDao bd = new BrandDao();
                CategoryDao cd = new CategoryDao();
                ModelDao md = new ModelDao();
                ColorDao cdd = new ColorDao();
            am=md.getelementByID(Modelid);
            bn=bd.getelementByID(Brandid);
            cm=cdd.getelementByID(ColorNameid);
            ct=cd.getelementByID(Categoryid);
    pt.setBrand(bn);
    pt.setCategory(ct);
    pt.setCgstamount(cgstamt);
    pt.setCgstper(cgstper);
    pt.setColorModel(cm);
    pt.setFinalAmount(grossamount);
    pt.setIgstamount(igstamt);
    pt.setIgstper(igstper);
    pt.setModel(am);
//    pt.setProduct_id(product_id);
    pt.setPurchasePrice(purchaseamt);
    pt.setQuantity(quant);
    pt.setSgstamount(sgstamt);
    pt.setSgstper(sgstper);
    pt.setTaxableAmount(totalgstamount);
    pt.setTotal(total);
    pt.setMrpprice(mrpprice);
    pd.Addproduct(pt);


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
                        alltempProduct = pd.getAllProducts();
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
                        <input type="text" id="CGST_Amount" value="<%=grosscgst%>" readonly="" name="CGST_Amount"  required="required" placeholder="CGST_Amount"  class="form-control">  
                    </div>          
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <label class="text-center" >SGST Amount</label>
                        <input type="text" id="SGST_Amount" value="<%=grosssgst%>" readonly="" name="SGST_Amount"  required="required" placeholder="SGST_Amount"  class="form-control">  
                    </div>          
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <label class="text-center" >IGST Amount</label>
                        <input type="text" id="IGST_Amount" value="<%=grossigst%>" readonly="" name="IGST_Amount"  required="required" placeholder="IGST_Amount"  class="form-control">  
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

            <input type="text" id="Net_Amount"  readonly="" name="Net_Amount" value="<%=finalamount + otheramount - discountamo%>" required="required" placeholder="Net_Amount"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
        </div>
    </div>
</div>












<script>

    $.fn.popover.Constructor.prototype.leave = function(a) {
        var c, d, b = a instanceof this.constructor ? a : $(a.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
        originalLeave.call(this, a), a.currentTarget && (c = $(a.currentTarget).siblings(".popover"), d = b.timeout, c.one("mouseenter", function() {
            clearTimeout(d), c.one("mouseleave", function() {
                $.fn.popover.Constructor.prototype.leave.call(b, b)
            })
        }))
    },
            $(document).ready(function() {
        init_wysiwyg(), init_InputMask(), init_JQVmap(), init_cropper(), init_knob(), init_IonRangeSlider(), init_ColorPicker(), init_TagsInput(), init_parsley(), init_daterangepicker(), init_daterangepicker_right(), init_EasyPieChart(), init_charts(), init_echarts(), init_morris_charts(), init_skycons(), init_select2(), init_validator(), init_DataTables(), init_chart_doughnut(), init_gauge(), init_PNotify(), init_starrr(), init_calendar(), init_compose(), init_CustomNotification(), init_autosize(), init_autocomplete()
    });





</script>


