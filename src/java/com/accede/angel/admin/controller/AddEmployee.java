/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.dao.BankDetailDao;
import com.accede.angel.admin.dao.EmployeeDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.BankDetails;
import com.accede.angel.admin.model.Employee;
import com.accede.angel.services.DynamicGenerator;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "AddEmployee", urlPatterns = {"/AddEmployee"})
public class AddEmployee extends HttpServlet {

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
        Admin Branch1 = (Admin) session1.getAttribute("BRANCH_ADMIN");
        if (Branch1 != null) {
            
            
      
            String name = request.getParameter("name");
            int salary = Integer.parseInt(request.getParameter("salary"));
            int Branch = Integer.parseInt(request.getParameter("Branch"));
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");
            String alternateNo = request.getParameter("alternateNo");
            String Working = request.getParameter("Working");
//            String PermanentNo = request.getParameter("PermanentNo");
            String qualification = request.getParameter("qualification");
            String addree = request.getParameter("addree");
            String paddree = request.getParameter("paddree");
            String Designation = request.getParameter("Designation");
            String joiningDate = request.getParameter("joinDate");
            String intime = request.getParameter("intime");
            System.out.println("intime======" + intime);
            String outtime = request.getParameter("outtime");
            System.out.println("outtime======" + outtime);

            // parameters of BankDetail Table
            String bankName = request.getParameter("bankName");
            String branchName = request.getParameter("branchName");
            String ifscCode = request.getParameter("ifscCode");
            String panNo = request.getParameter("panNo");
            String bankAddrss = request.getParameter("bankAddrss");
            long accNo = Long.parseLong(request.getParameter("accNo"));
            long aadharNo = Long.parseLong(request.getParameter("aadharNo"));

            BankDetails bd = new BankDetails();
            bd.setBankName(bankName);
            bd.setBranchName(branchName);
            bd.setIfscCode(ifscCode);
            bd.setPanNumber(panNo);
            bd.setBankAddress(bankAddrss);
            bd.setBankAccountNo(accNo);
            bd.setAadharNo(aadharNo);

            BankDetailDao bdd = new BankDetailDao();
            boolean bb = bdd.saveBankDetails(bd);
            if (bb) {

                Employee e = new Employee();
                DynamicGenerator d = new DynamicGenerator();
                String EmployeeNo = "AN" + d.passwordGenerator1();
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
                    Date date1 = sdf.parse(intime);
                    e.setIntime(date1);
                } catch (ParseException e1) {
                    e1.printStackTrace();
                }
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
                    Date date1 = sdf.parse(outtime);
                    e.setOuttime(date1);
                } catch (ParseException e1) {
                    e1.printStackTrace();
                }
                e.setAddress(addree);
                e.setAlternateNo(alternateNo);
                e.setDesignation(Designation);
                e.setEmail(email);

                try {
                    e.setJoiningDate(new SimpleDateFormat("yyyy-MM-dd").parse(joiningDate));
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
                e.setMobileNo(mobile);
                e.setName(name);

                e.setPermanentAddress(paddree);
//                e.setPermanentNo(PermanentNo);
                e.setQualification(qualification);
                e.setSalary(salary);
                
                Admin Admin=new AdminDao().getAdminByID(Branch);
                
                e.setBranchid(Branch);
                e.setAdmin(Admin);
                e.setEmplyeeNo(EmployeeNo);
                e.setBankDetailId(bd);
                e.setWorkingType(Working);
                boolean b = new EmployeeDao().saveEmployee(e);

                if (b) {

                    
                    if (Branch1.getAdminOfBranch() == null) {
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Employee Added Successfully !!!");

                    response.sendRedirect("Admin/admin/EmployeeRegistr.jsp");
                     }else{
                     
                      int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Employee Added Successfully !!!");

                    response.sendRedirect("Admin/branchReception/EmployeeRegistr.jsp");
                     
                     }
                    
                    
                  
                } else {
                    
                    
                     if (Branch1.getAdminOfBranch() == null) {
                      int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong !!!");
                    response.sendRedirect("Admin/admin/EmployeeRegistr.jsp");
                     
                     
                     }else{
                     
                      int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong !!!");
                    response.sendRedirect("Admin/branchReception/EmployeeRegistr.jsp");
                     
                     }
                   
                }
            } else {
                
                
                 if (Branch1.getAdminOfBranch() == null) {
                      int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "There is Error While Adding Bank Details !!!");
                response.sendRedirect("Admin/admin/EmployeeRegistr.jsp");
                     
                     
                     }else{
                     
                      int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "There is Error While Adding Bank Details !!!");
                response.sendRedirect("Admin/branchReception/EmployeeRegistr.jsp");
                     
                     }
                
               
            }
        }else{
        
        
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
