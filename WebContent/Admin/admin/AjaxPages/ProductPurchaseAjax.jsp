

<%@page import="com.accede.angel.sell.model.CustomerSaleDetails"%>
<%@page import="com.accede.angel.sell.dao.CustomerSaleDAO"%>
<%@page import="com.accede.angel.sell.model.CustomerSale"%>
<%@page import="com.accede.angel.sell.model.BranchSaleDetails"%>
<%@page import="com.accede.angel.sell.dao.SaveBranchSaleDAO"%>
<%@page import="com.accede.angel.sell.model.BranchSale"%>
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
String Branch = request.getParameter("Branch");
 
    String vendorid = request.getParameter("vendorid");
    System.out.print("/////////////////////vendorid///////////////////////" + vendorid);
    System.out.print("/////////////////////vendorid///////////////////////" + vendorid);
    System.out.print("/////////////////////vendorid///////////////////////" + vendorid);
    System.out.print("/////////////////////vendorid///////////////////////" + vendorid);
    String SubCategory = request.getParameter("SubCategory");
    String ColorName = request.getParameter("ColorName");
    String noofdays = request.getParameter("noofdays");
    int id = 0;
    int adminid = 0;
    long Categoryid = 0;
    int Brandid = 0;
    int Modelid = 0;
    int Colorid = 0;
    long SubCategoryid = 0;
    int noofdayss = 0;
    long vendoridd = 0;
    Venderregistration Venderregistration = new Venderregistration();

    if (!noofdays.equals("")) {
        noofdayss = Integer.parseInt(noofdays);

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
 if (!Branch.equals("")) {
        adminid = Integer.parseInt(Branch);

    }
    System.out.println("cat-" + Categoryid);
    System.out.println("modr-" + Modelid);

    System.out.println("bar-" + Brandid);
    System.out.println("Colorid-" + Colorid);
    System.out.println("id-" + id);
    String transfer = request.getParameter("transfer");
     ProductDao1 ProductDao1 = new ProductDao1();
                        List<Integer> allproduct = null;
                        allproduct = ProductDao1.getAllProduct1(Categoryid, SubCategoryid, Brandid, Modelid, Colorid);
                       
%>



<div id="Report_Fetch">
    <div class="x_content table-responsive">
         

            <%
                if (transfer.equals("1")) {
            %>
         <h2>   Product Purchase Report
            
          </h2>  <div id="output1">
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

                        allProducts = PurchaseDao.getPurchaseProductInoutt(Venderregistration, noofdayss);

                        SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("dd-MM-yyyy");
                       
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
            <%} else if (transfer.equals("2")) {%>
            <h2> Product Sell To Branch Report</h2>
             <div id="Report_Fetch">
                                            <table id="datatable" class="table table-striped table-bordered">
                                                <thead> <tr>
                                                        <th class="text-center" >Sr.No</th>
                                                        <th class="text-center" >Sale_Date</th>


                                                        <th class="text-center" >Branch Name</th>
                                                       
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

                                                    <%
                                                        BranchSale p = new BranchSale();
                                                        SaveBranchSaleDAO SaveBranchSaleDAO = new SaveBranchSaleDAO();

                                                        List<BranchSale> cl = null;
                                                        float grandtotal = 0.0f;
                                                        float other_charges = 0.0f;
                                                        float discount_amount = 0.0f;
                                                        float grosstotal = 0.0f;

                                                       

                                                        cl = SaveBranchSaleDAO.getBranchSaleInoutt(noofdayss,adminid);
                                                        int i = 0;
                                                        if (cl != null && cl.size() > 0) {
                                                            for (BranchSale c1 : cl) {
                                                                SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("dd-MM-yyyy");
                                                                String date1 = DATE_FORMAT1.format(c1.getDate());
                                                                List<BranchSaleDetails> AllProduct = c1.getBranchsaledetails();

                                                                for (BranchSaleDetails products : AllProduct) {
                                                                     if (allproduct.contains(products.getProduct().getId())) {
                                                                    i++;
                                                    %>
                                                    <tr>
                                                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                                                <td class="data_center"><%=i%></td>
                                                <td class="data_center"><%=date1%></td>


                                                </form>
<!--                                                        <td class="data_center"><a href="PrintBarcode.jsp?Barcodeid=<%=products.getId()%>" target="_blank" class="btn btn-primary edit_prd"><i>Print</i></a></td>-->
                                                <td class="data_center" id="prd_name<%=i%>"><%=c1.getAdmin().getAdminOfBranch().getBranchName()%></td> 
                                               
                                                <td  class="data_center"><%=products.getProduct().getCategory().getCategory()%></td>
                                                <td  class="data_center"><%=products.getProduct().getSubCategory().getSubCategory()%></td>
                                                <td  class="data_center"><%=products.getProduct().getBrand().getBrand()%></td>
                                                <td  class="data_center"><%=products.getProduct().getModel().getModelName()%></td>

                                                <td  class="data_center"><%=products.getProduct().getColorModel().getColorName()%></td>

                                                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                    
                                                <td class="data_center" id="prd_bar<%=i%>"><%=products.getProduct().getProductBarcode()%></td>         

                                                <td class="data_center" id="prd_mrp<%=i%>"><%=products.getProduct().getPurchasePrice()%></td>                                                 
                                                <td class="data_center" id="prd_unit<%=i%>"><%=products.getProduct().getUnitPrice()%></td>                                                   
                                                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProduct().getCgst()%></td>                                                   
                                                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProduct().getSgst()%></td>                                                   
                                                <td class="data_center" id="prd_igst<%=i%>"><%=products.getProduct().getIgst()%></td>                                                   



                                                </tr> 
                                                <%}
                                                                } }
                                                    }

                                                %>                                                 
                                                </tbody>
                                            </table>
                                        </div>
            
            
            <%} else if (transfer.equals("3")) {%>  <h2> Product Sell To Customer Report</h2>
            
            
               <div id="Report_Fetch">
                                        <table id="datatable-buttons" class="table table-striped table-bordered">
                                            <thead>
                                                    <tr>
                                                        <th>Sr No.</th>
                                                        <th>Branch</th>
                                                        <th>Sale Date</th>     
                                                        <th>Category</th>
                                                        <th>Sub-Category</th>
                                                        <th>Model No</th> 
                                                        <th>Brand</th> 
                                                        <th>Color</th> 
                                                        <th>Sell Quantity</th> 
                                                        <th>Product Price</th> 
                                                       
                                                        <th>Total</th> 
                                                        
  


                                                    </tr>
                                                </thead>
                                            <tbody>

                                                <%
                                                    CustomerSale p = new CustomerSale();
                                                    CustomerSaleDAO cd = new CustomerSaleDAO();
                                               
                                                    List<CustomerSale> cl = null;
                                                  
                                                 

                                                 
                                                                cl = cd.getCustomerSaleInoutt(noofdayss,adminid);
                                                           
                                                    int i = 0;
                                                    if (cl != null && cl.size() > 0) {
                                                        for (CustomerSale c11 : cl) {
                                                           
  List<CustomerSaleDetails> AllProduct = c11.getCustomerSaleDetails();
                                                        
                                                        for (CustomerSaleDetails c1 : AllProduct) {
                                                        
                                                             if (allproduct.contains(c1.getProduct().getId())) {
                                                                   
                                                            SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("dd-MM-yyyy");
                                                            String date1 = DATE_FORMAT1.format(c11.getDate());
                                                            i++;
                                                %>
                                                 <tr> <td><%=i%></td>
                                                        <td><%=c11.getAdmin().getAdminOfBranch().getBranchName()%></td>
                                                        <td><%=c1.getDate()%></td>
                                                        <td><%=c1.getProduct().getCategory().getCategory()%></td>
                                                        <td><%=c1.getProduct().getSubCategory().getSubCategory()%></td>
                                                        <td><%=c1.getProduct().getModel().getModelName()%></td>
                                                        <td><%=c1.getProduct().getBrand().getBrand()%></td>
                                                        <td><%=c1.getProduct().getColorModel().getColorName()%></td>

                                                        <td><%=c1.getProductquantity()%></td>
                                                        <td><%=c1.getMrpprice()%></td>

                                                        <td><%=c1.getGross_amount()%></td>   </tr>
                                                <%

                                                          
                                                        }}}
                                                    }
                                                %>

                                            </tbody>

                                            


                                        </table>
                                        </div>
            
            
              <%} else if (transfer.equals("4")) {%>
            <h2> Product Transfer Report</h2>
            
            
<div id="Report_Fetch">
    <div class="x_content table-responsive">
        <!--                    <p class="text-muted font-13 m-b-30">
                              The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                            </p>-->
        <div id="output1">
            <table id="datatable" class="table table-striped table-bordered">
                <thead> <tr>
                        <th class="text-center" >Sr.No</th>


                      
            
                        <th class="text-center" >To Branch</th>
                        <th class="text-center" >Transfer_Date</th>
                        
                        <th class="text-center" > Category</th>
                        <th class="text-center" >Sub Category</th>
                        <th class="text-center" >Brand</th>
                        <th class="text-center" >Model No</th>

                        <th class="text-center" >Color</th>

                        <th class="text-center" >Quantity</th>
                        <th class="text-center" > Bar Code</th>



                        <th class="text-center" >MRP Price</th>
                        <th class="text-center" >CGST (%)</th>
                        <th class="text-center" >SGST (%)</th>
                        <th class="text-center" >IGST (%)</th>




                    </tr>
                </thead>
                <tbody>      

                    <%                                                    BranchClassTransferDao pdo = new BranchClassTransferDao();

                        BranchClassTransfer pm = new BranchClassTransfer();
                        List<BranchClassTransfer> allProducts = null;
                         SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("dd-MM-yyyy");
                         
                            long totalq = 0;
                          
                         System.out.println("*************************************************************");
                         System.out.println("********************************allproduct*****************************"+allproduct.size());
                         System.out.println("********************************allproduct*****************************"+allproduct.toString());
                         System.out.println("*************************************************************");
                     
                       
                         allProducts = pdo.getBranchClassTransferInoutt(id,noofdayss,adminid);
                        
  System.out.println("*************************************************************");
                         System.out.println("********************************allProducts*****************************"+allProducts.size());
                         System.out.println("********************************allProducts*****************************"+allProducts.toString());
                         System.out.println("*************************************************************");
                        if (allProducts != null && allProducts.size() > 0) {
                            int i = 0;
                            for (BranchClassTransfer products : allProducts) {
  System.out.println("********************************products*****************************"+products.getProduct().getId());
  System.out.println("********************************proboolean resultducts*****************************"+allproduct.contains(products.getProduct().getId()));
                       
                              if(allproduct.contains(products.getProduct().getId()))
                              {
                                    i++;  
                                    String date1 = DATE_FORMAT1.format(products.getDate());
 totalq = totalq + products.getProductquantity();
                                                                                   


                    %>                             

                    <tr>
                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                <td class="data_center"><%=i%></td>

                 <td class="data_center" id="prd_name<%=i%>"><%=products.getToadmin().getAdminOfBranch().getBranchName()%></td> 
                <td  class="data_center"><%=date1%></td>  <td  class="data_center"><%=products.getProduct().getCategory().getCategory()%></td>
                <td  class="data_center"><%=products.getProduct().getSubCategory().getSubCategory()%></td>
                <td  class="data_center"><%=products.getProduct().getBrand().getBrand()%></td>
                <td  class="data_center"><%=products.getProduct().getModel().getModelName()%></td>

                <td  class="data_center"><%=products.getProduct().getColorModel().getColorName()%></td>

                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                    
                <td class="data_center" id="prd_bar<%=i%>"><%=products.getProduct().getProductBarcode()%></td>         


                <td class="data_center" id="prd_unit<%=i%>"><%=products.getProduct().getUnitPrice()%></td>                                                   
                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProduct().getCgst()%></td>                                                   
                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProduct().getSgst()%></td>                                                   
                <td class="data_center" id="prd_igst<%=i%>"><%=products.getProduct().getIgst()%></td>                                                   



                </tr> 




                <%}
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




                                                                        </tr>
                                                                    </tfoot>
            </table>
        </div>
    </div>
</div>
              <%} else  {%>
            <h2> Product Receive Report</h2>
            
            
<div id="Report_Fetch">
    <div class="x_content table-responsive">
        <!--                    <p class="text-muted font-13 m-b-30">
                              The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                            </p>-->
        <div id="output1">
            <table id="datatable" class="table table-striped table-bordered">
                <thead> <tr>
                        <th class="text-center" >Sr.No</th>


                      
      
                        
                           <th class="text-center" >From Branch</th>
                        <th class="text-center" >Receive_Date</th>
                     
                        <th class="text-center" > Category</th>
                        <th class="text-center" >Sub Category</th>
                        <th class="text-center" >Brand</th>
                        <th class="text-center" >Model No</th>

                        <th class="text-center" >Color</th>

                        <th class="text-center" >Quantity</th>
                        <th class="text-center" > Bar Code</th>



                        <th class="text-center" >MRP Price</th>
                        <th class="text-center" >CGST (%)</th>
                        <th class="text-center" >SGST (%)</th>
                        <th class="text-center" >IGST (%)</th>




                    </tr>
                </thead>
                <tbody>      

                    <%                                                    BranchClassTransferDao pdo = new BranchClassTransferDao();

                        BranchClassTransfer pm = new BranchClassTransfer();
                        List<BranchClassTransfer> allProducts = null;
                         SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("dd-MM-yyyy");
                   
                            long totalq = 0;
                          
                         System.out.println("*************************************************************");
                         System.out.println("********************************allproduct*****************************"+allproduct.size());
                         System.out.println("********************************allproduct*****************************"+allproduct.toString());
                         System.out.println("*************************************************************");
                     
                          allProducts = pdo.getBranchClassTransferInoutt(adminid,noofdayss,id);
                       
  System.out.println("*************************************************************");
                         System.out.println("********************************allProducts*****************************"+allProducts.size());
                         System.out.println("********************************allProducts*****************************"+allProducts.toString());
                         System.out.println("*************************************************************");
                        if (allProducts != null && allProducts.size() > 0) {
                            int i = 0;
                            for (BranchClassTransfer products : allProducts) {
  System.out.println("********************************products*****************************"+products.getProduct().getId());
  System.out.println("********************************proboolean resultducts*****************************"+allproduct.contains(products.getProduct().getId()));
                       
                              if(allproduct.contains(products.getProduct().getId()))
                              {
                                    i++;  
                                    String date1 = DATE_FORMAT1.format(products.getDate());
 totalq = totalq + products.getProductquantity();
                                                                                   


                    %>                             

                    <tr>
                <input type="hidden" value="<%=products.getId()%>" id="prd_id<%=i%>">
                <td class="data_center"><%=i%></td>

                 <td class="data_center" id="prd_name<%=i%>"><%=products.getToadmin().getAdminOfBranch().getBranchName()%></td> 
                <td  class="data_center"><%=date1%></td>  <td  class="data_center"><%=products.getProduct().getCategory().getCategory()%></td>
                <td  class="data_center"><%=products.getProduct().getSubCategory().getSubCategory()%></td>
                <td  class="data_center"><%=products.getProduct().getBrand().getBrand()%></td>
                <td  class="data_center"><%=products.getProduct().getModel().getModelName()%></td>

                <td  class="data_center"><%=products.getProduct().getColorModel().getColorName()%></td>

                <td class="data_center" id="prd_quant<%=i%>"><%=products.getProductquantity()%></td>                                    
                <td class="data_center" id="prd_bar<%=i%>"><%=products.getProduct().getProductBarcode()%></td>         


                <td class="data_center" id="prd_unit<%=i%>"><%=products.getProduct().getUnitPrice()%></td>                                                   
                <td class="data_center" id="prd_cgst<%=i%>"><%=products.getProduct().getCgst()%></td>                                                   
                <td class="data_center" id="prd_sgst<%=i%>"><%=products.getProduct().getSgst()%></td>                                                   
                <td class="data_center" id="prd_igst<%=i%>"><%=products.getProduct().getIgst()%></td>                                                   



                </tr> 




                <%}
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




                                                                        </tr>
                                                                    </tfoot>
            </table>
        </div>
    </div>
</div>
            <%}%>
      
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