/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.admin.dao.EnquiryDao;
import com.accede.angel.admin.dao.PaymentDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Enquiry;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.sell.dao.BranchProductDao;
import com.accede.angel.sell.dao.CustomerSaleDAO;
import com.accede.angel.sell.dao.CustomerSaleDetailsDAO;
import com.accede.angel.sell.dao.CustomerSellDAO;
import com.accede.angel.sell.dao.ProductDao1;
import com.accede.angel.sell.model.BranchProduct;
import com.accede.angel.sell.model.CustomerSale;
import com.accede.angel.sell.model.CustomerSaleDetails;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.sell.model.TempCustomerSell;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "CustomerSaleServletforreception", urlPatterns = {"/CustomerSaleServletforreception"})
public class CustomerSaleServletforreception extends HttpServlet {

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
              int inquiryid = Integer.parseInt(request.getParameter("inquiryid"));
                    if (inquiryid != 0) {
                        Enquiry en = new Enquiry();
                        EnquiryDao ed = new EnquiryDao();
                        en = ed.getEnquiryByID(inquiryid);
                        en.setRemove(false);
                        ed.update(en);

                    }
            
            
            
            String customername = request.getParameter("customer_name");
            String customermobilenumber = request.getParameter("Mobile_no");
            String Cust_Address = request.getParameter("Cust_Address");
            String Other_Charges = request.getParameter("Other_Charges");
            String Discount_Amount = request.getParameter("Discount_Amount");
            String Net_Amount = request.getParameter("Net_Amount");
            String amountinword = request.getParameter("amountinword");
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
                totalquantity=totalquantity+p.getProductquantity();

            }

            CustomerSale cs = new CustomerSale();
            CustomerSaleDAO csd1 = new CustomerSaleDAO();

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
            cs.setGrosstotal(grandtotal + otheramount - discountamo);
            cs.setCustomerSaleDetails(pdList);

            boolean b = csd1.SaveProduct(cs);

            if (b) {
                int saleno=csd1.getLastBillSaleID();
                String no=Integer.toString(saleno);
                 String Sell = "Sell No- ";
                    String agains = Sell + no;
                    Payment pay = new Payment();
                    pay.setAmount((int)(grandtotal + otheramount - discountamo));
//                    pay.setBankName("");
                    pay.setAdminOfBranch(Branch);
                    pay.setPaymentMode("Cash");
                    pay.setPaymentType("Credit");
//                    pay.setTransctionNo("");
                    pay.setPaymentAgains(agains);
                    new PaymentDao().savePayment(pay);
                
                
                int i = 1;

                session.setAttribute("i", i);
                session.setAttribute("msg", "Product Sell Successfully");
                session.setAttribute("printInvoiceID", saleno);
                response.sendRedirect("Admin/branchAdmin/CustomerSale.jsp");
            } else {
                int i = 2;

                session.setAttribute("i", i);
                session.setAttribute("msg", "Something Went Wrong......");
                response.sendRedirect("Admin/branchAdmin/SellProductToBranch.jsp");
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
