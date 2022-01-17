<%@page import="com.accede.angel.services.SendMessage"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%

    
   
    AdmissionDao cd = new AdmissionDao();
    List<Admission> cl = null;
    cl = cd.getAllAdmission();

    if (cl != null && cl.size() > 0) {
        for (Admission p : cl) {
            Admission q = new Admission();
            q = p;
            p.setBirthdaysmsstatus(true);
            p.setDuedateSmsstatus(true);

            cd.updateAdmission(p);

        }
    }

    RentDao cd1 = new RentDao();

    List<Rent> cl1 = null;
    cl1 = cd1.getAllDueDateStudent1();
    if (cl1 != null && cl1.size() > 0) {
        for (Rent p : cl1) {
            Rent r = new Rent();
            r = p;
            r.setDuedateSmsstatus(true);
            cd1.update(r);

        }
    }

    RepairDao cd2 = new RepairDao();

    List<Repair> cl2 = null;

    cl2 = cd2.getAllDueDateStudent1();
    if (cl2 != null && cl2.size() > 0) {
        for (Repair p : cl2) {
            Repair r = new Repair();
            r = p;
            r.setDuedateSmsstatus(true);
            cd2.update(r);

        }
    }

 SendMessage.sendMobileMSG("8956276855", "Night Cronjob run");
%>