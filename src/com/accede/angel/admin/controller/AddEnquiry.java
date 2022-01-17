/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.dao.InstrumentDao;
import com.accede.angel.admin.dao.ProductDao;
import com.accede.angel.admin.dao.RentDao;
import com.accede.angel.admin.dao.RepairDao;
import com.accede.angel.admin.dao.SellDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.ClassEnquiry;
import com.accede.angel.admin.model.Instrument;
import com.accede.angel.admin.model.Product;
import com.accede.angel.admin.model.Rent;
import com.accede.angel.admin.model.Repair;
import com.accede.angel.admin.model.Sell;
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
 * @author accede
 */
@WebServlet(name = "AddEnquiry", urlPatterns = {"/AddEnquiry"})
public class AddEnquiry extends HttpServlet {

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
            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
            if (Branch != null) {
               if (Branch.getAdminId() == 1) {
            String Fname = request.getParameter("fname");
            String Mname = request.getParameter("mname");
            String Lname = request.getParameter("lname");
            String Mobile = request.getParameter("mobile");
            String Email = request.getParameter("email");
            String EnquiryFor = request.getParameter("enquiryfor");
            DynamicGenerator dy = new DynamicGenerator();
          
            String Branchname=Branch.getAdminOfBranch().getBranchName();
            String[] branch=Branchname.split("");
            String pre=branch[0] + branch[1];
            System.out.println("pre"+pre);
            if (EnquiryFor.equals("MusicClass")) {
                
                String insttt=request.getParameter("instname3");
                int InstName =Integer.parseInt(insttt);
                String Days = request.getParameter("days");
                String BatchTime = request.getParameter("batchtime");
                String[] Daylist = request.getParameterValues("days");
                int size = Daylist.length;
                String str = " ";
                for (int i = 0; i < size; i++) {
                    str = str.concat(Daylist[i]);
                    str = str.concat(" ");
                }
                 Instrument instrument = new Instrument();
                InstrumentDao id = new InstrumentDao();
                instrument = id.getInstrumentByID(InstName);
                ClassEnquiry ce = new ClassEnquiry();
                ce.setFirstName(Fname);
                ce.setMiddleName(Mname);
                ce.setLastName(Lname);
                ce.setMobile(Mobile);
                ce.setEmail(Email);
                ce.setInstrumentName(instrument);
                ce.setDays(Days);
                ce.setDays(Days);
                ce.setBatchTiming(BatchTime);
                ce.setAdminOfBranch(Branch);

                AdmissionDao ad = new AdmissionDao();
                boolean b = ad.saveClassEnquiry(ce);
                if (b) {
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    response.sendRedirect("Admin/branchReception/enquiry.jsp");
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    response.sendRedirect("Admin/branchReception/enquiry.jsp");
                }
            } else if (EnquiryFor.equals("Sell")) {
                String counsellor = request.getParameter("counsellor");
                String custaddr = request.getParameter("custaddr");
                String altno = request.getParameter("altno");
                int pname = Integer.parseInt(request.getParameter("pname"));
                String discou = request.getParameter("discou");
                String unitPrice = request.getParameter("unitPrice");
                String quant = request.getParameter("quant");
                String total = request.getParameter("total");
                String sellno = dy.sellNoGenerator(pre);
                float discou1 = Float.parseFloat(discou);
                float unitPrice1 = Float.parseFloat(unitPrice);
                int quant1 = Integer.parseInt(quant);
                float total1 = Float.parseFloat(total);

                ProductDao pd = new ProductDao();
                Product product = new Product();
                product = pd.getProductByID(pname);
                Sell sell = new Sell();
                sell.setCounsellorName(counsellor);
                sell.setCustomerAddress(custaddr);
                sell.setCustomerAlternateNo(altno);
                sell.setCustomerFirstName(Fname);
                sell.setCustomerLastName(Lname);
                sell.setCustomerMiddleName(Mname);
                sell.setCustomerMobileNo(Mobile);
                sell.setDiscount(discou1);
                sell.setProductId(product);
                sell.setQuentity(quant1);
                sell.setSellDate(new Date());
                sell.setSellNo(sellno);
                sell.setSellPrice(unitPrice1);
                sell.setTotalPrice(total1);
                SellDao sellDao = new SellDao();
                sell.setAdminOfBranch(Branch);
                boolean b = sellDao.saveSell(sell);
                if (b) {
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    response.sendRedirect("Admin/branchReception/enquiry.jsp");
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    response.sendRedirect("Admin/branchReception/enquiry.jsp");
                }

            } else if (EnquiryFor.equals("Repair")) {

                String counsellor2 = request.getParameter("counsellor2");
                String altno2 = request.getParameter("altno2");
                String custaddr2 = request.getParameter("custaddr2");
                int instname2 = Integer.parseInt(request.getParameter("instname2"));
                String problem = request.getParameter("problem");
                String returndate = request.getParameter("returndate");
                String repcost = request.getParameter("repcost");
                String discou2 = request.getParameter("discou2");
                int quant2 = Integer.parseInt(request.getParameter("quant2"));
                String total2 = request.getParameter("total2");
                String balanceAmount2 = request.getParameter("balanceAmount2");
                String advancedPaid2 = request.getParameter("advancedPaid2");
//                String repairno = dy.repairNoGenerator(pre);
                long advancedPaid21 = Long.parseLong(advancedPaid2);
                long balanceAmount21 = Long.parseLong(balanceAmount2);
                long total21 = Long.parseLong(total2);
                long discou21 = Long.parseLong(discou2);
                float repcost1 = Float.parseFloat(repcost);

                Repair repair = new Repair();
                Instrument instrument = new Instrument();
                InstrumentDao id = new InstrumentDao();
                instrument = id.getInstrumentByID(instname2);
//                repair.setAdvancePaid(advancedPaid21);
//                repair.setBalanceAmount(advancedPaid21);
//                repair.setBilling(altno2);
//                repair.setCounsellorName(counsellor2);
//                repair.setCustomerAddress(custaddr2);
//                repair.setCustomerAlternateNo(altno2);
//                repair.setCustomerFirstName(Fname);
//                repair.setCustomerLastName(Lname);
//                repair.setCustomerMiddleName(Mname);
//                repair.setCustomerMobileNo(Mobile);
//                repair.setDiscount(discou21);
//                repair.setInstrumentName(instrument);
//                repair.setProblem(problem);
//                repair.setQuantity(quant2);
//                repair.setRepairNo(repairno);
//                repair.setAdvancePaid(advancedPaid21);
                repair.setReceivedDate(new Date());
                repair.setAdminOfBranch(Branch);
//                try {
////                    repair.setReturnDate(new SimpleDateFormat("dd/MM/yyyy").parse(returndate));
//                } catch (ParseException ex) {
//                    ex.printStackTrace();
//                }

                RepairDao rd = new RepairDao();
                boolean b = rd.saveRepair(repair);
                if (b) {
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    response.sendRedirect("Admin/branchReception/enquiry.jsp");
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    response.sendRedirect("Admin/branchReception/enquiry.jsp");
                }

            } else {
                String altno1 = request.getParameter("altno1");
                String custaddr1 = request.getParameter("custaddr1");
                String idproof = request.getParameter("idproof");
                int instname = Integer.parseInt(request.getParameter("instname"));
                String from = request.getParameter("from");
                String to = request.getParameter("to");
                String unitPrice1 = request.getParameter("unitPrice1");
                String discou1 = request.getParameter("discou1");

                String quant1 = request.getParameter("quant1");
                String noOfDays1 = request.getParameter("noOfDays1");
                String advancedPaid1 = request.getParameter("advancedPaid1");
                String total1 = request.getParameter("total1");
                String balanceAmount1 = request.getParameter("balanceAmount1");
                String custname = Fname.concat(" ");
                custname = custname.concat(Mname);
                custname = custname.concat(" ");
                custname = custname.concat(Lname);
//                String rentno = dy.rentNoGenerator(pre);
                int quant11 = Integer.parseInt(quant1);
                int noOfDays11 = Integer.parseInt(noOfDays1);

                long noOfDays13 = Long.parseLong(noOfDays1);
                long total13 = Long.parseLong(total1);
                long balanceAmount13 = Long.parseLong(balanceAmount1);
                long discou21 = Long.parseLong(discou1);

                long advancedPaid13 = Long.parseLong(advancedPaid1);
                long quant13 = Long.parseLong(quant1);
                long total134 = Long.parseLong(total1);

                Rent rent = new Rent();
                Instrument instrument = new Instrument();
                InstrumentDao id = new InstrumentDao();
                instrument = id.getInstrumentByID(instname);
//                rent.setAdvancedPaid(advancedPaid13);
//                rent.setAmount(total13);
//                rent.setBalanceAmount(balanceAmount13);
//                rent.setCustomerAddress(custaddr1);
//                rent.setCustomerAlternateNo(altno1);
//                rent.setCustomerContactNo(Mobile);
//                rent.setCustomerIdProof(idproof);
//                rent.setCustomerName(custname);
//                rent.setDiscount(discou21);
//                rent.setInstrumentName(instrument);
//                rent.setNoOfDays(noOfDays13);
//                rent.setQuantity(quant13);
//                rent.setRentNo(rentno);
//                rent.setTotalAmount(total134);
                rent.setAdminOfBranch(Branch);
                try {
                    rent.setFromDate(new SimpleDateFormat("dd/MM/yyyy").parse(from));
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
//                try {
////                    rent.setToDate(new SimpleDateFormat("dd/MM/yyyy").parse(to));
//                } catch (ParseException ex) {
//                    ex.printStackTrace();
//                }
                RentDao rd = new RentDao();
                boolean b = rd.saveRent(rent);
                if (b) {
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    response.sendRedirect("Admin/branchReception/enquiry.jsp");
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    response.sendRedirect("Admin/branchReception/enquiry.jsp");
                }

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
