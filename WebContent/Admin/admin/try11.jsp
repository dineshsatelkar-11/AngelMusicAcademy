<%-- 
    Document   : try11
    Created on : May 11, 2018, 1:51:21 PM
    Author     : Admin
--%>
<%@page import="com.accede.angel.admin.dao.UserDao"%>
<%@page import="java.util.List"%>
<link href="New/fSelect.css" rel="stylesheet" type="text/css"/>
<script src="New/fSelect.js" type="text/javascript"></script>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <script>
            (function($) {
                $(function() {
                    $('.multi-select-dd').fSelect();
                });
            })(jQuery);
        </script>


        <p><strong>   Select Days:</strong></p>
        <select id="Days" name="Days" class="multi-select-dd form-control" multiple="multiple">
            <%                                  List<String> Days = new UserDao().initDaysList();

                for (String b : Days) {

            %>
            <option value="<%=b.toString()%>" ><%=b.toString()%></option>

            <%                                                                               }

            %>

        </select>
            
            
<script src="New/jquery-1.11.3.min.js" type="text/javascript"></script>

    </body>
</html>
