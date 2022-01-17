

<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
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

    AddModel am = new AddModel();
    Brand bn = new Brand();

    Category ct = new Category();

    BrandDao bd = new BrandDao();
    CategoryDao cd = new CategoryDao();
    ModelDao md = new ModelDao();

    long Categoryid = 0;
    int Brandid = 0;
    int Modelid = 0;

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
                                                        <th class="text-center" >Print Barcode</th>
                                                        <th class="text-center" >Edit Product</th>
                                                        <th class="text-center" >Delete</th>
                                                        <th class="text-center" >Model No</th>
                                                        <th class="text-center" >Category</th>
                                                        <th class="text-center" >Brand</th>
                                                        <th class="text-center" >Color</th>
                                                        <!--<th class="text-center" >Product Name</th>-->
                                                        <th class="text-center" >Product Bar Code</th>
                                                        <th class="text-center" >Quantity</th>
                                                        <!--<th class="text-center" >HSN Code</th>-->
                                                        <th class="text-center" >Purchase Price</th>
                                                        <th class="text-center" >Unit Price</th>
                                                        <th class="text-center" >CGST (%)</th>
                                                        <th class="text-center" >SGST (%)</th>
                                                        <th class="text-center" >IGST (%)</th>

                                                        <!--<th class="text-center" >Discription</th>-->



                                                    </tr>
                 </thead>
                <tbody>      

                    <%                                                    ProductDao1 pdo = new ProductDao1();

                        ProductModel pm = new ProductModel();
                        List<ProductModel> allProducts = null;
                        allProducts = pdo.getAllProduct();

                        if (allProducts != null && allProducts.size() > 0) {
                            int i = 0;
                            for (ProductModel products : allProducts) {
                                //if (products.getAdminOfBranch().getAdminId() == admin.getAdminId()) {
                                if (Categoryid != 0 && Brandid != 0 && Modelid != 0) {
                                    if ((products.getCategory().getId() == Categoryid) && (products.getBrand().getId() == Brandid) && (products.getModel().getId() == Modelid)) {
                                        i++;


                    %>                             

                 <tr>
                                                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                                <td class="data_center"><%=i%></td>
                                                <td class="data_center"><a href="#myModal1" role="button" data-toggle="modal" data-id="<%=products.getId()%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-print edit_prd"></i></a></td>
                                                <td class="data_center"><a href="EditProduct.jsp?productid=<%=products.getId()%>" role="button" data-toggle="modal" data-id="<%=i%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-edit edit_prd1"></i></a></td>
                                                <form action="../../DeleteProduct" method="post">
                                                    <%                                          if (session.getAttribute("i") != null) {
                                                            int i1 = (Integer) session.getAttribute("i");
                                                            String msg = (String) session.getAttribute("msg");
                                                            if (i1 == 2) {

                                                                System.out.println("fdgsfd");
                                                    %>
                                                    <div class="alert">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Danger!</strong> <%=msg%>
                                                    </div>
                                                    <%} else {%>
                                                    <div class="alert success">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Success!</strong><%=msg%> 
                                                    </div>
                                                    <%
                                                            }
                                                            session.removeAttribute("i");
                                                            session.removeAttribute("msg");
                                                        }%>
                                                    <input type="hidden" name="productId" id="productId" value="<%=products.getId()%>">
                                                    <input type="hidden" name="prd_model1<%=i%>" id="prd_model1<%=i%>" value="<%=products.getModel().getId()%>">
                                                    <input type="hidden" name="prd_cat1<%=i%>" id="prd_cat1<%=i%>" value="<%=products.getCategory().getId()%>">
                                                    <input type="hidden" name="prd_brand1<%=i%>" id="prd_brand1<%=i%>" value="<%=products.getBrand().getId()%>">
                                                    <input type="hidden" name="prd_color1<%=i%>" id="prd_color1<%=i%>" value="<%=products.getColorModel().getId()%>">

                                                    <td><button type="submit" class="btn btn-danger table_center" >Delete</button></td>
                                                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                                                <input type="hidden" id="prd_name<%=i%>"  value="<%=products.getProductBarcode()%>" >                                                   
                                                <td class="data_center"  id="prd_model<%=i%>"><%=products.getModel().getModelName()%></td>         
                                                <td class="data_center"  id="prd_cat<%=i%>"><%=products.getCategory().getCategory()%></td>         
                                                <td class="data_center"  id="prd_brand<%=i%>"><%=products.getBrand().getBrand()%></td>         
                                                <td class="data_center"  id="prd_color<%=i%>"><%=products.getColorModel().getColorName()%></td>         
                                                <td class="data_center"  id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         
                                                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                                   
                                                <!--<td class="data_center" id="prd_hsn<%=i%>"><%=products.getHsn()%></td>-->                                                   
                                                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getPurchasePrice()%></td>                                                 
                                                <td class="data_center" id="prd_unit<%=i%>"><%=products.getUnitPrice()%></td>                                                   
                                                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getCgst()%></td>                                                   
                                                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getSgst()%></td>                                                   
                                                <td class="data_center" id="prd_igst<%=i%>"><%=products.getIgst()%></td>                                                   

                                                <!--<td class="data_center" id="prd_desc<%=i%>"><%=products.getDiscription()%></td>-->                                                   


                                                </tr> 
                <% }
                } else if (Categoryid != 0 && Brandid != 0) {
                    if ((products.getCategory().getId() == Categoryid) && (products.getBrand().getId() == Brandid)) {
                        i++;


                %>                             

               <tr>
                                                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                                <td class="data_center"><%=i%></td>
                                                <td class="data_center"><a href="#myModal1" role="button" data-toggle="modal" data-id="<%=products.getId()%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-print edit_prd"></i></a></td>
                                                <td class="data_center"><a href="EditProduct.jsp?productid=<%=products.getId()%>" role="button" data-toggle="modal" data-id="<%=i%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-edit edit_prd1"></i></a></td>
                                                <form action="../../DeleteProduct" method="post">
                                                    <%                                          if (session.getAttribute("i") != null) {
                                                            int i1 = (Integer) session.getAttribute("i");
                                                            String msg = (String) session.getAttribute("msg");
                                                            if (i1 == 2) {

                                                                System.out.println("fdgsfd");
                                                    %>
                                                    <div class="alert">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Danger!</strong> <%=msg%>
                                                    </div>
                                                    <%} else {%>
                                                    <div class="alert success">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Success!</strong><%=msg%> 
                                                    </div>
                                                    <%
                                                            }
                                                            session.removeAttribute("i");
                                                            session.removeAttribute("msg");
                                                        }%>
                                                    <input type="hidden" name="productId" id="productId" value="<%=products.getId()%>">
                                                    <input type="hidden" name="prd_model1<%=i%>" id="prd_model1<%=i%>" value="<%=products.getModel().getId()%>">
                                                    <input type="hidden" name="prd_cat1<%=i%>" id="prd_cat1<%=i%>" value="<%=products.getCategory().getId()%>">
                                                    <input type="hidden" name="prd_brand1<%=i%>" id="prd_brand1<%=i%>" value="<%=products.getBrand().getId()%>">
                                                    <input type="hidden" name="prd_color1<%=i%>" id="prd_color1<%=i%>" value="<%=products.getColorModel().getId()%>">

                                                    <td><button type="submit" class="btn btn-danger table_center" >Delete</button></td>
                                                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                                                <input type="hidden" id="prd_name<%=i%>"  value="<%=products.getProductBarcode()%>" >                                                   
                                                <td class="data_center"  id="prd_model<%=i%>"><%=products.getModel().getModelName()%></td>         
                                                <td class="data_center"  id="prd_cat<%=i%>"><%=products.getCategory().getCategory()%></td>         
                                                <td class="data_center"  id="prd_brand<%=i%>"><%=products.getBrand().getBrand()%></td>         
                                                <td class="data_center"  id="prd_color<%=i%>"><%=products.getColorModel().getColorName()%></td>         
                                                <td class="data_center"  id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         
                                                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                                   
                                                <!--<td class="data_center" id="prd_hsn<%=i%>"><%=products.getHsn()%></td>-->                                                   
                                                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getPurchasePrice()%></td>                                                 
                                                <td class="data_center" id="prd_unit<%=i%>"><%=products.getUnitPrice()%></td>                                                   
                                                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getCgst()%></td>                                                   
                                                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getSgst()%></td>                                                   
                                                <td class="data_center" id="prd_igst<%=i%>"><%=products.getIgst()%></td>                                                   

                                                <!--<td class="data_center" id="prd_desc<%=i%>"><%=products.getDiscription()%></td>-->                                                   


                                                </tr> 
                <% }
                } else if (Categoryid != 0 && Modelid != 0) {
                    if ((products.getCategory().getId() == Categoryid) && (products.getModel().getId() == Modelid)) {
                        i++;


                %>                             
 <tr>
                                                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                                <td class="data_center"><%=i%></td>
                                                <td class="data_center"><a href="#myModal1" role="button" data-toggle="modal" data-id="<%=products.getId()%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-print edit_prd"></i></a></td>
                                                <td class="data_center"><a href="EditProduct.jsp?productid=<%=products.getId()%>" role="button" data-toggle="modal" data-id="<%=i%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-edit edit_prd1"></i></a></td>
                                                <form action="../../DeleteProduct" method="post">
                                                    <%                                          if (session.getAttribute("i") != null) {
                                                            int i1 = (Integer) session.getAttribute("i");
                                                            String msg = (String) session.getAttribute("msg");
                                                            if (i1 == 2) {

                                                                System.out.println("fdgsfd");
                                                    %>
                                                    <div class="alert">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Danger!</strong> <%=msg%>
                                                    </div>
                                                    <%} else {%>
                                                    <div class="alert success">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Success!</strong><%=msg%> 
                                                    </div>
                                                    <%
                                                            }
                                                            session.removeAttribute("i");
                                                            session.removeAttribute("msg");
                                                        }%>
                                                    <input type="hidden" name="productId" id="productId" value="<%=products.getId()%>">
                                                    <input type="hidden" name="prd_model1<%=i%>" id="prd_model1<%=i%>" value="<%=products.getModel().getId()%>">
                                                    <input type="hidden" name="prd_cat1<%=i%>" id="prd_cat1<%=i%>" value="<%=products.getCategory().getId()%>">
                                                    <input type="hidden" name="prd_brand1<%=i%>" id="prd_brand1<%=i%>" value="<%=products.getBrand().getId()%>">
                                                    <input type="hidden" name="prd_color1<%=i%>" id="prd_color1<%=i%>" value="<%=products.getColorModel().getId()%>">

                                                    <td><button type="submit" class="btn btn-danger table_center" >Delete</button></td>
                                                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                                                <input type="hidden" id="prd_name<%=i%>"  value="<%=products.getProductBarcode()%>" >                                                   
                                                <td class="data_center"  id="prd_model<%=i%>"><%=products.getModel().getModelName()%></td>         
                                                <td class="data_center"  id="prd_cat<%=i%>"><%=products.getCategory().getCategory()%></td>         
                                                <td class="data_center"  id="prd_brand<%=i%>"><%=products.getBrand().getBrand()%></td>         
                                                <td class="data_center"  id="prd_color<%=i%>"><%=products.getColorModel().getColorName()%></td>         
                                                <td class="data_center"  id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         
                                                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                                   
                                                <!--<td class="data_center" id="prd_hsn<%=i%>"><%=products.getHsn()%></td>-->                                                   
                                                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getPurchasePrice()%></td>                                                 
                                                <td class="data_center" id="prd_unit<%=i%>"><%=products.getUnitPrice()%></td>                                                   
                                                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getCgst()%></td>                                                   
                                                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getSgst()%></td>                                                   
                                                <td class="data_center" id="prd_igst<%=i%>"><%=products.getIgst()%></td>                                                   

                                                <!--<td class="data_center" id="prd_desc<%=i%>"><%=products.getDiscription()%></td>-->                                                   


                                                </tr> 


                <% }
                } else if (Brandid != 0 && Modelid != 0) {
                    if ((products.getBrand().getId() == Categoryid) && (products.getModel().getId() == Modelid)) {
                        i++;


                %>                             

               <tr>
                                                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                                <td class="data_center"><%=i%></td>
                                                <td class="data_center"><a href="#myModal1" role="button" data-toggle="modal" data-id="<%=products.getId()%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-print edit_prd"></i></a></td>
                                                <td class="data_center"><a href="EditProduct.jsp?productid=<%=products.getId()%>" role="button" data-toggle="modal" data-id="<%=i%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-edit edit_prd1"></i></a></td>
                                                <form action="../../DeleteProduct" method="post">
                                                    <%                                          if (session.getAttribute("i") != null) {
                                                            int i1 = (Integer) session.getAttribute("i");
                                                            String msg = (String) session.getAttribute("msg");
                                                            if (i1 == 2) {

                                                                System.out.println("fdgsfd");
                                                    %>
                                                    <div class="alert">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Danger!</strong> <%=msg%>
                                                    </div>
                                                    <%} else {%>
                                                    <div class="alert success">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Success!</strong><%=msg%> 
                                                    </div>
                                                    <%
                                                            }
                                                            session.removeAttribute("i");
                                                            session.removeAttribute("msg");
                                                        }%>
                                                    <input type="hidden" name="productId" id="productId" value="<%=products.getId()%>">
                                                    <input type="hidden" name="prd_model1<%=i%>" id="prd_model1<%=i%>" value="<%=products.getModel().getId()%>">
                                                    <input type="hidden" name="prd_cat1<%=i%>" id="prd_cat1<%=i%>" value="<%=products.getCategory().getId()%>">
                                                    <input type="hidden" name="prd_brand1<%=i%>" id="prd_brand1<%=i%>" value="<%=products.getBrand().getId()%>">
                                                    <input type="hidden" name="prd_color1<%=i%>" id="prd_color1<%=i%>" value="<%=products.getColorModel().getId()%>">

                                                    <td><button type="submit" class="btn btn-danger table_center" >Delete</button></td>
                                                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                                                <input type="hidden" id="prd_name<%=i%>"  value="<%=products.getProductBarcode()%>" >                                                   
                                                <td class="data_center"  id="prd_model<%=i%>"><%=products.getModel().getModelName()%></td>         
                                                <td class="data_center"  id="prd_cat<%=i%>"><%=products.getCategory().getCategory()%></td>         
                                                <td class="data_center"  id="prd_brand<%=i%>"><%=products.getBrand().getBrand()%></td>         
                                                <td class="data_center"  id="prd_color<%=i%>"><%=products.getColorModel().getColorName()%></td>         
                                                <td class="data_center"  id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         
                                                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                                   
                                                <!--<td class="data_center" id="prd_hsn<%=i%>"><%=products.getHsn()%></td>-->                                                   
                                                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getPurchasePrice()%></td>                                                 
                                                <td class="data_center" id="prd_unit<%=i%>"><%=products.getUnitPrice()%></td>                                                   
                                                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getCgst()%></td>                                                   
                                                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getSgst()%></td>                                                   
                                                <td class="data_center" id="prd_igst<%=i%>"><%=products.getIgst()%></td>                                                   

                                                <!--<td class="data_center" id="prd_desc<%=i%>"><%=products.getDiscription()%></td>-->                                                   


                                                </tr> 


                <% }
                } else if (Categoryid != 0) {
                    if ((products.getCategory().getId() == Categoryid)) {
                        i++;


                %>                             

             <tr>
                                                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                                <td class="data_center"><%=i%></td>
                                                <td class="data_center"><a href="#myModal1" role="button" data-toggle="modal" data-id="<%=products.getId()%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-print edit_prd"></i></a></td>
                                                <td class="data_center"><a href="EditProduct.jsp?productid=<%=products.getId()%>" role="button" data-toggle="modal" data-id="<%=i%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-edit edit_prd1"></i></a></td>
                                                <form action="../../DeleteProduct" method="post">
                                                    <%                                          if (session.getAttribute("i") != null) {
                                                            int i1 = (Integer) session.getAttribute("i");
                                                            String msg = (String) session.getAttribute("msg");
                                                            if (i1 == 2) {

                                                                System.out.println("fdgsfd");
                                                    %>
                                                    <div class="alert">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Danger!</strong> <%=msg%>
                                                    </div>
                                                    <%} else {%>
                                                    <div class="alert success">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Success!</strong><%=msg%> 
                                                    </div>
                                                    <%
                                                            }
                                                            session.removeAttribute("i");
                                                            session.removeAttribute("msg");
                                                        }%>
                                                    <input type="hidden" name="productId" id="productId" value="<%=products.getId()%>">
                                                    <input type="hidden" name="prd_model1<%=i%>" id="prd_model1<%=i%>" value="<%=products.getModel().getId()%>">
                                                    <input type="hidden" name="prd_cat1<%=i%>" id="prd_cat1<%=i%>" value="<%=products.getCategory().getId()%>">
                                                    <input type="hidden" name="prd_brand1<%=i%>" id="prd_brand1<%=i%>" value="<%=products.getBrand().getId()%>">
                                                    <input type="hidden" name="prd_color1<%=i%>" id="prd_color1<%=i%>" value="<%=products.getColorModel().getId()%>">

                                                    <td><button type="submit" class="btn btn-danger table_center" >Delete</button></td>
                                                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                                                <input type="hidden" id="prd_name<%=i%>"  value="<%=products.getProductBarcode()%>" >                                                   
                                                <td class="data_center"  id="prd_model<%=i%>"><%=products.getModel().getModelName()%></td>         
                                                <td class="data_center"  id="prd_cat<%=i%>"><%=products.getCategory().getCategory()%></td>         
                                                <td class="data_center"  id="prd_brand<%=i%>"><%=products.getBrand().getBrand()%></td>         
                                                <td class="data_center"  id="prd_color<%=i%>"><%=products.getColorModel().getColorName()%></td>         
                                                <td class="data_center"  id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         
                                                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                                   
                                                <!--<td class="data_center" id="prd_hsn<%=i%>"><%=products.getHsn()%></td>-->                                                   
                                                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getPurchasePrice()%></td>                                                 
                                                <td class="data_center" id="prd_unit<%=i%>"><%=products.getUnitPrice()%></td>                                                   
                                                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getCgst()%></td>                                                   
                                                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getSgst()%></td>                                                   
                                                <td class="data_center" id="prd_igst<%=i%>"><%=products.getIgst()%></td>                                                   

                                                <!--<td class="data_center" id="prd_desc<%=i%>"><%=products.getDiscription()%></td>-->                                                   


                                                </tr> 


                <% }
                } else if (Brandid != 0) {
                    if ((products.getBrand().getId() == Categoryid)) {
                        i++;


                %>                             

             <tr>
                                                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                                <td class="data_center"><%=i%></td>
                                                <td class="data_center"><a href="#myModal1" role="button" data-toggle="modal" data-id="<%=products.getId()%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-print edit_prd"></i></a></td>
                                                <td class="data_center"><a href="EditProduct.jsp?productid=<%=products.getId()%>" role="button" data-toggle="modal" data-id="<%=i%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-edit edit_prd1"></i></a></td>
                                                <form action="../../DeleteProduct" method="post">
                                                    <%                                          if (session.getAttribute("i") != null) {
                                                            int i1 = (Integer) session.getAttribute("i");
                                                            String msg = (String) session.getAttribute("msg");
                                                            if (i1 == 2) {

                                                                System.out.println("fdgsfd");
                                                    %>
                                                    <div class="alert">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Danger!</strong> <%=msg%>
                                                    </div>
                                                    <%} else {%>
                                                    <div class="alert success">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Success!</strong><%=msg%> 
                                                    </div>
                                                    <%
                                                            }
                                                            session.removeAttribute("i");
                                                            session.removeAttribute("msg");
                                                        }%>
                                                    <input type="hidden" name="productId" id="productId" value="<%=products.getId()%>">
                                                    <input type="hidden" name="prd_model1<%=i%>" id="prd_model1<%=i%>" value="<%=products.getModel().getId()%>">
                                                    <input type="hidden" name="prd_cat1<%=i%>" id="prd_cat1<%=i%>" value="<%=products.getCategory().getId()%>">
                                                    <input type="hidden" name="prd_brand1<%=i%>" id="prd_brand1<%=i%>" value="<%=products.getBrand().getId()%>">
                                                    <input type="hidden" name="prd_color1<%=i%>" id="prd_color1<%=i%>" value="<%=products.getColorModel().getId()%>">

                                                    <td><button type="submit" class="btn btn-danger table_center" >Delete</button></td>
                                                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                                                <input type="hidden" id="prd_name<%=i%>"  value="<%=products.getProductBarcode()%>" >                                                   
                                                <td class="data_center"  id="prd_model<%=i%>"><%=products.getModel().getModelName()%></td>         
                                                <td class="data_center"  id="prd_cat<%=i%>"><%=products.getCategory().getCategory()%></td>         
                                                <td class="data_center"  id="prd_brand<%=i%>"><%=products.getBrand().getBrand()%></td>         
                                                <td class="data_center"  id="prd_color<%=i%>"><%=products.getColorModel().getColorName()%></td>         
                                                <td class="data_center"  id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         
                                                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                                   
                                                <!--<td class="data_center" id="prd_hsn<%=i%>"><%=products.getHsn()%></td>-->                                                   
                                                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getPurchasePrice()%></td>                                                 
                                                <td class="data_center" id="prd_unit<%=i%>"><%=products.getUnitPrice()%></td>                                                   
                                                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getCgst()%></td>                                                   
                                                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getSgst()%></td>                                                   
                                                <td class="data_center" id="prd_igst<%=i%>"><%=products.getIgst()%></td>                                                   

                                                <!--<td class="data_center" id="prd_desc<%=i%>"><%=products.getDiscription()%></td>-->                                                   


                                                </tr> 




                <%
                    }
                } else {

                    if ((products.getBrand().getId() == Categoryid)) {
                        i++;

                %>


               <tr>
                                                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                                <td class="data_center"><%=i%></td>
                                                <td class="data_center"><a href="#myModal1" role="button" data-toggle="modal" data-id="<%=products.getId()%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-print edit_prd"></i></a></td>
                                                <td class="data_center"><a href="EditProduct.jsp?productid=<%=products.getId()%>" role="button" data-toggle="modal" data-id="<%=i%>"><i id="<%=i%>" class="fa-2x glyphicon glyphicon-edit edit_prd1"></i></a></td>
                                                <form action="../../DeleteProduct" method="post">
                                                    <%                                          if (session.getAttribute("i") != null) {
                                                            int i1 = (Integer) session.getAttribute("i");
                                                            String msg = (String) session.getAttribute("msg");
                                                            if (i1 == 2) {

                                                                System.out.println("fdgsfd");
                                                    %>
                                                    <div class="alert">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Danger!</strong> <%=msg%>
                                                    </div>
                                                    <%} else {%>
                                                    <div class="alert success">
                                                        <span class="closebtn">&times;</span>  
                                                        <strong>Success!</strong><%=msg%> 
                                                    </div>
                                                    <%
                                                            }
                                                            session.removeAttribute("i");
                                                            session.removeAttribute("msg");
                                                        }%>
                                                    <input type="hidden" name="productId" id="productId" value="<%=products.getId()%>">
                                                    <input type="hidden" name="prd_model1<%=i%>" id="prd_model1<%=i%>" value="<%=products.getModel().getId()%>">
                                                    <input type="hidden" name="prd_cat1<%=i%>" id="prd_cat1<%=i%>" value="<%=products.getCategory().getId()%>">
                                                    <input type="hidden" name="prd_brand1<%=i%>" id="prd_brand1<%=i%>" value="<%=products.getBrand().getId()%>">
                                                    <input type="hidden" name="prd_color1<%=i%>" id="prd_color1<%=i%>" value="<%=products.getColorModel().getId()%>">

                                                    <td><button type="submit" class="btn btn-danger table_center" >Delete</button></td>
                                                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                                                <input type="hidden" id="prd_name<%=i%>"  value="<%=products.getProductBarcode()%>" >                                                   
                                                <td class="data_center"  id="prd_model<%=i%>"><%=products.getModel().getModelName()%></td>         
                                                <td class="data_center"  id="prd_cat<%=i%>"><%=products.getCategory().getCategory()%></td>         
                                                <td class="data_center"  id="prd_brand<%=i%>"><%=products.getBrand().getBrand()%></td>         
                                                <td class="data_center"  id="prd_color<%=i%>"><%=products.getColorModel().getColorName()%></td>         
                                                <td class="data_center"  id="prd_bar<%=i%>"><%=products.getProductBarcode()%></td>         
                                                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                                   
                                                <!--<td class="data_center" id="prd_hsn<%=i%>"><%=products.getHsn()%></td>-->                                                   
                                                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getPurchasePrice()%></td>                                                 
                                                <td class="data_center" id="prd_unit<%=i%>"><%=products.getUnitPrice()%></td>                                                   
                                                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getCgst()%></td>                                                   
                                                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getSgst()%></td>                                                   
                                                <td class="data_center" id="prd_igst<%=i%>"><%=products.getIgst()%></td>                                                   

                                                <!--<td class="data_center" id="prd_desc<%=i%>"><%=products.getDiscription()%></td>-->                                                   


                                                </tr> 



                <%

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