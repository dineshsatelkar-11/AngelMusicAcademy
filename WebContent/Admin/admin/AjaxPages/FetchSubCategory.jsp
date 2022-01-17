

<%@page import="com.accede.angel.sell.dao.SubCatDao"%>
<%@page import="com.accede.angel.sell.model.SubCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.model.Category"%>

   <script>
                                                        (function($) {
                                                            $(function() {
                                                              
                                                                $('.multi-select-dd3').fSelect();
                                                               
                                                            });
                                                        })(jQuery);
        </script>

<%

String Cate=request.getParameter("Category");
long catid=Long.parseLong(Cate);
Category Category=new CategoryDao().getelementByID(catid);
List<SubCategory> allSubcat=new SubCatDao().getAllSubCategorybycatname(Category);
%>

 <select type="text" name="SubCategory" id="SubCategory" required="" multiple="multiple" class="form-control multi-select-dd3">
                                                                    <option value="">Select Sub category</option>
<%
   for (SubCategory p : allSubcat) {
                                                       
%>
<option value="<%=p.getId()%>"><%=p.getSubCategory()%></option>     <%}%>                                                       </select>