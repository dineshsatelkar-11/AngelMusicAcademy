/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.admin.dao.BarcodeDao;
import com.accede.angel.admin.dao.BranchDao;
import com.accede.angel.admin.dao.ProductDao;
import com.accede.angel.admin.model.Branch;
import com.accede.angel.sell.dao.BrandDao;
import com.accede.angel.sell.dao.CategoryDao;
import com.accede.angel.sell.dao.ColorDao;
import com.accede.angel.sell.dao.ModelDao;
import com.accede.angel.sell.dao.ProductDao1;
import com.accede.angel.sell.model.AddModel;
import com.accede.angel.sell.model.Barcode;
import com.accede.angel.sell.model.Brand;
import com.accede.angel.sell.model.Category;
import com.accede.angel.sell.model.ColorModel;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.services.BarcodeGenerator;
import com.accede.angel.services.DynamicGenerator;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {

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
            String productname = request.getParameter("productname");

            long productquantity = Long.parseLong(request.getParameter("productquantity"));
            long Category = Long.parseLong(request.getParameter("Category"));
            int Brand = Integer.parseInt(request.getParameter("Brand"));
            int Model = Integer.parseInt(request.getParameter("Model"));
            int ColorName = Integer.parseInt(request.getParameter("ColorName"));

            System.out.println("Category" + Category);
            System.out.println("Brand" + Brand);
            System.out.println("Model" + Model);
            System.out.println("ColorName" + ColorName);
            ModelDao md = new ModelDao();
            CategoryDao cd = new CategoryDao();
            BrandDao bd1 = new BrandDao();
            ColorDao cdo = new ColorDao();
            AddModel am = md.getelementByID(Model);
            ColorModel cm = cdo.getelementByID(ColorName);
            Brand bn = bd1.getelementByID(Brand);
            Category cat = cd.getelementByID(Category);

            String Hsn = request.getParameter("Hsn");
            String Discription = request.getParameter("Discription");

            float Mrpprice = Float.parseFloat(request.getParameter("Mrpprice"));
            float unitprice = Float.parseFloat(request.getParameter("Sellprice"));
            float Cgst = Float.parseFloat(request.getParameter("Cgst"));
            float Sgst = Float.parseFloat(request.getParameter("Sgst"));
            float Igst = Float.parseFloat(request.getParameter("Igst"));
            Barcode q = new Barcode();
            BarcodeDao bd = new BarcodeDao();
            DynamicGenerator dg = new DynamicGenerator();
            String productshortcode = dg.Barcodegeneratot();

            BarcodeGenerator bg = new BarcodeGenerator();
            q.setBarcode(productshortcode);

            q.setImagename(productname);
            bg.GenerateBarcode(q);

            int id = bd.getLastID();
            Barcode br = new Barcode();
            br = bd.getBarcodeByID(id);
            ProductModel pd = new ProductModel();
            ProductDao1 pdo = new ProductDao1();

            pd.setProductname(productname);
            pd.setProductBarcode(productshortcode);
            pd.setProductquantity(productquantity);
            pd.setHsn(Hsn);
            pd.setPurchasePrice(Mrpprice);
            pd.setUnitPrice(unitprice);
            pd.setSgst(Sgst);
            pd.setCgst(Cgst);
            pd.setIgst(Igst);

            //HttpSession session1 = request.getSession();
            pd.setBarcode(br);
            //pd.setAdminOfBranch(Branch);
            pd.setDiscription(Discription);
            pd.setCategory(cat);
            pd.setColorModel(cm);
            pd.setBrand(bn);
            pd.setModel(am);
            Boolean b = pdo.SaveProduct(pd);

            if (b) {
                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Product Added Successfully");
                response.sendRedirect("Admin/admin/AddProduct.jsp");
            } else {
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Product Already Added ");
                response.sendRedirect("Admin/admin/AddProduct.jsp");
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
