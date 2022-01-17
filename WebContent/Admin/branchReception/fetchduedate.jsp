
<%@page import="java.util.Calendar"%>
<%@page import=" java.util.Date"%>
<%@page import=" java.text.DateFormat"%>
<%@page import=" java.text.SimpleDateFormat"%>

<%

int day=Integer.parseInt(request.getParameter("q"));

String date1=request.getParameter("w");
String date=request.getParameter("v");
  Calendar d = Calendar.getInstance();
            d.setTime(new Date());
         
            
            d.add(Calendar.DATE, day);
            Date dd = d.getTime();
            
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy ");
            String PendDate = df.format(dd);

%>
    <div id="datefetch"> 
                                                <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" id="datetimepicker2" readonly="" value="<%=PendDate%>" name="to" placeholder="To Date" class="form-control DueDate">
                                                </div>
                                                </div>