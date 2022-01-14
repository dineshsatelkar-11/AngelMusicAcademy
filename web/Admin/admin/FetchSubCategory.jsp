



              <%@page import="com.accede.angel.admin.model.Instrument"%>
<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>
<%@page import="com.accede.angel.admin.dao.InstrumentSubcategoryDao"%>
<%@page import="com.accede.angel.admin.model.InstrumentSubcategory"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="java.util.List"%>


<div id="output1">
                                       <select class="form-control" id="Instumentsub" name="Instumentsub" >
                                                        <option value="">-select Sub-Category-</option> 
                                                        <%
                                                            List<InstrumentSubcategory> instsubcat = new InstrumentSubcategoryDao().getAllInstrumentSubcategory();
                                    int id=Integer.parseInt(request.getParameter("q"));
                                   
                                                            for (InstrumentSubcategory in : instsubcat) {
                                                  if(id == in.getInstrument().getInstrumentId())
                                                  {
                                                        %>
                                                        <option value="<%=in.getInstrumentSubcategoryId()%>"><%=in.getInstrumentSubcategoryName()%></option>
                                                        <%
                                                            }
                                                            }
                                                        %>
                                                    </select>
                                    </div>

