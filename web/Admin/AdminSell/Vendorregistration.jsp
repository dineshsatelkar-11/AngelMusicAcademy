
<%@page import="com.accede.angel.sell.model.Venderregistration"%>
<%@page import="com.accede.angel.sell.dao.VendorDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="../comman_files/favicon.png" rel="shortcut icon" type="image/png">

    </head>

    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/adminSideBarForBilling.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">

                        <div class="page-title">
                            <div class="title_left">
                               
                            </div>

                            <!--                            <div class="title_right">
                                                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control" placeholder="Search for...">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-default" type="button">Go!</button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Vendor Registration</h2>
                                        
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <br />
                                        <form  method="get" action="../../Vendorregservlet" id="demo-form2" onsubmit="return valid();" data-parsley-validate class="form-horizontal form-label-left">

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


                                            <div class="row" >
                                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                            <div class="form-group">
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <input type="text" id="vendorname" onkeypress="return alpha(event)" name="vendorname"  required="required" placeholder="Vendor Name"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                </div>                                                      

                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <input type="text" id="contactPersonName" onkeypress="return alpha(event)" name="contactPersonName"  required="required" placeholder="Contact Person Name"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <input type="text" maxlength="10" onkeypress="return alpha2(event)" id="contactPersonMob" name="contactPersonMob"  required="required" placeholder="Contact Person Mobile No"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                </div>
                                                                
                                                            </div>

                                                        </div>
                                                    </div>  
                                                <div class="row" >
                                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                            <div class="form-group">
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <input type="text" id="state" name="state" onkeypress="return alpha(event)"  required="required" placeholder="State"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                </div>                                                      

                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <input type="text" id="dist" name="dist" onkeypress="return alpha(event)"  required="required" placeholder="District"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <input type="text" id="city" name="city"  onkeypress="return alpha(event)" required="required" placeholder="City"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                <div class="row" >
                                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                            <div class="form-group">
                                                                <div class="col-md-8 col-sm-8 col-xs-12">
                                                                    <input type="text" id="Address" name="Address"   required="required" placeholder="Address"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                </div>                                                      

                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <input type="text"  id="pin" name="pin" onkeypress="return alpha2(event)" required="required" placeholder="PIN Code"  class="form-control priceup">                                                                                                                                                                                                                                                                                                               
                                                                </div>
                                                                
                                                            </div>

                                                        </div>
                                                    </div>
                                                <div class="row" >
                                                        <div class="col-md-12 col-sm-12 col-xs-12">                                                   
                                                            <div class="form-group">
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <input type="text" id="gstnnumber" name="gstnnumber" onkeypress="return alpha3(event)" required="required" placeholder="GSTIN Number"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                </div>                                                      

                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <input type="email" id="email" name="email"  required="required" placeholder="Email"  class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <input type="text" id="companyPhone" maxlength="10" onkeypress="return alpha2(event)" name="companyPhone"  required="required" placeholder="Company Phone Number" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-4">
                                                    <!--<button class="btn btn-primary"  type="button">Cancel</button>-->
                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <button  type="submit" class="btn btn-success"  >Submit</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Vendor Details </h2>   
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
                                                    <th class="table_center">Edit Vendor</th>
                                                    <th class="table_center">Delete Vendor</th>
                                                    
                                                    <th class="table_center">Vendor Name </th>
                                                    <th class="table_center">Contact Person Name</th>
                                                    <th class="table_center">Contact Person Mob</th>
                                                     <th class="table_center">GSTIN number</th>
                                                    <th class="table_center">Address</th>
                                                     <th class="table_center">District</th>
                                                    <th class="table_center">City</th>
                                                   
                                                    <th class="table_center">State</th>
                                                    <th class="table_center">Pin  </th>
                                                    <th class="table_center">Email</th>
                                                   
                                                    
                                                    <th class="table_center">Company Phone</th>
                                                    
                                                    


                                                </tr>
                                            </thead>
                                            <tbody>

                                                <% int j = 0;
                                                    // AdminDao aa = new AdminDao();
                                                    VendorDao bd = new VendorDao();
                                                    Venderregistration b = new Venderregistration();
                                                    List<Venderregistration> c = bd.getAllVendor();
                                                    for (Venderregistration p : c) {
                                                       
                                                        boolean b1 = p.isStatus();
                                                        if (b1) { j++;

                                                %>
                                                <tr>
                                                    <td class="table_center"  ><%=j%>
                                                        <input type="hidden" name="vendor_id<%=j%>" id="vendor_id<%=j%>" value="<%=p.getId()%>">
                                                    </td> 
                                                    <td class="table_center"><a href="#myModal2" role="button" data-toggle="modal" data-id="<%=j%>"><i id="<%=j%>" class="fa-2x glyphicon glyphicon-edit edit_prd1"></i></a></td>
                                            <form action="../../DeleteVendor" method="post">
                                                <td class="table_center">
                                                    <input type="hidden" value="<%=p.getId()%>" id="deletevendor" name="deletevendor">
                                                    <button class="btn btn-danger table_center" type="submit">Delete</button>
                                                </td>
                                            </form>
                                            
                                            <td class="table_center" id="Vendor_name<%=j%>"><%=p.getVendorname()%></td>
                                            <td class="table_center" id="contact_personname<%=j%>"><%=p.getContactPersonName()%></td> 
                                            <td class="table_center" id="contactperson_mob<%=j%>"><%=p.getContactPersonMob()%></td> 
                                             <td class="table_center" id="gstn_number<%=j%>"><%=p.getGstnnumber()%></td>  
                                            <td class="table_center" id="Address<%=j%>"><%=p.getAddress()%></td> 
                                            <td class="table_center" id="Dist<%=j%>"><%=p.getDist()%></td>
                                            <td class="table_center" id="City<%=j%>"><%=p.getCity()%></td> 
                                             
                                            <td class="table_center" id="State<%=j%>"><%=p.getState()%></td> 
                                            <td class="table_center" id="pin<%=j%>" ><%=p.getPin()%></td> 
                                            <td class="table_center" id="vendor_email<%=j%>"><%=p.getEmail()%></td> 
                                          
                                           
                                            
                        
                                            <td class="table_center" id="company_phone<%=j%>"><%=p.getCompanyPhone()%></td> 
                                            
                                            


                                            </tr> 
                                            <%
                                                    }
                                                }
                                            %>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="example-modal">
                    <div class="modal" id="myModal2">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="../../Updatevendor" method="post" name="update" class="form-horizontal form-label-left">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">Edit Vendor</h4>
                                    </div>
                                    <input type="hidden" id="Modal_Vendor_Id" name="Modal_Vendor_Id">
                                    <div class="modal-body">
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_Vendor_name">Vendor Name<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_Vendor_name"  name="modal_Vendor_name" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Address<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_Address"  name="modal_Address" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_City">City<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_City"  name="modal_City" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_Dist">District<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_Dist"  name="modal_Dist" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_State">State<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_State"  name="modal_State" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_pin">pin<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_pin" maxlength="6" onkeypress="return alpha2(event)" name="modal_pin" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Email<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="email" id="modal_email"  name="modal_email" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_gstn_number">GSTN No.<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_gstn_number"  name="modal_gstn_number" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_contact_personname">Contact Person Name<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_contact_personname"   name="modal_contact_personname" onkeypress="return alpha(event)" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_company_phone">Company Phone<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_company_phone"  maxlength="10" onkeypress="return alpha2(event)"   name="modal_company_phone" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_contactperson_mob">Contact Person Mobile<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_contactperson_mob" maxlength="10" onkeypress="return alpha2(event)" name="modal_contactperson_mob" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary" id="updateProduct"   >Update</button>
                                    </div>
                                </form>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                </div>
                <!-- /page content -->


                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
            </div>
        </div>
        <script src="../production/js/Alertajax.js" type="text/javascript"></script>
        <script src="../production/js/Swal.js" type="text/javascript"></script>
        <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
                                            $('#document').ready(function() {



                                                $('.edit_prd1').click(function(event) {
                                                    var i = this.id;
                                                   // alert("id==" + i)
                                                    //  var j = $('#prd_id' + i).val();


                                                    // $('#modal_vendor_id').val($('#vendor_id' + i).text());
                                                    //$('#modal_Company_name').val($('#Company_name' + i).text());
                                                    $('#modal_Vendor_name').val($('#Vendor_name' + i).text());
                                                    $('#modal_Address').val($('#Address' + i).text());
                                                    $('#modal_City').val($('#City' + i).text());
                                                    $('#Modal_Vendor_Id').val($('#vendor_id' + i).val());
                                                    $('#modal_Dist').val($('#Dist' + i).text());
                                                    $('#modal_State').val($('#State' + i).text());
                                                    $('#modal_pin').val($('#pin' + i).text());
                                                    $('#modal_email').val($('#vendor_email' + i).text());
                                                    $('#modal_gstn_number').val($('#gstn_number' + i).text());
                                                    $('#modal_contact_personname').val($('#contact_personname' + i).text());                                                   
                                                    //$('#modal_dob').val($('#dob' + i).text());
                                                    $('#modal_company_phone').val($('#company_phone' + i).text());
                                                    //$('#modal_company_email').val($('#company_email' + i).text());
                                                    $('#modal_contactperson_mob').val($('#contactperson_mob' + i).text());

                                                   

                                                });


                                            });

        </script>
        <script type="text/javascript">


            
            $('#contactPersonMob').blur(function () {

                var contact = $('#contactPersonMob').val().length;
                if (contact == 10)
                {
                }
                else
                {
                    swal({
                        title: 'Enter Correct Mobile No',
                        input: 'number',
                        showCancelButton: true,
                        animation: false,
                        inputValidator: function (value) {
                            return new Promise(function (resolve, reject) {
                                if (value.length == 10)
                                {

                                    $('#adminMobileNo').val(value);
                                    resolve()
                                } else {
                                    reject('You need to Enter Mobile No :)')
                                }
                            })
                        }
                    }).then(function (result) {
                        swal({
                            type: 'success',
                            html: 'You Enter ' + result
                        })
                    })


                }
            });

            function valid()
            {
                var contact = $('#contactPersonMob').val().length;
                var rollno = /^[0-9]*$/;
                // var phoneno = /^\d{10}$/; 
                var branchname = document.getElementById('branchname').value;
                var adminName = document.getElementById('adminName').value;
                var branchAddress = document.getElementById('branchAddress').value;
                var branchAddress1 = document.getElementById('branchAddress1').value;
                var branchAddress2 = document.getElementById('branchAddress2').value;

                var letters = /^[A-Za-z]+$/;


                if (contact == 10)
                {
                }
                else
                {
                    swal({
                        title: 'Enter Correct Mobile No',
                        input: 'number',
                        showCancelButton: true,
                        animation: false,
                        inputValidator: function (value) {
                            return new Promise(function (resolve, reject) {
                                if (value.length == 10)
                                {

                                    $('#contactPersonMob').val(value);
                                    resolve()
                                } else {
                                    reject('You need to Enter Mobile No :)')
                                }
                            })
                        }
                    }).then(function (result) {
                        swal({
                            type: 'success',
                            html: 'You Enter ' + result
                        })
                    })

                    return false;
                }





            }

        </script>

        <script type="text/javascript">

            $(document).ready(function() {
                $('#datetimepicker1').datetimepicker({
                    format: 'DD/MM/YYYY',
                    //viewMode: "years"
                    defaultDate: new Date(),
                    sideBySide: true
                });


            });
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
                $('#branch_name').hide();
                $('#branch_Address').hide();
                $('#branch_Address1').hide();
                $('#branch_Address2').hide();
                $('#admin_Name').hide();


                //                $("#sub").click(function(event) {
                //                    var branchname = $('#branchname').val();
                //                    var branchAddress = $('#branchAddress').val();
                //                    var branchAddress1 = $('#branchAddress1').val();
                //                    var branchAddress2 = $('#branchAddress2').val();
                //                    var format = /[ !@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
                //                    if ((format.test(branchname))) {
                //
                //                        var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
                //
                //                        jPrompt('You Entered:', branchname, msg, function(r) {
                //
                //                            if (r) {
                ////                            alert('You entered ' + branchname);
                //                                $('#branchname').val(r);
                //                                if ((format.test(r))) {
                //
                //                                    var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
                //
                //                                    jPrompt('You Entered:', branchname, msg, function(s) {
                //
                //                                        if (s) {
                //                                            $('#branchname').val(r);
                //                                            document.getElementById('demo-form2').submit();
                //                                        }
                //                                    })
                //                                }
                //                                else
                //                                {
                //                                    document.getElementById('demo-form2').submit();
                //                                }
                //
                //
                //                            }
                //                        })
                //                    } else {
                //
                //
                //                        if (branchAddress.matches(".*[a-z].*")) {
                //                            if (branchAddress1.matches(".*[a-z].*")) {
                //                                if (branchAddress2.matches(".*[a-z].*")) {
                //
                //                                    document.getElementById('demo-form2').submit();
                //                                }
                //                                else
                //                                {
                //                                    var msg = "The Branch Address  has No characters. \nThese are not allowed.\n"
                //
                //                                    jPrompt('You Entered:', branchAddress2, msg, function(r) {
                //
                //                                        if (r) {
                ////                            alert('You entered ' + branchname);
                //                                            $('#branchAddress2').val(r);
                //                                            if (r.matches(".*[a-z].*")) {
                //                                                document.getElementById('demo-form2').submit();
                //
                //                                            }
                //                                            else
                //                                            {
                //                                                var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
                //
                //                                                jPrompt('You Entered:', r, msg, function(s) {
                //
                //                                                    if (s) {
                //                                                        $('#branchAddress2').val(s);
                //                                                        document.getElementById('demo-form2').submit();
                //                                                    }
                //                                                })
                //                                            }
                //
                //
                //
                //                                        }
                //                                    })
                //                                }
                //
                //                            }
                //                            else
                //                            {
                //                                var msg = "The Branch Address  has No characters. \nThese are not allowed.\n"
                //
                //                                jPrompt('You Entered:', branchAddress1, msg, function(r) {
                //
                //                                    if (r) {
                ////                            alert('You entered ' + branchname);
                //                                        $('#branchAddress1').val(r);
                //                                        if (r.matches(".*[a-z].*")) {
                //                                            document.getElementById('demo-form2').submit();
                //
                //                                        }
                //                                        else
                //                                        {
                //                                            var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
                //
                //                                            jPrompt('You Entered:', r, msg, function(s) {
                //
                //                                                if (s) {
                //                                                    $('#branchAddress1').val(s);
                //                                                    document.getElementById('demo-form2').submit();
                //                                                }
                //                                            })
                //                                        }
                //
                //
                //
                //                                    }
                //                                })
                //                            }
                //                        }
                //                        else
                //                        {
                //                            var msg = "The Branch Address  has No characters. \nThese are not allowed.\n"
                //
                //                            jPrompt('You Entered:', branchAddress, msg, function(r) {
                //
                //                                if (r) {
                ////                            alert('You entered ' + branchname);
                //                                    $('#branchAddress').val(r);
                //                                    if (r.matches(".*[a-z].*")) {
                //                                        document.getElementById('demo-form2').submit();
                //
                //                                    }
                //                                    else
                //                                    {
                //                                        var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
                //
                //                                        jPrompt('You Entered:', r, msg, function(s) {
                //
                //                                            if (s) {
                //                                                $('#branchAddress').val(s);
                //                                                document.getElementById('demo-form2').submit();
                //                                            }
                //                                        })
                //                                    }
                //
                //
                //
                //                                }
                //                            })
                //                        }
                //
                //                    }
                //                });
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
        <script type="text/javascript">
//alert("ready");

        function alpha(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32);
        }
        function alpha1(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || (k > 47 && k < 58) || (k > 96 && k < 123) || k == 8 || k == 32);
        }
         function alpha2(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ( (k > 47 && k < 58)  || k == 8 || k == 32 || k==45);
        }
        function alpha3(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ( (k > 47 && k < 58)  || (k > 64 && k < 91) || (k > 96 && k < 123) ||  k == 8 || k == 32 || k==64);
        }
        $('#mobile').blur(function () {

            var contact = $('#mobile').val().length;
            if (contact == 10)
            {
            }
            else
            {
                swal({
                    title: 'Enter Correct Mobile No',
                    input: 'number',
                    showCancelButton: true,
                    animation: false,
                    inputValidator: function (value) {
                        return new Promise(function (resolve, reject) {
                            if (value.length == 10)
                            {

                                $('#mobile').val(value);
                                resolve()
                            } else {
                                reject('You need to Enter Mobile No :)')
                            }
                        })
                    }
                }).then(function (result) {
                    swal({
                        type: 'success',
                        html: 'You Enter ' + result
                    })
                })


            }
        });

        function valid()
        {
            var contact = $('#mobile').val().length;
            var rollno = /^[0-9]*$/;
            // var phoneno = /^\d{10}$/; 
            var branchname = document.getElementById('branchname').value;
            var adminName = document.getElementById('adminName').value;
            var branchAddress = document.getElementById('branchAddress').value;
            var branchAddress1 = document.getElementById('branchAddress1').value;
            var branchAddress2 = document.getElementById('branchAddress2').value;

            var letters = /^[A-Za-z]+$/;


            if (contact == 10)
            {
            }
            else
            {
                swal({
                    title: 'Enter Correct Mobile No',
                    input: 'number',
                    showCancelButton: true,
                    animation: false,
                    inputValidator: function (value) {
                        return new Promise(function (resolve, reject) {
                            if (value.length == 10)
                            {

                                $('#mobile').val(value);
                                resolve()
                            } else {
                                reject('You need to Enter Mobile No :)')
                            }
                        })
                    }
                }).then(function (result) {
                    swal({
                        type: 'success',
                        html: 'You Enter ' + result
                    })
                })

                return false;
            }





        }

    </script>
    </body>
</html>