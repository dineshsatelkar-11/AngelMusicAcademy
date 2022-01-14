



<%@page import="com.accede.angel.sell.dao.PurchaseDao"%>
<%@page import="com.accede.angel.sell.model.PurchaseProduct"%>
<%@page import="java.util.List"%>
<%
long id=Long.parseLong(request.getParameter("vendor"));
System.out.println("id"+id);
    

%>


<table id="datatable" class="table table-striped table-bordered tablefetch">
    <thead>
        <tr>

            <th class="table_center">Sr No</th>
            <th class="table_center">View Products</th>
            <th class="table_center">Vendor Name</th>
            <th class="table_center">Invoice No</th>
            <th class="table_center">Purchase  Date</th>

            <th class="table_center">Grand SGST</th>
            <th class="table_center">Grand CGST</th>
            <th class="table_center">Grand IGST</th>
            <th class="table_center">Taxable Amount</th>
            <th class="table_center">Grand Quantity</th>
            <th class="table_center">Grand Total</th>


        </tr>
    </thead>
    <tbody>

      <%
                                                    PurchaseDao cd = new PurchaseDao();

                                                    int i = 0;
                                                    List<PurchaseProduct> cl = null;
                                                    cl = cd.getAllPurchaseProduct();
                                                    if (cl != null && cl.size() > 0) {
                                                        for (PurchaseProduct p : cl) {
                                                            if(p.getVendorid().getId()==id){

                                                            i++;


                                                %>
        <tr>
            <td class="table_center"><%=i%></td>

            <td class="table_center"><a href="PurchaseReportAjax.jsp?id=<%=p.getPurchaseID()%>"><i class="btn btn-round btn-success">VIEW PRODUCTS</i></a></td> 





            <td class="table_center"><%=p.getVendorid().getVendorname()%> </td>
            <td class="table_center"><%=p.getInvoiceID()%> </td>

            <td class="table_center"><%=p.getPurchase_Date()%></td> 
            <td class="table_center"><%=p.getGrandsgst()%></td> 
            <td class="table_center"><%=p.getGrandcgst()%></td> 
            <td class="table_center"><%=p.getGrandigst()%></td> 
             <td class="table_center"><%=p.getGrandTotalGst()%></td> 
            <td class="table_center"><%=p.getGrandtotalquantity()%></td> 
            <td class="table_center"><%=p.getGrandTotal()%></td> 



        </tr> 
        <%

                    }
                }
                                                    }

        %>
    </tbody>
</table>












