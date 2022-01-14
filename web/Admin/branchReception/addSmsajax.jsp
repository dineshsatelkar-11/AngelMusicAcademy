



<%@page import="com.accede.angel.admin.dao.SmsDao"%>
<%@page import="com.accede.angel.admin.model.SmsModel"%>
<%


    String textarea=request.getParameter("textarea");
    SmsModel smsModel=new SmsModel();
    smsModel.setSms(textarea);
    SmsDao smsDao =new SmsDao();
    smsDao.saveSms(smsModel);
    
%>


  <div class="item form-group smsport">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">Textarea <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <textarea id="textarea" required="required" name="textarea" class="form-control col-md-7 col-xs-12"></textarea>
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