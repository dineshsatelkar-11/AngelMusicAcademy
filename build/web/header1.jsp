<footer id="footer" class="footer" data-bg-img="images/footer-bg.png" data-bg-color="#001018">
    <div class="container pt-70 pb-40">
        <div class="row border-bottom-black">
            <div class="col-sm-6 col-md-3">
                <div class="widget dark">
                    <img class="mt-10 mb-20" alt="" src="images/logo-wide-white-footer.png">
                    <p class="text-gray">5, Gulmohar Complex, Nr. Post Office,Wadagaon Sheri, Pune 411 014 (India) </p>
                    <ul class="list-inline mt-5">
                        <li class="m-0 pl-10 pr-10"> <i class="fa fa-phone text-theme-colored mr-5"></i> <a class="text-gray">+91 20 27034860, 32347050,65609292 </a> </li>
                        <li class="m-0 pl-10 pr-10"> <i class="fa fa-envelope-o text-theme-colored mr-5"></i> <a class="text-gray">info@strategemiceberg.com</a> </li>
                        <li class="m-0 pl-10 pr-10"> <i class="fa fa-globe text-theme-colored mr-5"></i> <a class="text-gray">www.strategemiceberg.com</a> </li>
                    </ul>
                    <ul class="social-icons icon-bordered icon-circled icon-sm mt-15">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-skype"></i></a></li>
                        <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                        <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="widget dark">
                    <h5 class="widget-title line-bottom">Useful Links</h5>
                    <ul class="list angle-double-right list-border">
                        <li><a href="index.html">Home</a></li>

                        <li><a href="AboutUs.html">About</a></li>

                        <li><a href="Gallery.html">Gallery</a></li>              
                    </ul>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="widget dark">
                    <h5 class="widget-title line-bottom">Quick Contact</h5>
                    <ul class="list angle-double-right list-border">
                        <li><a href="contact.aspx">Contact Us</a></li>
                    </ul>

                    <!-- Quick Contact Form Validation-->
                    <script type="text/javascript">
                        $("#footer_quick_contact_form").validate({
                            submitHandler: function (form) {
                                var form_btn = $(form).find('button[type="submit"]');
                                var form_result_div = '#form-result';
                                $(form_result_div).remove();
                                form_btn.before('<div id="form-result" class="alert alert-success" role="alert" style="display: none;"></div>');
                                var form_btn_old_msg = form_btn.html();
                                form_btn.html(form_btn.prop('disabled', true).data("loading-text"));
                                $(form).ajaxSubmit({
                                    dataType: 'json',
                                    success: function (data) {
                                        if (data.status == 'true') {
                                            $(form).find('.form-control').val('');
                                        }
                                        form_btn.prop('disabled', false).html(form_btn_old_msg);
                                        $(form_result_div).html(data.message).fadeIn('slow');
                                        setTimeout(function () {
                                            $(form_result_div).fadeOut('slow')
                                        }, 6000);
                                    }
                                });
                            }
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom" data-bg-color="#001111">
        <div class="container pt-15 pb-10">
            <div class="row">
                <div class="col-md-12">
                    <p class="font-12 text-gray m-0 text-center">Copyright &copy;2017 <span class="text-theme-colored">Strategem Iceberg</span>. All Rights Reserved Designed By <span ><a class="text-theme-colored" href="http://www.accedesoftwaresolutions.com/" target="_blank">Accede Software Solutions</a></span></p>
                </div>
            </div>
        </div>
    </div>
</footer>
<a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>