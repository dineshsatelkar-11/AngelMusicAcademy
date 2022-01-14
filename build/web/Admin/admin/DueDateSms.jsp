<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%
    AdmissionDao cd = new AdmissionDao();

    int i = 0;
    List<Admission> cl = null;
    cl = cd.getAllAdmission();
    if (cl != null && cl.size() > 0) {
        for (Admission p : cl) {
            boolean studentype = p.isShiftToOldStudent();

            if (studentype) {
                i++;

                String ImgPath1 = p.getImage();
                
                System.out.println("Due Date===="+p.getDueDate());

//                                                                    ImgPath1 = ImgPath1.substring(ImgPath1.lastIndexOf("eb\\") + 17);

%>

<%
            }}}
%>