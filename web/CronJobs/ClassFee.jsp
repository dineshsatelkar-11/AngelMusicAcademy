
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.accede.angel.services.SendMessage"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%                                                    AdmissionDao cd = new AdmissionDao();

    int i = 0;
    List<Admission> cl = null;
Date date = new Date();
   
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String start1 = df.format(date);
    String[] str = start1.split("-");
    String month1 = str[1];
    String day1 = str[2];
    cl = cd.getYesterdatDueDateStudent1();

    if (cl != null && cl.size() > 0) {
        for (Admission p : cl) {

          
     Date c = p.getDuedateSmsdate();
            DateFormat df12 = new SimpleDateFormat("yyyy-MM-dd");
            String start22 = df12.format(c);
            String[] str12 = start22.split("-");
            String month2 = str12[1];
          
            String day2 = str12[2];
                    if (!(day2.equals(day1))) {
            String msg = "Hi " + p.getFirstName() + " " + p.getLastName() + "\n"
                    + "Thank you for registering for !" + p.getCourseName() + "\n"
                    + "You have an outstanding balance for your Class Fee . Your Due Date is " + p.getDueDate() + " Please visit our nearest Branch office  to complete your payments.!"
                    + "Thanks!"
                    + "The Angel Music  Team";
             SendMessage.sendMobileMSG(p.getContactNo(), msg);
             
             Admission q = new Admission();
            q = p;
             q.setDuedateSmsdate(new Date());
           

            cd.updateAdmission(p);
 }

        }
    }
    cl = cd.getTodayDueDateStudent1();
    if (cl != null && cl.size() > 0) {
        for (Admission p : cl) {

          
     Date c = p.getDuedateSmsdate();
            DateFormat df12 = new SimpleDateFormat("yyyy-MM-dd");
            String start22 = df12.format(c);
            String[] str12 = start22.split("-");
            String month2 = str12[1];
          
            String day2 = str12[2];
                    if (!(day2.equals(day1))) {
            String msg = "Hi " + p.getFirstName() + " " + p.getLastName() + "\n"
                    + "Thank you for registering for !" + p.getCourseName() + "\n"
                    + "You have an outstanding balance for your Class Fee . Your Due Date is " + p.getDueDate() + " Please visit our nearest Branch office  to complete your payments.!"
                    + "Thanks!"
                    + "The Angel Music  Team";
  SendMessage.sendMobileMSG(p.getContactNo(), msg);
   Admission q = new Admission();
            q = p;
             q.setDuedateSmsdate(new Date());
           

            cd.updateAdmission(p);
}
        }
    }
    cl = cd.getTommorowDueDateStudent1();
    if (cl != null && cl.size() > 0) {
        for (Admission p : cl) {

          
     Date c = p.getDuedateSmsdate();
            DateFormat df12 = new SimpleDateFormat("yyyy-MM-dd");
            String start22 = df12.format(c);
            String[] str12 = start22.split("-");
            String month2 = str12[1];
          
            String day2 = str12[2];
                    if (!(day2.equals(day1))) {
            String msg = "Hi " + p.getFirstName() + " " + p.getLastName() + "\n"
                    + "Thank you for registering for !" + p.getCourseName() + "\n"
                    + "You have an outstanding balance for your Class Fee . Your Due Date is " + p.getDueDate() + " Please visit our nearest Branch office  to complete your payments.!"
                    + "Thanks!" + "\n"
                    + "The Angel Music  Team";
              SendMessage.sendMobileMSG(p.getContactNo(), msg);
               Admission q = new Admission();
            q = p;
             q.setDuedateSmsdate(new Date());
           

            cd.updateAdmission(p);
}
        }
    }
SendMessage.sendMobileMSG("8956276855", "Morning Class Fee Cronjob run");
%>