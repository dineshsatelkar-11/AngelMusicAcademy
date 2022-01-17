

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
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
    Map<Admin, Integer> asd = new HashMap<Admin, Integer>();
    String sms = "We are thinking of you on this important day and we hope success and happiness keeps coming your way. Wishing you many joyous years ahead. Happy Birthday. \n"
            + "\n"
            + "Thanks !" + "\n"
            + "The Angel Music  Team";
    int k = 0;
    if (cl != null && cl.size() > 0) {
        for (Admission p : cl) {

            System.out.print("idd=" + p.getAdmissionId());
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
                    Date c = p.getDateofBirthsmsdate();

                    String start22 = df1.format(c);
                    String[] str12 = start22.split("-");
                    String month2 = str12[1];
                    System.out.println("month-" + month);
                    String day2 = str12[2];
                    if (!(day2.equals(day1))) {
                        if (asd != null) {
                            if (asd.containsKey(p.getAdminOfBranch())) {
                                asd.put(p.getAdminOfBranch(), asd.get(p.getAdminOfBranch()) + 1);
                            } else {
                                asd.put(p.getAdminOfBranch(), 1);
                            }
                        } else {
                            // Key might be present...
                            asd.put(p.getAdminOfBranch(), 1);
                        }
                        SendMessage.sendMobileMSG(p.getContactNo(), sms, p.getAdminOfBranch());
                        Admission q = new Admission();
                        q = p;
                        p.setDateofBirthsmsdate(new Date());

                        cd.updateAdmission(p);
                    }
                }
            }
        }
    }

    String msg="No Student Having Today Birthday";
	for (Map.Entry<Admin,Integer> entry : asd.entrySet()) 
          msg  =" Today  No of Student Today Birthday " + "\n"
                    + " " + entry.getKey().getAdminOfBranch().getBranchName() + ":-" + entry.getValue() ;
        
	 SendMessage.sendMobileMSG(msg);
	 SendMessage.sendMobileMSG("8956276855",msg);
%>