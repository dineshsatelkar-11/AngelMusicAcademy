<!DOCTYPE html>
<html>
    <head>
        <title>Accessing Web Camera in JS</title>

        <!-- Start: injected by Adguard -->
        <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/8CCFFF5D-2C8C-5C45-948D-562095779C3C/main.js" charset="UTF-8"></script><script src="//local.adguard.com/adguard-ajax-api/injections/userscripts/Adguard Assistant?ts=63642034447301" type="text/javascript"></script>
        <script src="//local.adguard.com/adguard-ajax-api/injections/userscripts/Adguard Popup Blocker?ts=63642034447301" type="text/javascript"></script>
        <script src="//local.adguard.com/adguard-ajax-api/injections/content-script.js?ts=63642032509391&amp;domain=doc-00-a0-docs.googleusercontent.com&amp;css=1&amp;js=1&amp;generic=1&amp;stealth=0&amp;ref=0" type="text/javascript"></script>

        <!-- End: injected by Adguard -->
    </head>
    <body>

        <video id="video"></video>
       
            <canvas id="canvas" name="image"></canvas><br>
            <input type="button" id="mob_email">
        
        <button onclick="snap();">Snap</button>
        <form>
            <script type="text/javascript">
                var video = document.getElementById('video');
                var canvas = document.getElementById('canvas');
                var context = canvas.getContext('2d');

                navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.oGetUserMedia || navigator.msGetUserMedia;

                if (navigator.getUserMedia) {
                    navigator.getUserMedia({video: true}, streamWebCam, throwError);
                }

                function streamWebCam(stream) {
                    video.src = window.URL.createObjectURL(stream);
                    video.play();
                }

                function throwError(e) {
                    alert(e.name);
                }

                function snap() {
                    canvas.width = video.clientWidth;
                    canvas.height = video.clientHeight;
                    context.drawImage(video, 0, 0);
                }









            </script>


            <script src="Alertajax.js" type="text/javascript"></script>

            <script type="text/javascript">
                $(document).ready(function() {
                     alert('fsdfsdf');
                    $('#mob_email').click(function() {
  alert('fsdfsdf');
                        var dataURL = canvas.toDataURL("image/png");
                        formdata = dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
                        $.ajax({
                            url: '../signupcanvasdopost',
                            type: 'POST',
                            data: formdata,
                            processData: false,
                            contentType: "text/html",
                            success: function(data) {

                            }
                        });
                    });
    //                $('#coursename').change(function() {
    //                    $('#allfees1').hide();
    //                    $('#allfees2').hide();
    //                    $('#allfees3').hide();
    //                    $('#allfees4').hide();
    //                    var id_menu = $(this).val().join();
    //                    var ss = id_menu.split(",");
    //                    var rowcount = 0;
    //                    $('#allfees0').hide();
    //                    var id_menu = $(this).val().join();
    //                    var ss = id_menu.split(",");
    //                    var rowcount = 0;
    //                    for (var i in ss) {
    //                        rowcount++;
    //                        //                    alert(ss[i])
    //                        $("#allfees" + i).show();
    //                        $('#Coursename' + i).val(ss[i]);
    //                    }
    //                    $('#rowcount').val(rowcount);
    //                });
                    function isNumberKey(evt) {

                        var charCode = (evt.which) ? evt.which : evt.keyCode
                        if (charCode != 46 && charCode > 31
                                && (charCode < 48 || charCode > 57))
                            return false;
                        return true;
                    }

                });
            </script>
    </body>
</html>