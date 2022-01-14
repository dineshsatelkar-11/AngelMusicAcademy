/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.SessionKey;
import com.accede.angel.sell.dao.BranchClassTransferDao;
import com.accede.angel.sell.dao.BranchProductDao;
import com.accede.angel.sell.dao.ProductDao1;
import com.accede.angel.sell.dao.SaveBranchSaleDAO;
import com.accede.angel.sell.dao.SaveSaleDetailsforBranchDAO;
import com.accede.angel.sell.dao.TempSaleforBranchDAO;
import com.accede.angel.sell.model.BranchClassTransfer;
import com.accede.angel.sell.model.BranchProduct;
import com.accede.angel.sell.model.BranchSale;
import com.accede.angel.sell.model.BranchSaleDetails;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.sell.model.TempSaleforBranch;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SendStock", urlPatterns = {"/SendStock"})
public class SendStock extends HttpServlet {

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
            
            
        
          AdminDao AdminDao=new AdminDao();
            int StockBranch = Integer.parseInt(request.getParameter("Branch"));
            Admin Admin=AdminDao.getAdminByID(StockBranch);
         
        String Productid = request.getParameter("Productid");
        String QuantityStock = request.getParameter("QuantityStock");
        long enterquant = Long.parseLong(QuantityStock);
        int Productidd = Integer.parseInt(Productid);
        BranchProduct BranchProduct=new BranchProduct();
        BranchProduct=new BranchProductDao().getProductByID(Productidd);
      if(BranchProduct.getProductquantity() >= enterquant)
      {
          
      long remainingquantity=BranchProduct.getProductquantity()-enterquant;
      BranchProduct.setProductquantity(remainingquantity);
      new BranchProductDao().updateBranchProduct(BranchProduct);
      BranchClassTransfer BranchClassTransfer=new BranchClassTransfer();
      BranchClassTransfer.setAdmin(Branch);
      BranchClassTransfer.setAdminid(Branch.getAdminId());
      BranchClassTransfer.setCgst(BranchProduct.getProduct().getCgst());
      BranchClassTransfer.setSgst(BranchProduct.getProduct().getSgst());
      BranchClassTransfer.setIgst(BranchProduct.getProduct().getIgst());
      BranchClassTransfer.setDiscountper(0);
      BranchClassTransfer.setHsn(BranchProduct.getProduct().getHsn());
      BranchClassTransfer.setProduct(BranchProduct.getProduct());
      BranchClassTransfer.setProductname(BranchProduct.getProduct().getProductname());
      BranchClassTransfer.setProductquantity(enterquant);
      BranchClassTransfer.setPurchasePrice(BranchProduct.getProduct().getPurchasePrice());
      BranchClassTransfer.setToadmin(Admin);
      BranchClassTransfer.setToadminid(Admin.getAdminId());
    BranchClassTransfer.setUnitPrice(BranchProduct.getProduct().getUnitPrice());
    BranchClassTransferDao BranchClassTransferDao=new BranchClassTransferDao();
      boolean b=BranchClassTransferDao.saveBranchClassTransfer(BranchClassTransfer);
      
      if(b)
      {
          
           BranchProduct bp = new BranchProduct();
            BranchProduct bp1 = new BranchProduct();
            BranchProductDao bd = new BranchProductDao();
            
            bp.setProductid(Productidd);
            bp.setAdminid(Admin.getAdminId());
            bp = bd.getBranchProduct(bp);
            
            if (bp != null) {
                
                long productquantity = bp.getProductquantity();
                productquantity = productquantity + enterquant;
                bp.setProductquantity(productquantity);
                bd.updateBranchProduct(bp);
                
            } else {
                
               
                bp1.setAdmin(Admin);
                bp1.setAdminid(Admin.getAdminId());
                bp1.setProduct(BranchProduct.getProduct());
                bp1.setCatid(BranchProduct.getProduct().getCatid());
                bp1.setSubcatid(BranchProduct.getProduct().getSubcatid());
                bp1.setBrandid(BranchProduct.getProduct().getBrandid());
                bp1.setModelid(BranchProduct.getProduct().getModelid());
                bp1.setColorModelid(BranchProduct.getProduct().getColorModelid());
                bp1.setProductBarcode(BranchProduct.getProduct().getProductBarcode());
                bp1.setProductid(BranchProduct.getProduct().getId());
                bp1.setProductquantity(enterquant);
                bd.saveBranchProduct(bp1);
            }
          
        int i = 1;

            session.setAttribute("i", i);
            session.setAttribute("msg", "Product Succssfully Transfer to the another Branch......");
            response.sendRedirect("Admin/branchReception/BranchProductStock1.jsp");
      
      
      }else
      {
      
      
       int i = 2;

            session.setAttribute("i", i);
            session.setAttribute("msg", "Sonething went wrong at the time of Product Shifting......");
            response.sendRedirect("Admin/branchReception/BranchProductStock1.jsp");
      }
      
      }else{
       int i = 2;

            session.setAttribute("i", i);
            session.setAttribute("msg", "Enter Quantity is Greater then available Quantity......");
            response.sendRedirect("Admin/branchReception/BranchProductStock1.jsp");
      
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
