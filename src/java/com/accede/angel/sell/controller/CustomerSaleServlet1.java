/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.dao.EnquiryDao;
import com.accede.angel.admin.dao.PaymentDao;
import com.accede.angel.admin.dao.PaymentFollowupDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.Enquiry;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.admin.model.PaymentFollowup;
import com.accede.angel.admin.model.PaymentFollowupMessage;
import com.accede.angel.admin.model.SessionKey;
import com.accede.angel.sell.dao.BranchProductDao;
import com.accede.angel.sell.dao.CustomerSaleDAO;
import com.accede.angel.sell.dao.CustomerSaleDetailsDAO;
import com.accede.angel.sell.dao.CustomerSellDAO;
import com.accede.angel.sell.dao.ProductDao1;
import com.accede.angel.sell.dao.SellPaymentHistoryDao;
import com.accede.angel.sell.model.BranchProduct;
import com.accede.angel.sell.model.CustomerSale;
import com.accede.angel.sell.model.CustomerSaleDetails;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.sell.model.SellPaymentHistory;
import com.accede.angel.sell.model.TempCustomerSell;
import com.accede.angel.services.SendMessage;
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

/**
 *
 * @author asd
 */
@WebServlet(name = "CustomerSaleServlet1", urlPatterns = {"/CustomerSaleServlet1"})
public class CustomerSaleServlet1 extends HttpServlet {

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
        HttpSession session1 = request.getSession();
        HttpSession session = request.getSession();

        Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
        if (Branch != null) {
            int customerAccountid = Integer.parseInt(request.getParameter("customerAccountid"));
            String sessionidd = request.getParameter("sessionidd");
            System.out.println("sessionidd==="+sessionidd);
            boolean c=true;
            AdminDao AdminDao=new AdminDao();
            List<String> allSessionKey=AdminDao.getAllSessionKey();
            if(allSessionKey.size()>0 && allSessionKey != null )
            {
            if(allSessionKey.contains(sessionidd))
            {
                c=false;
            }else
            {
            SessionKey SessionKey=new SessionKey();
            SessionKey.setSessionkey(sessionidd);
            AdminDao.saveSessionKey(SessionKey);
            }
            }else
            {
            SessionKey SessionKey=new SessionKey();
            SessionKey.setSessionkey(sessionidd);
            AdminDao.saveSessionKey(SessionKey);
            }
            if(c)
            {
            CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
            CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(customerAccountid);

            String customername = request.getParameter("customer_name");
            String customermobilenumber = request.getParameter("Mobile_no");
            String Cust_Address = request.getParameter("Cust_Address");

            CustomerAccount.setName(customername);
            CustomerAccount.setAddress(Cust_Address);

            String Other_Charges = request.getParameter("Other_Charges");
            String Discount_Amount = request.getParameter("Discount_Amount");

            String Discount_Per = request.getParameter("Discount_Per");
            String Advance_Amount = request.getParameter("Advance_Amount");
            String net_Advance_Amount = request.getParameter("net_Advance_Amount");
            String paidamt = request.getParameter("paidamt");
            String balamt = request.getParameter("balamt");

            float Discount_Peramt = Float.parseFloat(Discount_Per);
            float Advance_Amountamt = Float.parseFloat(Advance_Amount);
            float net_Advance_Amountamt = Float.parseFloat(net_Advance_Amount);
            float paidamtamt = Float.parseFloat(paidamt);
            float balamtamt = Float.parseFloat(balamt);

            String Net_Amount = request.getParameter("Net_Amount");
            String amountinword = request.getParameter("amountinword");
            String paymode = request.getParameter("paymode");

            float otheramount = Float.parseFloat(Other_Charges);
            float discountamo = Float.parseFloat(Discount_Amount);
            List<CustomerSaleDetails> pdList = new ArrayList<CustomerSaleDetails>();
            List<TempCustomerSell> tempProduct = new CustomerSellDAO().getAllProduct();

            CustomerSaleDetailsDAO csdao = new CustomerSaleDetailsDAO();
            BranchProduct bp = new BranchProduct();
            BranchProductDao bpdao = new BranchProductDao();
            ProductDao1 pd1 = new ProductDao1();
            ProductModel pm = new ProductModel();
            float newtotal = 0.0f;
            long totalquantity = 0;
            float grandtotal = 0.0f;
            long Stockquantity = 0;

            for (TempCustomerSell p : tempProduct) {

                CustomerSaleDetails csd = new CustomerSaleDetails();
                CustomerSaleDetailsDAO csddao = new CustomerSaleDetailsDAO();
                csd.setDate(new Date());
                csd.setGross_amount(p.getTotal());
                csd.setMrpprice(p.getBranchProduct().getProduct().getUnitPrice());
                csd.setPurchasePrice(p.getBranchProduct().getProduct().getPurchasePrice());
                csd.setProductquantity(p.getProductquantity());
                csd.setProduct(p.getBranchProduct().getProduct());

                csddao.SaveProduct(csd);
                bp = p.getBranchProduct();
                Stockquantity = bp.getProductquantity();
                bp.setProductquantity(Stockquantity - (p.getProductquantity()));
                bpdao.updateBranchProduct(bp);

                pdList.add(csd);
                grandtotal = grandtotal + p.getTotal();
                totalquantity = totalquantity + p.getProductquantity();

            }

            CustomerSale cs = new CustomerSale();
            CustomerSaleDAO csd1 = new CustomerSaleDAO();
            cs.setCustomerAccount(CustomerAccount);
            cs.setCustomername(customername);
            cs.setMobilenumber(customermobilenumber);
            cs.setGrandtotal(grandtotal);
            cs.setProductquanity(totalquantity);
            cs.setAdmin(Branch);
            cs.setAmount_inword(amountinword);
            cs.setCust_addre(Cust_Address);
            cs.setDate(new Date());
            cs.setDiscount_amount(discountamo);
            cs.setOther_charges(otheramount);

            cs.setAdvance_Amount(Advance_Amountamt);
            cs.setBalamt(balamtamt);
            cs.setNet_Advance_Amount(net_Advance_Amountamt);
            cs.setDiscount_Per(Discount_Peramt);
            cs.setPaidamt(paidamtamt);
            if (balamtamt > 0) {
                try {

                    cs.setNextPaymentDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("nextpaymentdate")));
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }

            }else
            {
            cs.setCloseRequest(false);
            }

            cs.setGrosstotal(grandtotal + otheramount - discountamo);
            cs.setCustomerSaleDetails(pdList);

            cs.setPaymentMode(paymode);
            boolean b = csd1.SaveProduct(cs);

            if (b) {
                int saleno = csd1.getLastBillSaleID();
                String no = Integer.toString(saleno);
                String message ="";
                 message = "Customer Sell," + "\n"
                            + "Sell No:-. " + no + "\n"
                           
                            + "Total Billing Amount. " + Net_Amount + "\n"
                            + "Paid Amount. " + (paidamtamt + Advance_Amount) + "\n"
                            + "Balance Amount. " + balamtamt + "\n";
   SendMessage.sendMobileMSG(CustomerAccount.getMobileNo(), message,Branch);
                if (balamtamt > 0) {
                    PaymentFollowup PaymentFollowup = new PaymentFollowup();
 message = "Customer Sell," + "\n"
                            + "Sell No:-. " + no + "\n"
                            + "Mobile No:-. " + CustomerAccount.getMobileNo() + "\n"
                            + "Total Billing Amount. " + Net_Amount + "\n"
                            + "Paid Amount. " + (paidamtamt + Advance_Amount) + "\n"
                            + "Balance Amount. " + balamtamt + "\n";
   SendMessage.sendMobileMSG(CustomerAccount.getMobileNo(), message,Branch);
                    PaymentFollowup.setCustomerAccount(CustomerAccount);
                    Date nextdate = new Date();
                    try {

                        nextdate = (new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("nextpaymentdate")));
                    } catch (ParseException ex) {
                        ex.printStackTrace();
                    }

                    PaymentFollowup.setRequestDate(new Date());
                    PaymentFollowup.setNextfollowupdate(nextdate);
                    PaymentFollowup.setTypeofoffollowup("Sell");
                    
                    PaymentFollowup.setAdminOfBranch(Branch);
                    PaymentFollowupDao PaymentFollowupDao = new PaymentFollowupDao();
                    PaymentFollowupDao.savePaymentFollowup(PaymentFollowup);
                    int paymentId = new PaymentFollowupDao().getLastPaymentFollowupID();
                    if (paymentId != 0) {
                        PaymentFollowupMessage PaymentFollowupMessage = new PaymentFollowupMessage();
                        PaymentFollowup = PaymentFollowupDao.getPaymentFollowupByID(paymentId);
                        PaymentFollowupMessage.setDescription(message);
                        PaymentFollowupMessage.setFollowupdate(nextdate);
                        PaymentFollowupMessage.setPaymentFollowup(PaymentFollowup);
                        PaymentFollowupDao.savePaymentFollowupMessage(PaymentFollowupMessage);
                    }
                }

                String Sell = "Sell No- ";
                String agains = Sell + no;
                Payment pay = new Payment();
                pay.setAmount((int) (paidamtamt));

                pay.setAdminOfBranch(Branch);
                pay.setPaymentMode(paymode);
                pay.setPaymentType("Credit");
                pay.setCustomerAccount(CustomerAccount);
pay.setDescription(message);
                pay.setPaymentAgains(agains);
                new PaymentDao().savePayment(pay);
                if (balamtamt < 0) {

                    balamtamt = balamtamt - balamtamt * 2;
                    CustomerAccount.setAdvanceAmount(balamtamt);
                } else {
                    CustomerAccount.setAdvanceAmount(0);
                }
                CustomerAccountDao.updateCustomerAccount(CustomerAccount);

                
                
                SellPaymentHistory SellPaymentHistory=new SellPaymentHistory();
                SellPaymentHistory.setCustomerAccount(CustomerAccount);
                SellPaymentHistory.setCustomerSale(cs);
                SellPaymentHistory.setPaidamt(paidamtamt);
               new  SellPaymentHistoryDao().saveSellPaymentHistory(SellPaymentHistory);
                int i = 1;

              String  msg="Dear "+CustomerAccount.getName().toUpperCase()+ ","+ "\n"
                     + "Thank you for chossing Angel Music for Insrument Purchase.For any queries visit our website www.angelm.co.in";
                SendMessage.sendMobileMSG(CustomerAccount.getMobileNo(), msg,Branch);
                SendMessage.sendMobileMSG(CustomerAccount.getMobileNo(), message,Branch);
              session.setAttribute("i", i);
                session.setAttribute("msg", "Product Sell Successfully");
                session.setAttribute("printInvoiceID", "Sell");
                session.setAttribute("Sellid", cs.getId());
                response.sendRedirect("Admin/branchReception/CustomerSaleReport.jsp?accountid="+customerAccountid);
            } else {
                int i = 1;

                session.setAttribute("i", i);
                session.setAttribute("msg", "Something Went Wrong......");
                response.sendRedirect("Admin/branchReception/CustomerSaleReport.jsp?accountid="+customerAccountid);
            }
            
            
              } else {
                int i = 2;

                session.setAttribute("i", i);
                session.setAttribute("msg", "Check That Product Entry Save or Not......");
                response.sendRedirect("Admin/branchReception/CustomerSaleReport.jsp?accountid="+customerAccountid);
            }
        } else {
            int i = 2;

            session.setAttribute("i", i);
            session.setAttribute("msg", "Your Session is Terminate......");
            response.sendRedirect("Admin/Login/adminLogin.jsp");

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
