/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.EmployeeDao;
import com.accede.angel.admin.dao.EmployeeWeekoffDao;
import com.accede.angel.admin.model.Employee;
import com.accede.angel.admin.model.EmployeeWeekoff;
import com.accede.angel.services.Dates;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
@WebServlet(name = "AddLeaves", urlPatterns = {"/AddLeaves"})
public class AddLeaves extends HttpServlet {

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
            String Leave = request.getParameter("Leave");
            String day = request.getParameter("day");
            String Months = request.getParameter("Month");
            String Year = request.getParameter("Year");
            String Reason = request.getParameter("Reason");
            int noOfDays = Integer.parseInt(request.getParameter("noOfDays"));
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
            String Fromdate = day + "/" + monthno + "/" + Year;
            Date Fromdate1 = new Date();
            try {
                Fromdate1 = new SimpleDateFormat("dd/MM/yyyy").parse(Fromdate);

            } catch (ParseException ex) {
                ex.printStackTrace();
            }
            Dates Dates = new Dates();
            Date nextdate = Dates.getEndingDate(Fromdate1, noOfDays);
            EmployeeWeekoff EmployeeWeekoff = new EmployeeWeekoff();
            Employee e = new Employee();
            EmployeeDao ed = new EmployeeDao();
            e = ed.getEmployeeByID(empid);
            EmployeeWeekoff.setEmployee(e);
            EmployeeWeekoff.setMonth(monthno);
            EmployeeWeekoff.setReason(Reason);
            EmployeeWeekoff.setYear(Year);
            EmployeeWeekoff.setTypeofLeave(Leave);
            EmployeeWeekoff.setWeekoffDate(Fromdate1);
            EmployeeWeekoffDao ewd = new EmployeeWeekoffDao();
            if (nextdate.getMonth() != Fromdate1.getMonth()) {
               
                Calendar c = Calendar.getInstance();
c.setTime(Fromdate1);
c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
System.out.println("++++++++++++++++++++===");
System.out.println(c);
System.out.println("++++++++++++++++++++===");
                System.out.println("nextdate===" + nextdate);
                System.out.println("nextdate.getDate()===" + nextdate.getDate());
                int newnoofday = noOfDays - nextdate.getDate() + 1;
                System.out.println("newnoofday===" + newnoofday);
                EmployeeWeekoff.setNoofday(newnoofday);
                  boolean b=new EmployeeDao().isEmployeePaymentExist(EmployeeWeekoff);
                    if (b) {
                 b = ewd.saveEmployeeWeekoff(EmployeeWeekoff);
                if (b) {
                    System.out.println("noOfDays - newnoofday===" + (noOfDays - newnoofday));
                    EmployeeWeekoff.setNoofday(nextdate.getDate() - 1);
                    Date Fromdate2 = Dates.getEndingDate(nextdate, -(nextdate.getDate() - 1));

                    System.out.println("Fromdate2===" + (Fromdate2));
                    int monthnoo = Integer.parseInt(monthno);
                    monthnoo++;
                    if (monthnoo == 13) {
                        EmployeeWeekoff.setMonth("1");
                        int yearr = Integer.parseInt(Year);
                        yearr++;
                        EmployeeWeekoff.setYear(Integer.toString(yearr));
                    } else {
                        EmployeeWeekoff.setMonth(Integer.toString(monthnoo));
                    }

                    EmployeeWeekoff.setWeekoffDate(Fromdate2);
                    b = ewd.saveEmployeeWeekoff(EmployeeWeekoff);
                    if (b) {
                        int i = 1;
                        HttpSession session = request.getSession();
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Employee Leave Added successfully");
                        response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + empid);
                    } else {
                        int i = 2;
                        HttpSession session = request.getSession();
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Something Went Wrong..");
                        response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + empid);
                    }
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong..");
                    response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + empid);
                }
                
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Salary Already Given   For Thses Month ..");
                    response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + empid);
                }

            } else {
                EmployeeWeekoff.setNoofday(noOfDays);
                EmployeeWeekoff.setTillDate(nextdate);
                
                
                boolean b=new EmployeeDao().isEmployeePaymentExist(EmployeeWeekoff);
                    if (b) {
                 b = ewd.saveEmployeeWeekoff(EmployeeWeekoff);

                if (b) {
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Employee Leave Added successfully");
                    response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + empid);
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong..");
                    response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + empid);
                }  } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Salary Already Given   For Thses Month ..");
                    response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + empid);
                }
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
