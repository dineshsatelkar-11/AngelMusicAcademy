





<%@page import="com.accede.angel.admin.model.Product"%>
<%@page import="com.accede.angel.admin.dao.ProductDao"%>
<%
int productid=Integer.parseInt(request.getParameter("val"));
System.out.println("productid-"+productid);
ProductDao pd=new ProductDao();
Product product=new Product();
product=pd.getProductByID(productid);
%>
                                            <div >
                                                <input type="text" readonly="" id="unitPrice" value="<%=product.getSellPrice()%>" name="unitPrice" placeholder="Unit Price" class="form-control priceup">
                                        </div>