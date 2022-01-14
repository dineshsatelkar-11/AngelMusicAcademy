/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.BatchTimeDa0;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.BatchTime;
import com.accede.angel.admin.model.BatchTimings;
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
 * @author asd
 */
@WebServlet(name = "UpdateBatchTiming", urlPatterns = {"/UpdateBatchTiming"})
public class UpdateBatchTiming extends HttpServlet {

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
           int id=Integer.parseInt(request.getParameter("batchtimeid"));
            String from=request.getParameter("from");
          String end=request.getParameter("end");
          int start=Integer.parseInt(from);
          int end1=Integer.parseInt(end);
          BatchTimings bb=new BatchTimings();
          BatchTimings bb1=new BatchTimings();
          BatchTimeDa0 bdd=new BatchTimeDa0();
          bb=bdd.getBatchTimingsByID(start);
          bb1=bdd.getBatchTimingsByID(end1);
          String Fromtime=bb.getBatchTiming();
          String EndTime=bb1.getBatchTiming();
          String Batch=Fromtime+" "+"TO"+" "+EndTime;
          Batch=Batch.toUpperCase();
            System.out.println("batchtime-"+Batch);
            
            BatchTime s=new BatchTime();
            s.setBatchTiming(Batch);
           HttpSession session1 = request.getSession();
                Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
            s.setAdminOfBranch(Branch);
            BatchTimeDa0 ad=new BatchTimeDa0();
             List<BatchTime> bd=null;
             bd=ad.getAllBatchTime();
             Boolean d=true;
             for(BatchTime b:bd)
             {
                 if(Branch.getAdminId()==b.getAdminOfBranch().getAdminId())
                 {
                 if(Batch.equals(b.getBatchTiming()))
                 {
                     System.out.println("batchtime-"+Batch);
                     System.out.println("batchtime-"+(b.getBatchTiming()));
                     
                    d=false; 
                 }
                 }
             }
           
           
             if(d){
                 s.setBatchTimeId(id);
                 ad.updateBatchTime(s);
                 int i=1;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Subject Added successfully');");
//                out.println("location='Admin/admin/addSubject.jsp';");
//                out.println("</script>");
                  session.setAttribute("msg", "Batch Time Added Successfully");
                response.sendRedirect("Admin/branchReception/addBatchTiming.jsp");
            }
            else{
                   int i=2;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
                  session.setAttribute("msg", "Batch Time Allready Added ");
                response.sendRedirect("Admin/branchReception/addBatchTiming.jsp");
        }
            out.println("</html>");
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
