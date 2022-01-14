/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.sell.dao.BrandDao;
import com.accede.angel.sell.dao.CategoryDao;
import com.accede.angel.sell.dao.ColorDao;
import com.accede.angel.sell.dao.ModelDao;
import com.accede.angel.sell.dao.ProductDao1;
import com.accede.angel.sell.dao.SubCatDao;
import com.accede.angel.sell.model.AddModel;
import com.accede.angel.sell.model.Barcode;
import com.accede.angel.sell.model.Brand;
import com.accede.angel.sell.model.Category;
import com.accede.angel.sell.model.ColorModel;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.sell.model.SubCategory;
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
@WebServlet(name = "UpdateProduct", urlPatterns = {"/UpdateProduct"})
public class UpdateProduct extends HttpServlet {

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

            int modal_prd_quant1 = Integer.parseInt(request.getParameter("modal_prd_quant1"));
            long productquantity = Long.parseLong(request.getParameter("productquantity"));
            float Mrpprice = Float.parseFloat(request.getParameter("Mrpprice"));
            float unitprice = Float.parseFloat(request.getParameter("Sellprice"));
            float Cgst = Float.parseFloat(request.getParameter("Cgst"));
            float Sgst = Float.parseFloat(request.getParameter("Sgst"));
            float Igst = Float.parseFloat(request.getParameter("Igst"));

            long Category = Long.parseLong(request.getParameter("Category"));
            int Brand = Integer.parseInt(request.getParameter("Brand"));
            int Model = Integer.parseInt(request.getParameter("Model"));
            int ColorName = Integer.parseInt(request.getParameter("ColorName"));
            int subCategoryID = Integer.parseInt(request.getParameter("subCategory"));
             System.out.println("subCategoryID===" + subCategoryID);
            ModelDao md = new ModelDao();
            CategoryDao cd = new CategoryDao();
            BrandDao bd1 = new BrandDao();
            ColorDao cdo = new ColorDao();
            SubCatDao SubCatDao = new SubCatDao();
            AddModel am = md.getelementByID(Model);
            ColorModel cm = cdo.getelementByID(ColorName);
            Brand bn = bd1.getelementByID(Brand);
            Category cat = cd.getelementByID(Category);
            SubCategory SubCategory = SubCatDao.getelementByID(subCategoryID);

            ProductModel pd = new ProductModel();
            ProductDao1 pdo = new ProductDao1();
            pd = pdo.getProductByID(modal_prd_quant1);
            System.out.println("Category===" + Category);
            System.out.println("Category===" + Category);
            System.out.println("SubCategory===" + SubCategory.getId());
            System.out.println("Model===" + Model);
            System.out.println("Brand===" + Brand);
            System.out.println("ColorName===" + ColorName);
            System.out.println("Brand===" + pd.getBrand().getId());
            System.out.println("Category===" + pd.getCategory().getId());
            System.out.println("Model===" + pd.getModel().getId());
            System.out.println("ColorName===" + pd.getColorModel().getId());
            if (Category == pd.getCategory().getId() && subCategoryID == pd.getSubCategory().getId() && Brand == pd.getBrand().getId() && Model == pd.getModel().getId() && ColorName == pd.getColorModel().getId()) 
            {
                pd.setProductquantity(productquantity);

                pd.setPurchasePrice(Mrpprice);
                pd.setUnitPrice(unitprice);
                pd.setSgst(Sgst);
                pd.setCgst(Cgst);
                pd.setIgst(Igst);
                pd.setCategory(cat);
                pd.setSubCategory(SubCategory);
                pd.setColorModel(cm);
                pd.setBrand(bn);
                pd.setModel(am);

                pd.setCatid(Category);
                pd.setSubcatid(subCategoryID);
                pd.setBrandid(Brand);
                pd.setModelid(Model);
                pd.setColorModelid(ColorName);

                System.out.println("productname1===" + pd.getProductname());
                System.out.println("Hsn1===" + pd.getHsn());
                System.out.println("Discription1===" + pd.getDiscription());

                System.out.println("Cgst1===" + pd.getCgst());
                System.out.println("Sgst1===" + pd.getSgst());
                System.out.println("id1===" + pd.getId());

                Boolean b = pdo.UpdateProduct(pd);

                if (b) {
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Product Updated Successfully");
                    response.sendRedirect("Admin/admin/AddProduct.jsp");
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong");
                    response.sendRedirect("Admin/admin/AddProduct.jsp");
                }
            } else {

                ProductModel pd2 = new ProductModel();
                pd.setProductquantity(productquantity);

                pd.setPurchasePrice(Mrpprice);
                pd.setUnitPrice(unitprice);
                pd.setSgst(Sgst);
                pd.setCgst(Cgst);
                pd.setIgst(Igst);
                pd.setCategory(cat);
                pd.setColorModel(cm);
                pd.setBrand(bn);
                pd.setModel(am);
                pd.setSubCategory(SubCategory);
                pd.setCatid(Category);
                pd.setSubcatid(subCategoryID);
                pd.setBrandid(Brand);
                pd.setModelid(Model);
                pd.setColorModelid(ColorName);

                System.out.println("productname1===" + pd.getProductname());
                System.out.println("SubCategory===" + SubCategory.getId());
                System.out.println("subCategoryID===" + subCategoryID);
                System.out.println("productname1===" + pd.getProductname());
                System.out.println("Hsn1===" + pd.getHsn());
                System.out.println("Discription1===" + pd.getDiscription());

                System.out.println("Cgst1===" + pd.getCgst());
                System.out.println("Sgst1===" + pd.getSgst());
                System.out.println("id1===" + pd.getId());

                Boolean b = pdo.UpdateProduct1(pd);

                if (b) {
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Product Updated Successfully");
                    response.sendRedirect("Admin/admin/AddProduct.jsp");
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Product Alreday Added For These Requirment");
                    response.sendRedirect("Admin/admin/AddProduct.jsp");
                }

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
