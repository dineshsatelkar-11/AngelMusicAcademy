/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AddPdfGalleryDao;
import com.accede.angel.admin.dao.CourseDao;
import com.accede.angel.admin.dao.LessonDao;
import com.accede.angel.admin.model.AddPdfGallery;
import com.accede.angel.admin.model.Course;
import com.accede.angel.admin.model.LessonPdf;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author USER
 */
@WebServlet(name = "AddPdfGallerySer", urlPatterns = {"/AddPdfGallerySer"})
public class AddPdfGallerySer extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "PdfGallery";
    private static final int THRESHOLD_SIZE = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        System.out.println("upload directory is" + UPLOAD_DIRECTORY);
        HttpSession session = request.getSession();
        HttpSession session1 = request.getSession();
        AddPdfGalleryDao ld = new AddPdfGalleryDao();
        AddPdfGallery a = new AddPdfGallery();
        if (ServletFileUpload.isMultipartContent(request)) {
            try {

                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
                    //System.out.println("in for");
                    if (!item.isFormField()) {
                        a.setPdfpath(uploadPath + File.separator + item.getName());
                        item.write(new File(uploadPath + File.separator + item.getName()));
                        a.setPdfname(item.getName());
                    } else {

                        System.err.println(item.getString() + item.getFieldName());

                        if (item.getFieldName().equals("course")) {
                            String courseno = item.getString();
                            long p5 = Long.parseLong(courseno);
                            Course c = new Course();
                            CourseDao cd = new CourseDao();
                            c = cd.getCourseBylongID(p5);
                            a.setCourse(c);
                            a.setCourseid(p5);
                        }
                        if (item.getFieldName().equals("lesson")) {
                            String lesson = item.getString();
                            int p5 = Integer.parseInt(lesson);

                            a.setLessonno(p5);
                        }

                    }
                }

                boolean b = ld.saveAddPdfGallery1(a);

                if (b) {

                    int i = 1;

                    session.setAttribute("i", i);
                    session.setAttribute("msg", "PDF Upload Successfully");

                    response.sendRedirect("Admin/admin/AddGallery.jsp");

                } else {

                    int i = 2;

                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong..");
                    response.sendRedirect("Admin/admin/AddGallery.jsp");
                }

            } catch (Exception e) {
                e.printStackTrace();
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
