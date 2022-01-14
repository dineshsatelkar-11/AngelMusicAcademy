/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.BranchDao;
import com.accede.angel.admin.dao.EmployeeDao;
import com.accede.angel.admin.dao.SuperAdminPaymentDao;
import com.accede.angel.admin.model.Employee;
import com.accede.angel.admin.model.EmployeePayment;
import com.accede.angel.admin.model.EmployeeSalary;
import com.accede.angel.admin.model.SuperAdminPayment;
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
 * @author Dinesh
 */
@WebServlet(name = "EmployeePaymentSave", urlPatterns = {"/EmployeePaymentSave"})
public class EmployeePaymentSave extends HttpServlet {

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
            long empid = Long.parseLong(request.getParameter("empid"));
            System.out.println("Modal_Employee_Id====" + empid);
            int noOfDays = Integer.parseInt(request.getParameter("noOfDays"));
            int noOfDaysLeaves = Integer.parseInt(request.getParameter("noOfDaysLeaves"));
            int paymentamt = Integer.parseInt(request.getParameter("paymentamt"));
            int incntamt = Integer.parseInt(request.getParameter("incntamt"));
            int totalamt = Integer.parseInt(request.getParameter("totalamt"));
            int extrahours = Integer.parseInt(request.getParameter("extrahours"));
            int overtime = Integer.parseInt(request.getParameter("overtime"));
            int employeeadvance = Integer.parseInt(request.getParameter("employeeadvance"));
            int finalamt = Integer.parseInt(request.getParameter("finalamt"));
            
            int Year = Integer.parseInt(request.getParameter("Year"));
            String Month = request.getParameter("Month");
            Employee e = new Employee();

            EmployeeDao ed = new EmployeeDao();
            BranchDao bd = new BranchDao();
            e = ed.getEmployeeByID(empid);
            int salary = e.getSalary();
            EmployeePayment ep = new EmployeePayment();
            ep.setActualSalary(salary);
            ep.setEmployee(e);
            ep.setIncentive(incntamt);
            ep.setNoOfDays(noOfDays);
            ep.setPayment(paymentamt);
            ep.setTotalamount(totalamt);
        
            ep.setExtrahours(extrahours);
            ep.setOvertimeamt(overtime);
            ep.setAdvance(salary);
            ep.setFinalamount(finalamt);
            ep.setBalanceadvanceamt(0);
            ep.setYear(Year);
            e.setAdvance(0);
            String Months = Month;
            String monthno = "0";

            if (Months.equals("Jan")) {
                monthno = "1";
            } else if (Months.equals("Feb")) {
                monthno = "2";
            } else if (Months.equals("Mar")) {
                monthno = "3";
            } else if (Months.equals("Apr")) {
                monthno = "4";
            } else if (Months.equals("May")) {
                monthno = "5";
            } else if (Months.equals("Jun")) {
                monthno = "6";
            } else if (Months.equals("Jul")) {
                monthno = "7";
            } else if (Months.equals("Aug")) {
                monthno = "8";
            } else if (Months.equals("Sep")) {
                monthno = "9";
            } else if (Months.equals("Oct")) {
                monthno = "10";
            } else if (Months.equals("Nov")) {
                monthno = "11";
            } else {
                monthno = "12";
            }
                ep.setMonth(monthno);
                ep.setMonthinword(Months);
              Boolean b=new EmployeeDao().isEmployeePaymentExist(ep);
              if(b){
             b = ed.saveEmployeePayment(ep);

            if (b) {
                new EmployeeDao().UpdateEmployeeStatus(e);

                SuperAdminPayment SuperAdminPayment = new SuperAdminPayment();
                SuperAdminPayment.setAmount((int) finalamt);
                String Remark = "Employee Payment:- Name " + e.getName() + " Month:-" + Month;
                SuperAdminPayment.setDescription(Remark);
                SuperAdminPayment.setPaymentAgainsType("Employee");
                SuperAdminPayment.setPaymentAgains(request.getParameter("empid"));
                SuperAdminPayment.setPaymentMode("Cash");
                SuperAdminPayment.setPaymentType("Debit");
                new SuperAdminPaymentDao().saveSuperAdminPayment(SuperAdminPayment);

                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Employee Payment successfully");
                response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + empid);
            } else {
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Something Went Wrong..");
                response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + empid);
            } } else {
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                 session.setAttribute("msg", "Alreday Payment Given for Thses Month..");
                response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + empid);
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
