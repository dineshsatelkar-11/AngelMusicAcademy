<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.accede.angel.services.SendMessage"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%                                                    AdminDao addd = new AdminDao();
    RepairDao cd = new RepairDao();
  Date date = new Date();
   
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String start1 = df.format(date);
    String[] str = start1.split("-");
    String month1 = str[1];
    String day1 = str[2];
    int i = 0;
    List<Repair> cl = null;

    cl = cd.getYesterdatDueDateStudent1();
    if (cl != null && cl.size() > 0) {
        for (Repair p : cl) {

          
     Date c = p.getDuedateSmsdate();
            DateFormat df12 = new SimpleDateFormat("yyyy-MM-dd");
            String start22 = df12.format(c);
            String[] str12 = start22.split("-");
            String month2 = str12[1];
          
            String day2 = str12[2];
                    if (!(day2.equals(day1))) {
    
    String msg = "Hi " + p.getCustomerFirstName() + "\n"
                    + "Thanks!"
                    + "The Angel Music  Team";
            SendMessage.sendMobileMSG(p.getCustomerMobileNo(), msg);
            Repair r = new Repair();
            r = p;
           r.setDuedateSmsdate(new Date());
            cd.update(r);

        }}}
   
    cl = cd.getTodayDueDateStudent1();
    if (cl != null && cl.size() > 0) {
        for (Repair p : cl) {
 Date c = p.getDuedateSmsdate();
            DateFormat df12 = new SimpleDateFormat("yyyy-MM-dd");
            String start22 = df12.format(c);
            String[] str12 = start22.split("-");
            String month2 = str12[1];
          
            String day2 = str12[2];
                    if (!(day2.equals(day1))) {
    
    
    
    
    
            String msg = "Hi " + p.getCustomerFirstName() + "\n"
                    + "Thanks!"
                    + "The Angel Music  Team";
            SendMessage.sendMobileMSG(p.getCustomerMobileNo(), msg);
            Repair r = new Repair();
            r = p;
           r.setDuedateSmsdate(new Date());
            cd.update(r);

        }}
    }
    cl = cd.getTommorowDueDateStudent1();
    if (cl != null && cl.size() > 0) {
        for (Repair p : cl) {
 Date c = p.getDuedateSmsdate();
            DateFormat df12 = new SimpleDateFormat("yyyy-MM-dd");
            String start22 = df12.format(c);
            String[] str12 = start22.split("-");
            String month2 = str12[1];
          
            String day2 = str12[2];
                    if (!(day2.equals(day1))) {
            String msg = "Hi " + p.getCustomerFirstName() + "\n"
                    + "Thanks!"
                    + "The Angel Music  Team";
            SendMessage.sendMobileMSG(p.getCustomerMobileNo(), msg);
            Repair r = new Repair();
            r = p;
           r.setDuedateSmsdate(new Date());
            cd.update(r);
        }}
    }
    SendMessage.sendMobileMSG("8956276855", "Morning Repair Cronjob run");

%>