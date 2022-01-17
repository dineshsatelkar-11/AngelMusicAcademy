

<%@page import="com.accede.angel.sell.dao.CustomerSaleDAO"%>
<%@page import="com.accede.angel.sell.model.CustomerSale"%>
<%@page import="com.accede.angel.sell.model.CustomerSaleDetails"%>
<%@page import="com.accede.angel.sell.model.BranchSaleDetails"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.sell.dao.SaveBranchSaleDAO"%>
<%@page import="com.accede.angel.sell.model.BranchSale"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
  <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
<%

    String purchaseid = request.getParameter("purchaseid");
    System.out.println("purchaseid"+purchaseid);
    int saleid=Integer.parseInt(purchaseid);
    CustomerSale customersale = new CustomerSale();
    CustomerSaleDAO purchase = new CustomerSaleDAO();
    customersale = purchase.getpurchaseByID(saleid);

    

%>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
       
        <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
       

        <!-- top navigation -->
       <%@ include file = "../comman_files/adminTopBar.jsp" %>


                <!-- page content -->
                <div  role="main">
                    <div class="">

                      
                        <div class="row">
                           <div class="col-md-12 col-sm-12 col-xs-12">

                                <!-- form date pickers -->
                                
                                    <div class="container cropper hidedata">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <div class="img-container">
                                                    <img id="image" src="images/cropper.jpg" alt="Picture">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-9 docs-buttons">
                                                <h3 class="page-header">Toolbar:</h3> 
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="setDragMode" data-option="move" title="Move">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
                                                            <span class="fa fa-arrows"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="setDragMode" data-option="crop" title="Crop">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setDragMode&quot;, &quot;crop&quot;)">
                                                            <span class="fa fa-crop"></span>
                                                        </span>
                                                    </button>
                                                </div>

                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="zoom" data-option="0.1" title="Zoom In">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;zoom&quot;, 0.1)">
                                                            <span class="fa fa-search-plus"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="zoom" data-option="-0.1" title="Zoom Out">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;zoom&quot;, -0.1)">
                                                            <span class="fa fa-search-minus"></span>
                                                        </span>
                                                    </button>
                                                </div>

                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="move" data-option="-10" data-second-option="0" title="Move Left">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;move&quot;, -10, 0)">
                                                            <span class="fa fa-arrow-left"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="move" data-option="10" data-second-option="0" title="Move Right">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;move&quot;, 10, 0)">
                                                            <span class="fa fa-arrow-right"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="-10" title="Move Up">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;move&quot;, 0, -10)">
                                                            <span class="fa fa-arrow-up"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="10" title="Move Down">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;move&quot;, 0, 10)">
                                                            <span class="fa fa-arrow-down"></span>
                                                        </span>
                                                    </button>
                                                </div>

                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="rotate" data-option="-45" title="Rotate Left">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;rotate&quot;, -45)">
                                                            <span class="fa fa-rotate-left"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="rotate" data-option="45" title="Rotate Right">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;rotate&quot;, 45)">
                                                            <span class="fa fa-rotate-right"></span>
                                                        </span>
                                                    </button>
                                                </div>

                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="scaleX" data-option="-1" title="Flip Horizontal">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;scaleX&quot;, -1)">
                                                            <span class="fa fa-arrows-h"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="scaleY" data-option="-1" title="Flip Vertical">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;scaleY&quot;, -1)">
                                                            <span class="fa fa-arrows-v"></span>
                                                        </span>
                                                    </button>
                                                </div>

                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="crop" title="Crop">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;crop&quot;)">
                                                            <span class="fa fa-check"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="clear" title="Clear">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;clear&quot;)">
                                                            <span class="fa fa-remove"></span>
                                                        </span>
                                                    </button>
                                                </div>

                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="disable" title="Disable">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;disable&quot;)">
                                                            <span class="fa fa-lock"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="enable" title="Enable">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;enable&quot;)">
                                                            <span class="fa fa-unlock"></span>
                                                        </span>
                                                    </button>
                                                </div>

                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="reset" title="Reset">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;reset&quot;)">
                                                            <span class="fa fa-refresh"></span>
                                                        </span>
                                                    </button>
                                                    <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
                                                        <input type="file" class="sr-only" id="inputImage" name="file" accept="image/*">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="Import image with Blob URLs">
                                                            <span class="fa fa-upload"></span>
                                                        </span>
                                                    </label>
                                                    <button type="button" class="btn btn-primary" data-method="destroy" title="Destroy">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;destroy&quot;)">
                                                            <span class="fa fa-power-off"></span>
                                                        </span>
                                                    </button>
                                                </div>

                                                <div class="btn-group btn-group-crop">
                                                    <button type="button" class="btn btn-primary" data-method="getCroppedCanvas">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;getCroppedCanvas&quot;)">
                                                            Get Cropped Canvas
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="getCroppedCanvas" data-option="{ &quot;width&quot;: 160, &quot;height&quot;: 90 }">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;getCroppedCanvas&quot;, { width: 160, height: 90 })">
                                                            160&times;90
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="getCroppedCanvas" data-option="{ &quot;width&quot;: 320, &quot;height&quot;: 180 }">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;getCroppedCanvas&quot;, { width: 320, height: 180 })">
                                                            320&times;180
                                                        </span>
                                                    </button>
                                                </div>

                                                Show the cropped image in modal 
                                                <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                <h4 class="modal-title" id="getCroppedCanvasTitle">Cropped</h4>
                                                            </div>
                                                            <div class="modal-body"></div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                <a class="btn btn-primary" id="download" href="javascript:void(0);" download="cropped.png">Download</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> /.modal 

                                                <button type="button" class="btn btn-primary" data-method="getData" data-option data-target="#putData">
                                                    <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;getData&quot;)">
                                                        Get Data
                                                    </span>
                                                </button>
                                                <button type="button" class="btn btn-primary" data-method="setData" data-target="#putData">
                                                    <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setData&quot;, data)">
                                                        Set Data
                                                    </span>
                                                </button>
                                                <button type="button" class="btn btn-primary" data-method="getContainerData" data-option data-target="#putData">
                                                    <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;getContainerData&quot;)">
                                                        Get Container Data
                                                    </span>
                                                </button>
                                                <button type="button" class="btn btn-primary" data-method="getImageData" data-option data-target="#putData">
                                                    <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;getImageData&quot;)">
                                                        Get Image Data
                                                    </span>
                                                </button>
                                                <button type="button" class="btn btn-primary" data-method="getCanvasData" data-option data-target="#putData">
                                                    <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;getCanvasData&quot;)">
                                                        Get Canvas Data
                                                    </span>
                                                </button>
                                                <button type="button" class="btn btn-primary" data-method="setCanvasData" data-target="#putData">
                                                    <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setCanvasData&quot;, data)">
                                                        Set Canvas Data
                                                    </span>
                                                </button>
                                                <button type="button" class="btn btn-primary" data-method="getCropBoxData" data-option data-target="#putData">
                                                    <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;getCropBoxData&quot;)">
                                                        Get Crop Box Data
                                                    </span>
                                                </button>
                                                <button type="button" class="btn btn-primary" data-method="setCropBoxData" data-target="#putData">
                                                    <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setCropBoxData&quot;, data)">
                                                        Set Crop Box Data
                                                    </span>
                                                </button>
                                                <button type="button" class="btn btn-primary" data-method="moveTo" data-option="0">
                                                    <span class="docs-tooltip" data-toggle="tooltip" title="cropper.moveTo(0)">
                                                        0,0
                                                    </span>
                                                </button>
                                                <button type="button" class="btn btn-primary" data-method="zoomTo" data-option="1">
                                                    <span class="docs-tooltip" data-toggle="tooltip" title="cropper.zoomTo(1)">
                                                        100%
                                                    </span>
                                                </button>
                                                <button type="button" class="btn btn-primary" data-method="rotateTo" data-option="180">
                                                    <span class="docs-tooltip" data-toggle="tooltip" title="cropper.rotateTo(180)">
                                                        180°
                                                    </span>
                                                </button>
                                                <input type="text" class="form-control" id="putData" placeholder="Get data to here or set data with this value">
                                            </div> /.docs-buttons 

                                            <div class="col-md-3 docs-toggles">
                                                <h3 class="page-header">Toggles:</h3> 
                                                <div class="btn-group btn-group-justified" data-toggle="buttons">
                                                    <label class="btn btn-primary active">
                                                        <input type="radio" class="sr-only" id="aspectRatio0" name="aspectRatio" value="1.7777777777777777">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: 16 / 9">
                                                            16:9
                                                        </span>
                                                    </label>
                                                    <label class="btn btn-primary">
                                                        <input type="radio" class="sr-only" id="aspectRatio1" name="aspectRatio" value="1.3333333333333333">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: 4 / 3">
                                                            4:3
                                                        </span>
                                                    </label>
                                                    <label class="btn btn-primary">
                                                        <input type="radio" class="sr-only" id="aspectRatio2" name="aspectRatio" value="1">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: 1 / 1">
                                                            1:1
                                                        </span>
                                                    </label>
                                                    <label class="btn btn-primary">
                                                        <input type="radio" class="sr-only" id="aspectRatio3" name="aspectRatio" value="0.6666666666666666">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: 2 / 3">
                                                            2:3
                                                        </span>
                                                    </label>
                                                    <label class="btn btn-primary">
                                                        <input type="radio" class="sr-only" id="aspectRatio4" name="aspectRatio" value="NaN">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: NaN">
                                                            Free
                                                        </span>
                                                    </label>
                                                </div>

                                                <div class="btn-group btn-group-justified" data-toggle="buttons">
                                                    <label class="btn btn-primary active">
                                                        <input type="radio" class="sr-only" id="viewMode0" name="viewMode" value="0" checked>
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="View Mode 0">
                                                            VM0
                                                        </span>
                                                    </label>
                                                    <label class="btn btn-primary">
                                                        <input type="radio" class="sr-only" id="viewMode1" name="viewMode" value="1">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="View Mode 1">
                                                            VM1
                                                        </span>
                                                    </label>
                                                    <label class="btn btn-primary">
                                                        <input type="radio" class="sr-only" id="viewMode2" name="viewMode" value="2">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="View Mode 2">
                                                            VM2
                                                        </span>
                                                    </label>
                                                    <label class="btn btn-primary">
                                                        <input type="radio" class="sr-only" id="viewMode3" name="viewMode" value="3">
                                                        <span class="docs-tooltip" data-toggle="tooltip" title="View Mode 3">
                                                            VM3
                                                        </span>
                                                    </label>
                                                </div>

                                                <div class="dropdown dropup docs-options">
                                                    <button type="button" class="btn btn-primary btn-block dropdown-toggle" id="toggleOptions" data-toggle="dropdown" aria-expanded="true">
                                                        Toggle Options
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu" aria-labelledby="toggleOptions" role="menu">
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="responsive" checked>
                                                                responsive
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="restore" checked>
                                                                restore
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="checkCrossOrigin" checked>
                                                                checkCrossOrigin
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="checkOrientation" checked>
                                                                checkOrientation
                                                            </label>
                                                        </li>

                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="modal" checked>
                                                                modal
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="guides" checked>
                                                                guides
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="center" checked>
                                                                center
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="highlight" checked>
                                                                highlight
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="background" checked>
                                                                background
                                                            </label>
                                                        </li>

                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="autoCrop" checked>
                                                                autoCrop
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="movable" checked>
                                                                movable
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="rotatable" checked>
                                                                rotatable
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="scalable" checked>
                                                                scalable
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="zoomable" checked>
                                                                zoomable
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="zoomOnTouch" checked>
                                                                zoomOnTouch
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="zoomOnWheel" checked>
                                                                zoomOnWheel
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="cropBoxMovable" checked>
                                                                cropBoxMovable
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="cropBoxResizable" checked>
                                                                cropBoxResizable
                                                            </label>
                                                        </li>
                                                        <li role="presentation">
                                                            <label class="checkbox-inline">
                                                                <input type="checkbox" name="toggleDragModeOnDblclick" checked>
                                                                toggleDragModeOnDblclick
                                                            </label>
                                                        </li>
                                                    </ul>
                                                </div> /.dropdown 

                                                <a class="btn btn-default btn-block" data-toggle="tooltip" href="https://fengyuanchen.github.io/cropperjs" title="Cropper without jQuery">Cropper.js</a>

                                            </div> /.docs-toggles 
                                        </div>
                                    </div>
                                    <!-- /image cropping -->
                                
                            </div>
                            <div class="row" id="tablefetch">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Customer Sale Product Details</h2>
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
                                            <table id="datatable-buttons" class="table table-striped table-bordered tablefetch">
                                                <thead>
                                                    <tr>
                                                        <th>Sr No.</th>
                                                        <th>Sale Date</th>     
                                                        <th>Category</th>
                                                        <th>Model No</th> 
                                                        <th>Brand</th> 
                                                        <th>Color</th> 
                                                        <th>Sell Quantity</th> 
                                                        <th>Product Price</th> 
                                                       
                                                        <th>Total</th> 
                                                        
  


                                                    </tr>
                                                </thead>
                                                <tbody>

                                                  
                                                   
                               <%
       
        List<CustomerSaleDetails> AllProduct = customersale.getCustomerSaleDetails();
        int i = 0;
        for (CustomerSaleDetails c1 : AllProduct) {
            
          
        i++;

        %>                                <tr>
                                                      
                                                        <td><%=i%></td>
            <td><%=c1.getDate()%></td>
            <td><%=c1.getProduct().getCategory().getCategory() %></td>
            <td><%=c1.getProduct().getModel().getModelName() %></td>
            <td><%=c1.getProduct().getBrand().getBrand() %></td>
            <td><%=c1.getProduct().getColorModel().getColorName()  %></td>
           
            <td><%=c1.getProductquantity()%></td>
            <td><%=c1.getMrpprice()%></td>
           
            <td><%=c1.getGross_amount()%></td>

                        <%
                           }
                        %>
                       
                                                    
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="outputt">   </div>                    
                        </div>
                    </div>
                    <!-- /page content -->
                    
                    <!-- footer content -->
                    <%@ include file = "../comman_files/BranchFooter.jsp" %>
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
        <!-- iCheck -->
        <script src="../vendors/iCheck/icheck.min.js"></script>
        <!-- Datatables -->
        <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
        <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
        <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
        <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
        <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
        <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
        <script src="../vendors/jszip/dist/jszip.min.js"></script>
        <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
        <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
        <style>

            .table_center{

                text-align: center;
            }




        </style>


        <%@ include file = "JavaScriptFile.jsp" %>

            <script type="text/javascript">
                $(document).ready(function() {
                    $(".hidedata").hide();
                });

                $('.search').click(function(event) {
                  alert("garimaaa!!!!");
                    var num = document.getElementById("search1").innerHTML;
                    var res = num.split("-");
                    var start = res[0];
                    var end = res[1];
                     var Branch = $("#Branch").val().trim();
                    
                    alert("garimaaaaaa!!!!" + num);
                    $.ajax({
                        url: "ReportFetchAjax.jsp",
                        type: "post",
                        data: {start: start, end: end,Branch:Branch},
                        success: function(response) {
                            alert("garimaaaaaa!!!!");
                            $(".tablefetch").html(response);
 alert("garimaaaaaa!!!!final");
                        },
                       
                       
                    });

                });
              
               $('.btn9').click (function() {
                    //alert('adsjhfgadsf');
                   var purchaseid = this.id;
                    if (purchaseid.trim() !== "")
                    {
                        alert('adsjhfgadsf===' + purchaseid);
                        $.ajax({
                            url: "ViewAllProductSaleToBranchAjax.jsp",
                            type: "post",
                            data: {purchaseid: purchaseid},
                            success: function(response) {
                              alert('success1');
                                $("#outputt").html(response);
                              alert('success2');
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                console.log(textStatus, errorThrown);
                            }
                        });
                    }
                   
                }); 
                
               
               


            </script>
            </div>
    </body>
</html> 