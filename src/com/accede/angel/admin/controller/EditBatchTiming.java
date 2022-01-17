/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.BatchTimeDa0;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.BatchTime;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "EditBatchTiming", urlPatterns = {"/EditBatchTiming"})
public class EditBatchTiming extends HttpServlet {

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
            String batchtime = request.getParameter("modal_prd_name");
            int  batchtid = Integer.parseInt(request.getParameter("modal_prd_id"));
            batchtime = batchtime.toUpperCase();
            System.out.println("batchtime-" + batchtime);

            BatchTime s = new BatchTime();
            s.setBatchTiming(batchtime);
            HttpSession session1 = request.getSession();
            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
            s.setAdminOfBranch(Branch);
            BatchTimeDa0 ad = new BatchTimeDa0();
            List<BatchTime> bd = null;
            bd = ad.getAllBatchTime();
            s.setBatchTimeId(batchtid);
            Boolean d = true;
            for (BatchTime b : bd) {
                if (Branch.getAdminId() == b.getAdminOfBranch().getAdminId()) {
                    if (batchtime.equals(b.getBatchTiming())) {
                        System.out.println("batchtime-" + batchtime);
                        System.out.println("batchtime-" + (b.getBatchTiming()));

                        d = false;
                    }
                }
            }

            if (d) {
                ad.saveBatchTime(s);
                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Subject Added successfully');");
//                out.println("location='Admin/admin/addSubject.jsp';");
//                out.println("</script>");
                session.setAttribute("msg", "Batch Time Updated Successfully");
                response.sendRedirect("Admin/branchReception/addBatchTiming.jsp");
            } else {
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Batch Time Allready Added Successfully");
                response.sendRedirect("Admin/branchReception/addBatchTiming.jsp");
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
