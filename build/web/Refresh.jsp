




<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<% int j = 0;
    BranchDao bd = new BranchDao();
    Branch b = new Branch();
    List<Branch> c = bd.getAllBranch();
    for (Branch p : c) {
        j++;
        System.out.println("Adminname-"+p.getAdminName());
        System.out.println("Bracnname-"+p.getBranchName());
        System.out.println("Timing-"+new Date());
    }

%>