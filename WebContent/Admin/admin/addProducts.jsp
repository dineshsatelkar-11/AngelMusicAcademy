<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>
<%@page import="com.accede.angel.admin.model.InstrumentSubcategory"%>
<%@page import="com.accede.angel.admin.model.Product"%>
<%@page import="com.accede.angel.admin.model.Instrument"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
  <%@ include file = "../comman_files/AdminHeaderFile.jsp" %>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <%@ include file = "../comman_files/adminSideBarFile.jsp" %>
        </div>

        <!-- top navigation -->
       <%@ include file = "../comman_files/adminTopBar.jsp" %>
        <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <!--            <div class="page-title">
                                      <div class="title_left">
                                        <h3>Form Elements</h3>
                                      </div>
                        
                                      <div class="title_right">
                                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                          <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search for...">
                                            <span class="input-group-btn">
                                              <button class="btn btn-default" type="button">Go!</button>
                                            </span>
                                          </div>
                                        </div>
                                      </div>
                                    </div>-->
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Add Products<small></small></h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Settings 1</a>
                                                    </li>
                                                    <li><a href="#">Settings 2</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <br />
                                        <form method="post" action="../../AddProduct" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                          
        <%
 
    if (session.getAttribute("i") != null) {
        int i = (Integer)session.getAttribute("i");
         if(i ==  2 )
{
    
System.out.println("fdgsfd");
%>
                        <div class="alert">
  <span class="closebtn">&times;</span>  
  <strong>Danger!</strong> Something Went Wrong.
</div>
<%}else{%>
<div class="alert success">
  <span class="closebtn">&times;</span>  
  <strong>Success!</strong> Branch Added Successfully.
</div>
<% }
     session.removeAttribute("i");
    }%>

                      <div class="row">

                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                        <input type="text" id="productName" placeholder=" Product Name " name="productName" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                                      <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                        <select class="form-control" id="Instumentid" name="Instumentid" >
                                                        <option value="">-Select Category-</option> 
                                                        <%
                                                            List<Instrument> prod = new InstrumentDao().getAllInstrumene();

                                                            for (Instrument p : prod) {

                                                        %>
                                                        <option value="<%=p.getInstrumentId()%>"><%=p.getInstrumentName()%></option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
                                    </div>
                                                      <div class="col-md-4 col-sm-12 col-xs-12 form-group" >
                                       <div id="output1">
                                                          <select class="form-control" id="Instumentsub" name="Instumentsub" >
                                                        <option value="">-Select Sub Category-</option> 
                                                      
                                                    </select>
                                    </div>
                                                     </div>
                                                 
                                                 </div>
                                                    <div class="ln_solid"></div>
                                                    
                                                                             <div class="row">

                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                        <input type="text" id="modelNo" name="modelNo" placeholder="Model No " required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                                      <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                        <input type="text" id="brand" name="brand" placeholder="Brand" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                                      <div class="col-md-4 col-sm-12 col-xs-12 form-group" id="output1">
                                        <input type="text" id="color" name="color" placeholder="Color " required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                                 
                                                 </div>
                                                    <div class="ln_solid"></div>
                                                     <div class="row">

                                    <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                       <input type="text"  id="unitPrice"  placeholder="Unit Price" name="unitPrice" required="required" class="form-control col-md-7 col-xs-12 priceup">
                                    </div>
                                                      <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                       <input type="text" id="sellPrice"  placeholder="Sell Price " name="sellPrice" required="required" class="form-control col-md-7 col-xs-12 priceup">
                                    </div>
                                                      <div class="col-md-3 col-sm-12 col-xs-12 form-group" id="output1">
                                      <input type="text" id="transportCharge" placeholder="Transport Charge " name="transportCharge" required="required" class="form-control col-md-7 col-xs-12 priceup">
                                    </div>
                                                           <div class="col-md-3 col-sm-12 col-xs-12 form-group" id="output1">
                                          <input type="text" id="quentity" placeholder="Quentity "  name="quentity" required="required" class="form-control col-md-7 col-xs-12 priceup">
                                    </div>
                                                 
                                                 </div>
                                                    <div class="ln_solid"></div>
                                                       <div class="row">

                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                       <input type="text" id="cgst"  placeholder="CGST Rate " name="cgst" required="required" class="form-control col-md-7 col-xs-12 priceup">
                                    </div>
                                                      <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                        <input type="text" id="sgst" placeholder="SGST Rate " name="sgst" required="required" class="form-control col-md-7 col-xs-12 priceup">
                                    </div>
                                                      <div class="col-md-4 col-sm-12 col-xs-12 form-group" id="output1">
                                       <input type="text" id="igst"  placeholder="IGST Rate " name="igst" required="required" class="form-control col-md-7 col-xs-12 priceup">
                                    </div>
                                                 
                                                 </div>
                                          
                                                 
                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                    <button class="btn btn-primary" type="button">Cancel</button>
                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <button type="submit" class="btn btn-success">Submit</button>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /page content -->

                <!-- footer content -->
                <footer>
                    <div class="pull-right">
                        Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->
            </div>
        </div>

        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- bootstrap-progressbar -->
        <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <!-- iCheck -->
        <script src="../vendors/iCheck/icheck.min.js"></script>
        <!-- bootstrap-daterangepicker -->
        <script src="../vendors/moment/min/moment.min.js"></script>
        <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- bootstrap-wysiwyg -->
        <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
        <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
        <script src="../vendors/google-code-prettify/src/prettify.js"></script>
        <!-- jQuery Tags Input -->
        <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
        <!-- Switchery -->
        <script src="../vendors/switchery/dist/switchery.min.js"></script>
        <!-- Select2 -->
        <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
        <!-- Parsley -->
        <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
        <!-- Autosize -->
        <script src="../vendors/autosize/dist/autosize.min.js"></script>
        <!-- jQuery autocomplete -->
        <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
        <!-- starrr -->
        <script src="../vendors/starrr/dist/starrr.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>

        <script type="text/javascript">
            $('#document').ready(function() {
                //  alert('hi11');
                $('#Instumentid').change(function() {
                    //   alert('hi112');
                    var val = $(this).val().trim();
//                    alert(' hello' + val);
                    $.get("FetchSubCategory.jsp", {q: val}, function(data) {
                        //   alert('sucess');
                        $('#output1').html(data);
                    });
                });
                
                $(".priceup").keypress(function (event) {
    var inputCode = event.which;
    var currentValue = $(this).val();
    if (inputCode > 0 && (inputCode < 48 || inputCode > 57)) {
        if (inputCode == 46) {
            if (getCursorPosition(this) == 0 && currentValue.charAt(0) == '-') return false;
            if (currentValue.match(/[.]/)) return false;
        } 
        else if (inputCode == 45) {
            if (currentValue.charAt(0) == '-') return false;
            if (getCursorPosition(this) != 0) return false;
        } 
        else if (inputCode == 8) return true;
        else return false;

    } 
    else if (inputCode > 0 && (inputCode >= 48 && inputCode <= 57)) {
        if (currentValue.charAt(0) == '-' && getCursorPosition(this) == 0) return false;
    }
});
            });
        </script>
        <script>
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
    close[i].onclick = function(){
        var div = this.parentElement;
        div.style.opacity = "0";
        setTimeout(function(){ div.style.display = "none"; }, 600);
    }
}
</script>
    </body>
</html>
