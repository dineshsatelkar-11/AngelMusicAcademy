<%-- 
    Document   : StudentEnquiryAjax
    Created on : Jul 18, 2017, 4:54:12 PM
    Author     : accede
--%>

<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>
<%@page import="com.accede.angel.admin.model.Instrument"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.ClassEnquiry"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String studEmail = request.getParameter("studEmail");

    ClassEnquiry ce = new ClassEnquiry();
    ce.setEmail(studEmail);
    ce.setMobile(studEmail);

    AdmissionDao ad = new AdmissionDao();
    ClassEnquiry c = ad.getStudByEmailorMobile(ce);
    if (c != null) {
        // z++;

        System.out.println("welcome to ajax");
        System.out.println(c.getEmail());
        System.out.println(c.getMobile());
%>
<div id="output">
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="fname" value="<%=c.getFirstName()%>" name="fname" placeholder="First Name" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="mname" value="<%=c.getMiddleName()%>" name="mname" placeholder="Middle Name" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="lname"  value="<%=c.getLastName()%>" name="lname" placeholder="Last Name" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="contact" value="<%=c.getMobile()%>" name="contact" placeholder="Contact No." class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="email"  value="<%=c.getEmail()%>" name="email" placeholder="Email" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <select class="form-control" id="instname" name="instname" >
            <option value="">-Select Instrument-</option> 
            <%                List<Instrument> inst = new InstrumentDao().getAllInstrumene();

                for (Instrument i : inst) {

            %>
            <option value="<%=i.getInstrumentId()%>"><%=i.getInstrumentName()%></option>
            <%
                }

            %>
        </select>
    </div>
</div>
<%    }
%>