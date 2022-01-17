/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.dao.BranchDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Branch;
import com.accede.angel.services.DynamicGenerator;
import com.accede.angel.services.SendMail;
import com.accede.angel.services.SendMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
@WebServlet(name = "UpdateBranch", urlPatterns = {"/UpdateBranch"})
public class UpdateBranch extends HttpServlet {

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

           
            int branchid =Integer.parseInt(request.getParameter("modal_prd_id1"));
            String branchname = request.getParameter("modal_prd_name");
            String branchAddress = request.getParameter("modal_prd_add");
            String branchAddress1 = request.getParameter("modal_prd_add1");
            String branchAddress2 = request.getParameter("modal_prd_add2");
            String adminName = request.getParameter("modal_admin_name");
            String adminEmail = request.getParameter("modal_admin_email");
            String modal_admin_pass = request.getParameter("modal_admin_pass");
            String modal_rec_pass = request.getParameter("modal_rec_pass");
            String adminMobileNo = request.getParameter("modal_admin_mob");
            String modal_prd_GST = request.getParameter("modal_prd_GST");
            Admin a = new Admin();
            Branch branch = new Branch();
            Branch branch1 = new Branch();
            AdminDao aa = new AdminDao();
            branch=aa.getBranchByID(branchid);
            branch.setBranchAddress(branchAddress);
            branch.setBranchAddress1(branchAddress1);
            branch.setBranchAddress2(branchAddress2);
            branch.setAdminEmail(adminEmail);
            branch.setAdminMobileNo(adminMobileNo);
            branch.setAdminName(adminName);
            branch.setAdminPassword(modal_rec_pass);
            branch.setReceptionPassword(modal_admin_pass);
            branch.setGstNo(modal_prd_GST);

            branch.setBranchName(branchname);
          
            a.setAdminEmail(adminEmail);
            String msg = "Branch Added Successfully";
           
                boolean b = aa.saveBranch(branch);
                if (b) {
                    BranchDao bd = new BranchDao();
                    int id = bd.getLastBranchID();
                    System.out.println("id-"+id);
                    Branch q = aa.getBranchByID(id);
                         System.out.println("q-"+q);
                         
                         
                    a=aa.getAdminbyEmail(adminEmail);
                    a.setAdminMobileNo(adminMobileNo);
                    a.setAdminName(adminName);
                    a.setAdminPassword(modal_rec_pass);
                    a.setReceptionPassword(modal_admin_pass);
                  
                    boolean c = aa.updateadminprofilepic(a);
                    if (c) {

//                int branchid = new BranchDao().getLastBranchID();
//                int adminid = aa.getLastAdminID();
//                a.setAdminId(adminid);
//                a = aa.getAdmin(a);
//                branch = aa.getBranchByID(branchid);
//
//                a.setAdminOfBranch(branch);
//                aa.updateAdmin(a);
//                aa.updateBranch(branch);
                        String Emailmsg = "WELCOME" + "\n\n" + "Our new Branch at " + branchAddress + "Starting Successfully"
                                + "\n\n" + "Feel your site at http://angelmusic.com"
                                + "\n\n" + "NOTE:PLEASE READ EVERYTHING BELOW.\n"
                                + "The below are Login Details of Branch Admin and Branch Reception" + "\n\n"
                                + "Login Details for Branch Admin of  " + branchname + "\n"
                                + "Admin Email:-" + adminEmail + "\n"
                                + "Password:-" + modal_admin_pass + "\n\n\n"
                                + "Login Details for Branch Reception of  " + branchname + "\n"
                                + "Reception Email:-" + adminEmail + "\n"
                                + "Password:-" + modal_rec_pass + "\n\n\n";
                        String subject = "Login Credentials";
                        SendMail.mailsend(adminEmail, Emailmsg, subject);
                        SendMessage.sendMobileMSG(adminMobileNo, Emailmsg);
                        int i = 1;
                        HttpSession session = request.getSession();
                        session.setAttribute("i", i);
                        session.setAttribute("msg", msg);
                        response.sendRedirect("Admin/admin/addBranch.jsp");
                    } else {
                        int i = 2;
                        HttpSession session = request.getSession();
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Something Went Wrong..");
                        response.sendRedirect("Admin/admin/addBranch.jsp");
                    }
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went1 Wrong..");
                    response.sendRedirect("Admin/admin/addBranch.jsp");
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
