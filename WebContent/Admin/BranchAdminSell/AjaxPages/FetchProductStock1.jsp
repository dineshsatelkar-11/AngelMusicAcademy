

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

    String Branch = request.getParameter("Branch");
    int branchid = Integer.parseInt(Branch);

    AddModel am = new AddModel();
    Brand bn = new Brand();
    ColorModel cm = new ColorModel();
    Category ct = new Category();

    BrandDao bd = new BrandDao();
    CategoryDao cd = new CategoryDao();
    ModelDao md = new ModelDao();
    ColorDao cdd = new ColorDao();

    long Categoryid = 0;
    int Brandid = 0;
    int Modelid = 0;
    int ColorNameid = 0;
    if (!Category.equals("")) {
        Categoryid = Long.parseLong(Category);
        ct = cd.getelementByID(Categoryid);
    }
    if (!Brand.equals("")) {
        Brandid = Integer.parseInt(Brand);
        bn = bd.getelementByID(Brandid);
    }
    if (!Model.equals("")) {
        Modelid = Integer.parseInt(Model);
        am = md.getelementByID(Modelid);
    }

    System.out.println("cat-" + Categoryid);
    System.out.println("modr-" + Modelid);
    System.out.println("color-" + ColorNameid);
    System.out.println("bar-" + Brandid);

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


                        <th class="text-center" >Branch Name</th>
                        <th class="text-center" >Model No</th>
                        <th class="text-center" >Brand</th>
                        <th class="text-center" >Color</th>
                        <th class="text-center" >Category</th>
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

                    <%                                                        BranchProductDao pdo = new BranchProductDao();

                        BranchProduct pm = new BranchProduct();
                        List<BranchProduct> allProducts = null;
                        allProducts = pdo.getAllProduct();

                        if (allProducts != null && allProducts.size() > 0) {
                            int i = 0;
                            for (BranchProduct products : allProducts) {
                                //if (products.getAdminOfBranch().getAdminId() == admin.getAdminId()) {

                                System.out.println("count:-" + i);
                                if (products.getAdminid() == branchid) {
                                    System.out.println("products.getAdminid()-" + products.getAdminid());
                                    System.out.println("products.getAdminid()-" + products.getProduct().getCategory().getId());
                                    System.out.println("products.getAdminid()-" + products.getProduct().getBrand().getId());
                                    System.out.println("products.getAdminid()-" + products.getProduct().getModel().getId());
                                    System.out.println("products.getAdminid()-" + products.getProduct().getColorModel().getId());
                                    long categorryid = products.getProduct().getCategory().getId();
                                    int modelid = products.getProduct().getModel().getId();

                                    int brandid = products.getProduct().getBrand().getId();
                                    if (!(Categoryid == 0 || brandid == 0 || Modelid == 0)) {
                                        if (categorryid == Categoryid && Brandid == brandid && modelid == Modelid) {
                                            i++;


                    %>                             

                    <tr>
                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                <td class="data_center"><%=i%></td>


                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                <td class="data_center" id="prd_name<%=i%>"><%=products.getAdmin().getAdminOfBranch().getBranchName()%></td> 

                <td  class="data_center"><%=products.getProduct().getModel().getModelName()%></td>
                <td  class="data_center"><%=products.getProduct().getBrand().getBrand()%></td>
                <td  class="data_center"><%=products.getProduct().getColorModel().getColorName()%></td>
                <td  class="data_center"><%=products.getProduct().getCategory().getCategory()%></td>
                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                    
                <td class="data_center" id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         


                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getProduct().getPurchasePrice()%></td>                                                 
                <td class="data_center" id="prd_unit<%=i%>"><%=products.getProduct().getUnitPrice()%></td>                                                   
                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProduct().getCgst()%></td>                                                   
                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProduct().getSgst()%></td>                                                   
                <td class="data_center" id="prd_igst<%=i%>"><%=products.getProduct().getIgst()%></td>                                                   




                </tr> 
                <%}
                } else if (!(Categoryid == 0 || brandid == 0)) {
                    if (categorryid == Categoryid && Brandid == brandid) {
                        i++;
                %>


                <tr>
                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                <td class="data_center"><%=i%></td>


                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                <td class="data_center" id="prd_name<%=i%>"><%=products.getAdmin().getAdminOfBranch().getBranchName()%></td> 

                <td  class="data_center"><%=products.getProduct().getModel().getModelName()%></td>
                <td  class="data_center"><%=products.getProduct().getBrand().getBrand()%></td>
                <td  class="data_center"><%=products.getProduct().getColorModel().getColorName()%></td>
                <td  class="data_center"><%=products.getProduct().getCategory().getCategory()%></td>
                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                    
                <td class="data_center" id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         


                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getProduct().getPurchasePrice()%></td>                                                 
                <td class="data_center" id="prd_unit<%=i%>"><%=products.getProduct().getUnitPrice()%></td>                                                   
                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProduct().getCgst()%></td>                                                   
                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProduct().getSgst()%></td>                                                   
                <td class="data_center" id="prd_igst<%=i%>"><%=products.getProduct().getIgst()%></td>                                                   




                </tr> 


                <%
                    }
                } else if (!(Categoryid == 0 || Modelid == 0)) {
                    if (categorryid == Categoryid && modelid == Modelid) {
                        i++;
                %>

                <tr>
                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                <td class="data_center"><%=i%></td>


                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                <td class="data_center" id="prd_name<%=i%>"><%=products.getAdmin().getAdminOfBranch().getBranchName()%></td> 

                <td  class="data_center"><%=products.getProduct().getModel().getModelName()%></td>
                <td  class="data_center"><%=products.getProduct().getBrand().getBrand()%></td>
                <td  class="data_center"><%=products.getProduct().getColorModel().getColorName()%></td>
                <td  class="data_center"><%=products.getProduct().getCategory().getCategory()%></td>
                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                    
                <td class="data_center" id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         


                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getProduct().getPurchasePrice()%></td>                                                 
                <td class="data_center" id="prd_unit<%=i%>"><%=products.getProduct().getUnitPrice()%></td>                                                   
                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProduct().getCgst()%></td>                                                   
                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProduct().getSgst()%></td>                                                   
                <td class="data_center" id="prd_igst<%=i%>"><%=products.getProduct().getIgst()%></td>                                                   




                </tr> 




                <%
                    }
                } else if (!(brandid == 0 || Modelid == 0)) {
                    if (Brandid == brandid && modelid == Modelid) {
                        i++;
                %>



                <tr>
                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                <td class="data_center"><%=i%></td>


                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                <td class="data_center" id="prd_name<%=i%>"><%=products.getAdmin().getAdminOfBranch().getBranchName()%></td> 

                <td  class="data_center"><%=products.getProduct().getModel().getModelName()%></td>
                <td  class="data_center"><%=products.getProduct().getBrand().getBrand()%></td>
                <td  class="data_center"><%=products.getProduct().getColorModel().getColorName()%></td>
                <td  class="data_center"><%=products.getProduct().getCategory().getCategory()%></td>
                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                    
                <td class="data_center" id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         


                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getProduct().getPurchasePrice()%></td>                                                 
                <td class="data_center" id="prd_unit<%=i%>"><%=products.getProduct().getUnitPrice()%></td>                                                   
                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProduct().getCgst()%></td>                                                   
                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProduct().getSgst()%></td>                                                   
                <td class="data_center" id="prd_igst<%=i%>"><%=products.getProduct().getIgst()%></td>                                                   




                </tr> 




                <%
                    }
                } else if (!(brandid == 0)) {
                    if (Brandid == brandid) {
                        i++;

                %>




                <tr>
                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                <td class="data_center"><%=i%></td>


                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                <td class="data_center" id="prd_name<%=i%>"><%=products.getAdmin().getAdminOfBranch().getBranchName()%></td> 

                <td  class="data_center"><%=products.getProduct().getModel().getModelName()%></td>
                <td  class="data_center"><%=products.getProduct().getBrand().getBrand()%></td>
                <td  class="data_center"><%=products.getProduct().getColorModel().getColorName()%></td>
                <td  class="data_center"><%=products.getProduct().getCategory().getCategory()%></td>
                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                    
                <td class="data_center" id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         


                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getProduct().getPurchasePrice()%></td>                                                 
                <td class="data_center" id="prd_unit<%=i%>"><%=products.getProduct().getUnitPrice()%></td>                                                   
                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProduct().getCgst()%></td>                                                   
                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProduct().getSgst()%></td>                                                   
                <td class="data_center" id="prd_igst<%=i%>"><%=products.getProduct().getIgst()%></td>                                                   




                </tr> 


                <%
                    }
                } else if (!(Modelid == 0)) {
                    if (modelid == Modelid) {
                        i++;

                %>



                <tr>
                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                <td class="data_center"><%=i%></td>


                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                <td class="data_center" id="prd_name<%=i%>"><%=products.getAdmin().getAdminOfBranch().getBranchName()%></td> 

                <td  class="data_center"><%=products.getProduct().getModel().getModelName()%></td>
                <td  class="data_center"><%=products.getProduct().getBrand().getBrand()%></td>
                <td  class="data_center"><%=products.getProduct().getColorModel().getColorName()%></td>
                <td  class="data_center"><%=products.getProduct().getCategory().getCategory()%></td>
                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                    
                <td class="data_center" id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         


                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getProduct().getPurchasePrice()%></td>                                                 
                <td class="data_center" id="prd_unit<%=i%>"><%=products.getProduct().getUnitPrice()%></td>                                                   
                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProduct().getCgst()%></td>                                                   
                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProduct().getSgst()%></td>                                                   
                <td class="data_center" id="prd_igst<%=i%>"><%=products.getProduct().getIgst()%></td>                                                   




                </tr> 

                <%
                    }
                } else if (!(Categoryid == 0)) {
                    if (categorryid == Categoryid) {
                        i++;

                %>

                <tr>
                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                <td class="data_center"><%=i%></td>


                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                <td class="data_center" id="prd_name<%=i%>"><%=products.getAdmin().getAdminOfBranch().getBranchName()%></td> 

                <td  class="data_center"><%=products.getProduct().getModel().getModelName()%></td>
                <td  class="data_center"><%=products.getProduct().getBrand().getBrand()%></td>
                <td  class="data_center"><%=products.getProduct().getColorModel().getColorName()%></td>
                <td  class="data_center"><%=products.getProduct().getCategory().getCategory()%></td>
                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                    
                <td class="data_center" id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         


                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getProduct().getPurchasePrice()%></td>                                                 
                <td class="data_center" id="prd_unit<%=i%>"><%=products.getProduct().getUnitPrice()%></td>                                                   
                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProduct().getCgst()%></td>                                                   
                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProduct().getSgst()%></td>                                                   
                <td class="data_center" id="prd_igst<%=i%>"><%=products.getProduct().getIgst()%></td>                                                   




                </tr> 
                <%
                                    }
                                } else {
                                }
                            }
                        }
                    }

                %>                                                 
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>

    $.fn.popover.Constructor.prototype.leave = function (a) {
        var c, d, b = a instanceof this.constructor ? a : $(a.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
        originalLeave.call(this, a), a.currentTarget && (c = $(a.currentTarget).siblings(".popover"), d = b.timeout, c.one("mouseenter", function () {
            clearTimeout(d), c.one("mouseleave", function () {
                $.fn.popover.Constructor.prototype.leave.call(b, b)
            })
        }))
    },
            $(document).ready(function () {
        init_wysiwyg(), init_InputMask(), init_JQVmap(), init_cropper(), init_knob(), init_IonRangeSlider(), init_ColorPicker(), init_TagsInput(), init_parsley(), init_daterangepicker(), init_daterangepicker_right(), init_EasyPieChart(), init_charts(), init_echarts(), init_morris_charts(), init_skycons(), init_select2(), init_validator(), init_DataTables(), init_chart_doughnut(), init_gauge(), init_PNotify(), init_starrr(), init_calendar(), init_compose(), init_CustomNotification(), init_autosize(), init_autocomplete()
    });





</script>