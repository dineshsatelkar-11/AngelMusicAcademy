<%-- 
    Document   : SendGroupSmsAjax
    Created on : Jul 12, 2017, 12:23:16 PM
    Author     : Accede
--%>
<%@page import="com.accede.angel.services.SendMessage"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="java.util.List"%>

<%

    String Sms = request.getParameter("sms");

    AdmissionDao cd = new AdmissionDao();

    List<Admission> cl = null;
    cl = cd.getAllAdmission();
    if (cl != null && cl.size() > 0) {
        for (Admission p : cl) {
         
          
            String mobile1=p.getContactNo();
            String mobile2=p.getParentsNo();
           
                SendMessage.sendMobileMSG(mobile1, Sms);
                SendMessage.sendMobileMSG(mobile2, Sms);
                 int i = 1;
                  
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Message Send Successfully.");

        }}

%>