<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.accede.angel.services.SendMessage"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%                                                    RentDao cd = new RentDao();

    int i = 0;
    List<Rent> cl = null;
    Map<Admin, Integer> asd = new HashMap<Admin, Integer>();
    Map<Admin, Integer> asd1 = new HashMap<Admin, Integer>();
    Map<Admin, Integer> asd2 = new HashMap<Admin, Integer>();
    Date date = new Date();

    cl = cd.getTodayDueDateStudent1();
    if (cl != null && cl.size() > 0) {
        for (Rent p : cl) {
            Date d = new Date();
            if (!p.getDuedateSmsdate().equals(d)) {

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
                String msg = "Dear " + p.getCustomerAccount().getName().toUpperCase() + "\n"
                        + "Today is Last Date of Returning Instrument.If you already Return Instrument then ignore thses Message !"
                        + "Thanks!"
                        + "The Angel Music  Team";
                SendMessage.sendMobileMSG(p.getCustomerAccount().getMobileNo(), msg);
                Rent r = new Rent();
                r = p;
                r.setDuedateSmsdate(new Date());
                cd.update(r);
            }
        }
    }

    String msg = "No  Customer Having Today Rent Due Date";
    for (Map.Entry<Admin, Integer> entry : asd.entrySet()) {
        msg = " Today  No of Customer Due Date " + "\n"
                + " " + entry.getKey().getAdminOfBranch().getBranchName() + ":-" + entry.getValue();
    }

    SendMessage.sendMobileMSG(msg);
    cl = cd.getTommorowDueDateStudent1();
    if (cl != null && cl.size() > 0) {
        for (Rent p : cl) {
            Date d = new Date();
            if (!p.getDuedateSmsdate().equals(d)) {

                if (asd1 != null) {
                    if (asd1.containsKey(p.getAdminOfBranch())) {
                        asd1.put(p.getAdminOfBranch(), asd1.get(p.getAdminOfBranch()) + 1);
                    } else {
                        asd1.put(p.getAdminOfBranch(), 1);
                    }
                } else {
                    // Key might be present...
                    asd1.put(p.getAdminOfBranch(), 1);
                }
                msg = "Dear " + p.getCustomerAccount().getName().toUpperCase() + "\n"
                        + "Tommorrow is Last Date of Returning Instrument.If you already Return Instrument then ignore thses Message !"
                        + "Thanks!"
                        + "The Angel Music  Team";
                SendMessage.sendMobileMSG(p.getCustomerAccount().getMobileNo(), msg);
                Rent r = new Rent();
                r = p;
                r.setDuedateSmsdate(new Date());
                cd.update(r);
            }
        }
    }
    msg = "No  Customer Having Tommorrow Rent Due Date";
    for (Map.Entry<Admin, Integer> entry : asd1.entrySet()) {
        msg = " Tommorrow  No of Customer Due Date " + "\n"
                + " " + entry.getKey().getAdminOfBranch().getBranchName() + ":-" + entry.getValue();
    }

    SendMessage.sendMobileMSG(msg);
    cl = cd.getYesterdatDueDateStudent1();
    if (cl != null && cl.size() > 0) {
        for (Rent p : cl) {
            Date d = new Date();
            if (!p.getDuedateSmsdate().equals(d)) {
                if (asd2 != null) {
                    if (asd2.containsKey(p.getAdminOfBranch())) {
                        asd2.put(p.getAdminOfBranch(), asd2.get(p.getAdminOfBranch()) + 1);
                    } else {
                        asd2.put(p.getAdminOfBranch(), 1);
                    }
                } else {
                    // Key might be present...
                    asd2.put(p.getAdminOfBranch(), 1);
                }
                msg = "Dear " + p.getCustomerAccount().getName().toUpperCase() + "\n"
                        + "Yesterday was  Last Date of Returning Instrument.If you already Return Instrument then ignore thses Message !"
                        + "Thanks!"
                        + "The Angel Music  Team";
                SendMessage.sendMobileMSG(p.getCustomerAccount().getMobileNo(), msg);
                Rent r = new Rent();
                r = p;
                r.setDuedateSmsdate(new Date());
                cd.update(r);
            }
        }
    }

    msg = "No  Customer Having Yesterday Rent Due Date";
    for (Map.Entry<Admin, Integer> entry : asd2.entrySet()) {
        msg = " Yesterday  No of Customer Due Date " + "\n"
                + " " + entry.getKey().getAdminOfBranch().getBranchName() + ":-" + entry.getValue();
    }

    SendMessage.sendMobileMSG(msg);

%>