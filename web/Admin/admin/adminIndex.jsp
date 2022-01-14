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
    <head>

        <style>

            .imagefetch 
            {

                background-color: #45423a;
            }
            .wrapper1, .wrapper2{width:100%; border: none 0px RED;
                                 overflow-x: scroll; overflow-y:hidden;}
            .wrapper1{height: 20px; }

            .div1 {width:1000px; height: 20px; }
            .div2 {width:1000px;  
                   overflow: auto;}


        </style>

        <script>
            $(function(){
            $(".wrapper1").scroll(function(){
            $(".wrapper2")
                    .scrollLeft($(".wrapper1").scrollLeft());
            });
                    $(".wrapper2").scroll(function(){
            $(".wrapper1")
                    .scrollLeft($(".wrapper2").scrollLeft());
            });</script>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">

                <%@ include file = "../comman_files/adminSideBarFile.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->

                <div  role="main" >

                    <!-- top tiles -->
                    <div class="row tile_count">
                        <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                            <span class="count_top"><i class="fa fa-user"></i> Total Students</span>
                            <%                                    AdmissionDao ad = new AdmissionDao();
                                List<Admission> students = ad.getAllAdmission();
                                int totalstudents = 0;
                                int activestudents = 0;
                                int totalinquiry = 0;
                                int todayfolloup = 0;
                                int activeinquiry = 0;
                                for (Admission a : students) {
                                    totalstudents++;

                                    if (a.isShiftToOldStudent()) {
                                        activestudents++;
                                    }
                                }
                                EnquiryDao ed = new EnquiryDao();
                                List<Enquiry> in = ed.getAllEnquiry();
                                for (Enquiry b : in) {
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

                                RentDao rd = new RentDao();
                                RepairDao rdd = new RepairDao();
                                List<Rent> rent = rd.getAllRentInquiry();
                                int totalcust = 0;
                                List<Repair> repair = rdd.getAllRepairInquiry();
                                for (Rent r : rent) {
                                    totalcust++;
                                }
                                for (Repair rr : repair) {
                                    totalcust++;
                                }
                                    
                                    
                                  CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                                                      
                                                    
                                                    List<CustomerAccount> allCustomerAccount = null;
                                                    allCustomerAccount = CustomerAccountDao.getCustomerAccount();
totalcust=allCustomerAccount.size();
PaymentFollowupDao PaymentFollowupDao = new PaymentFollowupDao();
                    List<PaymentFollowup> allPaymentFollowup = PaymentFollowupDao.getAllPaymentFollowup();
                     paymentfollowup=allPaymentFollowup.size();


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
                            <div class="count"><%=activeinquiry%></div>
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
                            for (Admin adminn : admin1) {
                                if (!(adminn.getAdminId() == 1)) {
                                    BranchName = adminn.getAdminOfBranch().getBranchName();
                                    imagename = adminn.getImagename();
                                    for (Admission a : students) {
                                        if (a.getAdminOfBranch().getAdminId() == adminn.getAdminId()) {
                                            totaladmissionbybranch++;

                                            if (a.isShiftToOldStudent()) {
                                                activestudentbybranch++;
                                            }
                                        }

                                    }

                                    for (Enquiry b : in) {
                                        totalinquiry++;
                                        if (b.isDeleteEnquiry()) {
                                            if (b.isRemove()) {
                                                activeinquiry++;
                                            }
                                        }
                                        boolean re = b.isRemove();
                                        boolean de = b.isDeleteEnquiry();
                                        if (b.getAdminOfBranch().getAdminId() == adminn.getAdminId()) {
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

                                     allCustomerAccount = CustomerAccountDao.getCustomerAccount(adminn);
totalcust=allCustomerAccount.size();
 allPaymentFollowup = PaymentFollowupDao.getAllPaymentFollowup(adminn);
                     paymentfollowup=allPaymentFollowup.size();
                     EnquiryDao EnquiryDao = new EnquiryDao();
                        List<Enquiry> allEnquiry = EnquiryDao.getAllEnquiryFollowup(adminn);
                        todayfolloup=allEnquiry.size();
                        %>
                        <div class="col-md-3 col-xs-12 widget widget_tally_box">
                            <div class="x_panel fixed_height_300">
                                <div class="x_content">

                                    <div class="flex">
                                        <ul class="list-inline widget_profile_box">
                                            <li>

                                            </li>
                                            <li>

                                                <img src="../../AdminImages/<%=imagename%>" alt="..." class="img-circle profile_img">
                                            </li>
                                            <li>
                                                <a>
                                                    <form action="../../DirectAdminLogin" method="post">
                                                        <input type="hidden" name="email" value="<%=adminn.getAdminEmail()%>">
                                                        <input type="hidden" name="password" value="<%=adminn.getReceptionPassword()%>">
                                                        <button type="submit">  <i class="fa fa-sign-out"></i></button>
                                                    </form>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>

                                    <h5 class="name"><%=BranchName%></h5>

                                    <div class="flex">
                                        <ul class="list-inline count2">
                                            <li>
                                                <h3><%=activestudentbybranch%></h3>
                                                <span>Students</span>
                                            </li>
                                            <li>
                                                <h3><%=todayfolloup+paymentfollowup%></h3>
                                                <span>Followup</span>
                                            </li>
                                            <li>
                                                <h3><%=totalcust%></h3>
                                                <span>Customers</span>
                                            </li>
                                        </ul>
                                    </div>
                                    <!--                                    <p>
                                                                            If you've decided to go in development mode and tweak all of this a bit, there are few things you should do.
                                                                        </p>-->
                                </div>
                            </div>
                        </div>

                        <%      totaladmissionbybranch = 0;
                                    activestudentbybranch = 0;
                                    todayfolloup = 0;
                                    totalcust = 0;
                                }
                            }%>

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

                                        <div class="wrapper2">
                                            <div class="div2 scrollbar" id="style-5">

                                                <ul id="myTab" class="nav nav-tabs muul force-overflow " role="tablist">
                                                    <%int i = 0;
                                                        for (Admin adminn : admin1) {
                                                            if (!(adminn.getAdminId() == 1)) {
                                                                i++;
                                                                if (i == 1) {
                                                    %>

                                                    <li role="presentation" ><a href="#tab_content<%=i%>" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true"><%=adminn.getAdminOfBranch().getBranchName()%></a>
                                                    </li>

                                                    <%} else {
                                                    %>

                                                    <li role="presentation" class=""><a href="#tab_content<%=i%>" role="tab" id="profile-tab<%=i%>" data-toggle="tab" aria-expanded="false"><%=adminn.getAdminOfBranch().getBranchName()%></a>
                                                    </li>

                                                    <%
                                                                }
                                                            }
                                                        }
                                                    %>



                                                </ul>
                                            </div>
                                        </div>
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
                                                int j = 0;
                                                Date date = new Date();

                                                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                                                String start1 = df.format(date);
                                                String[] str = start1.split("-");
                                                String month1 = str[1];
                                                String day1 = str[2];
                                                String year1 = str[0];

                                                PaymentDao pd = new PaymentDao();
                                                for (Admin adminn : admin1) {
                                                    if (!(adminn.getAdminId() == 1)) {
                                                        j++;

                                                        List<Payment> payment = pd.getAllPayment();
                                                        List<Payment> payment1 = pd.getAllPayment();
                                                        for (Payment st1 : payment1) {
                                                            if (st1.getAdminOfBranch().getAdminId() == adminn.getAdminId()) {
                                                                System.out.println("=============================");
                                                                System.out.println(st1.getId());
                                                                System.out.println("=============================");
                                                                String paymentagain = st1.getPaymentAgains();
                                                                String[] pp = paymentagain.split(" ");
                                                                String type = pp[0];
                                                                if (type.equals("Admissionno")) {
                                                                    Grand_Amount = Grand_Amount + st1.getAmount();
                                                                }
                                                            }
                                                        }
                                                        for (Payment st : payment) {
                                                            if (st.getAdminOfBranch().getAdminId() == adminn.getAdminId()) {
                                                                System.out.println("============1=================");
                                                                System.out.println(st.getId());
                                                                System.out.println("=============1================");
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
                                                        String branchnname = adminn.getAdminOfBranch().getBranchName();
                                                        if (j == 1) {


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
                                            } else {
                                            %>
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content<%=j%>" aria-labelledby="profile-tab">
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
                                                </div>  </div>

                                            <%
                                                        }
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
                                                    }
                                                }%>


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
                                        <div class="wrapper2">
                                            <div class="div2 scrollbar" id="style-5">

                                                <ul id="myTab" class="nav nav-tabs muul force-overflow " role="tablist">
                                                    <%
                                                                                               int k = 0;
                                                                                               for (Admin adminn : admin1) {
                                                                                                   if (!(adminn.getAdminId() == 1)) {
                                                                                                       k++;
                                                                                                       if (k == 1) {
                                                    %>

                                                    <li role="presentation" ><a href="#tab_content<%=k%><%=k%>" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true"><%=adminn.getAdminOfBranch().getBranchName()%></a>
                                                    </li>

                                                    <%} else {
                                                    %>

                                                    <li role="presentation" class=""><a href="#tab_content<%=k%><%=k%>" role="tab" id="profile-tab<%=i%><%=k%>" data-toggle="tab" aria-expanded="false"><%=adminn.getAdminOfBranch().getBranchName()%></a>
                                                    </li>

                                                    <%
                                                                }
                                                            }
                                                        }
                                                    %>



                                                </ul>
                                            </div>
                                        </div>
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
                                                int f = 0;

                                                for (Admin adminn : admin1) {
                                                    if (!(adminn.getAdminId() == 1)) {
                                                        f++;

                                                        List<Payment> payment = pd.getAllPayment();
                                                        List<Payment> payment1 = pd.getAllPayment();
                                                        for (Payment st1 : payment1) {
                                                            if (st1.getAdminOfBranch().getAdminId() == adminn.getAdminId()) {
                                                                String paymentagain = st1.getPaymentAgains();
                                                                String[] pp = paymentagain.split(" ");
                                                                String type = pp[0];
                                                                if (type.equals("Rent")) {
                                                                    Grand_Amount = Grand_Amount + st1.getAmount();
                                                                }
                                                            }
                                                        }
                                                        for (Payment st : payment) {
                                                            if (st.getAdminOfBranch().getAdminId() == adminn.getAdminId()) {

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
                                                        String branchnname = adminn.getAdminOfBranch().getBranchName();
                                                        if (f == 1) {


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
                                            } else {
                                            %>
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content<%=f%><%=f%>" aria-labelledby="profile-tab">
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
                                                </div>  </div>

                                            <%
                                                        }
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
                                                    }
                                                }%>


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

                                        <div class="wrapper2">
                                            <div class="div2 scrollbar" id="style-5">

                                                <ul id="myTab" class="nav nav-tabs muul force-overflow " role="tablist">
                                                    <%
                                                        int y = 0;
                                                        for (Admin adminn : admin1) {
                                                            if (!(adminn.getAdminId() == 1)) {
                                                                y++;
                                                                if (y == 1) {
                                                    %>

                                                    <li role="presentation" ><a href="#tab_content<%=y%><%=y%><%=y%>" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true"><%=adminn.getAdminOfBranch().getBranchName()%></a>
                                                    </li>

                                                    <%} else {
                                                    %>

                                                    <li role="presentation" class=""><a href="#tab_content<%=y%><%=y%><%=y%>" role="tab" id="profile-tab<%=i%><%=k%>" data-toggle="tab" aria-expanded="false"><%=adminn.getAdminOfBranch().getBranchName()%></a>
                                                    </li>

                                                    <%
                                                                }
                                                            }
                                                        }
                                                    %>



                                                </ul>
                                            </div>
                                        </div>
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
                                                int t = 0;

                                                for (Admin adminn : admin1) {
                                                    if (!(adminn.getAdminId() == 1)) {
                                                        t++;

                                                        List<Payment> payment = pd.getAllPayment();
                                                        List<Payment> payment1 = pd.getAllPayment();
                                                        for (Payment st1 : payment1) {
                                                            if (st1.getAdminOfBranch().getAdminId() == adminn.getAdminId()) {
                                                                String paymentagain = st1.getPaymentAgains();
                                                                String[] pp = paymentagain.split(" ");
                                                                String type = pp[0];
                                                                if (type.equals("Repair")) {
                                                                    Grand_Amount = Grand_Amount + st1.getAmount();
                                                                }
                                                            }
                                                        }
                                                        for (Payment st : payment) {
                                                            if (st.getAdminOfBranch().getAdminId() == adminn.getAdminId()) {

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
                                                        String branchnname = adminn.getAdminOfBranch().getBranchName();
                                                        if (t == 1) {


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
                                            } else {
                                            %>
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content<%=t%><%=t%><%=t%>" aria-labelledby="profile-tab">
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
                                                </div>  </div>

                                            <%
                                                        }
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
                                                    }
                                                }%>


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

                                        <div class="wrapper2">
                                            <div class="div2 scrollbar" id="style-5">

                                                <ul id="myTab" class="nav nav-tabs muul force-overflow " role="tablist">






                                                    <%
                                                        int p = 0;
                                                        for (Admin adminn : admin1) {
                                                            if (!(adminn.getAdminId() == 1)) {
                                                                p++;
                                                                if (p == 1) {
                                                    %>

                                                    <li role="presentation" ><a href="#tab_content<%=p%><%=p%><%=p%><%=p%>" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true"><%=adminn.getAdminOfBranch().getBranchName()%></a>
                                                    </li>

                                                    <%} else {
                                                    %>

                                                    <li role="presentation" class=""><a href="#tab_content<%=p%><%=p%><%=p%><%=p%>" role="tab" id="profile-tab<%=i%><%=k%>" data-toggle="tab" aria-expanded="false"><%=adminn.getAdminOfBranch().getBranchName()%></a>
                                                    </li>

                                                    <%
                                                                }
                                                            }
                                                        }
                                                    %>



                                                </ul>
                                            </div>
                                        </div>
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
                                                t = 0;

                                                for (Admin adminn : admin1) {
                                                    if (!(adminn.getAdminId() == 1)) {
                                                        t++;

                                                        List<Payment> payment = pd.getAllPayment();
                                                        List<Payment> payment1 = pd.getAllPayment();
                                                        for (Payment st1 : payment1) {
                                                            if (st1.getAdminOfBranch().getAdminId() == adminn.getAdminId()) {
                                                                String paymentagain = st1.getPaymentAgains();
                                                                String[] pp = paymentagain.split(" ");
                                                                String type = pp[0];
                                                                if (type.equals("Sell")) {
                                                                    Grand_Amount = Grand_Amount + st1.getAmount();
                                                                }
                                                            }
                                                        }
                                                        for (Payment st : payment) {
                                                            if (st.getAdminOfBranch().getAdminId() == adminn.getAdminId()) {

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
                                                        String branchnname = adminn.getAdminOfBranch().getBranchName();
                                                        if (t == 1) {


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
                                            } else {
                                            %>
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content<%=t%><%=t%><%=t%>" aria-labelledby="profile-tab">
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
                                                </div>  </div>

                                            <%
                                                        }
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
                                                    }
                                                }%>


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

        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- Chart.js -->
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

        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>

    </body>
</html>
