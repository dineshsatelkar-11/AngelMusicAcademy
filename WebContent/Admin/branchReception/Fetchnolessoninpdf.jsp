


<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%
    String course = request.getParameter("course");

    long id = Long.parseLong(course);
    Course cr = new CourseDao().getCourseBylongID(id);
    long nooflesson = cr.getNooflesson();


%>

<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Lesson</label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <select class="form-control" required="" id="lesson" name="lesson" style="width:326px;">
            <option value="">-Select Lesson-</option> 
            <%    for (int i = 1; i < nooflesson + 1; i++) {
            %>

            <option value="<%=i%>"> Lesson <%=i%> </option> 
            <%}%>
        </select>
    </div>
</div>



<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Enter Description <span class="required">*</span>
    </label>
    <div class="col-md-6 col-sm-6 col-xs-12">
        <textarea id="description" required="" placeholder="Address" required="required" class="form-control" name="description" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                  data-parsley-validation-threshold="10"></textarea>

    </div>
</div>
<div id="output12">

<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Select PDF  <span class="required">*</span>
    </label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <select class="form-control" required="" id="PDF" name="PDF" style="width:326px;">
            <option value="">-Select PDF-</option> 

        </select>
    </div>
    </div>
</div>
        <script src="../production/js/Alertajax.js" type="text/javascript"></script>
        
         <script type="text/javascript">
                                            $(document).ready(function () {
                                               
                                                
                                               
                                                 $("#lesson").change(function (event) {
                                                    var course = $('#course').val();
                                                    var lesson = $('#lesson').val();
                                                    $.get("FetchPdfGalleryAjax.jsp", {course: course ,lesson:lesson}, function (data) {
                                                        //   alert('sucess');
                                                        $('#output12').html(data);
                                                    });
                                                });
                                                });
                                                </script>
