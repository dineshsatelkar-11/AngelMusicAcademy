

<%

    String courses = request.getParameter("idd");

    String[] cou = courses.split(",");
    int size = cou.length;


%>


<div id="output11">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <label >Admission Fee : </label>
            <input type="text" class="form-control rechide priceup"   id="adfee" name="fees" placeholder="Enter Fee" required>
        </div>
        <div class="col-md-4"></div>
    </div>
    </br> 
  
</div >