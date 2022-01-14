/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.InstrumentDao;
import com.accede.angel.admin.dao.InstrumentSubcategoryDao;
import com.accede.angel.admin.dao.ProductDao;
import com.accede.angel.admin.model.Instrument;
import com.accede.angel.admin.model.InstrumentSubcategory;
import com.accede.angel.admin.model.Product;
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
 * @author Accede
 */
@WebServlet(name = "AddProduct", urlPatterns = {"/AddProduct"})
public class AddProduct extends HttpServlet {

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
            String productName = request.getParameter("productName");
            String Instumentid = request.getParameter("Instumentid");
            String Instumentsub = request.getParameter("Instumentsub");
            String modelNo = request.getParameter("modelNo");
            String brand = request.getParameter("brand");
            String color = request.getParameter("color");
            String unitPrice = request.getParameter("unitPrice");
            String transportCharge = request.getParameter("transportCharge");
            String sellPrice = request.getParameter("sellPrice");
            String quentity = request.getParameter("quentity");
            String cgst = request.getParameter("cgst");
            String sgst = request.getParameter("sgst");
            String igst = request.getParameter("igst");
//            String hsncode = request.getParameter("hsncode");
            String hsncode = "";
            float cgst1 = Float.parseFloat(cgst);
            float unitPrice1 = Float.parseFloat(unitPrice);
            float sellPrice1 = Float.parseFloat(sellPrice);
            float sgst1 = Float.parseFloat(sgst);
            float igst1 = Float.parseFloat(igst);
            float transportCharge1 = Float.parseFloat(transportCharge);
            
            int quant=Integer.parseInt(quentity);
             int instrum=Integer.parseInt(Instumentid);
             long Instumentsub1=Long.parseLong(Instumentsub);
            Product pr=new Product();
            Instrument instrument=new Instrument();
            InstrumentSubcategory inst=new InstrumentSubcategory();
            InstrumentDao idd=new InstrumentDao();
            InstrumentSubcategoryDao ido=new InstrumentSubcategoryDao();
            instrument=idd.getInstrumentByID(instrum);
            inst=ido.getInstrumentSubcategoryByID(Instumentsub1);
            pr.setBrand(brand);
            pr.setCgst(cgst1);
            pr.setColor(color);
            pr.setHSN_Code(hsncode);
            pr.setIgst(igst1);
            pr.setInstrumentName(instrument);
            pr.setInstrumentSubcategory(inst);
            pr.setModelNo(modelNo);
            pr.setProductName(productName);
            pr.setQuentity(quant);
            pr.setSellPrice(sellPrice1);
            pr.setSgst(sgst1);
            pr.setTransportCharge(transportCharge1);
            pr.setUnitPrice(unitPrice1);
            ProductDao pd=new ProductDao();
            Boolean b=pd.saveProduct(pr);
               if(b){
               
               
                 int i=1;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Subject Added successfully');");
//                out.println("location='Admin/admin/addSubject.jsp';");
//                out.println("</script>");
                response.sendRedirect("Admin/admin/addProducts.jsp" );
            }
            else{
                   int i=2;
                     HttpSession session = request.getSession();
                session.setAttribute("i", i);
                response.sendRedirect("Admin/admin/addProducts.jsp" );
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
