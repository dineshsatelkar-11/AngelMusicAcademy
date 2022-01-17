 


<footer>
    
    <div >
         <p class="font-12 text-gray m-0 text-center">&copy; 2017 <span class="text-theme-colored"> Angel Music</span>. All rights reserved | Designed by <a href="http://accedesoftwaresolutions.com/" class="text-theme-colored"> Accede Software Solutions </a></p>
    </div>
    <div class="clearfix"></div>
</footer>


<script>
    var close = document.getElementsByClassName("closebtn");
    var i;

    for (i = 0; i < close.length; i++) {
        close[i].onclick = function() {
            var div = this.parentElement;
            div.style.opacity = "0";
            setTimeout(function() {
                div.style.display = "none";
            }, 600);
        }
    }
    
    
    
   
</script>

<style>
    
    
     [role=main] {
 margin-left: 20px;
 margin-top: 51px;
}
    
</style>
<%
    }

        
        else
{
    
    response.sendRedirect("../../index1.jsp");
    }
%>
                       
