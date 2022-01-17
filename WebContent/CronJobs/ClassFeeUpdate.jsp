<%@page import="java.util.Iterator"%>
<%@page import="com.accede.angel.services.SendMail1"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="java.util.Map"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.accede.angel.services.SendMessage"%>
<%@page import="com.accede.angel.services.SendMail"%>
<%@page import="com.accede.angel.admin.dao.PaymentDao"%>
<%@page import="com.accede.angel.admin.model.Payment"%>
<%@page import="com.accede.angel.admin.model.PaymentFollowupMessage"%>
<%@page import="com.accede.angel.admin.dao.PaymentFollowupDao"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.accede.angel.admin.model.PaymentFollowup"%>
<%@page import="java.util.Date"%>
<%@page import="com.accede.angel.admin.model.StudentAccount"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.accede.angel.services.Dates"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>



<%
    AdmissionDao cd = new AdmissionDao();
    List<Admission> cl = null;

    cl = cd.getStudentListRegular1();
    SendMail1 sendmail = new SendMail1();
    String msg = "Cron job Heat on " + new Date() + "";
    String email = "angelmusictest@gmail.com";
    String subject = "Class Fee Count";
    sendmail.mailsend(email, msg, subject);
    Map<Admin, Integer> asd = new HashMap<Admin, Integer>();
    msg = "Total no of Student Count -" + cl.size();

    subject = "Class Fee Count";
    
    
    SendMail.mailsend("angelmusictest@gmail.com", "Cron Job Heat on "+new Date(), "Cron Job Heat");
    sendmail.mailsend(email, msg, subject);
    int i = 0;
    CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
    CustomerAccount CustomerAccount = new CustomerAccount();
    if (cl != null && cl.size() > 0) {
        for (Admission p : cl) {

           
            i++;
            System.out.println("i==" + i);
            CustomerAccount = p.getCustomerAccount();
            Dates dates = new Dates();

            List<StudentAccount> allAccount = new ArrayList<StudentAccount>();
            Date nextPaymentDate = dates.getEndingDate(p.getNextPaymentDate(), p.getPackageCourse().getPaymentMode() * 30);
            StudentAccount StudentAccount = new StudentAccount();
            StudentAccount.setPaymentMode("Software");
            StudentAccount.setAmountinWord("");
            StudentAccount.setPackageFee(p.getPackageCourse().getFee());
            StudentAccount.setDisamount(p.getDisamount());
            StudentAccount.setDiscper(p.getDiscper());
            StudentAccount.setFinalamount(p.getFee() - p.getDisamount() + p.getRemaininFee());
            int paidamount = 0;
            if (p.getRemaininFee() < 0) {
                StudentAccount.setPaid(p.getRemaininFee() - 2 * p.getRemaininFee());
                paidamount = p.getRemaininFee() - 2 * p.getRemaininFee();
                int remainfee = p.getRemaininFee();
                StudentAccount.setTotalremfee(p.getFee() - p.getDisamount() - (p.getRemaininFee() - (2 * p.getRemaininFee())));
                p.setRemaininFee(p.getFee() - p.getDisamount() - (remainfee - (2 * remainfee)));
            } else {
                StudentAccount.setPaid(0);
                StudentAccount.setTotalremfee(p.getFee() - p.getDisamount() + p.getRemaininFee());
                int remainfee = p.getRemaininFee();
                p.setRemaininFee(p.getFee() - p.getDisamount() + remainfee);
            }
            StudentAccount.setPreviousBalance(p.getRemaininFee());

            StudentAccount.setCourseName(p.getCourseName());
            StudentAccount.setDays(p.getDaysInWeek());
            StudentAccount.setBatches(p.getBatchTimings());
            StudentAccount.setCustomerAccount(CustomerAccount);
            StudentAccount.setPackagename(p.getPackageCourse().getPackagename());
            StudentAccount.setDescription(p.getPackageCourse().getDescription());
            StudentAccount.setNoofBatchTimes(p.getPackageCourse().getNoofBatchTimes());
            StudentAccount.setNoofcourse(p.getPackageCourse().getNoofcourse());
            StudentAccount.setNoofdays(p.getPackageCourse().getNoofdays());
            StudentAccount.setNextPaymentDate(nextPaymentDate);
            StudentAccount.setCourseDuration(p.getPackageCourse().getCourseDuration());
            StudentAccount.setFeeType("Monthly Payment By Software");
            List<StudentAccount> account = new ArrayList<StudentAccount>();
            account = p.getStudentAccount();
            Boolean b = cd.saveStudentAccount(StudentAccount);
            if (b) {
                account.add(StudentAccount);
                p.setStudentAccount(account);
                p.setNextPaymentDate(nextPaymentDate);

                b = cd.updateAdmission(p);
                if (b) {
                    if (p.getRemaininFee() > 0) {
                        PaymentFollowup PaymentFollowup = new PaymentFollowup();

                        PaymentFollowup.setCustomerAccount(CustomerAccount);
                        Date nextdate = dates.getEndingDate(new Date(), 1);
                        PaymentFollowup.setRequestDate(new Date());

                        PaymentFollowup.setTypeofoffollowup("Music Class");

                        PaymentFollowup.setNextfollowupdate(nextdate);

                        String message = "Student Course Payment," + "\n"
                                + "Admission No:-. " + p.getAdmissionNo() + "\n"
                                + "Mobile No:-. " + CustomerAccount.getMobileNo() + "\n"
                                + "Total Fee Amount. " + (p.getFee() - p.getDisamount() + p.getRemaininFee()) + "\n"
                                + "Paid Amount. " + paidamount + "\n"
                                + "Balance Amount. " + p.getRemaininFee() + "\n";

                        PaymentFollowup.setAdminOfBranch(p.getAdminOfBranch());
                        PaymentFollowupDao PaymentFollowupDao = new PaymentFollowupDao();
                        PaymentFollowupDao.savePaymentFollowup(PaymentFollowup);
                        int paymentId = new PaymentFollowupDao().getLastPaymentFollowupID();
                        if (paymentId != 0) {
                            PaymentFollowupMessage PaymentFollowupMessage = new PaymentFollowupMessage();
                            PaymentFollowup = PaymentFollowupDao.getPaymentFollowupByID(paymentId);
                            PaymentFollowupMessage.setDescription(message);
                            PaymentFollowupMessage.setFollowupdate(new Date());
                            PaymentFollowupMessage.setPaymentFollowup(PaymentFollowup);
                            PaymentFollowupDao.savePaymentFollowupMessage(PaymentFollowupMessage);
                        }

                    }

                    CustomerAccountDao.updateCustomerAccount(CustomerAccount);
                    String Rent = "Admissionno No- ";
                    String agains = Rent + p.getAdmissionNo();
                    Payment pay = new Payment();
                    pay.setAmount(paidamount);
                    pay.setDescription("Student Monthly Course Payment");
                    pay.setAdminOfBranch(p.getAdminOfBranch());
                    pay.setPaymentMode("Software");
                    pay.setPaymentType("Credit");
                    pay.setCustomerAccount(CustomerAccount);
                    pay.setPaymentAgains(agains);
                    new PaymentDao().savePayment(pay);
                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
                    String dateee = DATE_FORMAT.format(nextPaymentDate);
                    String Emailmsg = "Dear Candidate," + "\n"
                            + "Thanku for paying an amount of Rs. " + paidamount + "\n"
                            + "Next Payment Date is . " + dateee + "\n"
                            + "Your Balance Amount. " + p.getRemaininFee() + "\n"
                            + "Please Pay Balance Amount as early as possible.... ";

                    subject = "Payment Details";
//                    SendMail.mailsend(p.getEmail(), Emailmsg, subject);
                    SendMessage.sendMobileMSG(p.getContactNo(), Emailmsg, p.getAdminOfBranch());

                } else {

                }
            }

        }

    }
    
    int sizee = cl.size();

    SendMessage.sendMobileMSG("8956276855", Integer.toString(sizee));
    SendMail.mailsend("angelmusictest@gmail.com", msg, "no of student fee");
     if (cl != null && cl.size() > 0) {
        for (Admission p : cl) {

            if (asd != null) {
                if (asd.containsKey(p.getAdminOfBranch())) {
                    asd.put(p.getAdminOfBranch(), asd.get(p.getAdminOfBranch()) + 1);
                } else {
                    asd.put(p.getAdminOfBranch(), 1);
                }
            } else {
                // Key might be present...
                asd.put(p.getAdminOfBranch(), 1);
            }}}

    Iterator<Map.Entry<Admin, Integer>> itr = asd.entrySet().iterator();

    while (itr.hasNext()) {
        Map.Entry<Admin, Integer> entry = itr.next();
        System.out.println("Branch Name = " + entry.getKey().getAdminOfBranch().getBranchName()
                + ", ******Count of Student = " + entry.getValue());

        msg = "Branch Name = " + entry.getKey().getAdminOfBranch().getBranchName()
                + ", ******Count of Student = " + entry.getValue();

        subject = "Class Fee Count Branch Wise";
        sendmail.mailsend(email, msg, subject);

    }

    msg = "No Student Having Today Due Date";
    for (Map.Entry<Admin, Integer> entry : asd.entrySet()) {
        msg = " Today  No of Student Due Date " + "\n"
                + " " + entry.getKey().getAdminOfBranch().getBranchName() + ":-" + entry.getValue();
    }

    SendMessage.sendMobileMSG(msg);
    
int allsessioncount= new AdminDao().getAllSessionKey().size();
if(allsessioncount>0)
{
    new AdminDao().deletesessionkey();
}

%>
