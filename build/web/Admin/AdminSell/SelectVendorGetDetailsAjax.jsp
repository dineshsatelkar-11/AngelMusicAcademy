
<%@page import="com.accede.angel.sell.dao.VendorDao"%>
<%@page import="com.accede.angel.sell.model.Venderregistration"%>
<%
long id=Long.parseLong(request.getParameter("vendor"));
System.out.println("id=="+id);
Venderregistration v=new Venderregistration();
VendorDao vdao=new VendorDao();
v=vdao.getvenderbyid(id);
%>
<div class="col-md-3 col-sm-12 col-xs-12">
    <input type="text" id="VendorName" value="<%=v.getVendorname() %>" name="VendorName" readonly="" required="required" placeholder="Vendor Name"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                </div>
