<%-- 
    Document   : StudentMaterial
    Created on : Mar 17, 2017, 6:28:22 PM
    Author     : Accede
--%>

<%@page import="com.accede.angel.admin.model.EmployeeDocuments"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDocumentsDao"%>
<%@page import="com.accede.angel.admin.model.LessonPdf"%>
<%@page import="com.accede.angel.admin.dao.LessonDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@page import="java.io.ByteArrayOutputStream"%>
        <%@page import="java.io.OutputStream"%>
        <%@page import="java.io.InputStream"%>
        <%@page import="java.io.ByteArrayInputStream"%>
        <%@page import="org.apache.commons.io.IOUtils"%>
        <%@page import="java.io.FileInputStream"%>
        <%@page import="java.io.File"%>

        <%
            String doc_id1 = request.getParameter("asd");
            System.out.println("id-" + doc_id1);
            int doc_id = Integer.parseInt(request.getParameter("asd"));
            EmployeeDocumentsDao uploadDao = new EmployeeDocumentsDao();

            EmployeeDocuments download = uploadDao.getEmployeeDocumentsByid(doc_id);

            String filename = "";

           
            String bram = download.getImage();
            filename = download.getImage();

            System.out.println("filename-" + bram);

            // clear the response header information.
            response.reset();
            // check the file type and set the header contentType accordingly..   
            if (download.getImage().endsWith(".txt")) {
                response.setContentType("application/octet-stream");
            } else if (download.getImage().endsWith(".pdf")) {
                response.setContentType("application/pdf");
            } else if (download.getImage().endsWith(".mp3")) {

                response.setContentType("application/mp3");
            } else if ((download.getImage().endsWith(".doc")) || download.getImage().endsWith(".docx")) {
                response.setContentType("application/msword");
            } else if ((download.getImage().endsWith(".xls")) || (download.getImage().endsWith(".xlsx"))) {
                response.setContentType("application/vnd.ms-excel");
            } else if (download.getImage().endsWith(".zip")) {
                response.setContentType("application/zip");
            } else if (download.getImage().endsWith(".wmv")) {
                response.setContentType("application/wmv");
            } else if (download.getImage().endsWith(".mp4")) {
                response.setContentType("application/mp4");
            }
            // add header information to response object
            response.setHeader("Content-Disposition", "attachment; filename=" + filename + ";");
            response.setHeader("Cache-Control", "no-cache");
            // create the byte array from Blob
            String path = request.getRealPath("/");
            System.out.println("path-" + path);
            File file = new File(path + "/EmployeeDocument/" + filename);
            System.out.println("file-" + file);
            FileInputStream fis = new FileInputStream(file);
            byte[] bytes = IOUtils.toByteArray(fis);

            InputStream a = new ByteArrayInputStream(bytes);

            int res = 0;

             // BidServlet bidServlet=new BidServlet();
            //  bidServlet.doGet(request, response);
            // get the response Output stream object to write the content of the file into header
            OutputStream output = response.getOutputStream();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            /* 
             while(true) {
             int n = a.read(c);
             if( n < 0 )
             {
             System.out.println("safkdajs bdsakd bkd kdfn ukfhndlsa fksafhl.fjs msafd;f  value of n"+n);
             break;
             }
  
             baos.write(c,0,n);
             }
    
             */
            int size = bytes.length;
            int max = size / 1000;
            System.out.println("maximam size is " + max);
            int j = 0;
            System.out.println("total length " + bytes.length);

            for (int i = 0; i < bytes.length; i++) {
                if (j < 100000) {
                    output.write(bytes[i]);
                    j++;
                } else {
                    j = 0;
                    Thread.sleep(100);
                }
            }

            output.close();

          // close the obejct of ResultSet

        %>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
