

<%@page import="com.accede.angel.services.SendMessage"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.Locale"%>




<%
    String sms = request.getParameter("sms");
    Date date = new Date();
    AdmissionDao cd = new AdmissionDao();
    List<Admission> cl = null;
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String start1 = df.format(date);
    String[] str = start1.split("-");
    String month1 = str[1];
    String day1 = str[2];
    System.out.println("month1-" + month1);
    System.out.println("day1-" + day1);
    cl = cd.getAllAdmission();
    int k = 0;
    if (cl != null && cl.size() > 0) {
        for (Admission p : cl) {
            Date d = p.getDateofBirth();
            DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
            String start2 = df1.format(d);
            String[] str1 = start2.split("-");
            String month = str1[1];
            System.out.println("month-" + month);
            String day = str1[2];
            System.out.println("day-" + day);
            if (month1.equals(month)) {
                System.out.println("daysd-" + day);
                if (day.equals(day1)) {
                    k++;

                    SendMessage.sendMobileMSG(p.getContactNo(), sms);
                     }
            }
        }
    }
%>