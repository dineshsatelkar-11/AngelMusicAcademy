///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.accede.angel.admin.controller;
//
//import com.accede.angel.admin.dao.AdmissionDao;
//import com.accede.angel.admin.dao.CourseDao;
//import com.accede.angel.admin.dao.EnquiryDao;
//import com.accede.angel.admin.dao.InstrumentDao;
//import com.accede.angel.admin.dao.PaymentDao;
//import com.accede.angel.admin.model.Admin;
//import com.accede.angel.admin.model.Admission;
//import com.accede.angel.admin.model.Course;
//import com.accede.angel.admin.model.Enquiry;
//import com.accede.angel.admin.model.Instrument;
//import com.accede.angel.admin.model.Payment;
//import com.accede.angel.admin.model.StudentAccount;
//import com.accede.angel.services.DynamicGenerator;
//import java.io.File;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//import org.hibernate.mapping.Array;
//
///**
// *
// * @author accede
// */
//@WebServlet(name = "OldStudentAdmission", urlPatterns = {"/OldStudentAdmission"})
//public class OldStudentAdmission extends HttpServlet {
//
//    private static final String UPLOAD_DIRECTORY = "StudentImages";
//    private static final int THRESHOLD_SIZE = 1024 * 1024 * 3;  // 3MB
//    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
//    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
//        System.out.println("upload directory is" + UPLOAD_DIRECTORY);
//        Admission a = new Admission();
//        String str2 = "";
//        String str3 = "";
//        String str5 = "";
//        int p = 0;
//        String amountinword = "";
//        String bal = "";
//        int durationid = 0;
//        String DueDate = "";
//        int p1 = 0;
//        String paymode = "";
//        String bankname = "";
//        String chequeno = "";
//        int p2 = 0;
//        int p3 = 0;
//        int coursetotalfee = 0;
//        int totalremfee = 0;
//        int admissonnfee = 0;
//        int totalfee = 0;
//        int discper = 0;
//        int disamount = 0;
//        int finalamount = 0;
//        int totaladvancedfee = 0;
//        int rowcount = 0;
//        String Courseid = "";
//        Payment pay = new Payment();
//        ArrayList<String> str = new ArrayList<String>();
//        String[] coursefee = new String[4];
//        StudentAccount sa = new StudentAccount();
//
//        List<StudentAccount> account = new ArrayList<StudentAccount>();
//        if (ServletFileUpload.isMultipartContent(request)) {
//            try {
//
//                List<FileItem> multiparts = new ServletFileUpload(
//                        new DiskFileItemFactory()).parseRequest(request);
//                for (FileItem item : multiparts) {
//                    //System.out.println("in for");
//                    if (!item.isFormField()) {
//                        a.setImagepath(uploadPath + File.separator + item.getName());
//                        item.write(new File(uploadPath + File.separator + item.getName()));
//                        a.setImage(item.getName());
//                    } else {
//
//                        System.err.println(item.getString() + item.getFieldName());
//                        if (item.getFieldName().equals("fname")) {
//                            a.setFirstName(item.getString());
//                        }
//                        if (item.getFieldName().equals("mname")) {
//                            a.setMiddleName(item.getString());
//                        }
//                        if (item.getFieldName().equals("lname")) {
//                            a.setLastName(item.getString());
//                        }
//                        if (item.getFieldName().equals("contact")) {
//                            a.setContactNo(item.getString());
//                        }
//                        if (item.getFieldName().equals("email")) {
//                            a.setEmail(item.getString());
//                        }
//                        if (item.getFieldName().equals("instname")) {
//                            String instname = item.getString();
////                            int id = Integer.parseInt(instrid);
////                            Instrument instrument = new Instrument();
////                            InstrumentDao instrumentDao = new InstrumentDao();
////                            instrument = instrumentDao.getInstrumentByID(id);
//                            a.setInstrumentName(instname);
//                        }
//                        if (item.getFieldName().equals("dob")) {
//                            String dob = item.getString();
//                            try {
//                                a.setDateofBirth(new SimpleDateFormat("dd/MM/yyyy").parse(dob));
//                            } catch (ParseException ex) {
//                                ex.printStackTrace();
//                            }
//                        }
//                        if (item.getFieldName().equals("payment_Date")) {
//                            String dob = item.getString();
//                            try {
//                                sa.setPaymentDate(new SimpleDateFormat("dd/MM/yyyy").parse(dob));
//                            } catch (ParseException ex) {
//                                ex.printStackTrace();
//                            }
//                            try {
//                                pay.setPaymentDate(new SimpleDateFormat("dd/MM/yyyy").parse(dob));
//                            } catch (ParseException ex) {
//                                ex.printStackTrace();
//                            }
//                            try {
//                                pay.setPaymentTime(new SimpleDateFormat("dd/MM/yyyy").parse(dob));
//                            } catch (ParseException ex) {
//                                ex.printStackTrace();
//                            }
//                        }
//                        if (item.getFieldName().equals("age")) {
//                            String age = item.getString();
//                            int p5 = Integer.parseInt(age);
//                            a.setAge(p5);
//                        }
//                        if (item.getFieldName().equals("inquiryid")) {
//                            String inquiryid = item.getString();
//                            int p5 = Integer.parseInt(inquiryid);
//                            if (p5 != 0) {
//                                Enquiry e = new Enquiry();
//                                EnquiryDao ed = new EnquiryDao();
//                                e = ed.getEnquiryByID(p5);
//                                e.setRemove(false);
//                                ed.update(e);
//                            }
//
//                        }
//                        if (item.getFieldName().equals("gender")) {
//                            a.setGender(item.getString());
//                        }
//                        if (item.getFieldName().equals("address")) {
//                            a.setAddress(item.getString());
//                        }
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
//                        if (item.getFieldName().equals("rowcount")) {
//                            String rowcount1 = item.getString();
//                            rowcount = Integer.parseInt(rowcount1);
//                            a.setNoofCourse(rowcount);
//                        }
//                        if (item.getFieldName().equals("duration")) {
//                            String duration = item.getString();
//                            durationid = Integer.parseInt(duration);
//                            a.setDuration(durationid);
//                        }
//
//                        if (item.getFieldName().equals("joindate")) {
//                            String joindate = item.getString();
//                            try {
//                                a.setJoiningDate(new SimpleDateFormat("dd/MM/yyyy").parse(joindate));
//                            } catch (ParseException ex) {
//                                ex.printStackTrace();
//                            }
//                        }
//                        if (item.getFieldName().equals("Admission_Date")) {
//                            String joindate = item.getString();
//                            try {
//                                a.setAdmissionDate(new SimpleDateFormat("dd/MM/yyyy").parse(joindate));
//                            } catch (ParseException ex) {
//                                ex.printStackTrace();
//                            }
//                        }
//
//                        if (item.getFieldName().equals("DueDate")) {
//                            DueDate = item.getString();
//                            try {
//                                a.setDueDate(new SimpleDateFormat("dd/MM/yyyy").parse(DueDate));
//                            } catch (ParseException ex) {
//                                ex.printStackTrace();
//                            }
//                        }
//                        if (item.getFieldName().equals("days")) {
//                            byte[] Daylist = item.get();
//                            String str1 = new String(Daylist);
//
//                            System.out.println("str1-" + str1);
//
//                            str2 = str2.concat(str1);
//                            str2 = str2.concat(" ");
//                            a.setDaysInWeek(str2);
//                        }
//                        if (item.getFieldName().equals("batchtime")) {
//                            byte[] batchtimelist = item.get();
//                            String str4 = new String(batchtimelist);
//
//                            System.out.println("str1-" + str4);
//
//                            str5 = str5.concat(str4);
//                            str5 = str5.concat(" ");
//                            a.setBatchTimings(str5);
//                        }
//                        if (item.getFieldName().equals("coursename")) {
//                            byte[] Daylist = item.get();
//                            String str1 = new String(Daylist);
//
//                            System.out.println("str1-" + str1);
//
//                            str3 = str3.concat(str1);
//                            str3 = str3.concat(" ");
//                            a.setCourseName(str3);
//                            sa.setCourseName(str3);
//
//                            str.add(str1);
//
//                            Course c = new CourseDao().getCourseByName(str1);
//                            String courseid1 = Long.toString(c.getCourseId());
//                            Courseid = Courseid.concat(courseid1);
//                            Courseid = Courseid.concat(" ");
//                            a.setCourseid(Courseid);
//
//                        }
//                        if (item.getFieldName().equals("Paymentmode")) {
//                            String Paymentmode = item.getString();
//                            int pay1 = Integer.parseInt(Paymentmode);
//                            a.setPaymentmodecount(pay1);
//                            sa.setPaymentmodecount(pay1);
//                        }
//                        if (item.getFieldName().equals("adfee")) {
//                            String admissionfee = item.getString();
//                            int fee = Integer.parseInt(admissionfee);
//                            a.setAdmissionFee(fee);
//                        }
//                        if (item.getFieldName().equals("CourseFee0")) {
//                            String courseFee = item.getString();
//                            int fee = Integer.parseInt(courseFee);
//                            a.setCourseFee1(fee);
//                            sa.setCourseFee1(fee);
//                        }
//                        if (item.getFieldName().equals("CourseFee1")) {
//                            String courseFee = item.getString();
//                            int fee = Integer.parseInt(courseFee);
//                            a.setCourseFee2(fee);
//                            sa.setCourseFee2(fee);
//                        }
//                        if (item.getFieldName().equals("CourseFee2")) {
//                            String courseFee = item.getString();
//                            int fee = Integer.parseInt(courseFee);
//                            a.setCourseFee3(fee);
//                            sa.setCourseFee3(fee);
//                        }
//                        if (item.getFieldName().equals("CourseFee3")) {
//                            String courseFee = item.getString();
//                            int fee = Integer.parseInt(courseFee);
//                            a.setCourseFee4(fee);
//                            sa.setCourseFee4(fee);
//                        }
//                        if (item.getFieldName().equals("CourseFee4")) {
//                            String courseFee = item.getString();
//                            int fee = Integer.parseInt(courseFee);
//                            a.setCourseFee5(fee);
//                            sa.setCourseFee5(fee);
//                        }
//                        if (item.getFieldName().equals("coursetotalfee")) {
//                            String courseFee = item.getString();
//                            coursetotalfee = Integer.parseInt(courseFee);
//
//                        }
//                        if (item.getFieldName().equals("admissonnfee")) {
//                            String courseFee = item.getString();
//                            admissonnfee = Integer.parseInt(courseFee);
//                            a.setAdmissionFee(admissonnfee);
//                        }
//                        if (item.getFieldName().equals("totalfee")) {
//                            String courseFee = item.getString();
//                            totalfee = Integer.parseInt(courseFee);
//
//                        }
//                        if (item.getFieldName().equals("discper")) {
//                            String courseFee = item.getString();
//                            discper = Integer.parseInt(courseFee);
//
//                        }
//                        if (item.getFieldName().equals("disamount")) {
//                            String courseFee = item.getString();
//                            disamount = Integer.parseInt(courseFee);
//
//                        }
//                        if (item.getFieldName().equals("finalamount")) {
//                            String courseFee = item.getString();
//                            finalamount = Integer.parseInt(courseFee);
//
//                        }
//                        if (item.getFieldName().equals("totaladvancedfee")) {
//                            String courseFee = item.getString();
//                            totaladvancedfee = Integer.parseInt(courseFee);
//
//                        }
//                        if (item.getFieldName().equals("totalremfee")) {
//                            String courseFee = item.getString();
//                            totalremfee = Integer.parseInt(courseFee);
//                            a.setRemaininFee(totalremfee);
//                        }
//                        if (item.getFieldName().equals("duedate0")) {
//                            DueDate = item.getString();
//                            try {
//                                a.setNextPaymentDate(new SimpleDateFormat("dd/MM/yyyy").parse(DueDate));
//                            } catch (ParseException ex) {
//                                ex.printStackTrace();
//                            }
//                        }
//
//                        if (item.getFieldName().equals("paymode")) {
//                            paymode = item.getString();
//
//                        }
//
//                        if (item.getFieldName().equals("chequeno")) {
//                            chequeno = item.getString();
//
//                        }
//                        if (item.getFieldName().equals("bankname")) {
//                            bankname = item.getString();
//
//                        }
//
//                        if (item.getFieldName().equals("amountinword")) {
//                            amountinword = item.getString();
//                            a.setAmountinword(item.getString());
//                        }
//
//                    }
//                }
//                int size = str.size();
//                for (int i = 0; i < size; i++) {
//                    String coursename = str.get(i);
//                    if (i == 0) {
//                        a.setCourseName1(coursename);
//                        sa.setCourseName1(coursename);
//                    } else if (i == 1) {
//                        a.setCourseName2(coursename);
//                        sa.setCourseName2(coursename);
//                    } else if (i == 2) {
//                        a.setCourseName3(coursename);
//                        sa.setCourseName3(coursename);
//                    } else if (i == 3) {
//                        a.setCourseName4(coursename);
//                        sa.setCourseName4(coursename);
//                    } else {
//                        a.setCourseName5(coursename);
//                        sa.setCourseName5(coursename);
//                    }
//                }
//                AdmissionDao ad = new AdmissionDao();
//
//                sa.setCoursetotalfee(coursetotalfee);
//                sa.setAdmissonnfee(admissonnfee);
//                sa.setTotalfee(totalfee);
//                sa.setDiscper(discper);
//                sa.setDisamount(disamount);
//                sa.setFinalamount(finalamount);
//                sa.setTotaladvancedfee(totaladvancedfee);
//                sa.setTotalremfee(totalremfee);
//                sa.setBankname(bankname);
//                sa.setChequeno(chequeno);
//                sa.setAmountinWord(amountinword);
//                sa.setCourse(rowcount);
//                sa.setCourseDuration(durationid);
//                DynamicGenerator dg = new DynamicGenerator();
//
//                String StudentPassword = dg.passwordGenerator();
//                System.out.println("StudentPassword-" + StudentPassword);
//                a.setStudentPassword(StudentPassword);
//                try {
//                    sa.setDueDate(new SimpleDateFormat("dd/MM/yyyy").parse(DueDate));
//                } catch (ParseException ex) {
//                    ex.printStackTrace();
//                }
//
//                sa.setPaymentMode(paymode);
//
//                ad.saveStudentAccount(sa);
//                account.add(sa);
//                a.setStudentAccount(account);
//                HttpSession session1 = request.getSession();
//                Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
//                String type1 = (String) session1.getAttribute("BRANCH_ADMIN1");
////                int type=Integer.parseInt("type1");
//                a.setAdminOfBranch(Branch);
//
//                String Branchname = Branch.getAdminOfBranch().getBranchName();
//                String[] branch = Branchname.split("");
//                String pre = branch[0] + branch[1];
//                String admissionno = new DynamicGenerator().jrNoGenerator(pre);
//                a.setAdmissionNo(admissionno);
//                boolean b = ad.saveAdmission(a);
//
//                if (b) {
//
//                    String Rent = "Admissionno No- ";
//                    String agains = Rent + admissionno;
//
//                    pay.setAmount(totaladvancedfee);
//                    pay.setBankName(bankname);
//                    pay.setAdminOfBranch(Branch);
//                    pay.setPaymentMode(paymode);
//                    pay.setPaymentType("Credit");
//                    pay.setTransctionNo(chequeno);
//                    pay.setPaymentAgains(agains);
//                    new PaymentDao().savePayment(pay);
//
//                    int i = 1;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    long admissionid = ad.getLastAdmissionID();
//
//                    session.setAttribute("printInvoiceID", admissionid);
//
//                    response.sendRedirect("Admin/branchReception/OldStudentAdmission.jsp");
//                } else {
//                    int i = 2;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    response.sendRedirect("Admin/branchReception/OldStudentAdmission.jsp");
//                }
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
