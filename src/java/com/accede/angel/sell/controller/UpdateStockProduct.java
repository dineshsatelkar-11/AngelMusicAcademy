/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.sell.dao.ProductDao1;
import com.accede.angel.sell.model.ProductModel;
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
@WebServlet(name = "UpdateStockProduct", urlPatterns = {"/UpdateStockProduct"})
public class UpdateStockProduct extends HttpServlet {

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
           String productname = request.getParameter("modal_prd_name1");
            
            long productquantity = Long.parseLong(request.getParameter("modal_prd_quant1"));
            String Hsn = request.getParameter("modal_prd_hsn");
            String Discription = request.getParameter("modal_prd_desc");

            float Mrpprice = Float.parseFloat(request.getParameter("modal_prd_mrp"));
            float unitprice = Float.parseFloat(request.getParameter("modal_prd_unit"));
            float Cgst = Float.parseFloat(request.getParameter("modal_prd_cgst"));
            float Sgst = Float.parseFloat(request.getParameter("modal_prd_sgst"));
            float Igst = Float.parseFloat(request.getParameter("modal_prd_igst"));
            int id = Integer.parseInt(request.getParameter("modal_prd_id1"));
            System.out.println("productname==="+productname);
            System.out.println("Hsn==="+Hsn);
            System.out.println("Discription==="+Discription);
            System.out.println("Mrpprice==="+Mrpprice);
            System.out.println("unitprice==="+unitprice);
            System.out.println("Cgst==="+Cgst);
            System.out.println("Sgst==="+Sgst);
            System.out.println("id==="+id);
            ProductModel pd = new ProductModel();
            ProductDao1 pdo = new ProductDao1();
            pd=pdo.getProductByID(id);
            pd.setProductname(productname);
        
            pd.setProductquantity(productquantity);
            pd.setHsn(Hsn);
            pd.setPurchasePrice(Mrpprice);
            pd.setUnitPrice(unitprice);
            pd.setSgst(Sgst);
            pd.setCgst(Cgst);
            pd.setIgst(Igst);
             pd.setDiscription(Discription);
             System.out.println("productname1==="+pd.getProductname());
            System.out.println("Hsn1==="+pd.getHsn() );
            System.out.println("Discription1==="+pd.getDiscription() );
            
            System.out.println("Cgst1==="+pd.getCgst() );
            System.out.println("Sgst1==="+pd.getSgst() );
            System.out.println("id1==="+pd.getId() );
              Boolean b = pdo.UpdateProduct(pd);
              
            if(b)
            {
                int i=1;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Product Updated Successfully");
                response.sendRedirect("Admin/admin/ProductStock.jsp");
            }
            else
            {
                 int i=2;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
                 session.setAttribute("msg", "Something Went Wrong");
                response.sendRedirect("Admin/admin/ProductStock.jsp" );
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
