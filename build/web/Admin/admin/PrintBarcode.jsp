<%-- 
    Document   : Invoice_Print1
    Created on : 13 Jul, 2017, 11:39:15 AM
    Author     : admin
--%>
<%@page import="com.accede.angel.sell.dao.ProductDao1"%>
<%@page import="com.accede.angel.sell.model.ProductModel"%>
<%@include file="../comman_files/BranchReceptionHeader.jsp"%>

      
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head  margin="1px" padding="0">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
      
    </head>
    <style>
        .row{
            margin-top: 3px;
            margin-bottom: 0px;
            padding: 0px
        }
        
    </style>
    <style>
        .row1{
            margin-top: 10px;
            margin-bottom: 0px;
            padding: 0px
        }
        
    </style>
 <style>
        .row2{
            margin-top: 150px;
            margin-bottom: 0px;
            padding: 0px
        }
        
    </style>

    <style>
        .row3{
            margin-top: 15px;
            margin-bottom: 0px;
            padding: 0px
        }
        
    </style>
     <style>
        .row4{
            margin-top: 150px;
            margin-bottom: 0px;
            padding: 0px
        }
        img
        {
           height: 22px;
width:123px;
        }
        
        
        
    </style>
    
         
    <%
        int id = Integer.parseInt(request.getParameter("modal_prd_id"));
        int quant = Integer.parseInt(request.getParameter("modal_prd_quant"));
        
//       int id=1;
        ProductModel pr = new ProductModel();
        ProductDao1 pd = new ProductDao1();
        pr = pd.getProductByID(id);
        String imagpath = pr.getBarcode().getImagename();
        float MRP=pr.getUnitPrice();
        
        
    %>
   <body onload="window.print();"  margin="0" padding="0" >

        <!-- Main content -->

        <!-- title row -->
       
          <div class="row" margin="0" padding="0" >
             <%if(quant >= 1){%>
             
            <div class="col-xs-3 text-center">
                <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                <p>MRP PRICE:- <%=MRP%></p>
              
            </div>
                <%}%>
                  <%if(quant >= 2){%>
                
            <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>
                  <%if(quant >= 3){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                     <p>MRP PRICE:- <%=MRP%></p>
            </div>
              <%}%>
                  <%if(quant >= 4){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
              <%}%>
                
        </div>
         
        
          <div class="row1">
               <%if(quant >= 5){%>
            <div class="col-xs-3 text-center">
                <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                <p>MRP PRICE:- <%=MRP%></p>
              
            </div>
                  <%}%>
                  <%if(quant >= 6){%>
            <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
              <%}%>
                  <%if(quant >= 7){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                     <p>MRP PRICE:- <%=MRP%></p>
            </div>
              <%}%>
                  <%if(quant >= 8){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
               <%}%>
        </div>
      
         <div class="row1" >
               
                  <%if(quant >= 9){%>
            <div class="col-xs-3 text-center">
                <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                <p>MRP PRICE:- <%=MRP%></p>
              
            </div>
                 <%}%>
                  <%if(quant >= 10){%>
            <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>
                  <%if(quant >= 11){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                     <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>
                  <%if(quant >= 12){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>
        </div>

       
     <div class="row1">
             <%if(quant >= 13){%>
            <div class="col-xs-3 text-center">
                <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                <p>MRP PRICE:- <%=MRP%></p>
              
            </div>
                <%}%>   <%if(quant >= 14){%>
            <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
                <%}%>   <%if(quant >= 15){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                     <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>   <%if(quant >= 16){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
               <%}%>   
        </div>
    
        
         <div class="row">
            <%if(quant >= 17){%>
            <div class="col-xs-3 text-center">
                <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                <p>MRP PRICE:- <%=MRP%></p>
              
            </div>
                 <%}%>   <%if(quant >= 18){%>
            <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
              <%}%>   <%if(quant >= 19){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                     <p>MRP PRICE:- <%=MRP%></p>
            </div>
              <%}%>   <%if(quant >= 20){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>  
        </div>
       
    <div class="row3">
      <%if(quant >= 21){%>
            <div class="col-xs-3 text-center">
                <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                <p>MRP PRICE:- <%=MRP%></p>
              
            </div>
                 <%}%>   <%if(quant >= 22){%>
            <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>   <%if(quant >= 23){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                     <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>   <%if(quant >= 24){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>  
        </div>

        
      <div class="row">
            <%if(quant >= 25){%>
            <div class="col-xs-3 text-center">
                <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                <p>MRP PRICE:- <%=MRP%></p>
              
            </div>
                 <%}%>      <%if(quant >= 26){%>
            <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
              <%}%>      <%if(quant >= 27){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                     <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>      <%if(quant >= 28){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
              <%}%>     
        </div>
     
      <div class="row1">
         <%if(quant >= 29){%>
            <div class="col-xs-3 text-center">
                <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                <p>MRP PRICE:- <%=MRP%></p>
              
            </div>
                  <%}%>      <%if(quant >= 30){%>
            <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
              <%}%>      <%if(quant >= 31){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                     <p>MRP PRICE:- <%=MRP%></p>
            </div>
              <%}%>      <%if(quant >= 32){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
              <%}%>     
        </div>
       
      <div class="row">
                <%if(quant >= 33){%>
            <div class="col-xs-3 text-center">
                <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                <p>MRP PRICE:- <%=MRP%></p>
              
            </div>
                  <%}%>      <%if(quant >= 34){%>
            <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
              <%}%>      <%if(quant >= 35){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                     <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>      <%if(quant >= 36){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>     
        </div>

     
   <div class="row1">
         <%if(quant >= 37){%>
            <div class="col-xs-3 text-center">
                <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                <p>MRP PRICE:- <%=MRP%></p>
              
            </div>
                 <%}%>      <%if(quant >= 38){%>
            <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>      <%if(quant >= 39){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                     <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>      <%if(quant >= 40){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>     
        </div>
       
     <div class="row3">
             <%if(quant >= 41){%>
            <div class="col-xs-3 text-center">
                <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                <p>MRP PRICE:- <%=MRP%></p>
              
            </div>
                 <%}%>      <%if(quant >= 42){%>
            <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>      <%if(quant >= 43){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                     <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>      <%if(quant >= 44){%>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <%}%>     
        </div>

      
<!--        <div class="row2" >
            <div class="col-xs-3 text-center">
                <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                <p>MRP PRICE:- <%=MRP%></p>
              
            </div>
            <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                     <p>MRP PRICE:- <%=MRP%></p>
            </div>
             <div class="col-xs-3 text-center">
                  <p>Angel Music</p>
                <img src="../../Barcode/<%=imagpath%>"  alt="..." >
                    <p>MRP PRICE:- <%=MRP%></p>
            </div>
        </div>-->

    </body>
</html>

