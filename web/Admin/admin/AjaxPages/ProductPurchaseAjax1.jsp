

<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="com.accede.angel.sell.dao.VendorDao"%>
<%@page import="com.accede.angel.sell.model.PurchaseDetails"%>
<%@page import="com.accede.angel.sell.model.Venderregistration"%>
<%@page import="com.accede.angel.sell.dao.PurchaseDao"%>
<%@page import="com.accede.angel.sell.model.PurchaseProduct"%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
<%@page import="java.util.Set"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.accede.angel.sell.model.BranchClassTransfer"%>
<%@page import="com.accede.angel.sell.dao.BranchClassTransferDao"%>
<%@page import="com.accede.angel.sell.model.SubCategory"%>
<%@page import="com.accede.angel.sell.dao.SubCatDao"%>
<%@page import="com.accede.angel.sell.dao.ColorDao"%>
<%@page import="com.accede.angel.sell.dao.ModelDao"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.dao.BrandDao"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="com.accede.angel.sell.model.AddModel"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.model.BranchProduct"%>
<%@page import="com.accede.angel.sell.dao.BranchProductDao"%>
<%
    
    String Category = request.getParameter("Category");
    String Brand = request.getParameter("Brand");
    String Model = request.getParameter("Model");

    String vendorid = request.getParameter("vendorid");
    System.out.print("/////////////////////vendorid///////////////////////"+vendorid);
    System.out.print("/////////////////////vendorid///////////////////////"+vendorid);
    System.out.print("/////////////////////vendorid///////////////////////"+vendorid);
    System.out.print("/////////////////////vendorid///////////////////////"+vendorid);
    String SubCategory = request.getParameter("SubCategory");
    String ColorName = request.getParameter("ColorName");
   String TDate = request.getParameter("TDate");
    String FDate = request.getParameter("FDate");
    int id = 0;
    long Categoryid = 0;
    int Brandid = 0;
    int Modelid = 0;
    int Colorid = 0;
    long SubCategoryid = 0;
    int noofdayss = 0;
    long vendoridd = 0;
    Venderregistration Venderregistration = new Venderregistration();

     Date FromDate = new Date();
    Date ToDate = new Date();

    try {
        FromDate = new SimpleDateFormat("yyyy-MM-dd").parse(FDate);

    } catch (ParseException ex) {
        ex.printStackTrace();
    }

    try {
        ToDate = new SimpleDateFormat("yyyy-MM-dd").parse(TDate);

    } catch (ParseException ex) {
        ex.printStackTrace();
    }
    if (!Category.equals("")) {
        Categoryid = Long.parseLong(Category);

    }
    if (!Brand.equals("")) {
        Brandid = Integer.parseInt(Brand);

    }
    if (!Model.equals("")) {
        Modelid = Integer.parseInt(Model);

    }
    if (!SubCategory.equals("")) {
        SubCategoryid = Long.parseLong(SubCategory);

    }
    if (!ColorName.equals("")) {
        Colorid = Integer.parseInt(ColorName);

    }
    if (!vendorid.equals("")) {
        vendoridd = Long.parseLong(vendorid);

        Venderregistration = new VendorDao().getvenderbyid(vendoridd);
    }

    System.out.println("cat-" + Categoryid);
    System.out.println("modr-" + Modelid);

    System.out.println("bar-" + Brandid);
    System.out.println("Colorid-" + Colorid);
    System.out.println("id-" + id);

%>



<div id="Report_Fetch">
    <div class="x_content table-responsive">
        <!--                    <p class="text-muted font-13 m-b-30">
                              The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                            </p>-->
        <div id="output1">
            <table id="datatable" class="table table-striped table-bordered">
                <thead> <tr>
                        <th class="text-center" >Sr.No</th>
                        <th class="text-center" >Sale_Date</th>
                        <th class="text-center" >Vendor</th>



                        <th class="text-center" >Category</th>
                        <th class="text-center" >Sub Category</th>
                        <th class="text-center" >Brand</th>
                        <th class="text-center" >Model No</th>

                        <th class="text-center" >Color</th>

                        <th class="text-center" >Quantity</th>
                        <th class="text-center" > Bar Code</th>


                        <th class="text-center" >Purchase Price</th>
                        <th class="text-center" >MRP Price</th>
                        <th class="text-center" >CGST (%)</th>
                        <th class="text-center" >SGST (%)</th>
                        <th class="text-center" >IGST (%)</th>




                    </tr>
                </thead>
                <tbody>      

                    <%                        PurchaseProduct p = new PurchaseProduct();
                        PurchaseDao PurchaseDao = new PurchaseDao();

                        List<PurchaseProduct> allProducts = null;
                        float grandtotal = 0.0f;
                        float other_charges = 0.0f;
                        float discount_amount = 0.0f;
                        float grosstotal = 0.0f;

                        allProducts = PurchaseDao.getPurchaseProductInoutt(Venderregistration, FromDate,ToDate);

                        SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("dd-MM-yyyy");
                        ProductDao1 ProductDao1 = new ProductDao1();
                        List<Integer> allproduct = null;
                        allproduct = ProductDao1.getAllProduct1(Categoryid, SubCategoryid, Brandid, Modelid, Colorid);
                        for (Integer products : allproduct) {
                            System.out.println("ID======" + products);

                        }
                        long totalq = 0;

                        int i = 0;
                        System.out.println("*************************************************************");
                        System.out.println("********************************allProducts*****************************" + allProducts.size());
                        System.out.println("********************************allProducts*****************************" + allProducts.toString());
                        System.out.println("*************************************************************");
                        if (allProducts != null && allProducts.size() > 0) {

                            for (PurchaseProduct c1 : allProducts) {

                                List<PurchaseDetails> AllProduct = c1.getPurchaseDetails();

                                for (PurchaseDetails products : AllProduct) {

                                    if (allproduct.contains(products.getProductModel().getId())) {
                                        i++;

                                        String date1 = DATE_FORMAT1.format(c1.getPurchase_Date());

                                        totalq = totalq + products.getQuantity();


                    %>                             

                    <tr>
                <input type="hidden" value="<%=c1.getPurchaseID()%>" id="prd_id<%=i%>">
                <td class="data_center"><%=i%></td>
                <td class="data_center"><%=date1%></td>
                <td class="data_center"><%=c1.getVendorid().getVendorname()%></td>



                <td  class="data_center"><%=products.getProductModel().getCategory().getCategory()%></td>
                <td  class="data_center"><%=products.getProductModel().getSubCategory().getSubCategory()%></td>
                <td  class="data_center"><%=products.getProductModel().getBrand().getBrand()%></td>
                <td  class="data_center"><%=products.getProductModel().getModel().getModelName()%></td>

                <td  class="data_center"><%=products.getProductModel().getColorModel().getColorName()%></td>

                <td class="data_center" id="prd_quant<%=i%>"><%=products.getQuantity()%></td>                                    
                <td class="data_center" id="prd_bar<%=i%>"><%=products.getProductModel().getProductBarcode()%></td>         

                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getProductModel().getPurchasePrice()%></td>                                                 
                <td class="data_center" id="prd_unit<%=i%>"><%=products.getProductModel().getUnitPrice()%></td>                                                   
                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProductModel().getCgst()%></td>                                                   
                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProductModel().getSgst()%></td>                                                   
                <td class="data_center" id="prd_igst<%=i%>"><%=products.getProductModel().getIgst()%></td>                                                   



                </tr> 



                <%}
                            }
                        }
                    }%>


                </tbody>
                <tfoot>
                    <tr>

                        <td class="data_center"></td>
                        <td class="data_center"></td>
                        <td class="data_center"></td>
                        <td class="data_center"></td>
                        <td class="data_center"></td>
                        <td class="data_center"></td>
                        <td class="data_center"></td>
                        <td class="data_center"></td>
                        <td class="data_center"><%=totalq%></td>
                        <td class="data_center"></td>
                        <td class="data_center"></td>
                        <td class="data_center"></td>
                        <td class="data_center"></td>
                        <td class="data_center"></td>
                        <td class="data_center"></td>




                    </tr>
                </tfoot>
            </table>
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