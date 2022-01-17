<%-- 
    Document   : UpdateTempdata
    Created on : Nov 9, 2017, 11:15:59 AM
    Author     : asd
--%>
 <%@page import="java.util.List"%>
<%@page import="com.accede.angel.sell.model.PurchaseTemp"%>
<%@page import="com.accede.angel.sell.dao.PurchaseTempDao"%>
<%
        PurchaseTempDao td = new PurchaseTempDao();
        td.deleteProduct();
        String GstType=request.getParameter("GSTtype");
        
    %>

      <div class="x_content" id="tablefetch">
                                        <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                </p>-->
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead> <tr>
                                                    <th class="text-center" >Sr.No</th>
                                                    <th  class="data_center">Delete</th>
                                                    <th class="text-center" >Product Name</th>
                                                    <th class="text-center" >Purchase Price</th>
                                                    <th class="text-center" >Quantity</th>
                                                    <th class="text-center" >Total Amount</th>
                                                    <th class="text-center" >CGST (%)</th>
                                                    <th class="text-center" >CGST Amount</th>
                                                    <th class="text-center" >SGST (%)</th>
                                                    <th class="text-center" >SGST Amount</th>
                                                    <th class="text-center" >IGST (%)</th>
                                                    <th class="text-center" >IGST Amount</th>
                                                    <th class="text-center" >Taxable Amount</th>
                                                    <th class="text-center" >Final Amount</th>




                                                </tr>
                                            </thead>
                                        </table>
                                    </div>


        

<style>
    .data_center{

        text-align:center;

    }
</style>  
              
                
<script>



    var originalLeave = $.fn.popover.Constructor.prototype.leave;
    $.fn.popover.Constructor.prototype.leave = function(a) {
        var c, d, b = a instanceof this.constructor ? a : $(a.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
        originalLeave.call(this, a), a.currentTarget && (c = $(a.currentTarget).siblings(".popover"), d = b.timeout, c.one("mouseenter", function() {
            clearTimeout(d), c.one("mouseleave", function() {
                $.fn.popover.Constructor.prototype.leave.call(b, b)
            })
        }))
    }, $("body").popover({selector: "[data-popover]", trigger: "click hover", delay: {show: 50, hide: 400}}), $(document).ready(function() {
        init_sparklines(), init_flot_chart(), init_sidebar(), init_wysiwyg(), init_InputMask(), init_JQVmap(), init_cropper(), init_knob(), init_IonRangeSlider(), init_ColorPicker(), init_TagsInput(), init_parsley(), init_daterangepicker(), init_daterangepicker_right(), init_daterangepicker_single_call(), init_daterangepicker_reservation(), init_SmartWizard(), init_EasyPieChart(), init_charts(), init_echarts(), init_morris_charts(), init_skycons(), init_select2(), init_validator(), init_DataTables(), init_chart_doughnut(), init_gauge(), init_PNotify(), init_starrr(), init_calendar(), init_compose(), init_CustomNotification(), init_autosize(), init_autocomplete()
    });





</script>

    