<%@page import="com.accede.angel.admin.model.Instrument"%>
<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>
<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="com.accede.angel.admin.model.StudentAccount"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.EnquiryDetail"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">



    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
              
                    <%@ include file = "../comman_files/adminSideBarFile.jsp" %>
             

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div  role="main">
                    <div class="">

                        <div class="page-title">
                            <div class="title_left">
                                <h3>Instruments</h3>
                            </div>

                            
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Add Instruments </h2>
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
                                        <form method="post" action="../../AddInstrument" id="demo-form2"  onsubmit="return valid();" data-parsley-validate class="form-horizontal form-label-left">
                                            <%                                          if (session.getAttribute("i") != null) {
                                                    int i = (Integer) session.getAttribute("i");
                                                    String msg = (String) session.getAttribute("msg");
                                                    if (i == 2) {

                                                        System.out.println("fdgsfd");
                                            %>
                                            <div class="alert">
                                                <span class="closebtn">&times;</span>  
                                                <strong>Danger!</strong> <%=msg%>
                                            </div>
                                            <%} else {%>
                                            <div class="alert success">
                                                <span class="closebtn">&times;</span>  
                                                <strong>Success!</strong><%=msg%> 
                                            </div>
                                            <%
                                                    }
                                                    session.removeAttribute("i");
                                                    session.removeAttribute("msg");
                                                }%>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Instrument Name<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="Instrument" name="Instrument" required="required" onkeypress="return alpha(event)" class="form-control col-md-7 col-xs-12">
                                              
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Instrument Rent Cost<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="RentCost" name="RentCost" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12">
                                             
                                                </div>
                                            </div>
                                     
                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                 
                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <button type="submit" class="btn btn-success">Submit</button>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="example-modal">
                            <div class="modal" id="EditInstrumentModel">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="../../EditInstrument" name="update" data-parsley-validate>
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title">Edit Instrument </h4>
                                            </div>
                                            <div class="modal-body">

                                                <table  class="table table-striped">
                                                    <thead>

                                                    <th class="table_center">Instrument Name</th>
                                                    <th class="table_center">Instrument Rent Cost</th>

                                                    <!--                                                        <th>Discount</th>
                                                                                                            <th>Add Qnt</th>-->

                                                    </thead>
                                                    <tbody class="text-center">
                                                        <tr class="text-center">
                                                    <input type="hidden" id="modal_prd_id" name="modal_prd_id">
                                                    <td class="text-center"><input type="text" onkeypress="return alpha(event)" name="modal_prd_name" id="modal_prd_name" class="form-control table_center" ></td>
                                                    <td class="text-center"><input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="modal_prd_rent" id="modal_prd_rent" class="form-control table_center" ></td>
                                                    </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary" id="updateProduct"   >Edit Instrument</button>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Instrument Details </h2>   
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
                                        <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                </p>-->
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="table_center">Sr No</th>

                                                    <th class="table_center">Instrument Added Date & Time </th>
                                                    <th class="table_center">Instrument Name </th>
                                                    <th class="table_center">Instrument Rent Cost </th>
                                                    <!--                                                    <th class="table_center">Instrument Description </th>-->
                                                    <th class="table_center">Edit Instrument Name </th>


                                                    <th class="table_center">Delete Instrument Name </th



                                                </tr>
                                            </thead>
                                            <tbody>

                                                <% int j = 0;
                                                    InstrumentDao bd = new InstrumentDao();

                                                    List<Instrument> c = bd.getAllInstrumene();
                                                    for (Instrument p : c) {
                                                        j++;

                                                %>
                                                <tr>
                                            <input type="hidden" value="<%=p.getInstrumentId()%>" id="prd_id<%=j%>">
                                            <td class="table_center"><%=j%> </td>
                                            <td class="table_center"><%=p.getInstrumentAddedDate()%></td> 
                                            <td class="table_center" id="prd_name<%=j%>"><%=p.getInstrumentName()%></td> 
                                            <td class="table_center" id="prd_rent<%=j%>"><%=p.getInstrumentRentCost()%></td> 


                                            <td class="table_center"><a href="#EditInstrumentModel" role="button" data-toggle="modal" data-id="<%=j%>"><i id="<%=j%>" class="fa-2x glyphicon glyphicon-edit edit_prd"></i></a></td>

                                            <form id="from<%=j%>" class="swa-confirm" action="../../DeleteInstrument">
                                                <td class="table_center">
                                                    <input type="hidden" value="<%=p.getInstrumentId()%>" id="deleteInstrument" name="deleteInstrument">
                                                    <input class="btn btn-danger table_center"  value="Delete" type="submit">
                                               </td>
                                            </form>

                                            </tr> 
                                            <%}
                                            %>
 <input type="hidden" id="noofcourse" id="noofcourse" value="<%=c.size() %>">
                                          
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /page content -->


                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
            </div>
        </div>
                <script src="../production/css/Alertajax.js" type="text/javascript"></script>
              <script>

var x=document.getElementById('noofcourse').value;
var y = 1;         // assign the value 5 to x
        // assign the value 2 to y
var j = parseInt(x) + parseInt(y);

var i=0;
for (i = 1; i < j; i++) {

document.querySelector('#from'+i).addEventListener('submit', function(e) {

        var form = this;

  e.preventDefault(); // <--- prevent form from submitting

  swal({
      title: "Are you sure?",
      text: "You will not be able to recover this  Instrument!",
      icon: "warning",
      buttons: [
        'No, cancel it!',
        'Yes, I am sure!'
      ],
      dangerMode: true,
    }).then(function(isConfirm) {
      if (isConfirm) {
        swal({
          title: '',
          text: 'Request Send Successfully!',
          icon: 'success'
        }).then(function() {
          form.submit(); // <--- submit form programmatically
        });
      } else {
        swal("Cancelled", "Your Instrument  is safe :)", "error");
      }
    })
});
}
</script>
   <script src="../production/js/Swal.js" type="text/javascript"></script>
        <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>             
<script type="text/javascript">


            function alpha(e) {
                var k;
                document.all ? k = e.keyCode : k = e.which;
                return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32);
            }
            
            </script>
                
                <script type="text/javascript">
                                                                $('#document').ready(function() {

                                                                    $('.edit_prd').click(function(event) {
                                                                        var i = this.id;
                                                                       var j=$('#prd_id' + i).val();
                                                                      
                                                                        $('#modal_prd_id').val($('#prd_id' + i).val());


                                                                        $('#modal_prd_name').val($('#prd_name' + i).text());
                                                                        $('#modal_prd_rent').val($('#prd_rent' + i).text());

                                                                    });


                                                                });

        </script>
        <script type="text/javascript">



        </script>
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
        <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
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

        <style>

            .table_center{

                text-align: center;
            }

        </style>
        <script type="text/javascript">
            $('#document').ready(function() {
                


                $(".priceup").keypress(function(event) {
                    var inputCode = event.which;
                    var currentValue = $(this).val();
                    if (inputCode > 0 && (inputCode < 48 || inputCode > 57)) {
                        if (inputCode == 46) {
                            if (getCursorPosition(this) == 0 && currentValue.charAt(0) == '-')
                                return false;
                            if (currentValue.match(/[.]/))
                                return false;
                        }
                        else if (inputCode == 45) {
                            if (currentValue.charAt(0) == '-')
                                return false;
                            if (getCursorPosition(this) != 0)
                                return false;
                        }
                        else if (inputCode == 8)
                            return true;
                        else
                            return false;
                    }
                    else if (inputCode > 0 && (inputCode >= 48 && inputCode <= 57)) {
                        if (currentValue.charAt(0) == '-' && getCursorPosition(this) == 0)
                            return false;
                    }
                });
            });
        </script>
    </body>
</html>