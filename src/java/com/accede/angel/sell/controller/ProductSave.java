                /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.admin.dao.BarcodeDao;
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
import com.accede.angel.services.BarcodeGenerator;
import com.accede.angel.services.DynamicGenerator;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProductSave", urlPatterns = {"/ProductSave"})
public class ProductSave extends HttpServlet {

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
            String Category = request.getParameter("Category");
            String[] SubCa = request.getParameterValues("SubCategory");
            String hsncode = request.getParameter("hsncode");
            String[] Brand = request.getParameterValues("Brand");
            String[] Model = request.getParameterValues("Model");
            String[] ColorName = request.getParameterValues("ColorName");

            long Categoryid = Long.parseLong(Category);
            List<String> list = Arrays.asList(SubCa);
            List<String> list1 = Arrays.asList(Brand);
            List<String> list2 = Arrays.asList(Model);
            List<String> list3 = Arrays.asList(ColorName);
            int count = 0;
            int rejectcount = 0;
             Category ct = new CategoryDao().getelementByID(Categoryid);
            for (int i = 0; i < list.size(); i++) {

                long SubCategoryid = Long.parseLong(list.get(i));
                    SubCategory SubCategory = new SubCatDao().getelementByID(SubCategoryid);
                for (int j = 0; j < list1.size(); j++) {
                    int Brandid = Integer.parseInt(list1.get(j));
                     Brand bn = new BrandDao().getelementByID(Brandid);
                    for (int k = 0; k < list2.size(); k++) {
                        int Modelid = Integer.parseInt(list2.get(k));
                        AddModel am = new ModelDao().getelementByID(Modelid);
                        for (int l = 0; l < list3.size(); l++) {
                            int ColorNameid = Integer.parseInt(list3.get(l));
                            
                           
                            ColorModel cm = new ColorDao().getelementByID(ColorNameid);
                           
                        
                            ProductModel product = new ProductModel();
                            ProductModel product1 = new ProductModel();
                            ProductDao1 pd = new ProductDao1();
                            product.setBrand(bn);
                            product.setCategory(ct);
                            product.setModel(am);
                            product.setColorModel(cm);
                            product.setSubCategory(SubCategory);
                            product1 = pd.getProductModel(product);
                            if (product1 == null) {
                                product.setCatid(Categoryid);
                                product.setSubcatid(SubCategoryid);
                                product.setBrandid(Brandid);
                                product.setModelid(Modelid);
                                product.setColorModelid(ColorNameid);
                                Barcode q = new Barcode();
                                BarcodeDao bad = new BarcodeDao();
                                DynamicGenerator dg = new DynamicGenerator();
                                String productshortcode = dg.Barcodegeneratot();

                                BarcodeGenerator bg = new BarcodeGenerator();
                                q.setBarcode(productshortcode);
                                DynamicGenerator dge = new DynamicGenerator();
                                String no = dge.imagenameGenerator();
                                String imagename = no + "image";
                                q.setImagename(imagename);
                                bg.GenerateBarcode(q);

                                int id = bad.getLastID();
                                Barcode br = new Barcode();
                                br = bad.getBarcodeByID(id);
                                product.setProductBarcode(productshortcode);
                                product.setBarcode(br);

                                pd.SaveProduct(product);
                                count++;

                            } else {
                                rejectcount++;

                            }
                        }
                    }
                }
            }
            int i = 1;
            HttpSession session = request.getSession();
            session.setAttribute("i", i);
            session.setAttribute("msg", " " + count +"  Product  Added ...!!!!!");
            response.sendRedirect("Admin/admin/ProductSave.jsp");

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
