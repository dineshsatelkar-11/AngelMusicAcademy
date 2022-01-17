
<%@page import="com.accede.angel.admin.dao.AdminPrevilleagesDao"%>
<%@page import="com.accede.angel.admin.model.AdminPrevilleages"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%
    int adminid = Integer.parseInt(request.getParameter("adminid"));
    int checkboxval = Integer.parseInt(request.getParameter("checkboxval"));
    String Checkstatus = request.getParameter("Checkstatus");
    String type = request.getParameter("typeofadmin");
    boolean status = true;
    if (Checkstatus.equals("2")) {
        status = false;
    }

    AdminDao aa = new AdminDao();
    Admin branchh = aa.getAdminByID(adminid);
    AdminPrevilleagesDao apd = new AdminPrevilleagesDao();
    AdminPrevilleages p1 = apd.getAdminPrevilleages(branchh, type);
    System.out.print("adminid======" + p1.getId());
    int i = 2;
    if (checkboxval == (i++)) {
        p1.setAllAccounts(status);
    } else if (checkboxval == (i++)) {
        p1.setAllStudent(status);
    } else if (checkboxval == (i++)) {
        p1.setVanished(status);
    } else if (checkboxval == (i++)) {
        p1.setAllRentRequest(status);
    } else if (checkboxval == (i++)) {
        p1.setAllRepairing(status);
    } else if (checkboxval == (i++)) {
        p1.setAllEmployee(status);
    } else if (checkboxval == (i++)) {
        p1.setDailyInOut(status);
    } else if (checkboxval == (i++)) {
        p1.setAllEnquiry(status);
    } else if (checkboxval == (i++)) {
        p1.setBatch_Timing(status);
    } else if (checkboxval == (i++)) {
        p1.setVendor_Account(status);
    } else if (checkboxval == (i++)) {
        p1.setSMS(status);
    } else if (checkboxval == (i++)) {
        p1.setSend_Promotional_SMS(status);
    } else if (checkboxval == (i++)) {
        p1.setBranch_Sell_Report(status);
    } else if (checkboxval == (i++)) {
        p1.setClass_Branch_Sell_Report(status);
    } else if (checkboxval == (i++)) {
        p1.setCustomer_Sell_Report(status);
    } else if (checkboxval == (i++)) {
        p1.setBranch_Product_Report(status);
    } else if (checkboxval == (i++)) {
        p1.setAvailable_Product(status);
    } else if (checkboxval == (i++)) {
        p1.setClass_Product_Stock_Report(status);
    } else if (checkboxval == (i++)) {
        p1.setTime_Table(status);
    } else if (checkboxval == (i++)) {
        p1.setExpense(status);

    } else if (checkboxval == (i++)) {
        p1.setEnquiry(status);

    } else if (checkboxval == (i++)) {
        p1.setNew_Account(status);

    } else if (checkboxval == (i++)) {
        p1.setBalance(status);

    } else if (checkboxval == (i++)) {
        p1.setEnquiryReport(status);

    } else if (checkboxval == (i++)) {
        p1.setPayemtReport(status);

    } 
    else if (checkboxval == (i++)) {
        p1.setPreviliageTab(status);

    } 
    else if (checkboxval == (i++)) {
        p1.setActivePackage(status);

    } 
    else if (checkboxval == (i++)) {
        p1.setRentCostReport(status);

    } 
    
    else if (checkboxval == (i++)) {
        p1.setRepairCostReport(status);
    }
    else
    {
     p1.setSellCostReport(status);
    }

    apd.UpdateAdminPrevilleages(p1);


%>