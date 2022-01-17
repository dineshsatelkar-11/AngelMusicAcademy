<%@page import="com.accede.angel.admin.model.InstrumentSubcategory"%>
<%
    String pname = request.getParameter("q");

    InstrumentSubcategory instsub = new InstrumentSubcategory();
    instsub.setInstrument(pname);

   
    MenuDao md = new MenuDao();
    List<MenuSubTypeModel> m = md.getMenuSubType(msd);
    List<InstrumentSubcategory> instsubcat = new AdminDao().getAllInstSubcat();

            

        System.out.println("welcome to ajax");
%>
<div id="output">
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Sub Type</label>
        <div class="col-md-9 col-sm-9 col-xs-12">
            <select class="form-control" id="menusubtype" name="menusubtype" style="width:326px;">
                <%
                  for (InstrumentSubcategory in : instsubcat) {
                   
                %>
                <option value="<%=mm.getMenuSubType()%>"><%=mm.getMenuSubType()%></option>
           <%
        }
    %>
            </select>
        </div>
    </div>
   
</div>
