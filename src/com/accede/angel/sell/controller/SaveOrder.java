/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.dao.BarcodeDao;
import com.accede.angel.admin.model.SessionKey;
import com.accede.angel.sell.dao.BrandDao;
import com.accede.angel.sell.dao.CategoryDao;
import com.accede.angel.sell.dao.ColorDao;
import com.accede.angel.sell.dao.ModelDao;
import com.accede.angel.sell.dao.ProductDao1;
import com.accede.angel.sell.dao.PurchaseDao;
import com.accede.angel.sell.dao.PurchaseTempDao;
import com.accede.angel.sell.dao.VendorDao;
import com.accede.angel.sell.dao.VendorTransactionDao;
import com.accede.angel.sell.model.AddModel;
import com.accede.angel.sell.model.Barcode;
import com.accede.angel.sell.model.Brand;
import com.accede.angel.sell.model.Category;
import com.accede.angel.sell.model.ColorModel;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.sell.model.PurchaseDetails;
import com.accede.angel.sell.model.PurchaseProduct;
import com.accede.angel.sell.model.PurchaseTemp;
import com.accede.angel.sell.model.Venderregistration;
import com.accede.angel.sell.model.VendorTransaction;
import com.accede.angel.services.BarcodeGenerator;
import com.accede.angel.services.DynamicGenerator;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
@WebServlet(name = "SaveOrder", urlPatterns = {"/SaveOrder"})
public class SaveOrder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String sessionidd = request.getParameter("sessionidd");
            System.out.println("sessionidd==="+sessionidd);
            boolean c=true;
            AdminDao AdminDao=new AdminDao();
            List<String> allSessionKey=AdminDao.getAllSessionKey();
            if(allSessionKey.size()>0 && allSessionKey != null )
            {
            if(allSessionKey.contains(sessionidd))
            {
                c=false;
            }else
            {
            SessionKey SessionKey=new SessionKey();
            SessionKey.setSessionkey(sessionidd);
            AdminDao.saveSessionKey(SessionKey);
            }
            }else
            {
            SessionKey SessionKey=new SessionKey();
            SessionKey.setSessionkey(sessionidd);
            AdminDao.saveSessionKey(SessionKey);
            }
            if(c)
            {
            String invoiceNo = request.getParameter("InvoiceNo");
            String amountinword = request.getParameter("amountinword");
            System.out.println("word======" + amountinword);
            System.out.println("InvoiceNo========" + invoiceNo);

            String DateOfPurchase = request.getParameter("DateOfPurchase");
            String gsttype = request.getParameter("gst_type");
            System.out.println("DateOfPurchase======" + DateOfPurchase);
            String paymentmode = request.getParameter("paymentmode");
            float Other_Charges = Float.parseFloat(request.getParameter("Other_Charges"));
            float Discount_Amount = Float.parseFloat(request.getParameter("Discount_Amount"));
            float GSt_per = Float.parseFloat(request.getParameter("GSt_per"));
            System.out.println("GrandTotal========" + Discount_Amount);
            System.out.println("Date========" + DateOfPurchase);
            long vendorname = Long.parseLong(request.getParameter("Vendor_Id"));
            //System.out.println("vendorname========"+vendorname);
            Venderregistration v = new Venderregistration();
            VendorDao dao = new VendorDao();
            v = dao.getvenderbyid(vendorname);

            List<PurchaseDetails> pdList = new ArrayList<PurchaseDetails>();
            List<PurchaseTemp> tempProduct = new PurchaseTempDao().getAllProducts();

            //float GrandTotal = 0;
            float grandsgst = 0;
            float grandcgst = 0;
            float grandigst = 0;
            float grandGstAmount = 0;
            float grandfinalamount = 0;
            float totalamountwithoutgst = 0;

            float grandtotalquantity = 0;
            float vendorbalance = v.getBalanceAmount();
            System.out.println("GrandTotal for vendor=======" + vendorbalance);

            for (PurchaseTemp p : tempProduct) {

                ProductDao1 pd = new ProductDao1();

                ProductModel product = new ProductModel();
                ProductModel product1 = new ProductModel();

                AddModel am = new AddModel();
                Brand bn = new Brand();
                ColorModel cm = new ColorModel();
                Category ct = new Category();

                product.setBrand(p.getBrand());
                product.setCategory(p.getCategory());
                product.setModel(p.getModel());
                product.setColorModel(p.getColorModel());
               product.setSubCategory(p.getSubCategory());
                product.setCgst(p.getCgstper());
                product.setSgst(p.getSgstper());
                product.setIgst(p.getIgstper());
                product.setPurchasePrice(p.getPurchasePrice());
                product.setUnitPrice(p.getMrpprice());

                product1 = pd.getProductModel(product);
                if (product1 == null) {

                    Barcode q = new Barcode();
                    BarcodeDao bad = new BarcodeDao();
                    DynamicGenerator dg = new DynamicGenerator();
                    String productshortcode = dg.Barcodegeneratot();

                    BarcodeGenerator bg = new BarcodeGenerator();
                    q.setBarcode(productshortcode);
                    DynamicGenerator dge = new DynamicGenerator();
                    String no = dge.imagenameGenerator();
                    String imagename = no + "image.png";
                    q.setImagename(imagename);
                    bg.GenerateBarcode(q);

                    int id = bad.getLastID();
                    Barcode br = new Barcode();
                    br = bad.getBarcodeByID(id);
                    product.setProductBarcode(productshortcode);
                    product.setBarcode(br);

                    pd.SaveProduct(product);
                    int productid = pd.getLastProductModel();
                    product = pd.getProductByID(productid);

                } else {
                    product = pd.getProductModel(product);
                    
                     product.setCgst(p.getCgstper());
                product.setSgst(p.getSgstper());
                product.setIgst(p.getIgstper());
                product.setPurchasePrice(p.getPurchasePrice());
                product.setUnitPrice(p.getMrpprice());
                    
                    
                }
                long purchasequantity = p.getQuantity();
                long availablequantity = product.getProductquantity();
                availablequantity = availablequantity + purchasequantity;
                product.setProductquantity(availablequantity);

                float Total = p.getTotal();

                float igstamount = p.getIgstamount();

                float cgstamount = p.getCgstamount();
                float sgstamount = p.getSgstamount();

                totalamountwithoutgst = totalamountwithoutgst + Total;
                grandfinalamount = grandfinalamount + p.getFinalAmount();
                float PurchasePrice = p.getPurchasePrice();
                //float Unitprice = p.getUnitprice();
                float taxableAmount = 0;
                taxableAmount = igstamount + cgstamount + sgstamount;

                grandsgst = grandsgst + sgstamount;
                grandcgst = grandcgst + cgstamount;
                grandigst = grandigst + igstamount;
                grandGstAmount = grandsgst + grandcgst + grandigst;

                grandtotalquantity = grandtotalquantity + purchasequantity;
                pd.updateProductQuentity(product);
                PurchaseDao purd = new PurchaseDao();
                PurchaseDetails tm = new PurchaseDetails();

                tm.setCgstamount(cgstamount);
                tm.setSgstamount(sgstamount);
                tm.setIgstamount(igstamount);
                tm.setCgstper(p.getCgstper());
                tm.setSgstper(p.getSgstper());
                tm.setIgstper(p.getIgstper());

                tm.setPurchasePrice(PurchasePrice);

                tm.setQuantity(purchasequantity);

                tm.setProductModel(product);

                tm.setTotal(Total);
                tm.setTaxableAmount(taxableAmount);

                tm.setFinalAmount(p.getFinalAmount());

                try {
                    tm.setPurchase_Date(new SimpleDateFormat("dd/MM/yyyy").parse(DateOfPurchase));
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }

                purd.savePurchaseDetails(tm);

                pdList.add(tm);

            }
            grandfinalamount = grandfinalamount + Other_Charges - Discount_Amount;

            PurchaseProduct sale = new PurchaseProduct();
            sale.setGrandTotal(grandfinalamount);
            sale.setGrandcgst(grandcgst);
            sale.setGrandsgst(grandsgst);
            sale.setGrandigst(grandigst);
            sale.setInvoiceID(invoiceNo);
            sale.setGrandTotalGst(grandGstAmount);
            sale.setGrandtotalquantity(grandtotalquantity);
            sale.setPurchaseDetails(pdList);
            sale.setVendorid(v);
            sale.setGSTType(gsttype);
            sale.setGstpercenatge(GSt_per);
            sale.setOthercharges(Other_Charges);
            sale.setDiscountamount(Discount_Amount);
            sale.setGrandTotalinword(amountinword);
sale.setPaymentmode(paymentmode);
            try {
                sale.setPurchase_Date(new SimpleDateFormat("dd/MM/yyyy").parse(DateOfPurchase));
            } catch (ParseException ex) {
                ex.printStackTrace();
            }

            Boolean b = new PurchaseDao().savePurchaseProduct(sale);

            if (b) {

                float BalanceAmount = grandfinalamount + vendorbalance;
                v.setBalanceAmount(BalanceAmount);
                boolean b1 = dao.updatevendor(v);
                VendorTransaction vt = new VendorTransaction();
                vt.setVendorid(v);
                vt.setTransactionAmount(grandfinalamount);
                String ss = "Purchase order against=:" + invoiceNo;
                System.out.println(ss);
                vt.setReason(ss);
                vt.setTransactionType("Credit");
                try {
                    vt.setTransaction_Date(new SimpleDateFormat("dd/MM/yyyy").parse(DateOfPurchase));
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
                vt.setVendor_Id(vendorname);

                VendorTransactionDao dao1 = new VendorTransactionDao();
                boolean bb = dao1.SaveTransactionDetails(vt);

                int i = 1;

                response.sendRedirect("Admin/admin/Purchase.jsp");
            } else {
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                response.sendRedirect("Admin/admin/Purchase.jsp");
            }
            }else
            {
             int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Purchase Order Save Succssfully");
                response.sendRedirect("Admin/admin/Purchase.jsp");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
