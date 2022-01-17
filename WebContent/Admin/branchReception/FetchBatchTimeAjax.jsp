



 <%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>
<%@page import="com.accede.angel.admin.model.BatchTimings"%>
 <%
String Batchtiming=request.getParameter("i");
int idd=Integer.parseInt(Batchtiming);
BatchTimeDa0 bddd=new BatchTimeDa0();
List<BatchTimings> batch=bddd.getAllBatchTimings();
%>
<div class="form-group" id="endbatchtimefetch">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="batchtime">End Time <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select class="form-control" required=""  id="end" name="end" >
                                                        <option >-Select Batch Timings-</option> 
<%

for(BatchTimings c:batch)
{
   if(c.getId()==(idd+1) || c.getId()==(idd+2)) 
   {

%>
<option value="<%=c.getId()%>"><%=c.getBatchTiming()%></option> 
   <%}}%>
                                                    </select>
                                                    
                                                    
                                                
                                                </div>
                                            </div>