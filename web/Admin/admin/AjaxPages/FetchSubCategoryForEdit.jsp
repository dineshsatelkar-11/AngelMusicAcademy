

<%@page import="com.accede.angel.sell.dao.SubCatDao"%>
<%@page import="com.accede.angel.sell.model.SubCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%

    String Cate = request.getParameter("Category");
    String subCate = request.getParameter("subCategory");
    long catid = Long.parseLong(Cate);
    long subcatid = Long.parseLong(subCate);
    Category Category = new CategoryDao().getelementByID(catid);
    List<SubCategory> allSubcat = new SubCatDao().getAllSubCategorybycatname(Category);
%>

<select type="text" name="subCategory" id="subCategory" required="" class="form-control">
    <option value="">Select Sub category</option>
    <%
        for (SubCategory p : allSubcat) {
            if (p.getId() == subcatid) {
            %>
    <option value="<%=p.getId()%>"><%=p.getSubCategory()%></option>  

    <%
         }else{%>

    <option value="<%=p.getId()%>"><%=p.getSubCategory()%></option>  



    <%}}%>                                                       </select>