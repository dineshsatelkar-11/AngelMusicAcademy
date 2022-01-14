/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.dao.CourseDao;
import com.accede.angel.admin.dao.EnquiryDao;
import com.accede.angel.admin.dao.InstrumentDao;
import com.accede.angel.admin.dao.PaymentDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.Course;
import com.accede.angel.admin.model.Enquiry;
import com.accede.angel.admin.model.Instrument;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.admin.model.StudentAccount;
import com.accede.angel.services.DynamicGenerator;
import com.accede.angel.services.SendMail;
import com.accede.angel.services.SendMessage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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
import org.hibernate.mapping.Array;

/**
 *
 * @author accede
 */
@WebServlet(name = "AdmissionbyBranchAdmin", urlPatterns = {"/AdmissionbyBranchAdmin"})
public class AdmissionbyBranchAdmin extends HttpServlet {

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
        HttpSession session1 = request.getSession();
        Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
        if (Branch != null) {

            if (!(Branch.getAdminId() == 1)) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                System.out.println("upload directory is" + UPLOAD_DIRECTORY);
                Admission a = new Admission();
                String str2 = "";
                String str3 = "";
                String str5 = "";
                int p = 0;
                String amountinword = "not Determine";
                String bal = "";
                int durationid = 0;
                String DueDate = "";
                int p1 = 0;
                String paymode = "";
                String bankname = "";
                String chequeno = "";
                int p2 = 0;
                int p3 = 0;
                int coursetotalfee = 0;
                int totalremfee = 0;
                int admissonnfee = 0;
                int totalfee = 0;
                int discper = 0;
                int disamount = 0;
                int finalamount = 0;
                int totaladvancedfee = 0;
                int rowcount = 0;
                String Emailaddress = "";
                String mobile = "";
                String Courseid = "";
                ArrayList<String> str = new ArrayList<String>();
                String[] coursefee = new String[4];
                DynamicGenerator dg = new DynamicGenerator();
                StudentAccount sa = new StudentAccount();
                List<StudentAccount> account = new ArrayList<StudentAccount>();
//        File sourceFile = new File("/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT/TempImages/image.png");
////        File sourceFile = new File("E:\\Dinesh_update-28_07\\AngelMusicAcademy\\build\\web\\TempImages\\image.png");
//        String no = dg.imagenameGenerator();
//        File destinationFile = new File("/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT/StudentImages/" + no + sourceFile.getName());
////        File destinationFile = new File("E:\\Dinesh_update-28_07\\AngelMusicAcademy\\build\\web\\StudentImages\\" + no + sourceFile.getName());
//
//        FileInputStream fileInputStream = new FileInputStream(sourceFile);
//        FileOutputStream fileOutputStream = new FileOutputStream(
//                destinationFile);
//
//        int bufferSize;
//        byte[] bufffer = new byte[512];
//        while ((bufferSize = fileInputStream.read(bufffer)) > 0) {
//            fileOutputStream.write(bufffer, 0, bufferSize);
//        }
//        fileInputStream.close();
//        fileOutputStream.close();
//        String imagename = no + "image.png";
//        String imagepath = "/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT/StudentImages/" + no + "image.png";
////        String imagepath = "E:\\Dinesh_update-28_07\\AngelMusicAcademy\\build\\web\\StudentImages\\" + no + "image.png";
//        a.setImage(imagename);
//        a.setImagepath(imagepath);
                if (ServletFileUpload.isMultipartContent(request)) {
                    try {

                        List<FileItem> multiparts = new ServletFileUpload(
                                new DiskFileItemFactory()).parseRequest(request);
                        for (FileItem item : multiparts) {
                            if (!item.isFormField()) {
                                a.setImagepath(uploadPath + File.separator + item.getName());
                                item.write(new File(uploadPath + File.separator + item.getName()));
                                a.setImage(item.getName());
                            } else {

                                System.err.println(item.getString() + item.getFieldName());
                                if (item.getFieldName().equals("fname")) {
                                    a.setFirstName(item.getString());
                                }
                               
                                if (item.getFieldName().equals("lname")) {
                                    a.setLastName(item.getString());
                                }
                                if (item.getFieldName().equals("contact")) {
                                    mobile = item.getString();
                                    a.setContactNo(item.getString());
                                }
                                if (item.getFieldName().equals("email")) {
                                    Emailaddress = item.getString();
                                    a.setEmail(item.getString());
                                }
//                        if (item.getFieldName().equals("instname")) {
//                            String instname = item.getString();
////                            int id = Integer.parseInt(instrid);
////                            Instrument instrument = new Instrument();
////                            InstrumentDao instrumentDao = new InstrumentDao();
////                            instrument = instrumentDao.getInstrumentByID(id);
//                            a.setInstrumentName(instname);
//                        }
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
                                    a.setAge(p5);
                                }
                                if (item.getFieldName().equals("inquiryid")) {
                                    String inquiryid = item.getString();
                                    int p5 = Integer.parseInt(inquiryid);
                                    if (p5 != 0) {
                                        Enquiry e = new Enquiry();
                                        EnquiryDao ed = new EnquiryDao();
                                        e = ed.getEnquiryByID(p5);
                                        e.setRemove(false);
                                        ed.update(e);
                                    }

                                }
                                if (item.getFieldName().equals("gender")) {
                                    a.setGender(item.getString());
                                }
                                if (item.getFieldName().equals("address")) {
                                    a.setAddress(item.getString());
                                }
                               
                                if (item.getFieldName().equals("duration")) {
                                    String duration = item.getString();
                                    durationid = Integer.parseInt(duration);
//                                    a.setDuration(durationid);
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
                                if (item.getFieldName().equals("days")) {
                                    byte[] Daylist = item.get();
                                    String str1 = new String(Daylist);

                                    System.out.println("str1-" + str1);

                                    str2 = str2.concat(str1);
                                    str2 = str2.concat(" ");
                                    a.setDaysInWeek(str2);
                                }
                                if (item.getFieldName().equals("batchtime")) {
                                    byte[] batchtimelist = item.get();
                                    String str4 = new String(batchtimelist);

                                    System.out.println("str1-" + str4);

                                    str5 = str5.concat(str4);
                                    str5 = str5.concat(" ");
                                    a.setBatchTimings(str5);
                                }
                                if (item.getFieldName().equals("coursename")) {
                                    byte[] Daylist = item.get();
                                    String str1 = new String(Daylist);

                                    System.out.println("str1-" + str1);

                                    str3 = str3.concat(str1);
                                    str3 = str3.concat(" ");
                                    a.setCourseName(str3);
                                    sa.setCourseName(str3);
                                    str.add(str1);
                                    Course c = new CourseDao().getCourseByName(str1);
                                    String courseid1 = Long.toString(c.getCourseId());
                                    Courseid = Courseid.concat(courseid1);
                                    Courseid = Courseid.concat(" ");
//                                    a.setCourseid(Courseid);

                                }
                               
                                if (item.getFieldName().equals("adfee")) {
                                    String admissionfee = item.getString();
                                    int fee = Integer.parseInt(admissionfee);
                                    a.setAdmissionFee(fee);
                                }
                             
                               
                                if (item.getFieldName().equals("coursetotalfee")) {
                                    String courseFee = item.getString();
                                    coursetotalfee = Integer.parseInt(courseFee);

                                }
                                if (item.getFieldName().equals("admissonnfee")) {
                                    String courseFee = item.getString();
                                    admissonnfee = Integer.parseInt(courseFee);
                                    a.setAdmissionFee(admissonnfee);
                                }
                                if (item.getFieldName().equals("totalfee")) {
                                    String courseFee = item.getString();
                                    totalfee = Integer.parseInt(courseFee);

                                }
                                if (item.getFieldName().equals("discper")) {
                                    String courseFee = item.getString();
                                    discper = Integer.parseInt(courseFee);

                                }
                                if (item.getFieldName().equals("disamount")) {
                                    String courseFee = item.getString();
                                    disamount = Integer.parseInt(courseFee);

                                }
                                if (item.getFieldName().equals("finalamount")) {
                                    String courseFee = item.getString();
                                    finalamount = Integer.parseInt(courseFee);

                                }
                                if (item.getFieldName().equals("totaladvancedfee")) {
                                    String courseFee = item.getString();
                                    totaladvancedfee = Integer.parseInt(courseFee);

                                }
                                if (item.getFieldName().equals("totalremfee")) {
                                    String courseFee = item.getString();
                                    totalremfee = Integer.parseInt(courseFee);
                                    a.setRemaininFee(totalremfee);
                                }
                                if (item.getFieldName().equals("duedate0")) {
                                    DueDate = item.getString();
                                    try {
                                        a.setNextPaymentDate(new SimpleDateFormat("dd/MM/yyyy").parse(DueDate));
                                    } catch (ParseException ex) {
                                        ex.printStackTrace();
                                    }
                                }

                                if (item.getFieldName().equals("paymode")) {
                                    paymode = item.getString();

                                }

                                if (item.getFieldName().equals("chequeno")) {
                                    chequeno = item.getString();

                                }
                                if (item.getFieldName().equals("bankname")) {
                                    bankname = item.getString();

                                }

                               

                                a.setAdmissionDate(new Date());
                            }
                        }
                        int size = str.size();
                        
                        AdmissionDao ad = new AdmissionDao();

                        System.out.println("CourseDuration-" + durationid);
                        System.out.println("DueDate-" + DueDate);
                        System.out.println("PaymentMode-" + paymode);
                        System.out.println("admissonnfee-" + admissonnfee);
                        System.out.println("amountinWord-" + amountinword);
                        System.out.println("bankname-" + bankname);
                        System.out.println("chequeno-" + chequeno);
                        System.out.println("course-" + rowcount);
                        System.out.println("coursetotalfee-" + coursetotalfee);
                        System.out.println("disamount-" + disamount);
                        System.out.println("discper-" + discper);
                        System.out.println("finalamount-" + finalamount);
                        System.out.println("totaladvancedfee-" + totaladvancedfee);
                        System.out.println("totalfee-" + totalfee);
                        System.out.println("totalremfee-" + totalremfee);

                      
                        sa.setDiscper(discper);
                        sa.setDisamount(disamount);
                        sa.setFinalamount(finalamount);
                      
                        sa.setTotalremfee(totalremfee);
                     
                        sa.setPreviousBalance(0);
                        sa.setAmountinWord(amountinword);
                 
                        sa.setCourseDuration(durationid);

                        String StudentPassword = dg.passwordGenerator();
                        System.out.println("StudentPassword-" + StudentPassword);
                        a.setStudentPassword(StudentPassword);
                       

                        sa.setPaymentMode(paymode);

                        ad.saveStudentAccount(sa);
                        account.add(sa);
                        a.setStudentAccount(account);

                        String type1 = (String) session1.getAttribute("BRANCH_ADMIN1");
                        System.out.println("type1-" + type1);
//                int type=Integer.parseInt("type1");
                        a.setAdminOfBranch(Branch);

                        String Branchname = Branch.getAdminOfBranch().getBranchName();
                        System.out.println("Branchname-" + Branchname);
                        String[] branch = Branchname.split("");
                        System.out.println("branch-" + branch);
                        String pre = branch[0] + branch[1];
                        System.out.println("pre-" + pre);
                      
//                        a.setAdmissionNo(admissionno);
//                        System.out.println("admissionno-" + admissionno);

                        boolean b = ad.saveAdmission(a);

                        if (b) {

                            String Rent = "Admissionno No- ";
//                            String agains = Rent + admissionno;
                            Payment pay = new Payment();
                            pay.setAmount(totaladvancedfee);
//                            pay.setBankName(bankname);
                            pay.setAdminOfBranch(Branch);
                            pay.setPaymentMode(paymode);
                            pay.setPaymentType("Credit");
//                            pay.setTransctionNo(chequeno);
//                            pay.setPaymentAgains(agains);
                            new PaymentDao().savePayment(pay);

                            int i = 1;
                            HttpSession session = request.getSession();
                            session.setAttribute("i", i);
                            long admissionid = ad.getLastAdmissionID();
                            String Emailmsg = "Dear Candidate," + "\n"
                                    + "Its our Pleasure that you joined our Institute. " + "\n"
                                    + "Thanks for paying an amount of Rs. " + totaladvancedfee + "\n"
                                    + "\n\n" + "Feel your site at http://angelm.co.in/"
                                    + "\n\n" + "NOTE:PLEASE READ EVERYTHING BELOW.\n"
                                    + "Login Details for Student \n"
                                  
                                    + "Password:-" + StudentPassword + "\n\n\n";
                            String subject = "Login Credentials";
                            SendMail.mailsend(Emailaddress, Emailmsg, subject);
                            SendMessage.sendMobileMSG(mobile, Emailmsg);
                            session.setAttribute("printInvoiceID", admissionid);

                            response.sendRedirect("Admin/branchAdmin/CaptureIm.jsp");
                        } else {
                            int i = 2;
                            HttpSession session = request.getSession();
                            session.setAttribute("i", i);
                            response.sendRedirect("Admin/branchReception/BranchAdmission.jsp");
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Your Session is Terminate......");
                    response.sendRedirect("Admin/Login/adminLogin.jsp");

                }
            } else {
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
