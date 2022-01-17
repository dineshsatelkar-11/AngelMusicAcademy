 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.dao.AdminPrevilleagesDao;
import com.accede.angel.admin.dao.BranchDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.AdminPrevilleages;
import com.accede.angel.admin.model.Branch;
import com.accede.angel.services.DynamicGenerator;
import com.accede.angel.services.SendMail;
import com.accede.angel.services.SendMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
@WebServlet(name = "AddBranchServlet", urlPatterns = {"/AddBranchServlet"})
public class AddBranchServlet extends HttpServlet {

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

            String branchname = request.getParameter("branchname");
            String branchAddress = request.getParameter("branchAddress");
            String branchAddress1 = request.getParameter("branchAddress1");
            String branchAddress2 = request.getParameter("branchAddress2");
            String adminName = request.getParameter("adminName");
            String adminEmail = request.getParameter("adminEmail");
            String adminMobileNo = request.getParameter("adminMobileNo");
            String gstNo = request.getParameter("gstNo");            
            String meskey = request.getParameter("meskey");
            DynamicGenerator dg = new DynamicGenerator();

            String AdminPassword = dg.passwordGenerator();
            String BranchPassword = dg.passwordGenerator1();
            Admin a = new Admin();
            Branch branch = new Branch();
            AdminDao aa = new AdminDao();

            branch.setBranchAddress(branchAddress);
            branch.setBranchAddress1(branchAddress1);
            branch.setBranchAddress2(branchAddress2);
            branch.setAdminEmail(adminEmail);
            branch.setAdminMobileNo(adminMobileNo);
            branch.setAdminName(adminName);
            branch.setAdminPassword(AdminPassword);
            branch.setReceptionPassword(BranchPassword);
            branch.setGstNo(gstNo);
            branch.setBranchName(branchname);
            branch.setBranchRegisteredDate(new Date());
            a.setAdminEmail(adminEmail);
            String msg = "Branch Added Successfully";
            boolean d = aa.isEmailExist(a);
            if (d) {
                boolean b = aa.saveBranch(branch);
                if (b) {
                    BranchDao bd = new BranchDao();
                    int id = bd.getLastBranchID();
                    System.out.println("id-"+id);
                    Branch q = aa.getBranchByID(id);
                         System.out.println("q-"+q);
                    a.setAdminMobileNo(adminMobileNo);
                    a.setAdminName(adminName);
                    a.setAdminPassword(AdminPassword);
                    a.setReceptionPassword(BranchPassword);
                    a.setRegisteredDate(new Date());
                    a.setAdminOfBranch(q);
                    a.setImagename("admin.jpg");
                    a.setMsgKey(meskey);
                    boolean c = aa.saveadmin(a);
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
                                + "\n\n" + "Feel your site at http://angelm.in"
                                + "\n\n" + "NOTE:PLEASE READ EVERYTHING BELOW.\n"
                                + "The below are Login Details of Branch Admin and Branch Reception" + "\n\n"
                                + "Login Details for Branch Admin of  " + branchname + "\n"
                                + "Admin Email:-" + adminEmail + "\n"
                                + "Password:-" + BranchPassword + "\n\n\n"
                                + "Login Details for Branch Reception of  " + branchname + "\n"
                                + "Reception Email:-" + adminEmail + "\n"
                                + "Password:-" + AdminPassword + "\n\n\n";
                        
                        AdminPrevilleagesDao AdminPrevilleagesDao=new AdminPrevilleagesDao();
                        AdminPrevilleages AdminPrevilleages=new AdminPrevilleages();
                        AdminPrevilleages AdminPrevilleages1=new AdminPrevilleages();
                        AdminPrevilleages.setAdmin(a);
                        AdminPrevilleages.setAdmintype("2");
                        AdminPrevilleagesDao.saveAdminPrevilleages(AdminPrevilleages);
                         AdminPrevilleages1.setAdmin(a);
                        AdminPrevilleages1.setAdmintype("3");
                        AdminPrevilleagesDao.saveAdminPrevilleages(AdminPrevilleages1);
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

            } else {
                int i = 2;
                msg = "Email Address Already Exist";
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", msg);
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
