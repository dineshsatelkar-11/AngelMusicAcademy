 <%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<!DOCTYPE html><%@page import="com.accede.angel.admin.dao.PaymentDao"%>
<%@page import="com.accede.angel.admin.model.Payment"%>
<%@page import="com.accede.angel.admin.model.StudentAccount"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.model.ClassEnquiry"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

    <%    if (session.getAttribute("printInvoiceID") != null) {
        
       
            String invoicefor = (String) session.getAttribute("printInvoiceID");
        if(invoicefor.equals("Student") )
        {
            long admissionid = (Long) session.getAttribute("admissionid");
            long invoiceid=0;
             Admission ad = new AdmissionDao().getAdmissionByID(admissionid);
             for(StudentAccount StudentAccount:ad.getStudentAccount())
             {
                 
              invoiceid=   StudentAccount.getAccountId();
             }
            session.removeAttribute("printInvoiceID");
            session.removeAttribute("admissionid");
    %>
    <script>
        window.open("Perticular_invoice.jsp?admissionid=<%=admissionid%>&invoiceid=<%=invoiceid%>");</script>
        <%
            }}


        %>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
<!--                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
                </div>-->

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="" role="main" >
                    <div class="page-title">
                        <div class="title_left">
                            <h3></h3>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                    <input type="text" id="mobileno" name="mobileno" class="form-control" placeholder="Search for Account...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">Go!</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                  

                    <div id="AccountFetch">


                    </div>
                    <!-- top tiles -->
                    
                    
                                  
                                    
                    <div id="allDashboard">
                         <div class="x_content">
                        <%                                           if (session.getAttribute("i") != null) {
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
                                        
                         </div>
                        <div class="row tile_count" >
                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-user"></i> Total Students</span>
                                <%                                AdmissionDao ad = new AdmissionDao();
                                    List<Admission> students = ad.getAllAdmission();
                                    AdminDao aadao = new AdminDao();
                                    Admin aaaa = aadao.getAdmin(admin);

                                    System.out.println("aaaa=" + aaaa);
                                    System.out.println("aaaa=" + aaaa);
                                    int totalstudents = 0;
                                    int activestudents = 0;
                                    int totalinquiry = 0;
                                    int todayfolloup = 0;
                                    int activeinquiry = 0;
                                    for (Admission a : students) {
                                        if (a.getAdminOfBranch().getAdminId() == aaaa.getAdminId()) {
                                            totalstudents++;

                                            if (a.isShiftToOldStudent()) {
                                                activestudents++;
                                            }
                                        }
                                    }
                                    EnquiryDao ed = new EnquiryDao();
                                    List<Enquiry> in = ed.getAllEnquiry();
                                    for (Enquiry b : in) {
                                        if (b.getAdminOfBranch().getAdminId() == aaaa.getAdminId()) {
                                            totalinquiry++;
                                            if (b.isDeleteEnquiry()) {
                                                if (b.isRemove()) {
                                                    activeinquiry++;
                                                }
                                            }
                                            boolean re = b.isRemove();
                                            boolean de = b.isDeleteEnquiry();

                                            if (de) {
                                                if (re) {
                                                    Date today = b.getFollowupDate();
                                                    //
                                                    System.out.println("today-" + today);
                                                    Date d = new Date();
                                                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                                                    String start1 = df.format(d);
                                                    String start2 = df.format(today);
                                                    System.out.println("start1-" + start1);
                                                    System.out.println("start2-" + start2);

                                                    if (start1.equals(start2)) {
                                                        todayfolloup++;

                                                    }
                                                }
                                            }
                                        }
                                    }

                                    RentDao rd = new RentDao();
                                    RepairDao rdd = new RepairDao();
                                    List<Rent> rent = rd.getAllRentInquiry();
                                    int totalcust = 0;
                                    CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                                                      
                                                    
                                                        List<CustomerAccount> allCustomerAccount = null;
                                                        allCustomerAccount = CustomerAccountDao.getCustomerAccount(admin);
totalcust=allCustomerAccount.size();
                                %>
                                <div class="count"><%=totalstudents%></div>
                                <span class="count_bottom"><i class="green"> </i> From Start</span>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-clock-o"></i>Active Student</span>
                                <div class="count"><%=activestudents%></div>
                                <span class="count_bottom"><i class="green"></i> From Start </span>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-user"></i> Total Inquiry</span>
                                <div class="count "><%=totalinquiry%></div>
                                <span class="count_bottom"> From Start</span>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-user"></i>Active Inquiry</span>
                                <div class="count"><%=activeenquiry%></div>
                                <span class="count_bottom"> From Start</span>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-user"></i>Today Pending Followup</span>
                                <div class="count"><%=paymentfollowup%></div>
                                <span class="count_bottom"> Today Pending Customer</span>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-user"></i> Total Customers</span>
                                <div class="count"><%=totalcust%></div>
                                <span class="count_bottom">From Start</span>
                            </div>
                        </div>
                        <!-- /top tiles -->

                        <div class="row">
                            <%
                                AdminDao ado = new AdminDao();
                                List<Admin> admin1 = ado.getAllAdmin();
                                String BranchName = "";
                                String imagename = "";
                                int totaladmissionbybranch = 0;
                                int activestudentbybranch = 0;
                                totalcust = 0;
                                todayfolloup = 0;


                            %>



                        </div>


                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2><i class="fa fa-bars"></i> Student Fee Report Branch Wise  </h2>
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


                                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                            <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                <%                                                int i = 1;

                                                %>

                                                <li role="presentation" ><a href="#tab_content<%=i%>" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true"><%=admin.getAdminOfBranch().getBranchName()%></a>
                                                </li>





                                            </ul>
                                            <div id="myTabContent" class="tab-content">

                                                <%
                                                    float jan = 0;
                                                    float feb = 0;
                                                    float mar = 0;
                                                    float apl = 0;
                                                    float may = 0;
                                                    float jun = 0;
                                                    float jul = 0;
                                                    float aug = 0;
                                                    float sep = 0;
                                                    float oct = 0;
                                                    float nov = 0;
                                                    float dec = 0;

                                                    float janper = 0;
                                                    float febper = 0;
                                                    float marper = 0;
                                                    float aplper = 0;
                                                    float mayper = 0;
                                                    float junper = 0;
                                                    float julper = 0;
                                                    float augper = 0;
                                                    float sepper = 0;
                                                    float octper = 0;
                                                    float novper = 0;
                                                    float decper = 0;
                                                    float Grand_Amount = 0;
                                                    int j = 1;
                                                    Date date = new Date();

                                                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                                                    String start1 = df.format(date);
                                                    String[] str = start1.split("-");
                                                    String month1 = str[1];
                                                    String day1 = str[2];
                                                    String year1 = str[0];

                                                    PaymentDao pd = new PaymentDao();

                                                    List<Payment> payment = pd.getAllPayment();
                                                    List<Payment> payment1 = pd.getAllPayment();
                                                    for (Payment st1 : payment1) {
                                                        if (st1.getAdminOfBranch().getAdminId() == admin.getAdminId()) {
                                                            String paymentagain = st1.getPaymentAgains();
                                                            String[] pp = paymentagain.split(" ");
                                                            String type = pp[0];
                                                            if (type.equals("Admissionno")) {
                                                                Grand_Amount = Grand_Amount + st1.getAmount();
                                                            }
                                                        }
                                                    }
                                                    for (Payment st : payment) {
                                                        if (st.getAdminOfBranch().getAdminId() == admin.getAdminId()) {

                                                            String paymentagain = st.getPaymentAgains();
                                                            String[] pp = paymentagain.split(" ");
                                                            String type = pp[0];
                                                            if (type.equals("Admissionno")) {
                                                                Date d = st.getPaymentDate();
                                                                DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
                                                                String start2 = df1.format(d);
                                                                String[] str1 = start2.split("-");
                                                                String month = str1[1];
                                                                String year = str1[0];
                                                                System.out.println("month-" + month);
                                                                String day = str1[2];
                                                                System.out.println("day-" + day);

                                                                if (year.equals(year1)) {
                                                                    if (month.equals("01")) {
                                                                        jan = jan + st.getAmount();
                                                                        janper = jan * 100 / Grand_Amount;
                                                                    } else if (month.equals("02")) {
                                                                        feb = feb + st.getAmount();
                                                                        febper = feb * 100 / Grand_Amount;
                                                                    } else if (month.equals("03")) {
                                                                        mar = mar + st.getAmount();
                                                                        marper = mar * 100 / Grand_Amount;
                                                                    } else if (month.equals("04")) {
                                                                        apl = apl + st.getAmount();
                                                                        aplper = apl * 100 / Grand_Amount;
                                                                    } else if (month.equals("05")) {
                                                                        may = may + st.getAmount();
                                                                        mayper = may * 100 / Grand_Amount;
                                                                    } else if (month.equals("06")) {
                                                                        jun = jun + st.getAmount();
                                                                        junper = jun * 100 / Grand_Amount;
                                                                    } else if (month.equals("07")) {
                                                                        jul = jul + st.getAmount();
                                                                        System.out.println("jul" + jul);
                                                                        System.out.println("Grand_Amount1" + jul);
                                                                        julper = jul * 100 / Grand_Amount;
                                                                        System.out.println("julper" + julper);
                                                                    } else if (month.equals("08")) {
                                                                        aug = aug + st.getAmount();
                                                                        augper = aug * 100 / Grand_Amount;
                                                                    } else if (month.equals("09")) {
                                                                        sep = sep + st.getAmount();
                                                                        sepper = sep * 100 / Grand_Amount;
                                                                    } else if (month.equals("10")) {
                                                                        oct = oct + st.getAmount();
                                                                        octper = oct * 100 / Grand_Amount;
                                                                    } else if (month.equals("11")) {
                                                                        nov = nov + st.getAmount();
                                                                        novper = nov * 100 / Grand_Amount;
                                                                    } else {
                                                                        dec = dec + st.getAmount();
                                                                        decper = dec * 100 / Grand_Amount;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                    String branchnname = admin.getAdminOfBranch().getBranchName();


                                                %>

                                                <div role="tabpanel" class="tab-pane fade active in" id="tab_content<%=j%>" aria-labelledby="home-tab">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel tile fixed_height_320">
                                                                    <div class="x_title">
                                                                        <h2><%=branchnname%> Monthly Student Fee Report</h2>
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
                                                                        <div class="col-md-6">
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>January</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=janper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=jan%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>

                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>February </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=febper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=feb%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>March  </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=marper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=mar%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>April </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=aplper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=apl%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>May </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=mayper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=may%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>June </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=junper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=jun%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>  

                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>July</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=julper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=jul%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>August </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=augper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=aug%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>September</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=sepper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=sep%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>October  </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=octper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=oct%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>November</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=novper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=nov%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>December </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=decper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=dec%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                        </div>
                                                                        <!--                  <h4>App Usage across versions</h4>-->


                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div> </div>
                                                </div>



                                                <%

                                                    jan = 0;
                                                    feb = 0;
                                                    mar = 0;
                                                    apl = 0;
                                                    may = 0;
                                                    jun = 0;
                                                    jul = 0;
                                                    aug = 0;
                                                    sep = 0;
                                                    oct = 0;
                                                    nov = 0;
                                                    dec = 0;

                                                    janper = 0;
                                                    febper = 0;
                                                    marper = 0;
                                                    aplper = 0;
                                                    mayper = 0;
                                                    junper = 0;
                                                    julper = 0;
                                                    augper = 0;
                                                    sepper = 0;
                                                    octper = 0;
                                                    novper = 0;
                                                    decper = 0;
                                                    Grand_Amount = 0;

                                                %>


                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2><i class="fa fa-bars"></i> Customer Rent Report Branch Wise  </h2>
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


                                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                            <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                <%                                                int k = 1;

                                                %>

                                                <li role="presentation" ><a href="#tab_content<%=k%><%=k%>" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true"><%=admin.getAdminOfBranch().getBranchName()%></a>
                                                </li>




                                            </ul>
                                            <div id="myTabContent" class="tab-content">

                                                <%
                                                    jan = 0;
                                                    feb = 0;
                                                    mar = 0;
                                                    apl = 0;
                                                    may = 0;
                                                    jun = 0;
                                                    jul = 0;
                                                    aug = 0;
                                                    sep = 0;
                                                    oct = 0;
                                                    nov = 0;
                                                    dec = 0;

                                                    janper = 0;
                                                    febper = 0;
                                                    marper = 0;
                                                    aplper = 0;
                                                    mayper = 0;
                                                    junper = 0;
                                                    julper = 0;
                                                    augper = 0;
                                                    sepper = 0;
                                                    octper = 0;
                                                    novper = 0;
                                                    decper = 0;
                                                    Grand_Amount = 0;
                                                    int f = 1;

                                                    List<Payment> payment2 = pd.getAllPayment();
                                                    List<Payment> payment3 = pd.getAllPayment();
                                                    for (Payment st1 : payment2) {
                                                        if (st1.getAdminOfBranch().getAdminId() == admin.getAdminId()) {
                                                            String paymentagain = st1.getPaymentAgains();
                                                            String[] pp = paymentagain.split(" ");
                                                            String type = pp[0];
                                                            if (type.equals("Rent")) {
                                                                Grand_Amount = Grand_Amount + st1.getAmount();
                                                            }
                                                        }
                                                    }
                                                    for (Payment st : payment3) {
                                                        if (st.getAdminOfBranch().getAdminId() == admin.getAdminId()) {

                                                            String paymentagain = st.getPaymentAgains();
                                                            String[] pp = paymentagain.split(" ");
                                                            String type = pp[0];
                                                            if (type.equals("Rent")) {
                                                                Date d = st.getPaymentDate();
                                                                DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
                                                                String start2 = df1.format(d);
                                                                String[] str1 = start2.split("-");
                                                                String month = str1[1];
                                                                String year = str1[0];
                                                                System.out.println("month-" + month);
                                                                String day = str1[2];
                                                                System.out.println("day-" + day);

                                                                if (year.equals(year1)) {
                                                                    if (month.equals("01")) {
                                                                        jan = jan + st.getAmount();
                                                                        janper = jan * 100 / Grand_Amount;
                                                                    } else if (month.equals("02")) {
                                                                        feb = feb + st.getAmount();
                                                                        febper = feb * 100 / Grand_Amount;
                                                                    } else if (month.equals("03")) {
                                                                        mar = mar + st.getAmount();
                                                                        marper = mar * 100 / Grand_Amount;
                                                                    } else if (month.equals("04")) {
                                                                        apl = apl + st.getAmount();
                                                                        aplper = apl * 100 / Grand_Amount;
                                                                    } else if (month.equals("05")) {
                                                                        may = may + st.getAmount();
                                                                        mayper = may * 100 / Grand_Amount;
                                                                    } else if (month.equals("06")) {
                                                                        jun = jun + st.getAmount();
                                                                        junper = jun * 100 / Grand_Amount;
                                                                    } else if (month.equals("07")) {
                                                                        jul = jul + st.getAmount();
                                                                        System.out.println("jul" + jul);
                                                                        System.out.println("Grand_Amount1" + jul);
                                                                        julper = jul * 100 / Grand_Amount;
                                                                        System.out.println("julper" + julper);
                                                                    } else if (month.equals("08")) {
                                                                        aug = aug + st.getAmount();
                                                                        augper = aug * 100 / Grand_Amount;
                                                                    } else if (month.equals("09")) {
                                                                        sep = sep + st.getAmount();
                                                                        sepper = sep * 100 / Grand_Amount;
                                                                    } else if (month.equals("10")) {
                                                                        oct = oct + st.getAmount();
                                                                        octper = oct * 100 / Grand_Amount;
                                                                    } else if (month.equals("11")) {
                                                                        nov = nov + st.getAmount();
                                                                        novper = nov * 100 / Grand_Amount;
                                                                    } else {
                                                                        dec = dec + st.getAmount();
                                                                        decper = dec * 100 / Grand_Amount;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }


                                                %>

                                                <div role="tabpanel" class="tab-pane fade active in" id="tab_content<%=f%><%=f%>" aria-labelledby="home-tab">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content<%=f%><%=f%>" aria-labelledby="home-tab">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel tile fixed_height_320">
                                                                    <div class="x_title">
                                                                        <h2><%=branchnname%> Monthly Rent Report</h2>
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
                                                                        <div class="col-md-6">
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>January</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=janper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=jan%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>

                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>February </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=febper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=feb%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>March  </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=marper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=mar%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>April </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=aplper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=apl%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>May </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=mayper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=may%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>June </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=junper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=jun%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>  

                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>July</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=julper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=jul%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>August </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=augper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=aug%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>September</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=sepper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=sep%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>October  </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=octper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=oct%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>November</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=novper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=nov%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>December </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=decper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=dec%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                        </div>
                                                                        <!--                  <h4>App Usage across versions</h4>-->


                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div> </div>
                                                </div>



                                                <%

                                                    jan = 0;
                                                    feb = 0;
                                                    mar = 0;
                                                    apl = 0;
                                                    may = 0;
                                                    jun = 0;
                                                    jul = 0;
                                                    aug = 0;
                                                    sep = 0;
                                                    oct = 0;
                                                    nov = 0;
                                                    dec = 0;

                                                    janper = 0;
                                                    febper = 0;
                                                    marper = 0;
                                                    aplper = 0;
                                                    mayper = 0;
                                                    junper = 0;
                                                    julper = 0;
                                                    augper = 0;
                                                    sepper = 0;
                                                    octper = 0;
                                                    novper = 0;
                                                    decper = 0;
                                                    Grand_Amount = 0;

                                                %>


                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2><i class="fa fa-bars"></i> Customer Repair Report Branch Wise  </h2>
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


                                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                            <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                <%                                                int y = 1;

                                                %>

                                                <li role="presentation" ><a href="#tab_content<%=y%><%=y%><%=y%>" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true"><%=admin.getAdminOfBranch().getBranchName()%></a>
                                                </li>




                                            </ul>
                                            <div id="myTabContent" class="tab-content">

                                                <%
                                                    jan = 0;
                                                    feb = 0;
                                                    mar = 0;
                                                    apl = 0;
                                                    may = 0;
                                                    jun = 0;
                                                    jul = 0;
                                                    aug = 0;
                                                    sep = 0;
                                                    oct = 0;
                                                    nov = 0;
                                                    dec = 0;

                                                    janper = 0;
                                                    febper = 0;
                                                    marper = 0;
                                                    aplper = 0;
                                                    mayper = 0;
                                                    junper = 0;
                                                    julper = 0;
                                                    augper = 0;
                                                    sepper = 0;
                                                    octper = 0;
                                                    novper = 0;
                                                    decper = 0;
                                                    Grand_Amount = 0;
                                                    int t = 1;

                                                    List<Payment> payment4 = pd.getAllPayment();
                                                    List<Payment> payment5 = pd.getAllPayment();
                                                    for (Payment st1 : payment4) {
                                                        if (st1.getAdminOfBranch().getAdminId() == admin.getAdminId()) {
                                                            String paymentagain = st1.getPaymentAgains();
                                                            String[] pp = paymentagain.split(" ");
                                                            String type = pp[0];
                                                            if (type.equals("Repair")) {
                                                                Grand_Amount = Grand_Amount + st1.getAmount();
                                                            }
                                                        }
                                                    }
                                                    for (Payment st : payment5) {
                                                        if (st.getAdminOfBranch().getAdminId() == admin.getAdminId()) {

                                                            String paymentagain = st.getPaymentAgains();
                                                            String[] pp = paymentagain.split(" ");
                                                            String type = pp[0];
                                                            if (type.equals("Repair")) {
                                                                Date d = st.getPaymentDate();
                                                                DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
                                                                String start2 = df1.format(d);
                                                                String[] str1 = start2.split("-");
                                                                String month = str1[1];
                                                                String year = str1[0];
                                                                System.out.println("month-" + month);
                                                                String day = str1[2];
                                                                System.out.println("day-" + day);

                                                                if (year.equals(year1)) {
                                                                    if (month.equals("01")) {
                                                                        jan = jan + st.getAmount();
                                                                        janper = jan * 100 / Grand_Amount;
                                                                    } else if (month.equals("02")) {
                                                                        feb = feb + st.getAmount();
                                                                        febper = feb * 100 / Grand_Amount;
                                                                    } else if (month.equals("03")) {
                                                                        mar = mar + st.getAmount();
                                                                        marper = mar * 100 / Grand_Amount;
                                                                    } else if (month.equals("04")) {
                                                                        apl = apl + st.getAmount();
                                                                        aplper = apl * 100 / Grand_Amount;
                                                                    } else if (month.equals("05")) {
                                                                        may = may + st.getAmount();
                                                                        mayper = may * 100 / Grand_Amount;
                                                                    } else if (month.equals("06")) {
                                                                        jun = jun + st.getAmount();
                                                                        junper = jun * 100 / Grand_Amount;
                                                                    } else if (month.equals("07")) {
                                                                        jul = jul + st.getAmount();
                                                                        System.out.println("jul" + jul);
                                                                        System.out.println("Grand_Amount1" + jul);
                                                                        julper = jul * 100 / Grand_Amount;
                                                                        System.out.println("julper" + julper);
                                                                    } else if (month.equals("08")) {
                                                                        aug = aug + st.getAmount();
                                                                        augper = aug * 100 / Grand_Amount;
                                                                    } else if (month.equals("09")) {
                                                                        sep = sep + st.getAmount();
                                                                        sepper = sep * 100 / Grand_Amount;
                                                                    } else if (month.equals("10")) {
                                                                        oct = oct + st.getAmount();
                                                                        octper = oct * 100 / Grand_Amount;
                                                                    } else if (month.equals("11")) {
                                                                        nov = nov + st.getAmount();
                                                                        novper = nov * 100 / Grand_Amount;
                                                                    } else {
                                                                        dec = dec + st.getAmount();
                                                                        decper = dec * 100 / Grand_Amount;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }


                                                %>

                                                <div role="tabpanel" class="tab-pane fade active in" id="tab_content<%=t%><%=t%><%=t%>" aria-labelledby="home-tab">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content<%=t%><%=t%><%=t%>" aria-labelledby="home-tab">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel tile fixed_height_320">
                                                                    <div class="x_title">
                                                                        <h2><%=branchnname%> Monthly Repair Report</h2>
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
                                                                        <div class="col-md-6">
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>January</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=janper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=jan%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>

                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>February </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=febper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=feb%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>March  </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=marper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=mar%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>April </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=aplper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=apl%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>May </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=mayper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=may%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>June </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=junper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=jun%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>  

                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>July</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=julper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=jul%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>August </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=augper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=aug%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>September</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=sepper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=sep%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>October  </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=octper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=oct%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>November</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=novper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=nov%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>December </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=decper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=dec%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                        </div>
                                                                        <!--                  <h4>App Usage across versions</h4>-->


                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div> </div>
                                                </div>


                                                <%

                                                    jan = 0;
                                                    feb = 0;
                                                    mar = 0;
                                                    apl = 0;
                                                    may = 0;
                                                    jun = 0;
                                                    jul = 0;
                                                    aug = 0;
                                                    sep = 0;
                                                    oct = 0;
                                                    nov = 0;
                                                    dec = 0;

                                                    janper = 0;
                                                    febper = 0;
                                                    marper = 0;
                                                    aplper = 0;
                                                    mayper = 0;
                                                    junper = 0;
                                                    julper = 0;
                                                    augper = 0;
                                                    sepper = 0;
                                                    octper = 0;
                                                    novper = 0;
                                                    decper = 0;
                                                    Grand_Amount = 0;

                                                %>


                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2><i class="fa fa-bars"></i> Customer Sell Report Branch Wise  </h2>
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


                                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                            <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                <%                                                int p = 1;

                                                %>

                                                <li role="presentation" ><a href="#tab_content<%=p%><%=p%><%=p%><%=p%>" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true"><%=admin.getAdminOfBranch().getBranchName()%></a>
                                                </li>




                                            </ul>
                                            <div id="myTabContent" class="tab-content">

                                                <%
                                                    jan = 0;
                                                    feb = 0;
                                                    mar = 0;
                                                    apl = 0;
                                                    may = 0;
                                                    jun = 0;
                                                    jul = 0;
                                                    aug = 0;
                                                    sep = 0;
                                                    oct = 0;
                                                    nov = 0;
                                                    dec = 0;

                                                    janper = 0;
                                                    febper = 0;
                                                    marper = 0;
                                                    aplper = 0;
                                                    mayper = 0;
                                                    junper = 0;
                                                    julper = 0;
                                                    augper = 0;
                                                    sepper = 0;
                                                    octper = 0;
                                                    novper = 0;
                                                    decper = 0;
                                                    Grand_Amount = 0;
                                                    int t1 = 1;

                                                    List<Payment> payment6 = pd.getAllPayment();
                                                    List<Payment> payment7 = pd.getAllPayment();
                                                    for (Payment st1 : payment6) {
                                                        if (st1.getAdminOfBranch().getAdminId() == admin.getAdminId()) {
                                                            String paymentagain = st1.getPaymentAgains();
                                                            String[] pp = paymentagain.split(" ");
                                                            String type = pp[0];
                                                            if (type.equals("Sell")) {
                                                                Grand_Amount = Grand_Amount + st1.getAmount();
                                                            }
                                                        }
                                                    }
                                                    for (Payment st : payment7) {
                                                        if (st.getAdminOfBranch().getAdminId() == admin.getAdminId()) {

                                                            String paymentagain = st.getPaymentAgains();
                                                            String[] pp = paymentagain.split(" ");
                                                            String type = pp[0];
                                                            if (type.equals("Sell")) {
                                                                Date d = st.getPaymentDate();
                                                                DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
                                                                String start2 = df1.format(d);
                                                                String[] str1 = start2.split("-");
                                                                String month = str1[1];
                                                                String year = str1[0];
                                                                System.out.println("month-" + month);
                                                                String day = str1[2];
                                                                System.out.println("day-" + day);

                                                                if (year.equals(year1)) {
                                                                    if (month.equals("01")) {
                                                                        jan = jan + st.getAmount();
                                                                        janper = jan * 100 / Grand_Amount;
                                                                    } else if (month.equals("02")) {
                                                                        feb = feb + st.getAmount();
                                                                        febper = feb * 100 / Grand_Amount;
                                                                    } else if (month.equals("03")) {
                                                                        mar = mar + st.getAmount();
                                                                        marper = mar * 100 / Grand_Amount;
                                                                    } else if (month.equals("04")) {
                                                                        apl = apl + st.getAmount();
                                                                        aplper = apl * 100 / Grand_Amount;
                                                                    } else if (month.equals("05")) {
                                                                        may = may + st.getAmount();
                                                                        mayper = may * 100 / Grand_Amount;
                                                                    } else if (month.equals("06")) {
                                                                        jun = jun + st.getAmount();
                                                                        junper = jun * 100 / Grand_Amount;
                                                                    } else if (month.equals("07")) {
                                                                        jul = jul + st.getAmount();
                                                                        System.out.println("jul" + jul);
                                                                        System.out.println("Grand_Amount1" + jul);
                                                                        julper = jul * 100 / Grand_Amount;
                                                                        System.out.println("julper" + julper);
                                                                    } else if (month.equals("08")) {
                                                                        aug = aug + st.getAmount();
                                                                        augper = aug * 100 / Grand_Amount;
                                                                    } else if (month.equals("09")) {
                                                                        sep = sep + st.getAmount();
                                                                        sepper = sep * 100 / Grand_Amount;
                                                                    } else if (month.equals("10")) {
                                                                        oct = oct + st.getAmount();
                                                                        octper = oct * 100 / Grand_Amount;
                                                                    } else if (month.equals("11")) {
                                                                        nov = nov + st.getAmount();
                                                                        novper = nov * 100 / Grand_Amount;
                                                                    } else {
                                                                        dec = dec + st.getAmount();
                                                                        decper = dec * 100 / Grand_Amount;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }


                                                %>

                                                <div role="tabpanel" class="tab-pane fade active in" id="tab_content<%=t%><%=t%><%=t%>" aria-labelledby="home-tab">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content<%=t%><%=t%><%=t%>" aria-labelledby="home-tab">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel tile fixed_height_320">
                                                                    <div class="x_title">
                                                                        <h2><%=branchnname%> Monthly Sell Report</h2>
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
                                                                        <div class="col-md-6">
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>January</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=janper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=jan%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>

                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>February </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=febper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=feb%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>March  </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=marper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=mar%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>April </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=aplper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=apl%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>May </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=mayper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=may%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>June </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=junper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=jun%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>  

                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>July</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=julper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=jul%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>August </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=augper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=aug%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>September</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=sepper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=sep%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>October  </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=octper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=oct%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>November</span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=novper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=nov%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                            <div class="widget_summary">
                                                                                <div class="w_left w_25">
                                                                                    <span>December </span>
                                                                                </div>
                                                                                <div class="w_center w_55">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=decper%>%;">
                                                                                            <span class="sr-only">60% Complete</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="w_right w_20">
                                                                                    <span><%=dec%></span>
                                                                                </div>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                        </div>
                                                                        <!--                  <h4>App Usage across versions</h4>-->


                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div> </div>
                                                </div>


                                                <%

                                                    jan = 0;
                                                    feb = 0;
                                                    mar = 0;
                                                    apl = 0;
                                                    may = 0;
                                                    jun = 0;
                                                    jul = 0;
                                                    aug = 0;
                                                    sep = 0;
                                                    oct = 0;
                                                    nov = 0;
                                                    dec = 0;

                                                    janper = 0;
                                                    febper = 0;
                                                    marper = 0;
                                                    aplper = 0;
                                                    mayper = 0;
                                                    junper = 0;
                                                    julper = 0;
                                                    augper = 0;
                                                    sepper = 0;
                                                    octper = 0;
                                                    novper = 0;
                                                    decper = 0;
                                                    Grand_Amount = 0;

                                                %>


                                            </div>
                                        </div>

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

 <script src="../production/js/jquery.formError.js" type="text/javascript"></script>
        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- Chart.js -->/
       
        <script src="../vendors/Chart.js/dist/Chart.min.js"></script>
        <!-- gauge.js -->
        <script src="../vendors/gauge.js/dist/gauge.min.js"></script>
        <!-- bootstrap-progressbar -->
        <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <!-- iCheck -->
        <script src="../vendors/iCheck/icheck.min.js"></script>
        <!-- Skycons -->
        <script src="../vendors/skycons/skycons.js"></script>
        <!-- Flot -->
        <script src="../vendors/Flot/jquery.flot.js"></script>
        <script src="../vendors/Flot/jquery.flot.pie.js"></script>
        <script src="../vendors/Flot/jquery.flot.time.js"></script>
        <script src="../vendors/Flot/jquery.flot.stack.js"></script>
        <script src="../vendors/Flot/jquery.flot.resize.js"></script>
        <!-- Flot plugins -->
        <script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
        <script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
        <script src="../vendors/flot.curvedlines/curvedLines.js"></script>
        <!-- DateJS -->
        <script src="../vendors/DateJS/build/date.js"></script>
        <!-- JQVMap -->
        <script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
        <script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
        <script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
        <!-- bootstrap-daterangepicker -->
        <script src="../vendors/moment/min/moment.min.js"></script>
        <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- Datatables -->
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
        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
        
         <%@ include file = "JavaScriptFile.jsp" %>



        <script type="text/javascript">
            $(document).ready(function() {

                $('#mobileno').keyup(function() {

                    var mobileno = $('#mobileno').val();
                    if (mobileno != "")
                    {
                        $('#allDashboard').hide();

                        $.get("AjaxPages/SearchAccount.jsp", {mobileno: mobileno}, function(data) {
                            //   alert('sucess');
                            $('#AccountFetch').html(data);
                        });
                    }
                    else
                    {

                        $.get("AjaxPages/SearchAccount.jsp", {mobileno: mobileno}, function(data) {
                            //   alert('sucess');
                            $('#AccountFetch').html(data);
                            $('#allDashboard').show();
                        });
                    }
                });


                $('.srrequest').click(function() {

                    var srrequestid = this.id;

                    $('#allDashboard').hide();

                    $.get("AjaxPages/RequestFetch.jsp", {srrequestid: srrequestid}, function(data) {
                        alert('sucess');
                        $('#AccountFetch').html(data);
                    });

                });


            });
        </script>
    </body>
</html>
