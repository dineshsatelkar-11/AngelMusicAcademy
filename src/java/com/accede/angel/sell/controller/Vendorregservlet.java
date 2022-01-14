/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.sell.dao.VendorDao;
import com.accede.angel.sell.model.Venderregistration;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author a2z
 */
@WebServlet(name = "Vendorregservlet", urlPatterns = {"/Vendorregservlet"})
public class Vendorregservlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            //String companyName = request.getParameter("companyName");
            String vendorname = request.getParameter("vendorname");
            String Address = request.getParameter("Address");
            String city = request.getParameter("city");
            String dist = request.getParameter("dist");
            String state = request.getParameter("state");
            String pin = request.getParameter("pin");
            String Email = request.getParameter("email");
            String gstnnumber = request.getParameter("gstnnumber");
            String contactPersonName = request.getParameter("contactPersonName");
            
            String companyPhone = request.getParameter("companyPhone");
           // String companyemail = request.getParameter("companyemail");
            String contactPersonMob = request.getParameter("contactPersonMob");
            Venderregistration v = new Venderregistration();
            VendorDao vd = new VendorDao();
            v.setAddress(Address);
            v.setCity(city);
            //v.setCompanyName(companyName);
            v.setCompanyPhone(companyPhone);
            v.setEmail(Email);
            v.setContactPersonMob(contactPersonMob);
            v.setContactPersonName(contactPersonName);
            v.setDist(dist);
            //v.setDob(new SimpleDateFormat("dd/MM/yyyy").parse(Dob));
            v.setGstnnumber(gstnnumber);
            v.setPin(pin);
            v.setState(state);
            //v.setVendoremail(Vendoremail);
            v.setVendorname(vendorname);

            boolean b = vd.savevendor(v);
            String msg = "Vendor Added Successfully";
            if (b) {
                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", msg);
                response.sendRedirect("Admin/admin/Vendorregistration.jsp");
            } else {
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Something Went Wrong..");
                response.sendRedirect("Admin/admin/Vendorregistration.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
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
