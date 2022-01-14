



<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
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
    String ColorName = request.getParameter("ColorName");
    String count = request.getParameter("count");
    int countid = Integer.parseInt(count);
    System.out.println(countid);
    long catid = 0;
    long SubCategoryid = 0;
    int modelid = 0;
    int Branddid = 0;
    int Colorid = 0;
    if (countid == 1 || countid > 1) {
        if (Cate != "") {
            catid = Long.parseLong(Cate);
        }
        if (countid > 1) {
            if (SubCate != "") {
                SubCategoryid = Long.parseLong(SubCate);
            }
            if (countid > 2) {
                if (Brandd != "") {
                    Branddid = Integer.parseInt(Brandd);
                }
                if (countid > 3) {
                    if (Mod != "") {
                        modelid = Integer.parseInt(Mod);
                    }

                    if (countid > 4) {
                        if (ColorName != "") {
                            Colorid = Integer.parseInt(ColorName);
                        }
                    }
                }
            }
        }
    }
    ProductDao1 ProductDao1 = new ProductDao1();
%>
<div class="col-md-3 col-sm-12 col-xs-12">
    <select type="text" name="Category" id="Category"  class="form-control product">
        <option value="">Select Category</option>
        <%  CategoryDao dao = new CategoryDao();
            Category bm = new Category();
            List<Category> model = dao.getAllCategory(bm);
            for (Category gm : model) {

                if (gm.getId() == catid) {
        %>
        <option selected="selected" value="<%=gm.getId()%>"><%=gm.getCategory()%></option>
        <%
        } else {
        %>

        <option value="<%=gm.getId()%>"><%=gm.getCategory()%></option>
        <%
                }
            }
        %>
    </select>    
</div>

<div id="output1">
    <div class="col-md-2 col-sm-12 col-xs-12">

        <select type="text" name="SubCategory" id="SubCategory"  class="form-control product">
            <option value="">Select Sub category</option>
            <%
                List<SubCategory> allSubcat = ProductDao1.getAllProductSubCategory(catid, SubCategoryid, Branddid, modelid, Colorid);
                for (SubCategory p : allSubcat) {
                    if (p.getId() == SubCategoryid) {
            %>
            <option selected="selected"  value="<%=p.getId()%>"><%=p.getSubCategory()%></option> 
            <%
            } else {
            %>

            <option value="<%=p.getId()%>"><%=p.getSubCategory()%></option> 


            <%}
                }%>    
        </select>
    </div>
    <div id="output2">
        <div class="col-md-2 col-sm-12 col-xs-12">
            <select type="text" name="Brand" id="Brand"  class="form-control productsearch product">
                <option value="">Select Brand</option>
                <%
                    List<Brand> mod = ProductDao1.getAllProductBrand(catid, SubCategoryid, Branddid, modelid, Colorid);
                    for (Brand gm : mod) {

                        if (gm.getId() == Branddid) {
                %>
                <option  selected="selected"   value="<%=gm.getId()%>"><%=gm.getBrand()%></option>

                <%
                } else {
                %>

                <option value="<%=gm.getId()%>"><%=gm.getBrand()%></option>
                <%
                        }
                    }
                %>
            </select>  
        </div>


        <div id="output2">
            <div class="col-md-2 col-sm-12 col-xs-12">
                <select type="text" name="Model" id="Model"  class="form-control product">
                    <option value="">Select Model</option>
                    <%
                        List<AddModel> pp1 = ProductDao1.getAllProductAddModel(catid, SubCategoryid, Branddid, modelid, Colorid);
                        for (AddModel gm : pp1) {

                            if (gm.getId() == modelid) {
                    %>
                    <option selected="selected"  value="<%=gm.getId()%>"><%=gm.getModelName()%></option>

                    <%
                    } else {
                    %>


                    <option value="<%=gm.getId()%>"><%=gm.getModelName()%></option>



                    <%
                            }
                        }
                    %>
                </select>    
            </div>
            <div id="output3">
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <select type="text" name="ColorName" id="ColorName"  class="form-control product">
                        <option value="">Select Color</option>
                        <%
                            List<ColorModel> cm = ProductDao1.getAllProductColorModel(catid, SubCategoryid, Branddid, modelid, Colorid);
                            //                                                                        List<ColorModel> cm = cd.getAllColorModel(cmm);
                            for (ColorModel gm : cm) {

                                if (gm.getId() == Colorid) {

                        %>
                        <option selected="selected"  value="<%=gm.getId()%>"><%=gm.getColorName()%></option>



                        <%
                        } else {
                        %>

                        <option value="<%=gm.getId()%>"><%=gm.getColorName()%></option>

                        <%
                                }
                            }
                        %>
                    </select>     
                </div></div>
        </div>
    </div>
</div>


<script type="text/javascript">
                                                                $(document).ready(function() {
                                                                    // alert('fsdfsdf');
                                                                    $('.product').change(function() {
                                                                        var id = this.id;
                                                                       
                                                                        var count=0;
                                                                        if (id == "Category")
                                                                        {
                                                                            count=1;
                                                                        } else if (id == "SubCategory")
                                                                        {
                                                                              count=2;
                                                                        }
                                                                        else if (id == "Brand")
                                                                        {
                                                                              count=3;
                                                                        }
                                                                        else if (id == "Model")
                                                                        {
                                                                              count=4;
                                                                        }
                                                                        else
                                                                        {
                                                                              count=5;
                                                                        }
                                                                     
                                                                        var Category = $('#Category').val();
                                                                        var SubCategory = $('#SubCategory').val();
                                                                        var Model = $('#Model').val();
                                                                        var Brand = $('#Brand').val();
                                                                        var ColorName = $('#ColorName').val();

                                                                        $.get("AjaxPages/FetchSubCategoryInPurchase.jsp", {SubCategory: SubCategory, Model: Model, Brand: Brand, ColorName: ColorName, Category: Category ,count : count}, function(data) {

                                                                            $('#productfetch').html(data);
                                                                        });

                                                                    });
                                                                });
</script>