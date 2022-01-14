/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.SessionKey;
import com.accede.angel.sell.dao.BranchProductDao;
import com.accede.angel.sell.dao.ProductDao1;
import com.accede.angel.sell.dao.SaveBranchSaleDAO;
import com.accede.angel.sell.dao.SaveSaleDetailsforBranchDAO;
import com.accede.angel.sell.dao.TempSaleforBranchDAO;
import com.accede.angel.sell.model.BranchProduct;
import com.accede.angel.sell.model.BranchSale;
import com.accede.angel.sell.model.BranchSaleDetails;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.sell.model.TempSaleforBranch;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
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
@WebServlet(name = "SaletoBranch", urlPatterns = {"/SaletoBranch"})
public class SaletoBranch extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String sessionidd = request.getParameter("sessionidd");
            boolean c=true;  
            HttpSession session = request.getSession();
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
        String branchid1 = request.getParameter("Branch");
        int branchid = Integer.parseInt(branchid1);
        AdminDao ad = new AdminDao();
        Admin a = ad.getAdminByID(branchid);
        
        List<BranchSaleDetails> pdList = new ArrayList<BranchSaleDetails>();
        List<TempSaleforBranch> tempProduct = new TempSaleforBranchDAO().getAllProduct();
        SaveSaleDetailsforBranchDAO saledao = new SaveSaleDetailsforBranchDAO();
        ProductDao1 pd1 = new ProductDao1();
        
        long totalquantity = 0;
        for (TempSaleforBranch p : tempProduct) {
            
            int pi = p.getProductid();
            System.out.println("product id" + pi);
            ProductModel pm = pd1.getProductByID(pi);
            String pn = p.getProductname();
            long pq = p.getProductquantity();
            totalquantity = totalquantity + pq;
            BranchSaleDetails bsd = new BranchSaleDetails();
            
            bsd.setProductname(pn);
            bsd.setProductquantity(pq);
            bsd.setProduct(pm);
            bsd.setCgst(pm.getCgst());
            bsd.setSgst(pm.getSgst());
            bsd.setIgst(pm.getIgst());
            bsd.setPurchasePrice(pm.getPurchasePrice());
            bsd.setUnitPrice(pm.getUnitPrice());
            bsd.setHsn(pm.getHsn());
            saledao.saveBranchSaleDetails(bsd);
            
            BranchProduct bp = new BranchProduct();
            BranchProduct bp1 = new BranchProduct();
            BranchProductDao bd = new BranchProductDao();
            
            bp.setProductid(pi);
            bp.setAdminid(branchid);
            bp = bd.getBranchProduct(bp);
            
            if (bp != null) {
                
                long productquantity = bp.getProductquantity();
                productquantity = productquantity + pq;
                bp.setProductquantity(productquantity);
                bd.updateBranchProduct(bp);
                
            } else {
                
                Admin a1 = ad.getAdminByID(branchid);
                bp1.setAdmin(a1);
                bp1.setAdminid(branchid);
                bp1.setProduct(pm);
                bp1.setCatid(pm.getCatid());
                bp1.setSubcatid(pm.getSubcatid());
                bp1.setBrandid(pm.getBrandid());
                bp1.setModelid(pm.getModelid());
                bp1.setColorModelid(pm.getColorModelid());
                bp1.setProductBarcode(pm.getProductBarcode());
                bp1.setProductid(pi);
                bp1.setProductquantity(p.getProductquantity());
                bd.saveBranchProduct(bp1);
            }
            
            long productmodelquantity = pm.getProductquantity();
            productmodelquantity = productmodelquantity - p.getProductquantity();
            pm.setProductquantity(productmodelquantity);
            pd1.UpdateProduct(pm);
            pdList.add(bsd);
            
        }
     
        
        BranchSale bs = new BranchSale();
        SaveBranchSaleDAO branchsale = new SaveBranchSaleDAO();
        
        bs.setAdmin(a);
        bs.setBranchsaledetails(pdList);
        bs.setAdminid(branchid);
        
        bs.setTotalquantity(totalquantity);
        boolean b = branchsale.saveBrachsale(bs);
        
        long Saleid1 = branchsale.getLastInvoiceID();
        
        session.setAttribute("printSaleID1", Saleid1);
        System.out.println("printSaleID1===" + Saleid1);
        session.setAttribute("client_id1", branchid);
        
        if (b) {
            int i = 1;
            
            session.setAttribute("i", i);
            session.setAttribute("msg", "Product Successfully Added To Branch...!");
            response.sendRedirect("Admin/admin/SellProductToBranch.jsp");
        } else {
            int i = 2;
            
            session.setAttribute("i", i);
            session.setAttribute("msg", "Something Went Wrong......");
            response.sendRedirect("Admin/admin/SellProductToBranch.jsp");
        }
       } else {
            int i = 2;
            
            session.setAttribute("i", i);
            session.setAttribute("msg", "Check Product Successfully Added To Class Branch or Not...!......");
            response.sendRedirect("Admin/admin/SellProductToBranch.jsp");
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
