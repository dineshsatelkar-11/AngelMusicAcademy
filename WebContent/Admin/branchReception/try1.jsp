
<%
    int id = Integer.parseInt(request.getParameter("Package"));
    int AdmissionFee = Integer.parseInt(request.getParameter("AdmissionFee"));
    PackageCourse PackageCourse = new PackageDao().getPackageCourseByID(id);
    Admin asq = (Admin) session.getAttribute("BRANCH_ADMIN");
    int q = asq.getAdminId();

%>


<div class="row" >


    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Discount in %:</strong></p>
            <input value="0" type="text" id="discper" name="discper" maxlength="10" placeholder="Discount in %" class="form-control admission" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>   Discount in Amount:</strong></p>
            <input value="0" type="text" id="discamt" name="discamt" maxlength="10" placeholder="  Discount in Amount" class="form-control admission" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

        </div>

    </div>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <p><strong>   Final Amount:</strong></p>
        <input value="<%=PackageCourse.getFee() + AdmissionFee%>" type="text" readonly="" id="FinalAmount" name="FinalAmount" maxlength="10" placeholder="Contact No." class="form-control admission" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
    </div>
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong>  Paid Amount:</strong></p>
            <input value="0" type="text" id="PaidAmount" name="PaidAmount" maxlength="10" placeholder=" Paid Amount" class="form-control admission" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
            <p><strong> Balance  Amount:</strong></p>
            <input value="<%=PackageCourse.getFee() + AdmissionFee%>"  readonly=""type="text" id="BalanceAmount" name="BalanceAmount" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

        </div> </div>


</div>

<div class="row">

    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <dl class="dropdown  "  > 

            <dt class="form-control " id="DropDownDays">
            <a href="#">
                <span class="hida">-Select Days in Week -</span>    
                <p class="multiSel"></p>  
            </a>
            </dt>

            <dd>
                <div class="mutliSelect ">
                    <ul>


                        <%                                  List<String> Days = new UserDao().initDaysList();

                            for (String b : Days) {

                        %>
                        <li>
                            <input type="checkbox"  name="days" value="<%=b.toString()%>"/><%=b.toString()%></li>


                        <%                                                                               }

                        %>


                    </ul>
                </div>
            </dd>

        </dl>   </div>



    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <dl class="dropdown  "> 

            <dt class="form-control"  id="DropDownCourse">
            <a href="#">
                <span class="hida1">-Select Course List -</span>    
                <p class="multiSel1"></p>  
            </a>
            </dt>

            <dd>
                <div class="mutliSelect1 ">
                    <ul>


                        <%                                                                                List<Course> cs1 = new CourseDao().getAllCourse();
                            for (Course c : cs1) {

                        %>
                        <li>
                            <input type="checkbox"  name="coursename" value="<%=c.getCourseName()%>"/><%=c.getCourseName()%></li>


                        <%                                                                               }

                        %>


                    </ul>
                </div>
            </dd>

        </dl> 


    </div>





    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <dl class="dropdown " > 

            <dt class="form-control"  id="DropDownBatch">
            <a href="#">
                <span class="hida2">-Select Batch Time  in Day -</span>    
                <p class="multiSel2"></p>  
            </a>
            </dt>

            <dd>
                <div class="mutliSelect2 ">
                    <ul>


                        <%                               List<BatchTime> batch = new BatchTimeDa0().getAllBatchTime();

                            for (BatchTime b : batch) {
                                if (b.getAdminOfBranch().getAdminId() == q) {
                        %>
                        <li>
                            <input type="checkbox"  name="batchtime" value="<%=b.getBatchTiming()%>"><%=b.getBatchTiming()%></li>


                        <%                                                                               }
                            }
                        %>


                    </ul>
                </div>
            </dd>

        </dl>   </div>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
    <input type="text" id="coursefee" value="<%=PackageCourse.getFee()%>">
    <input type="text" id="noofday" value="<%=PackageCourse.getNoofdays()%>">
    <input type="text" id="noofcours" value="<%=PackageCourse.getNoofcourse()%>">
    <input type="text" id="noofBatchTimes" value="<%=PackageCourse.getNoofBatchTimes()%>">
    <input type="text" id="noofcourseselect" name="noofcourseselect" value="0">
    <input type="text" id="noofDaysselect" name="noofDaysselect" value="0">
    <input type="text" id="noofBatchTimeselect" name="noofBatchTimeselect" value="0">
    <input type="text" id="amountinword" name="amountinword" value="0">

</div>