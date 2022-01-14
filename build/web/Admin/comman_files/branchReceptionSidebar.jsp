<%@page import="java.util.Calendar"%>
<%@page import="com.accede.angel.services.DynamicGenerator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.admin.model.Admin"%>

<%
  if (session.getAttribute("BRANCH_ADMIN") != null) {
      
       Admin qwr= (Admin) session.getAttribute("BRANCH_ADMIN");
        int id22222=qwr.getAdminId();
       AdminDao adddd=new AdminDao();
        Admin admin=adddd.getAdminByID(id22222);
       String ImgPath = admin.getImagename();
       
       String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
           
            DynamicGenerator dg = new DynamicGenerator();
            String no = dg.passwordGenerator();
            String sessionidd = no + timeStamp+admin.getAdminId();
            
            System.out.println("sessionidd=" + sessionidd);
       
        if (ImgPath != null && !ImgPath.isEmpty()) 
   {
//                         ImgPath = ImgPath.substring(ImgPath.lastIndexOf("eb\\")+17);
                         System.out.println("ImgPath-"+ImgPath);
                         
                          System.out.println("ImgPath-"+ImgPath);
%>

              <%}
     %>

            
                
                
                
     