
<%@page import="com.accede.angel.sell.dao.VendorDao"%>
<%@page import="com.accede.angel.sell.model.Venderregistration"%>
<%
long id=Long.parseLong(request.getParameter("vendor"));
System.out.println("id=="+id);
Venderregistration v=new Venderregistration();
VendorDao vdao=new VendorDao();
v=vdao.getvenderbyid(id);
%>

                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Balance Amount<span class="required"></span>
                        </label>
                          <div class="col-md-6 col-sm-6 col-xs-12" >
                              <input type="text" id="Balance_Amount" value="<%=v.getBalanceAmount() %>" name="Balance_Amount" readonly="" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                    
                        
                          
                             
                        
                     