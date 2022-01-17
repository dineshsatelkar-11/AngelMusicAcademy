<%-- 
    Document   : StudentSmsBulk
    Created on : Aug 8, 2018, 7:13:04 PM
    Author     : Admin
--%>
<%@page import="com.accede.angel.admin.model.SmsModel"%>
<%@page import="com.accede.angel.admin.dao.SmsDao"%>
<%@page import="com.accede.angel.services.SendMessage"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%
    String sms = request.getParameter("sms");

    if (session.getAttribute("BRANCH_ADMIN") != null) {

        Admin admintop1111 = (Admin) session.getAttribute("BRANCH_ADMIN");
        AdmissionDao AdmissionDao = new AdmissionDao();
        int i = 0;
        List<Admission> cl = null;
        SmsDao cd = new SmsDao();
        SmsModel crd = cd.getSmsModelByID(Long.parseLong(sms));
        cl = AdmissionDao.getStudentListRegular(admintop1111);
        if (cl != null && cl.size() > 0) {
            for (Admission p : cl) {
                SendMessage.sendMobileMSG(p.getContactNo(), crd.getSms(), admintop1111);
                System.out.println("i=" + i++);
            }
        }
    }

%>
