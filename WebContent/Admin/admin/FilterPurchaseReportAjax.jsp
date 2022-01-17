<%@page import="com.accede.angel.sell.dao.VendorDao"%>
<%@page import="com.accede.angel.sell.model.Venderregistration"%>
<%@page import="com.accede.angel.sell.dao.PurchaseDao"%>
<%@page import="com.accede.angel.sell.model.PurchaseProduct"%>

<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>



<%

    String start = request.getParameter("start");
    long id = Long.parseLong(request.getParameter("vendor"));
    Venderregistration v=new Venderregistration();
    VendorDao vd=new VendorDao();
    v=vd.getvenderbyid(id);
    //System.out.println("vendor name Isssssssssssssss" + id);
    String end = request.getParameter("end").trim();
    System.out.println("start-" + start);
    System.out.println("end-" + end);
    Date date = new Date();;
    try {
        date = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH).parse(start);
        System.out.println("start1-" + date);

    } catch (ParseException e) {
        e.printStackTrace();
    }

    Date date1 = new Date();
    try {
        date1 = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH).parse(end);
        System.out.println("end1-" + date1);

    } catch (ParseException e) {
        e.printStackTrace();
    }
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String start1 = df.format(date);
    System.out.println("start1-" + start1);
    String endd = df.format(date1);
    System.out.println("endd-" + endd);
// Date st1 = new SimpleDateFormat("MM/dd/yyyy").parse(start1);
// System.out.println("st1-"+st1);
// Date end1 = new SimpleDateFormat("MM/dd/yyyy").parse(endd);
// System.out.println("end1-"+end1);
    String query1 = "from PurchaseProduct where Purchase_Date  Between '" + start1 + "' AND '" + endd + "'  ";


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
            <th class="table_center">Grand Quantity</th>
            <th class="table_center">Grand Total</th>


        </tr>
    </thead>
    <tbody>

        <%                PurchaseDao cd = new PurchaseDao();

            int i = 0;

            List<PurchaseProduct> cl = null;
            cl = cd.getPurchaseProductReport1(query1);
            if (cl != null && cl.size() > 0) {
                for (PurchaseProduct p : cl) {
                    if (id == p.getVendorid().getId()) {

                        Date dt = p.getPurchase_Date();

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












