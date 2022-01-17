/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.BranchDao;
import com.accede.angel.admin.dao.EmployeeDao;
import com.accede.angel.admin.model.Branch;
import com.accede.angel.admin.model.Employee;
import com.accede.angel.admin.model.EmployeeSalary;
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
 * @author a2z
 */
@WebServlet(name = "UpdateEmployee", urlPatterns = {"/UpdateEmployee"})
public class UpdateEmployee extends HttpServlet {

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
            
            long Modal_Employee_Id = Long.parseLong(request.getParameter("Modal_Employee_Id"));
            System.out.println("Modal_Employee_Id===="+Modal_Employee_Id);
            String modal_name = request.getParameter("modal_name");
            System.out.println("modal_name===="+modal_name);
            String modal_mobile = request.getParameter("modal_mobile");
            System.out.println("modal_mobile===="+modal_mobile);
            String modal_alternateNo = request.getParameter("modal_alternateNo");
            System.out.println("modal_alternateNo===="+modal_alternateNo);
            String modal_email = request.getParameter("modal_email");
            System.out.println("modal_email===="+modal_email);
            String modal_PermenantNO = request.getParameter("modal_PermenantNO");
            System.out.println("modal_PermenantNO===="+modal_PermenantNO);
            String modal_qualification = request.getParameter("modal_qualification");
            System.out.println("modal_qualification===="+modal_qualification);
            String modal_address = request.getParameter("modal_address");
            System.out.println("modal_address===="+modal_address);
            String modal_permanentAddress = request.getParameter("modal_permanentAddress");
            System.out.println("modal_permanentAddress===="+modal_permanentAddress);
            String modal_designation = request.getParameter("modal_designation");
            System.out.println("modal_designation===="+modal_designation);
            int modal_salary = Integer.parseInt(request.getParameter("modal_salary"));
            System.out.println("modal_salary===="+modal_salary);
             String modal_joinDate = request.getParameter("modal_joinDate");
             System.out.println("modal_joinDate===="+modal_joinDate);
//              int modal_branch = Integer.parseInt(request.getParameter("modal_branch"));
//              System.out.println("modal_branch===="+modal_branch);
           
             String modal_inTime = request.getParameter("modal_inTime");
             System.out.println("modal_inTime===="+modal_inTime);
             String modal_outTime = request.getParameter("modal_outTime");
             System.out.println("modal_outTime===="+modal_outTime);
             
             Employee e = new Employee();
         
             EmployeeDao ed = new EmployeeDao();
             BranchDao bd = new BranchDao();
             e = ed.getEmployeeByID(Modal_Employee_Id);
             int currentsalary=e.getSalary();
           
//            Branch pp = bd.getBranchByID(modal_branch);
             try{
            SimpleDateFormat sdf=new SimpleDateFormat("HH:mm");
                Date date1=sdf.parse(modal_inTime);
                 e.setOuttime(date1);
            }catch(ParseException e1){
                e1.printStackTrace();
            }
             try{
            SimpleDateFormat sdf=new SimpleDateFormat("HH:mm");
                Date date1=sdf.parse(modal_outTime);
                 e.setOuttime(date1);
            }catch(ParseException e1){
                e1.printStackTrace();
            }
             e.setName(modal_name);
             e.setMobileNo(modal_mobile);
             e.setEmail(modal_email);
             e.setAlternateNo(modal_alternateNo);
             e.setPermanentNo(modal_PermenantNO);
             e.setQualification(modal_qualification);
             e.setAddress(modal_address);
             e.setPermanentAddress(modal_permanentAddress);
             e.setDesignation(modal_designation);
             e.setSalary(modal_salary);
             e.setJoiningDate(new SimpleDateFormat("yyyy-MM-dd").parse(modal_joinDate));
//             e.setBranchid(pp.getBranchId());
            
             
             boolean b = ed.updateEmployee(e);
             
              if (b) {
                  
                 if(currentsalary != modal_salary)
                 {
                 
                 EmployeeSalary EmployeeSalary=new EmployeeSalary();
                 EmployeeSalary.setEmployee(e);
                 EmployeeSalary.setSalary(modal_salary);
                 EmployeeDao EmployeeDao=new EmployeeDao();
                 EmployeeDao.saveEmployeeSalary(EmployeeSalary);
                 
                 
                 }
                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Employee Updated successfully");
                response.sendRedirect("Admin/admin/AllEmployee.jsp");
            } else {
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Something Went Wrong..");
                response.sendRedirect("Admin/admin/AllEmployee.jsp");
            }
            
            
        }
        catch(Exception e)
        {
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
