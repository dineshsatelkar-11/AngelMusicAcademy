  <%@page import="com.accede.angel.admin.model.SmsModel"%>
<%@page import="com.accede.angel.admin.dao.SmsDao"%>
<%@page import="java.util.List"%>

<div class="row" id="tablefetch">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Sms Added <small>Users</small></h2>
                                      
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
            <table id="datatable-buttons" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th class="table_center">Sr No</th>
                        <th class="table_center">Sms</th>

                        <th class="table_center">Delete</th>

                    </tr>
                </thead>
                <tbody>
                    <%

                        SmsDao cd = new SmsDao();
                        List<SmsModel> crd = cd.getAllSms();
                       int i=0;
                        for (SmsModel c : crd) {
                            i++;

                    %>
                    <tr>
                       
                        <td class="table_center"><%=i%></td>

                        <td class="table_center"><%=c.getSms()%></td> 

 <td class="table_center"><i id="<%=c.getSmsId()%>" class="fa fa-remove remove_prd text-danger"></i></td>
                    </tr> 
<%}%>


                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>     

  <script type="text/javascript">
            $(document).ready(function() {



                $('.remove_prd').click(function(event) {
                    var prdID = this.id;
//                   alert(prdID);
                    $.ajax({
                        url: "DeleteSms.jsp",
                        type: "post",
                        data: {prdID: prdID},
                        success: function(response) {
                            $("#tablefetch").html(response);




                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log(textStatus, errorThrown);
                        }
                    });

                });
                $('#refresh').on('click', function() {
                    $.ajax({
                        url: "FetchSms.jsp",
                        type: "post",
                        data: {},
                        success: function(response) {

                            $("#tablefetch").html(response);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log(textStatus, errorThrown);
                            alert("Something Went Wrong...!!!");
                        }
                    });

                });
                $('.sumittt').on('click', function() {
                    var textarea = $('#textarea').val();
//                    alert(textarea);

                    $.ajax({
                        url: "addSmsajax.jsp",
                        type: "post",
                        data: {textarea: textarea},
                        success: function(response) {
                            $(".smsport").html(response);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log(textStatus, errorThrown);
                            alert("Something Went Wrong...!!!");
                        }
                    });
                    $.ajax({
                        url: "FetchSms.jsp",
                        type: "post",
                        data: {},
                        success: function(response) {

                            $("#tablefetch").html(response);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log(textStatus, errorThrown);
                            alert("Something Went Wrong...!!!");
                        }
                    });

                });

            });
        </script>