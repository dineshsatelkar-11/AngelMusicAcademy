/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.services.SendMail;
import com.accede.angel.services.SendMessage;
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
@WebServlet(name = "ForgetPassword", urlPatterns = {"/ForgetPassword"})
public class ForgetPassword extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            String email = request.getParameter("email");
            HttpSession session = request.getSession();
            Admin admin = new AdminDao().getAdminbyEmail(email);
            if (admin != null) {
                int i = 1;
                String Emailmsg = "WELCOME" + "\n\n" + "Your Password Request Received Successfully"
                        + "\n\n" + "Feel your site at http://angelmusic.com"
                        + "\n\n" + "NOTE:PLEASE READ EVERYTHING BELOW.\n"
                        + "The below are Login Details of Branch Admin and Branch Reception" + "\n\n"
                       
                        + "Admin Email:-" + admin.getAdminEmail() + "\n"
                        + "Password:-" + admin.getReceptionPassword() + "\n\n\n"
                      
                        + "Reception Email:-" + admin.getAdminEmail() + "\n"
                        + "Password:-" + admin.getAdminPassword()+ "\n\n\n";
                String subject = "Login Credentials";
                SendMail.mailsend(admin.getAdminEmail(), Emailmsg, subject);
                SendMessage.sendMobileMSG(admin.getAdminMobileNo(), Emailmsg);

                session.setAttribute("i", i);
                session.setAttribute("msg", "Password is sent to your Mail Address & Registered Mobile No.");
                response.sendRedirect("Admin/Login/adminLogin.jsp");
            } else {
                int i = 2;

                session.setAttribute("i", i);
                session.setAttribute("msg", "Enter Correct Email Address");
                response.sendRedirect("Admin/Login/adminLogin.jsp");
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
