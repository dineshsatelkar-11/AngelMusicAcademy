




<%@page import="com.accede.angel.services.DynamicGenerator"%>
<%@page import="com.onbarcode.barcode.Code11"%>
<%@page import="com.onbarcode.barcode.Code39"%>
    <script src="../../Alertajax.js" type="text/javascript"></script>
<%

   DynamicGenerator by=new  DynamicGenerator();
   String no=by.Barcodegeneratot();
   System.out.println("barcode no. is:"+no);
    


%>


<div id="barcodeg">
    <input type="text" id="productshortcode" name="productshortcode" value="<%=no%>" required="required" placeholder="Product Bar Code"   class="form-control priceup">
    </div>                                                           