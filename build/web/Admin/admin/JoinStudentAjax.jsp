
<%@page import="com.accede.angel.admin.dao.PreviousStudentDAO"%>
<%@page import="com.accede.angel.admin.model.PreviousStudent"%>
<%@page import="com.accede.angel.sell.dao.SaveBranchSaleDAO"%>
<%@page import="com.accede.angel.sell.model.BranchSale"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<!-- Bootstrap -->


<%

    String start = request.getParameter("start");
   
  
    
    String end = request.getParameter("end").trim();
    System.out.println("start-" + start);
    System.out.println("end-" + end);
    Date date = new Date();;
    try {
        date = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH).parse(start);
        System.out.println("start1-" + date);

    } catch (ParseException e) {
        e.printStackTrace();
    }

    Date date1 = new Date();
    try {
        date1 = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH).parse(end);
        System.out.println("end1-" + date1);

    } catch (ParseException e) {
        e.printStackTrace();
    }
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String start1 = df.format(date);
    System.out.println("start1-" + start1);
    String endd = df.format(date1);
    System.out.println("endd-" + endd);
//Date st1 = new SimpleDateFormat("MM/dd/yyyy").parse(start1);

 //System.out.println("st1-"+st1);
    //Date end1 = new SimpleDateFormat("MM/dd/yyyy").parse(endd);
    //System.out.println("end1-"+end1);
    String query1 = "from PreviousStudent where joiningdate  Between '" + start1 + "' AND '" + endd + "'  ";
    System.out.println(query1);

%>





    <table id="datatable-buttons" class="table table-striped table-bordered tablefetch">
                                                <thead>
                                                    <tr>
                                                        <th>Sr No.</th>
                                                        <th>Student Name</th>  
                                                        <th>Course Name</th>  
                                                                                                            

                                                        <th>Mobile Number</th> 
                                                        <th>Joining Date</th> 

                                                    </tr>
                                                </thead>
                                                <tbody>

                                                  
                                                   
                       <%
                            PreviousStudent p = new PreviousStudent();
                            PreviousStudentDAO b1 = new PreviousStudentDAO();
                                List<PreviousStudent> AllBrand1 = b1.getPurchaseProductReport(query1);
                            int i = 0;
                            for (PreviousStudent c1 : AllBrand1) {
                              
                                i++;
                        %>
                        <tr>
                                                        <td><%=i%></td>

                                                        <td><%=c1.getStudentname()%></td>
                                                        <td><%=c1.getCoursename()%></td>
                                                        <td><%=c1.getMobilenumber()%></td>
                                                        <td><%=c1.getJoiningdate()%></td>
                                 
                        </tr>
                        <%
                           
                            }
                        %>
                       
                                                    
                                                    
                                                </tbody>
                                            </table>
            
                        
                        <!-- jQuery -->

                        
  <script type="text/javascript">
                $(document).ready(function() {
                    $(".hidedata").hide();
                });

                
                 $('.btn9').click (function() {
                   // alert('adsjhfgadsf');
                   var purchaseid = this.id;
                    if (purchaseid.trim() !== "")
                    {
                        alert('adsjhfgadsf===' + purchaseid);
                        $.ajax({
                            url: "ViewVendorAllProductAjax.jsp",
                            type: "post",
                            data: {purchaseid: purchaseid},
                            success: function(response) {
                                alert('success1');
                                $("#outputt").html(response);
                                alert('success2');
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                console.log(textStatus, errorThrown);
                            }
                        });
                    }
                    else
                    {
                        alert("Please Click On View Product");
                    }
                });


            </script>                      
                        

