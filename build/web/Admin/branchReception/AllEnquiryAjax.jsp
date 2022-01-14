<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.model.Sell"%>
<%@page import="com.accede.angel.admin.dao.SellDao"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.model.ClassEnquiry"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<!DOCTYPE html>
<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<!-- Datatables -->
<link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
<link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
<link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
<script src="../../js/Alertajax.js" type="text/javascript"></script>
<!-- Custom Theme Style -->
<link href="../build/css/custom.min.css" rel="stylesheet">


<%
    String inquirytype = request.getParameter("inquirytype");
    System.out.println("inquirytype" + inquirytype);
    if (inquirytype.equals("Class")) {
%>

<div class="x_content" id="class_inquiry">
    <!--                                        <p class="text-muted font-13 m-b-30">
                                                The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                            </p>-->
    <table id="datatable-buttons" class="table table-striped table-bordered">
        <thead>
            <tr>
                <th class="table_center">Sr No</th>
                <th class="table_center">Name</th>
                <th class="table_center">Mobile No</th>
                <th class="table_center">Email</th>
                <th class="table_center">InstrumentName</th>  
                <!--                                                     <th class="table_center">Credit Days</th>
                                                                    <th class="table_center">Proprietor Name</th>
                                                                    <th class="table_center">Date of Birth</th>
                                                                    <th class="table_center">Address</th>
                                                                    <th class="table_center">State</th>
                                                                    <th class="table_center">Pin Code</th>
                                                                    <th class="table_center">UPDATE</th>-->
            </tr>
        </thead>
        <tbody>

            <%
                AdmissionDao cd = new AdmissionDao();

                int i = 0;
                List<ClassEnquiry> cl = null;
                cl = cd.getAllClassEnquiry();
                if (cl != null && cl.size() > 0) {
                    for (ClassEnquiry p : cl) {

                        i++;

            %>
            <tr>
                <td class="table_center"><%=i%></td>
                <td class="table_center"><%=p.getFirstName()%> </td>
                <td class="table_center"><%=p.getMobile()%></td>  
                <td class="table_center"><%=p.getEmail()%></td> 
                <td class="table_center"><%=p.getInstrumentName().getInstrumentName()%></td>
                <!--                              
                -->                                                </tr> <!--
                <%}
                                                     } %>

            -->                                            </tbody>
    </table>
</div>


<%

} else if (inquirytype.equals("Sell")) {
%>
<div class="x_content" id="sell_inquiry">
    <!--                                       
    -->                                        <table id="datatable-buttons" class="table table-striped table-bordered">
        <thead>
            <tr>
                <th class="table_center">Sr No</th>
                <th class="table_center">Name</th>
                <th class="table_center">Mobile No</th>
                <th class="table_center">Product Name</th>
                <th class="table_center">Cust Address</th>  
                <!--                                                     <th class="table_center">Credit Days</th>
                                                                    <th class="table_center">Proprietor Name</th>
                                                                    <th class="table_center">Date of Birth</th>
                                                                    <th class="table_center">Address</th>
                                                                    <th class="table_center">State</th>
                                                                    <th class="table_center">Pin Code</th>
                                                                    <th class="table_center">UPDATE</th>
                -->                                                </tr>
        </thead>
        <tbody><!--

            <%
                SellDao sellDao = new SellDao();

                int j = 0;
                List<Sell> sell = null;
                sell = sellDao.getAllSellInquiry();
                if (sell != null && sell.size() > 0) {
                    for (Sell p : sell) {

                        j++;

            %>
            -->                                                <tr>
                <td class="table_center"><%=j%></td>
                <td class="table_center"><%=p.getCustomerFirstName()%> </td>
                <td class="table_center"><%=p.getCustomerMobileNo()%></td>  
                <td class="table_center"><%=p.getProductId().getProductName()%></td> 
                <td class="table_center"><%=p.getCustomerAddress()%></td>
                <!--                              
                -->                                                </tr> <!--
                <%}
                                                     } %>

            -->                                            </tbody>
    </table>
</div>
<%

} else if (inquirytype.equals("Rent")) {
%>

<div class="x_content" id="rent_inquiry">
    <!--                                        <p class="text-muted font-13 m-b-30">
                                                The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                            </p>-->
    <table id="datatable-buttons" class="table table-striped table-bordered">
        <thead>
            <tr>
                <th class="table_center">Sr No</th>
                <th class="table_center">Name</th>
                <th class="table_center">Mobile No</th>
                <th class="table_center">Address</th>
                <th class="table_center">InstrumentName</th>  
                <!--                                                     <th class="table_center">Credit Days</th>
                                                                    <th class="table_center">Proprietor Name</th>
                                                                    <th class="table_center">Date of Birth</th>
                                                                    <th class="table_center">Address</th>
                                                                    <th class="table_center">State</th>
                                                                    <th class="table_center">Pin Code</th>
                                                                    <th class="table_center">UPDATE</th>-->
            </tr>
        </thead>
        <tbody>

            <%
                RentDao rentDao = new RentDao();

                int k = 0;
                List<Rent> rent = null;
                rent = rentDao.getAllRentInquiry();
                if (rent != null && rent.size() > 0) {
                    for (Rent p : rent) {

                        k++;

            %>
            <tr>
                <td class="table_center"><%=k%></td>
                <td class="table_center"><%=p.getCustomerName()%> </td>
                <td class="table_center"><%=p.getCustomerContactNo()%></td>  
                <td class="table_center"><%=p.getCustomerAddress()%></td> 
                <td class="table_center"><%=p.getInstrumentName().getInstrumentName()%></td>
                <!--                              
                -->                                                </tr> <!--
                <%}
                                                     } %>

            -->                                            </tbody>
    </table>
</div>
<%

} else {
%>

<div class="x_content" id="repair_inquiry">
    <!--                                        <p class="text-muted font-13 m-b-30">
                                                The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                            </p>-->
    <table id="datatable-buttons" class="table table-striped table-bordered">
        <thead>
            <tr>
                <th class="table_center">Sr No</th>
                <th class="table_center">Name</th>
                <th class="table_center">Mobile No</th>
                <th class="table_center">Email</th>
                <th class="table_center">InstrumentName</th>  
                <!--                                                     <th class="table_center">Credit Days</th>
                                                                    <th class="table_center">Proprietor Name</th>
                                                                    <th class="table_center">Date of Birth</th>
                                                                    <th class="table_center">Address</th>
                                                                    <th class="table_center">State</th>
                                                                    <th class="table_center">Pin Code</th>
                                                                    <th class="table_center">UPDATE</th>-->
            </tr>
        </thead>
        <tbody>

            <%
                RepairDao repairDao = new RepairDao();

                int l = 0;
                List<Repair> repair = null;
                repair = repairDao.getAllRepairInquiry();
                if (repair != null && repair.size() > 0) {
                    for (Repair p : repair) {

                        l++;

            %>
            <tr>
                <td class="table_center"><%=l%></td>
                <td class="table_center"><%=p.getCustomerFirstName()%> </td>
                <td class="table_center"><%=p.getCustomerMobileNo()%></td>  
                <td class="table_center"><%=p.getCustomerAddress()%></td> 
                <td class="table_center"><%=p.getInstrumentName().getInstrumentName()%></td>
                <!--                              
                -->                                                </tr> <!--
                <%}
                                                     } %>

            -->                                            </tbody>
    </table>
</div>

<%}%>
<script src="../vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="../vendors/nprogress/nprogress.js"></script>
<!-- iCheck -->
<script src="../vendors/iCheck/icheck.min.js"></script>
<!-- Datatables -->
<script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
<script src="../vendors/jszip/dist/jszip.min.js"></script>
<script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

<!-- Custom Theme Scripts -->
<script src="../build/js/custom.min.js"></script>

<style>

    .table_center{

        text-align: center;
    }

</style>