<html>
<head>
<title>fSelect Test</title>
<link href="fSelect.css" rel="stylesheet">
<script src="jquery-1.11.3.min.js" type="text/javascript"></script>
<!--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
<script src="fSelect.js"></script>
<script>
(function($) {
    $(function() {
        $('.test').fSelect();
    });
})(jQuery);
</script>
</head>
<body>
    <select class="test" multiple="multiple">
        <optgroup label="Group A">
            <option value="1">Option 1</option>
            <option value="2" selected>Option 2</option>
            <option value="3">Option 3</option>
            <option value="4" disabled>Option 4</option>
            <option value="5">Option 5</option>
        </optgroup>
        <optgroup label="Group B">
            <option value="6" selected>Option 6</option>
            <option value="7">Option 7</option>
            <option value="8">Option 8</option>
        </optgroup>
    </select>
</body>
</html>
