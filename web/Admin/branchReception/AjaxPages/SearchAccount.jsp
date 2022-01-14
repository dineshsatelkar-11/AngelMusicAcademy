


<%@page import="com.accede.angel.admin.dao.AdminPrevilleagesDao"%>
<%@page import="com.accede.angel.admin.model.AdminPrevilleages"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="java.util.List"%>

<%

    String admintype1 = (String) session.getAttribute("Type");
    AdminPrevilleages AdminPrevilleages1 = new AdminPrevilleages();
    AdminPrevilleagesDao AdminPrevilleagesDao1 = new AdminPrevilleagesDao();
    Admin Adminforsearch = (Admin) session.getAttribute("BRANCH_ADMIN");
    AdminPrevilleages1 = AdminPrevilleagesDao1.getAdminPrevilleages(Adminforsearch, admintype1);

    String MobileNo = request.getParameter("mobileno");
    System.out.println("MobileNo==" + MobileNo);
    if (MobileNo != "") {
        Admin adminnn = (Admin) session.getAttribute("BRANCH_ADMIN");

%>

<div class="row">
    <%                int s = 0;
        List<CustomerAccount> AllCustomerAccount = new CustomerAccountDao().getCustomerAccountsByMobile(MobileNo, adminnn);
        AdmissionDao AdmissionDao = new AdmissionDao();
        RepairDao RepairDao = new RepairDao();
        RentDao RentDao = new RentDao();
        if (AllCustomerAccount != null && AllCustomerAccount.size() > 0) {
            for (CustomerAccount p : AllCustomerAccount) {

                int StudentBalanceamount = 0;
                Admission Admission = AdmissionDao.getAdmissionByAccount(p);
                if (Admission != null) {
                    StudentBalanceamount = Admission.getRemaininFee();
                }

                List<Rent> allRent = RentDao.getAllRentRequestForCust(p);
                int rentamount = 0;
                int repairamount = 0;
                if (allRent != null && allRent.size() > 0) {
                    for (Rent rent : allRent) {
                        rentamount = rentamount + rent.getPaid_ByCust();
                    }
                }

                List<Repair> allRepair = null;
                allRepair = RepairDao.getAllRepairRequestForCust(p);
                if (allRepair != null && allRepair.size() > 0) {
                    for (Repair rp : allRepair) {

                        repairamount = repairamount + rp.getBal();
                    }
                }

                s++;

    %>



    <div class="col-md-3 col-sm-12 col-xs-12">
        <div class="x_panel">
            <h2 style="text-align:center">User Profile Card</h2>

            <div class="card">
                <img src="../../StudentImages/<%=p.getImage()%>" alt="<%=p.getName()%>" style="width:25%" alt=""/>


                <h2><%=p.getName()%></h2>

                <p class="title"><%=p.getMobileNo()%></p>
                <p class="title">Bal:-<%=rentamount + repairamount + StudentBalanceamount%></p>
                <p><%=p.getAddress()%></p>
                <div style="margin: 24px 0;">

                    <% 
                                if (AdminPrevilleages1.isAllStudent()) {
                            %>
                    <a href="StudentProfileDetails.jsp?accountid=<%=p.getId()%>"><img src="../../AdminImages/admission.png"  alt="John" style="width:20%; margin-top: -25px;"></a>
                   <% }
                                if (AdminPrevilleages1.isAllRentRequest()) {
                            %>  <a href="CustRent.jsp?accountid=<%=p.getId()%>"><span  tool-tip-toggle="tooltip-demo" data-original-title="Rent "><img src="../../AdminImages/for-rent.png"  alt="John" style="width:20%; margin-top: -25px;"></span></a>
                     <% }
                                if (AdminPrevilleages1.isAllRepairing()) {
                            %> <a href="CustRepair.jsp?accountid=<%=p.getId()%>"><img src="../../AdminImages/repair.jpg"  alt="John" style="width:20%; margin-top: -25px;"></span></a>
                     <% }
                                if (AdminPrevilleages1.isCustomer_Sell_Report()) {
                            %> <a href="CustomerSaleReport.jsp?accountid=<%=p.getId()%>"><img src="../../AdminImages/Sell.png"  alt="John" style="width:20%; margin-top: -25px;"></span></a>

<%}%>


                </div>

            </div>
        </div>
    </div>


    <%}%>


    <%

    } else {%>


    <div class="row">
        <div class="x_panel" >
            <h2 class=" text-center"  style="color:red;">Account not Found For These Mobile Number</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 col-sm-12 col-xs-12"></div>
        <div class="col-md-4 col-sm-12 col-xs-12">
            <div class="x_panel" >
                <marquee><h2 class="titletag" style="color:blue;">Create Account</h2></marquee>


                <div class="card">
                    <br>
                    <img src="../../AdminImages/admin.jpg" alt="Person" width="96" height="96">
                    <div class="container">
                        <h4><b></b></h4> 
                        <p></p> 
                        <br>
                        <br>

                        <blink> <p><button type="button" class="btn btn-info btn-lg right"  data-toggle="modal" data-target="#myModal">Create Account</button></p></blink>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12">
            <div class="x_panel" >

                <marquee><h2 class="titletag" style="color:blue;">Inquiry Request</h2> </marquee>
                <div class="card">
                    <br>
                    <img src="../../AdminImages/admin.jpg" alt="Person" width="96" height="96">
                    <div class="container">
                        <h4><b></b></h4> 
                        <p></p> 
                        <br>
                        <br>
                        <blink>    <p><button type="button" class="btn btn-info btn-lg right"  data-toggle="modal" data-target="#myModal1">Inquiry Request</button></p> </blink> 
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%}
    } else {%>



    <%}%> 

    <script>

        $.fn.popover.Constructor.prototype.leave = function(a) {
            var c, d, b = a instanceof this.constructor ? a : $(a.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
            originalLeave.call(this, a), a.currentTarget && (c = $(a.currentTarget).siblings(".popover"), d = b.timeout, c.one("mouseenter", function() {
                clearTimeout(d), c.one("mouseleave", function() {
                    $.fn.popover.Constructor.prototype.leave.call(b, b)
                })
            }))
        },
                $(document).ready(function() {
            init_wysiwyg(), init_InputMask(), init_JQVmap(), init_cropper(), init_knob(), init_IonRangeSlider(), init_ColorPicker(), init_TagsInput(), init_parsley(), init_daterangepicker(), init_daterangepicker_right(), init_EasyPieChart(), init_charts(), init_echarts(), init_morris_charts(), init_skycons(), init_select2(), init_validator(), init_DataTables(), init_chart_doughnut(), init_gauge(), init_PNotify(), init_starrr(), init_calendar(), init_compose(), init_CustomNotification(), init_autosize(), init_autocomplete()
        });





    </script>


    <style>
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            max-width: 300px;
            margin: auto;
            text-align: center;
            font-family: arial;
        }

        .title {
            color: grey;
            font-size: 18px;
        }
        title{ color: red; } 
        button {
            border: none;
            outline: 0;
            display: inline-block;
            padding: 8px;
            color: white;
            background-color: #000;
            text-align: center;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
        }

        a {
            text-decoration: none;
            /*font-size: 22px;*/
            color: black;
        }

        button:hover, a:hover {
            opacity: 0.7;
            visibility: visible;
        }
    </style>


    <style>
        .chip {
            display: inline-block;
            padding: 0 25px;
            height: 50px;
            font-size: 16px;
            line-height: 50px;
            border-radius: 25px;
            background-color: #f1f1f1;
        }

        .chip img {
            float: left;
            margin: 0 10px 0 -25px;
            height: 50px;
            width: 50px;
            border-radius: 50%;
        }


        blink {
            -webkit-animation: 1s linear infinite condemned_blink_effect; // for android
            animation: 2s linear infinite condemned_blink_effect;
        }
        @-webkit-keyframes condemned_blink_effect { // for android
                                                    0% {
                                                        visibility: hidden;
                                                    }
                                                    50% {
                                                        visibility: hidden;
                                                    }
                                                    100% {
                                                        visibility: visible;
                                                    }
        }
        @keyframes condemned_blink_effect {
            0% {
                visibility: hidden;
            }
            50% {
                visibility: hidden;
            }
            100% {
                visibility: visible;
            }
        }
    </style>
