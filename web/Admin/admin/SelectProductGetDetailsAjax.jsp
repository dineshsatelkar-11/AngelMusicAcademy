
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.dao.PurchaseTempDao"%>

<%@page import="com.accede.angel.sell.model.PurchaseTemp"%>
<link href="../../css/SwalCss.css" rel="stylesheet" type="text/css"/>
<script src="../../js/Swal.js" type="text/javascript"></script>
<script src="../production/js/Alertajax.js" type="text/javascript"></script>

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
            var FinalAmount="FinalAmount-";
            
            quantityid = quantityid.concat(res[1]);
            productid = productid.concat(res[1]);
            PurchasePrice = PurchasePrice.concat(res[1]);
            
            //UnitPrice = UnitPrice.concat(res[1]);
            CGSTPerc = CGSTPerc.concat(res[1]);
            SGSTPerc = SGSTPerc.concat(res[1]);
            IGSTPerc = IGSTPerc.concat(res[1]);
            FinalAmount = FinalAmount.concat(res[1]);
            var gst=$('#GstType').val();
            var quantity = $("#" + quantityid).val();
       
            var id = $("#" + productid).val().trim();
           
            var PurchasePrice1= $("#" + PurchasePrice).val().trim();
          //alert("Purchase===="+PurchasePrice1)
            //var UnitPrice1 = $("#" + UnitPrice).val().trim();
           
            var CGSTPerc1 = $("#" + CGSTPerc).val().trim();
         
            var SGSTPerc1 = $("#" + SGSTPerc).val().trim();
            var IGSTPerc1 = $("#" + IGSTPerc).val().trim();
            var FinalAmount1 = $("#" + FinalAmount).val().trim();
            //alert("amount===="+FinalAmount1);
            //alert("amount==="+FinalAmount1);
           
           
            $.ajax({
                url: "UpdatePurchaseAjax.jsp",
                type: "get",
                data: {quantity: quantity,gst:gst, CGSTPerc1 :CGSTPerc1,SGSTPerc1 :SGSTPerc1,PurchasePrice1 :PurchasePrice1, IGSTPerc1 :IGSTPerc1,  id: id,FinalAmount1:FinalAmount1},
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
<script type="text/javascript">
    $(document).ready(function() {
        
        $('.FinalAmountchange').blur(function(event) {
            
            var prdID = this.id;
             
            
            var res = prdID.split("-");
            var quantityid = "quantity-";
          
            var productid = "product-";
            var PurchasePrice = "PurchasePrice-";
            //var UnitPrice = "UnitPrice-";
            var CGSTPerc = "CGSTrate-";
            var SGSTPerc = "SGSTrate-";
            var IGSTPerc = "IGSTrate-";
            var FinalAmount="FinalAmount-";
            
            quantityid = quantityid.concat(res[1]);
            productid = productid.concat(res[1]);
            PurchasePrice = PurchasePrice.concat(res[1]);
            
            //UnitPrice = UnitPrice.concat(res[1]);
            CGSTPerc = CGSTPerc.concat(res[1]);
            SGSTPerc = SGSTPerc.concat(res[1]);
            IGSTPerc = IGSTPerc.concat(res[1]);
            FinalAmount = FinalAmount.concat(res[1]);
            var gst=$('#GstType').val();
            var quantity = $("#" + quantityid).val();
       
            var id = $("#" + productid).val().trim();
           
            var PurchasePrice1= $("#" + PurchasePrice).val().trim();
          //alert("Purchase===="+PurchasePrice1)
            //var UnitPrice1 = $("#" + UnitPrice).val().trim();
           
            var CGSTPerc1 = $("#" + CGSTPerc).val().trim();
         
            var SGSTPerc1 = $("#" + SGSTPerc).val().trim();
            var IGSTPerc1 = $("#" + IGSTPerc).val().trim();
            var FinalAmount1 = $("#" + FinalAmount).val().trim();
            //alert("amount===="+FinalAmount1);
            //alert("amount==="+FinalAmount1);
           
           
            $.ajax({
                url: "UpdatePurchaseAmountAjax.jsp",
                type: "get",
                data: {quantity: quantity,gst:gst, CGSTPerc1 :CGSTPerc1,SGSTPerc1 :SGSTPerc1,PurchasePrice1 :PurchasePrice1, IGSTPerc1 :IGSTPerc1,  id: id,FinalAmount1:FinalAmount1},
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
    PurchaseTempDao tem = new PurchaseTempDao();
    String Productname = request.getParameter("Product");
    String GstType=request.getParameter("GSTtype");
    System.out.println("Gsttype======="+GstType);
    ProductModel p = new ProductModel();
    ProductDao1 pro = new ProductDao1();
    p.setProductBarcode(Productname);
    p = pro.getproductdetails(p);
    if (p != null) {
        
        float PurchasePrice = p.getPurchasePrice();
        float Cgst=0;
        float Sgst=0;
        float Igst=0;
        if(GstType.equals("1"))
        {
        
         Cgst = p.getCgst();
         Sgst = p.getSgst();
        }
        else
        {
        Igst = p.getIgst();
        }
         
        
        String productname = p.getProductname();
        
        
        long quantity = 1;
        float cgstamount = (quantity) * (PurchasePrice * Cgst / 100);
        System.out.println("cgstamount==="+cgstamount);
        float sgstamount = (quantity) * (PurchasePrice * Sgst / 100);
        float igstamount = (quantity) * (PurchasePrice * Igst / 100);
        float withouttaxamount = PurchasePrice * quantity;
        float TaxableAmount=cgstamount + sgstamount + igstamount;
        float finalamount = cgstamount + sgstamount + igstamount + withouttaxamount;
        
        int product_id = p.getId();
        String Hsn = p.getHsn();
        String Discription = p.getDiscription();
        String barcode = p.getProductBarcode();
        
        PurchaseTemp tm = new PurchaseTemp();
        PurchaseTemp tm1 = new PurchaseTemp();
        tm1 = tem.getTempProduct(product_id);
        if (tm1 == null) {
            tm.setBarcode(barcode);
            tm.setCgstamount(cgstamount);
            tm.setCgstper(Cgst);
            tm.setSgstper(Sgst);
            tm.setIgstper(Igst);
            //tm.setDiscription(Discription);
            tm.setHsn(Hsn);
            tm.setPurchasePrice(PurchasePrice);
            tm.setProduct_id(product_id);
            tm.setQuantity(quantity);
            tm.setSgstamount(sgstamount);
            tm.setIgstamount(igstamount);
            tm.setTotal(withouttaxamount);
            tm.setTaxableAmount(TaxableAmount);
            tm.setFinalAmount(finalamount);
            //tm.setUnitprice(unitprice);
            tm.setProductName(productname);
            
            boolean b = tem.Addproduct(tm);
        } else {
            
            quantity = tm1.getQuantity() + 1;
            System.out.println("qty after update======="+quantity);
            
            cgstamount = (quantity) * (PurchasePrice * Cgst / 100);
            sgstamount = (quantity) * (PurchasePrice * Sgst / 100);
            igstamount = (quantity) * (PurchasePrice * Igst / 100);
            withouttaxamount = PurchasePrice * quantity;
            float TaxableAmount1=cgstamount + sgstamount + igstamount;
            finalamount = cgstamount + sgstamount + igstamount + withouttaxamount;
            tm.setBarcode(barcode);
            tm.setCgstamount(cgstamount);
            tm.setIgstamount(igstamount);
            tm.setCgstper(Cgst);
            tm.setSgstper(Sgst);
            tm.setIgstper(Igst);
            //tm.setDiscription(Discription);
            tm.setHsn(Hsn);
            tm.setPurchasePrice(PurchasePrice);
            tm.setProduct_id(product_id);
            tm.setQuantity(quantity);
            tm.setSgstamount(sgstamount);
            tm.setTotal(withouttaxamount);
            tm.setTaxableAmount(TaxableAmount1);
            tm.setFinalAmount(finalamount);
            //tm.setUnitprice(unitprice);
            tm.setId(tm1.getId());
            tm.setProductName(productname);
            
            boolean b = tem.Addproduct(tm);
        }
    }

%>



<div class="row" id="output2">
    <input type="hidden" name="GstType" id="GstType" value="<%=GstType%>">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Product Details </h2>   
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
                <div class="table-responsive">
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
                                                        <th class="text-center" >Final Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                PurchaseTemp p1 = new PurchaseTemp();
                            
                            List<PurchaseTemp> alltempProduct = null;
                            alltempProduct = tem.getAllProducts();
                            int i = 0;
                            float Grandtotal = 0;
                            float GrandGstAmount=0;
                            for (PurchaseTemp c : alltempProduct) {
                                i++;
                                Grandtotal = Grandtotal + c.getFinalAmount();
                                GrandGstAmount=GrandGstAmount+c.getTaxableAmount();
                                System.out.println("GrandGstAmount======"+GrandGstAmount);
                               
                        %>  
                        <tr>
                             <input type="hidden" name="product-<%=i%>" class="productchange" value="<%= c.getBarcode()%>" id="product-<%=i%>">
                             
                  <td class="data_center"><%=i%></td>  
                  <td   class="data_center"> <i id="<%=c.getId()%>"  class="fa fa-remove remove_prd text-danger "></i> </td>
                    <td class="data_center" id="prd_name<%=i%>"><%=c.getProductName()%></td>                                                   
                    <td  class="data_center"><input type="text" name="PurchasePrice-<%=i%>" style="width: 55px" id="PurchasePrice-<%=i%>" class="productchange" value="<%=c.getPurchasePrice()%>"></td>         
                                                <td class="data_center"><input type="text" name="quantity-<%=i%>" style="width: 35px" class="productchange" id="quantity-<%=i%>" value="<%=c.getQuantity()%>"></td>                                                   
                                                <td class="data_center" ><%=c.getTotal()%></td>
                                                <%if(GstType.equals("1"))
                                                {%>
                                                <td class="data_center"><input type="text" style="width: 35px" name="CGSTrate-<%=i%>" class="productchange" id="CGSTrate-<%=i%>" value="<%=c.getCgstper()%>"></td>                                                 
                                                <td class="data_center"><%=c.getCgstamount()%></td>                                                   
                                                <td class="data_center"><input type="text" name="SGSTrate-<%=i%>" style="width: 35px" class="productchange" id="SGSTrate-<%=i%>" value="<%=c.getSgstper()%>"></td>                                                   
                                                <td class="data_center"><%=c.getSgstamount()%></td>  
                                               <td class="data_center"><input type="text" readonly="" name="IGSTrate-<%=i%>" style="width: 35px" class="productchange" id="IGSTrate-<%=i%>" value="<%=c.getIgstper()%>" ></td>                                                   
                                              
                                                <td class="data_center"><%=c.getIgstamount()%></td> 
                                                <%}else {%>
                                                <td class="data_center"><input type="text" readonly="" style="width: 35px" name="CGSTrate-<%=i%>" class="productchange" id="CGSTrate-<%=i%>" value="<%=c.getCgstper()%>"></td>                                                 
                                                <td class="data_center"><%=c.getCgstamount()%></td>                                                   
                                                <td class="data_center"><input type="text" readonly=""  name="SGSTrate-<%=i%>" style="width: 35px" class="productchange" id="SGSTrate-<%=i%>" value="<%=c.getSgstper()%>"></td>                                                   
                                                <td class="data_center"><%=c.getSgstamount()%></td>  
                                               <td class="data_center"><input type="text"  name="IGSTrate-<%=i%>" style="width: 35px" class="productchange" id="IGSTrate-<%=i%>" value="<%=c.getIgstper()%>" ></td>                                                   
                                              
                                                <td class="data_center"><%=c.getIgstamount()%></td> 
                                                <%}%>
                                                                              
                                                <td class="data_center"><%=c.getTaxableAmount()%></td>                                 
                                                <td class="data_center"><input type="text"  name="FinalAmount-<%=i%>" style="width: 70px" class="FinalAmountchange" id="FinalAmount-<%=i%>" value="<%=c.getFinalAmount()%>" ></td>                                
                    </tr>
                    <%
                            }
                    %>
                    </tbody>
                    
                </table>
            </div>
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
        

<style>
    .data_center{

        text-align:center;

    }
</style>  

              
                
<script>



    var originalLeave = $.fn.popover.Constructor.prototype.leave;
    $.fn.popover.Constructor.prototype.leave = function(a) {
        var c, d, b = a instanceof this.constructor ? a : $(a.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
        originalLeave.call(this, a), a.currentTarget && (c = $(a.currentTarget).siblings(".popover"), d = b.timeout, c.one("mouseenter", function() {
            clearTimeout(d), c.one("mouseleave", function() {
                $.fn.popover.Constructor.prototype.leave.call(b, b)
            })
        }))
    }, $("body").popover({selector: "[data-popover]", trigger: "click hover", delay: {show: 50, hide: 400}}), $(document).ready(function() {
        init_sparklines(), init_flot_chart(), init_sidebar(), init_wysiwyg(), init_InputMask(), init_JQVmap(), init_cropper(), init_knob(), init_IonRangeSlider(), init_ColorPicker(), init_TagsInput(), init_parsley(), init_daterangepicker(), init_daterangepicker_right(), init_daterangepicker_single_call(), init_daterangepicker_reservation(), init_SmartWizard(), init_EasyPieChart(), init_charts(), init_echarts(), init_morris_charts(), init_skycons(), init_select2(), init_validator(), init_DataTables(), init_chart_doughnut(), init_gauge(), init_PNotify(), init_starrr(), init_calendar(), init_compose(), init_CustomNotification(), init_autosize(), init_autocomplete()
    });





</script>





