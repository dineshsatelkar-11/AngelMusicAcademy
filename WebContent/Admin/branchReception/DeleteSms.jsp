  <%@page import="com.accede.angel.admin.model.SmsModel"%>
<%@page import="com.accede.angel.admin.dao.SmsDao"%>
<%@page import="java.util.List"%>



<%

long id=Long.parseLong(request.getParameter("prdID"));
int adminidd=Integer.parseInt(request.getParameter("adminidd"));
SmsDao td=new SmsDao();
td.deleteSmsByID(id);

%>
                   
                                                             
            <table id="datatable-buttons" class="table table-striped table-bordered tablefetch">
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
                            if(adminidd==c.getAdminOfBranch().getAdminId())
                                                        {
                                                            i++;
                                                       

                    %>
                    <tr>
                       
                        <td class="table_center"><%=i%></td>

                        <td class="table_center"><%=c.getSms()%></td> 

 <td class="table_center"><i id="<%=c.getSmsId()%>" class="fa fa-remove remove_prd text-danger"></i></td>
                    </tr> 
<%}}%>


                                            </tbody>
                                        </table>
                                 


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