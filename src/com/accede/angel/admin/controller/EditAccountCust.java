/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.CustomerAccount;
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
 * @author Admin
 */
@WebServlet(name = "EditAccountCust", urlPatterns = {"/EditAccountCust"})
public class EditAccountCust extends HttpServlet {

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
              HttpSession session1 = request.getSession();
            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
            if (Branch != null) 
            {
             String name = request.getParameter("First_Name");
            String mobile = request.getParameter("Account_Mobile_No");
            String email = request.getParameter("Account_Email_Id");
            String address = request.getParameter("AccountAddress");
            String account_id = request.getParameter("account_id");
            CustomerAccountDao CustomerAccountDao=new CustomerAccountDao();
            CustomerAccount CustomerAccount=new CustomerAccount();
            CustomerAccount=CustomerAccountDao.getCustomerAccountById(Integer.parseInt(account_id));
            CustomerAccount.setAddress(address);
          
            CustomerAccount.setName(name);
            CustomerAccount.setEmail(email);
           
            
            
              boolean b = CustomerAccountDao.updateCustomerAccount1(CustomerAccount);
                if (b) {
                    
//                    String message = "Your Account is Created For Angel Music.!!" + "\n"
//                             +    "For More Details "+"\n" 
//                       +  "https://www.angelm.in"+"\n"
//                       +  "Angel Music";
//                        
//                         SendMessage.sendMobileMSG(mobile, message,Branch);
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Account Update Successfully");
                    response.sendRedirect("Admin/branchReception/AccountDetails.jsp?accountid="+CustomerAccount.getId());
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong");
                    response.sendRedirect("Admin/branchReception/branchReceptionIndex.jsp");
                }
            
            
            
            
            }else
            {
                     int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Your Session is Terminate......");
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
