<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.security.MessageDigest"%>
<!DOCTYPE html>
<html lang="en">
  <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
  
   

  <body class="nav-md" onload="submitPayuForm();">
    <div class="container body">
      <div class="main_container">
       
          <%@ include file = "../comman_files/StudentSideBar.jsp" %>
      

        <!-- top navigation -->
       <%@ include file = "../comman_files/StudentTopBar.jsp" %>
        <!-- /top navigation -->
        <link href="ism/style11.css" rel="stylesheet" type="text/css"/>
        <!-- page content -->
        <div role="main">
          <!-- top tiles -->
         <%
 
        Admission register=new AdmissionDao().getAdmissionByID(studentid);
    
   int finalamt=  register.getRemaininFee();
    
        
//        http://localhost:8084/AngelOnlineExam/Succespage.jsp
        String sucess = "http://localhost:8084/AngelMusicAcademy/Admin/Student/Succespage.jsp";
        String failure = "http://localhost:8084/AngelMusicAcademy/Admin/Student/FailurePage.jsp";
//        String sucess = "https://musicofindia.org/Exam/Succespage.jsp";
//        String failure = "https://musicofindia.org/Exam/FailurePage.jsp";
        String product = "Hello";
    %>

    <%!
        public boolean empty(String s) {
            if (s == null || s.trim().equals("")) {
                return true;
            } else {
                return false;
            }
        }
    %>
    <%!
        public String hashCal(String type, String str) {
            byte[] hashseq = str.getBytes();
            StringBuffer hexString = new StringBuffer();
            try {
                MessageDigest algorithm = MessageDigest.getInstance(type);
                algorithm.reset();
                algorithm.update(hashseq);
                byte messageDigest[] = algorithm.digest();

                for (int i = 0; i < messageDigest.length; i++) {
                    String hex = Integer.toHexString(0xFF & messageDigest[i]);
                    if (hex.length() == 1) {
                        hexString.append("0");
                    }
                    hexString.append(hex);
                }

            } catch (NoSuchAlgorithmException nsae) {
            }

            return hexString.toString();

        }
    %>
    
    
    <%
//        String merchant_key = "gtKFFx";
//        String salt = "eCwWELxi";
        String merchant_key = "6poSCFhA";
        String salt = "zShERqA4sD";

        String action1 = "";
        String base_url = "https://secure.payu.in";
        int error = 0;
        String hashString = "";

        Enumeration paramNames = request.getParameterNames();
        Map<String, String> params = new HashMap<String, String>();
        while (paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();

            String paramValue = request.getParameter(paramName);
            params.put(paramName, paramValue);
        }
        String txnid = "";
        if (empty(params.get("txnid"))) {
            Random rand = new Random();
            String rndm = Integer.toString(rand.nextInt()) + (System.currentTimeMillis() / 1000L);
            txnid = hashCal("SHA-256", rndm).substring(0, 20);
        } else {
            txnid = params.get("txnid");
        }

        String txn = "abcd";
        String hash = "";
        String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
      
        if (empty(params.get("hash")) && params.size() > 0) {
            if (empty(params.get("key"))
                    || empty(params.get("txnid"))
                    || empty(params.get("amount"))
                    || empty(params.get("firstname"))
                    || empty(params.get("email"))
                    || empty(params.get("phone"))
                    || empty(params.get("productinfo"))
                    || empty(params.get("surl"))
                    || empty(params.get("furl"))  
                    || empty(params.get("service_provider")))
            {
                error = 1;
            } else {
                String[] hashVarSeq = hashSequence.split("\\|");

                for (String part : hashVarSeq) {
                    hashString = (empty(params.get(part))) ? hashString.concat("") : hashString.concat(params.get(part));
                    hashString = hashString.concat("|");
                }
                hashString = hashString.concat(salt);

                hash = hashCal("SHA-512", hashString);
                action1 = base_url.concat("/_payment");
            }
        } else if (!empty(params.get("hash"))) {
            hash = params.get("hash");
            action1 = base_url.concat("/_payment");
        }

    %>



    <script>
        var hash = '<%= hash%>';
       
        function submitPayuForm() {

            if (hash == '')
                return;
            var payuForm = document.forms.payuForm;
            payuForm.submit();
        }
    </script>
          <!-- /top tiles -->
  

<div class='container' >
  <div class="container">
            <div id="Checkout" class="inline">
                <h1>Pay Invoice</h1>
                <div class="card-row">
                    <span class="visa"></span>
                    <span class="mastercard"></span>
                    <span class="amex"></span>
                    <span class="discover"></span>
                </div>
                <form action="<%= action1%>" method="post" name="payuForm">
                    <input type="hidden" name="key" value="<%= merchant_key%>" />
                    <input type="hidden" name="hash" value="<%= hash%>"/>
                    
                    <input type="hidden" name="txnid" value="<%= txnid%>" />
                    
                    <input type="hidden" name="service_provider" value="payu_paisa" />
                    <div class="form-group">
                        <label for="PaymentAmount">Payment amount</label>
                        <div class="amount-placeholder">
                            Rs<span  id="aamount">. <%=finalamt%></span>
                            <div id="amount1">
                                <span></span>

                                <input id="amount" name="amount" value="<%=finalamt%>"  class="null card-image form-control" type="hidden"></input>
                            </div></div>
                    </div>

                    <div class="form-group">
                        <label or="NameOnCard">Name</label>
                        <input id="firstname" name="firstname" value="<%=register.getFirstName()%>"  class="form-control" type="text" maxlength="255"></input>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="CreditCardNumber">Email</label>
                        <input id="email" name="email" class="null card-image form-control"  value="<%=register.getCustomerAccount().getEmail()%>" type="text"></input>
                    </div>  <br>
                    <div class="form-group">
                        <label for="CreditCardNumber">Phone</label>
                        <input id="phone" name="phone" value="<%=register.getCustomerAccount().getMobileNo()%>"  class="null card-image form-control" type="text"></input>
                    </div>  <br>
                    <div class="form-group">
                        <!--              <label for="CreditCardNumber">Product</label>-->
                        <input name="productinfo"  value="<%=product%>" size="64"  class="null card-image form-control" type="hidden"></input>
                    </div>  <br>
                    <div class="form-group">
                        <!--              <label for="CreditCardNumber">Success Url</label>-->
                        <input name="surl" value="<%=sucess%>" size="64"  class="null card-image form-control" type="hidden"></input>
                    </div>  <br>
                    <div class="form-group">
                        <!--              <label for="CreditCardNumber">Failure</label>-->
                        <input name="furl" value="<%=failure%>" size="64" class="null card-image form-control" type="hidden"></input>
                    </div>  <br>
                    <input type="hidden" name="udf1" id="round" value="" />

                    <% if (empty(hash)) { %>

                    <button id="PayButton" class="btn btn-block btn-success submit-button" type="submit">
                        <span class="submit-button-lock"></span>
                        <span   class="align-middle">Pay Rs&nbsp<span id="bamount"></span><%=finalamt%></span>
                    </button>
                    <% } %>
                </form>
            </div>
        </div>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>



        <script  src="js/index.js"></script>
        
          <br />



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
