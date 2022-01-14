<%-- 
    Document   : EnquiryAjax
    Created on : Jul 17, 2017, 4:18:44 PM
    Author     : accede
--%>

<%@page import="com.accede.angel.admin.model.Instrument"%>
<%@page import="com.accede.angel.admin.model.Product"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String enquiryfor = request.getParameter("q");

%>
<div id="output">
    <%        if (enquiryfor.equals("Sell")) {
    %>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" placeholder="Counsellor Name" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" placeholder="Customer Address" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" placeholder="Alternate Contact Number" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <select class="form-control" id="pname" name="pname" >
            <option value="">-select-</option> 
            <%
                List<Product> prod = new AdminDao().getAllProducts();

                for (Product p : prod) {

            %>
            <option value="<%=p.getProductId()%>"><%=p.getProductName()%></option>
            <%
                }

            %>
        </select>
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="unitPrice" placeholder="Unit Price" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="discou" placeholder="Discount" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="quant" placeholder="Quantity" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="total" placeholder="Total Price" class="form-control">
    </div>
    <%        }
    %>
    
    <%       
         if (enquiryfor.equals("Rent")) {
    %>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" placeholder="Customer Alternate No." class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" placeholder="Customer Address" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" placeholder="Customer ID Proof" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <select class="form-control" id="instname" name="instname" >
            <option value="">-select-</option> 
            <%
                List<Instrument> inst = new AdminDao().getAllInstruments();

                for (Instrument i : inst) {

            %>
            <option value="<%=i.getInstrumentId()%>"><%=i.getInstrumentName()%></option>
            <%
                }

            %>
        </select>
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="date" id="datetimepicker2"  class="form-control">
    </div>
    
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="date" id="todate2"  class="form-control">
    </div>
     
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="noOfDays2" placeholder="Number of Days" class="form-control">
    </div>
    
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="unitPrice" placeholder="Unit Price" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="discou" placeholder="Discount" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="quant" placeholder="Quantity" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="total" placeholder="Total Price" class="form-control">
    </div>
        
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="advancedPaid" placeholder="Advanced Paid" class="form-control">
    </div>
        
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="balanceAmount" placeholder="Balance Amount" class="form-control">
    </div>
    <%        }
    %>
    
     <%       
         if (enquiryfor.equals("Repair")) {
    %>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" placeholder="Customer Alternate No." class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" placeholder="Customer Address" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" placeholder="Customer ID Proof" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <select class="form-control" id="instname" name="instname" >
            <option value="">-select-</option> 
            <%
                List<Instrument> inst = new AdminDao().getAllInstruments();

                for (Instrument i : inst) {

            %>
            <option value="<%=i.getInstrumentId()%>"><%=i.getInstrumentName()%></option>
            <%
                }

            %>
        </select>
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="date" id="fromdate" class="form-control">
    </div>
    
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="date" id="todate"  class="form-control">
    </div>
     
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="noOfDays" placeholder="Number of Days" class="form-control">
    </div>
    
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="unitPrice1" placeholder="Unit Price" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="discou1" placeholder="Discount" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="quant" placeholder="Quantity" class="form-control">
    </div>

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="total" placeholder="Total Price" class="form-control">
    </div>
        
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="advancedPaid" placeholder="Advanced Paid" class="form-control">
    </div>
        
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <input type="text" id="balanceAmount" placeholder="Balance Amount" class="form-control">
    </div>
    <%        }
    %>
</div>

 <script type="text/javascript">
	$(document).ready(function() {
	    $('#datetimepicker2').datetimepicker({
	    	 format: 'DD-MMMM-YYYY hh:mm A',
	    	 defaultDate: new Date(),
	    	 //autoClose: true,
	        sideBySide: true
	     });
	});
</script>
<script>
    $(document).ready(function()
    {
        alert('fdsgjsdjg');
//        $('#discou').on('keyup change', function() {
//            alert('dgfbfd');
//            var price = $('#unitPrice').val();
//             alert('dgfbfd'+price);
//            var qty = $('#quant').val();
//             alert('dgfbfd'+qty);
//            var dis = $('#discou').val();
//              alert('dgfbfd'+dis);
//
//            var total = price * qty;
//            var discount = ((total * dis) / 100);
//            var totalamt = total - discount;
//            $('#total').val(totalamt);
//             alert('dgfbfd');
//        });
    });
</script>