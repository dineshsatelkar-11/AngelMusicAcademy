/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.StudentAccount;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
 * @author Accede
 */
@WebServlet(name = "BranchAdmission", urlPatterns = {"/BranchAdmission"})
public class BranchAdmission extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "StudentImages";
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
        PrintWriter out = response.getWriter();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        System.out.println("upload directory is" + UPLOAD_DIRECTORY);
        Admission a = new Admission();
        String str2 = "";
        int p = 0;
        String amountinword = "";
        String bal = "";
        int durationid = 0;
        String DueDate = "";
        int p1 = 0;
        String paymode = "";
        int p2 = 0;
        int p3 = 0;

        if (ServletFileUpload.isMultipartContent(request)) {
            try {

                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
                    //System.out.println("in for");
                    if (!item.isFormField()) {
                        a.setImage(uploadPath + File.separator + item.getName());
                        item.write(new File(uploadPath + File.separator + item.getName()));
                    } else {

                        System.err.println(item.getString() + item.getFieldName());
                        if (item.getFieldName().equals("fname")) {
                            a.setFirstName(item.getString());
                        }
                        if (item.getFieldName().equals("mname")) {
//                            a.setMiddleName(item.getString());
                        }
                        if (item.getFieldName().equals("lname")) {
                            a.setLastName(item.getString());
                        }
                        if (item.getFieldName().equals("contact")) {
                            a.setContactNo(item.getString());
                        }
                        if (item.getFieldName().equals("email")) {
                            a.setEmail(item.getString());
                        }
                        if (item.getFieldName().equals("instname")) {
                            String instname = item.getString();
//                            int id = Integer.parseInt(instrid);
//                            Instrument instrument = new Instrument();
//                            InstrumentDao instrumentDao = new InstrumentDao();
//                            instrument = instrumentDao.getInstrumentByID(id);
//                            a.setInstrumentName(instname);
                        }
                        if (item.getFieldName().equals("dob")) {
                            String dob = item.getString();
                            try {
                                a.setDateofBirth(new SimpleDateFormat("dd/MM/yyyy").parse(dob));
                            } catch (ParseException ex) {
                                ex.printStackTrace();
                            }
                        }
                        if (item.getFieldName().equals("age")) {
                            String age = item.getString();
                            int p5 = Integer.parseInt(age);
                            a.setAge(p);
                        }
                        if (item.getFieldName().equals("gender")) {
                            a.setGender(item.getString());
                        }
                        if (item.getFieldName().equals("address")) {
                            a.setAddress(item.getString());
                        }
//                        if (item.getFieldName().equals("occupation")) {
//                            a.setOccupation(item.getString());
//                        }
//                        if (item.getFieldName().equals("parentcontact")) {
//                            a.setParentsNo(item.getString());
//                        }
//                        if (item.getFieldName().equals("nationality")) {
//                            a.setNationality(item.getString());
//                        }
//                        if (item.getFieldName().equals("religion")) {
//                            a.setReligion(item.getString());
//                        }
//                        if (item.getFieldName().equals("qualification")) {
//                            a.setQualification(item.getString());
//                        }
//                        if (item.getFieldName().equals("mothertongue")) {
//                            a.setMotherTongue(item.getString());
//                        }
//
//                        if (item.getFieldName().equals("mothername")) {
//                            a.setMothersName(item.getString());
//                        }
//                       
                        if (item.getFieldName().equals("duration")) {
                            String duration = item.getString();
                            durationid = Integer.parseInt(duration);
//                            a.setDuration(durationid);
                        }
                         if (item.getFieldName().equals("joindate")) {
                            String joindate = item.getString();
                            try {
                                a.setJoiningDate(new SimpleDateFormat("dd/MM/yyyy").parse(joindate));
                            } catch (ParseException ex) {
                                ex.printStackTrace();
                            }
                        }
                          if (item.getFieldName().equals("DueDate")) {
                            DueDate = item.getString();
                            try {
                                a.setDueDate(new SimpleDateFormat("dd/MM/yyyy").parse(DueDate));
                            } catch (ParseException ex) {
                                ex.printStackTrace();
                            }
                        }
                        if (item.getFieldName().equals("batchtime")) {
                            a.setBatchTimings(item.getString());
                        }
                       
                       
                        if (item.getFieldName().equals("days")) {
                            byte[] Daylist = item.get();
                            String str1 = new String(Daylist);

                            System.out.println("str1-" + str1);

                            str2 = str2.concat(str1);
                            str2 = str2.concat(" ");
                            a.setDaysInWeek(str2);
                        }
                           if (item.getFieldName().equals("rowcount")) {
                            String rowcount = item.getString();
                            int id = Integer.parseInt(rowcount);
//                            a.setNoofCourse(id);
                        }
                          if (item.getFieldName().equals("coursename")) {
                            byte[] Daylist = item.get();
                            String str1 = new String(Daylist);

                            System.out.println("str1-" + str1);

                            str2 = str2.concat(str1);
                            str2 = str2.concat(" ");
                            a.setDaysInWeek(str2);
                        }
//                            if (item.getFieldName().equals("payopt")) {
//                                a.setPaymentOption(item.getString());
//                            } 
                    
                        if (item.getFieldName().equals("paymode")) {
                            paymode = item.getString();
//                            a.setPaymentMode(item.getString());
                        }

                        if (item.getFieldName().equals("regfees")) {

                            String regfees = item.getString();
                            p2 = Integer.parseInt(regfees);
//                            a.setRegFees(p);
                        }
                        if (item.getFieldName().equals("totalfees")) {

                            String totfees = item.getString();
                            p3 = Integer.parseInt(totfees);
//                            a.setTotalFees(p);
                        }
                        if (item.getFieldName().equals("advpay")) {

                            String advpay = item.getString();
                            p1 = Integer.parseInt(advpay);
//                            a.setAdvPaid(p);
                        }
                        if (item.getFieldName().equals("balamt")) {

                            bal = item.getString();
                            p = Integer.parseInt(bal);
//                            a.setBalFees(p);
                        }
                        if (item.getFieldName().equals("amountinword")) {
                            amountinword = item.getString();
//                            a.setAmountinword(item.getString());
                        }

                        a.setAdmissionDate(new Date());

                    }
                }
                AdmissionDao ad = new AdmissionDao();
                StudentAccount sa = new StudentAccount();
                List<StudentAccount> account = new ArrayList<StudentAccount>();
                sa.setAmountinWord(amountinword);
//                sa.setBalanceAmount(p);
                sa.setCourseDuration(durationid);
//                try {
//                    sa.setDueDate(new SimpleDateFormat("dd/MM/yyyy").parse(DueDate));
//                } catch (ParseException ex) {
//                    ex.printStackTrace();
//                }
//                sa.setPaidAmount(p1);
//                sa.setPaymentMode(paymode);
//                sa.setRegFees(p2);
//                sa.setTotalFees(p3);
                ad.saveStudentAccount(sa);
                account.add(sa);
                a.setStudentAccount(account);
                HttpSession session1 = request.getSession();
                Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
                a.setAdminOfBranch(Branch);
                boolean b = ad.saveAdmission(a);

                if (b) {
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);

                    response.sendRedirect("Admin/admin/Admission.jsp");
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    response.sendRedirect("Admin/admin/Admission.jsp");
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
