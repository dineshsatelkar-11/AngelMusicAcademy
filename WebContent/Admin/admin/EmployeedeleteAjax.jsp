<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDao"%>

<%

    String EmpID1 = request.getParameter("EmpID");
    long EmpID = Long.parseLong(EmpID1);

    System.out.println("productid====" + EmpID);

    EmployeeDao em = new EmployeeDao();
    Boolean i2 = em.deleteEmployeeByID(EmpID);
    System.out.println("product deleted");

%>
<div class="x_content table-responsive" id="output">
    <p class="text-muted font-13 m-b-30">
    </p>                                       
    <table id="datatable " class="table table-striped table-bordered">
        <thead>
            <tr>
                <th class="table_center">Sr No</th>
                <th class="table_center">Delete</th>
                <th class="table_center">Edit</th>
                <th class="table_center">Employee NO</th>
                <th class="table_center">Employee Name </th>
                <th class="table_center">Designation</th>
                <th class="table_center">Mobile No</th>
                <th class="table_center">Email Id</th>
                <th class="table_center">Permanent Address</th>
                <th class="table_center">Qualification</th>
                <th class="table_center">Joining date</th>
                <th class="table_center">Salary</th>
                <th class="table_center">Address</th>
                <th class="table_center">In Time</th>
                <th class="table_center">Out Time</th>
            </tr>
        </thead>
        <tbody>
            <%                                                    int j = 0;
                Employee EMP = new Employee();
                EmployeeDao EMP1 = new EmployeeDao();
                List<Employee> c = EMP1.getAllEmployee();
                for (Employee p : c) {
                    j++;
            %>
            <tr>
                <td class="table_center"><%=j%></td>
                <td class="table_center"><i id="<%=p.getId()%>"  class="fa fa-remove remove_prd text-danger "></i></td>
                <td class="table_center"><a href="EmployeeEdit.jsp?EmpID=<%=p.getId()%>"><i  class="fa fa-edit"></i></a></td>
                <td class="table_center"><%=p.getEmplyeeNo()%></td>
                <td class="table_center"><%=p.getName()%></td>
                <td class="table_center"><%=p.getDesignation()%></td>
                <td class="table_center"><%=p.getPermanentNo()%></td>
                <td class="table_center"><%=p.getEmail()%></td>
                <td class="table_center"><%=p.getPermanentAddress()%></td>
                <td class="table_center"><%=p.getQualification()%></td>
                <td class="table_center"><%=p.getJoiningDate()%></td>
                <td class="table_center"><%=p.getSalary()%></td>
                <td class="table_center"><%=p.getAddress()%></td>
                <td class="table_center"><%=p.getInTime()%></td>
                <td class="table_center"><%=p.getOutTime()%></td>

            </tr>
            <%
                }
            %>
        </tbody>                                              
    </table>                                       
</div>
<script>
        $(document).ready(function() {
         // alert('adsjhfgadsf');          
            $('.remove_prd').click(function(event) {
                  alert("Are you want to delete this product...!");
                var EmpID = this.id;
                // alert(prdID);
                $.ajax({
                    url: "EmployeedeleteAjax.jsp",
                    type: "post",
                    data: {EmpID: EmpID},
                    success: function(response) {
                        //// alert("aaaaaaaaaaaaaaaaaaa1");
                        $("#output").html(response);
                        //  alert("aaaaaaaaaaaaaaaaaaa1");

                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                    }
                });
            });            
        });
    </script>