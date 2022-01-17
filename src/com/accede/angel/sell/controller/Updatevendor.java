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
@WebServlet(name = "Updatevendor", urlPatterns = {"/Updatevendor"})
public class Updatevendor extends HttpServlet {

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

            long Modal_Vendor_Id = Long.parseLong(request.getParameter("Modal_Vendor_Id"));
            System.out.println("Modal_Vendor_Id-" + Modal_Vendor_Id);
            //String modal_Company_name = request.getParameter("modal_Company_name");
            String modal_Vendor_name = request.getParameter("modal_Vendor_name");
            String modal_Address = request.getParameter("modal_Address");
            String modal_City = request.getParameter("modal_City");
            String modal_Dist = request.getParameter("modal_Dist");
            String modal_State = request.getParameter("modal_State");
            String modal_pin = request.getParameter("modal_pin");
            String modal_vendope_email = request.getParameter("modal_email");
            String modal_gstn_number = request.getParameter("modal_gstn_number");
            String modal_contact_personname = request.getParameter("modal_contact_personname");
            // String modal_dob = request.getParameter("modal_dob");
            //System.out.println("modal_dob==="+modal_dob);
            String modal_company_phone = request.getParameter("modal_company_phone");
            // String modal_company_email = request.getParameter("modal_company_email");
            String modal_contactperson_mob = request.getParameter("modal_contactperson_mob");

            Venderregistration a = new Venderregistration();

            VendorDao aa = new VendorDao();
            a = aa.getvenderbyid(Modal_Vendor_Id);
            System.out.println(a);
            a.setAddress(modal_Address);
            a.setCity(modal_City);
            // a.setCompanyName(modal_Company_name);
            a.setCompanyPhone(modal_company_phone);
            //a.setCompanyemail(modal_company_email);
            a.setContactPersonMob(modal_contactperson_mob);
            a.setContactPersonName(modal_contact_personname);
            a.setDist(modal_Dist);
            //a.setDob(new SimpleDateFormat("yyyy-MM-dd").parse(modal_dob));
            a.setGstnnumber(modal_gstn_number);
            a.setPin(modal_pin);
            a.setState(modal_State);
            a.setEmail(modal_vendope_email);
            a.setVendorname(modal_Vendor_name);

            boolean c = aa.updatevendor(a);
            if (c) {
                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Vendor Updated successfully");
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
