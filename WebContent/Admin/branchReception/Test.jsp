<%@page import="com.accede.angel.admin.model.AdminPrevilleages"%>
<%@page import="com.accede.angel.admin.dao.AdminPrevilleagesDao"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%
 Admin a = new Admin();
           
            AdminDao aa = new AdminDao();
            int id=4;
        a=aa.getAdminByID(id);
        AdminPrevilleagesDao AdminPrevilleagesDao = new AdminPrevilleagesDao();
        AdminPrevilleages AdminPrevilleages = new AdminPrevilleages();
        AdminPrevilleages AdminPrevilleages1 = new AdminPrevilleages();
        AdminPrevilleages.setAdmin(a);
        AdminPrevilleages.setAdmintype("2");
        AdminPrevilleagesDao.saveAdminPrevilleages(AdminPrevilleages);
        AdminPrevilleages1.setAdmin(a);
        AdminPrevilleages1.setAdmintype("3");
        AdminPrevilleagesDao.saveAdminPrevilleages(AdminPrevilleages1);

%>