        
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@page import="com.accede.angel.sell.dao.SubCatDao"%>
<%@page import="com.accede.angel.sell.dao.CategoryDao"%>
<%@page import="com.accede.angel.sell.model.SubCategory"%>
<%@page import="com.accede.angel.sell.model.Category"%>
<%@page import="com.accede.angel.sell.dao.ColorDao"%>
<%@page import="com.accede.angel.sell.model.ColorModel"%>
<%@page import="com.accede.angel.sell.dao.BrandDao"%>
<%@page import="com.accede.angel.sell.model.Brand"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.model.AddModel"%>
<%@page import="com.accede.angel.sell.dao.ModelDao"%>


<%

    String Cate = request.getParameter("Category");
    String SubCate = request.getParameter("SubCategory");
    String Mod = request.getParameter("Model");
    String Brandd = request.getParameter("Brand");
    long catid = Long.parseLong(Cate);
    long SubCategoryid = Long.parseLong(SubCate);
    int modelid=Integer.parseInt(Mod);
    int Branddid=Integer.parseInt(Brandd);
    Category Category = new CategoryDao().getelementByID(catid);
    SubCategory SubCategory = new SubCatDao().getelementByID(SubCategoryid);
         AddModel am = new ModelDao().getelementByID(modelid) ;
          Brand bm1 = new BrandDao().getelementByID(Branddid);
%>

            <div class="col-md-3 col-sm-12 col-xs-12">
                <select type="text" name="ColorName" id="ColorName"  class="form-control productsearch">
                    <option value="">Select Color</option>
                    <%  ColorDao cd = new ColorDao();
                        ColorModel cmm = new ColorModel();
                        List<ColorModel> cm = cd.getAllProductModel(Category,SubCategory,am,bm1);
//                                                                        List<ColorModel> cm = cd.getAllColorModel(cmm);
                        for (ColorModel gm : cm) {


                    %>
                    <option value="<%=gm.getId()%>"><%=gm.getColorName()%></option>
                    <%
                        }
                    %>
                </select>     
            </div>