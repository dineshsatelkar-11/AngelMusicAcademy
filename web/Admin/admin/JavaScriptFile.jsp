
<script type="text/javascript">

    $(document).ready(
            function()
            {
             

                $("#StockBranch").change(validate13.controls.StockBranch);
                $("#QuantityStock").change(validate13.controls.QuantityStock);



                $("#AccountAddress").change(validate10.controls.AccountAddress);
                $("#First_Name").keyup(validate10.controls.First_Name);
                $("#Account_Mobile_No").keyup(validate10.controls.Account_Mobile_No);

                $("#ExtAccountAddress").change(validate12.controls.ExtAccountAddress);
                $("#ExFirst_Name").keyup(validate12.controls.ExFirst_Name);
                $("#ExtAccount_Designation").keyup(validate12.controls.ExtAccount_Designation);
                $("#ExtAccount_Mobile_No").keyup(validate12.controls.ExtAccount_Mobile_No);

                $("#Inquiry_Mobile_No").keyup(validate11.controls.Inquiry_Mobile_No);
                $("#studentname").keyup(validate11.controls.studentname);
                $("#ref").change(validate11.controls.ref);
                $("#nxtdate1").change(validate11.controls.nxtdate1);
                $("#Inquiry_Type").change(validate11.controls.Inquiry_Type);
                $("#offer").keyup(validate11.controls.offer);
                $("#requirement").keyup(validate11.controls.requirement);
                $("#type_remark").change(validate1.controls.type_remark);
                $("#Remark").change(validate1.controls.Remark);
                $("#nxtdate").change(validate1.controls.nxtdate);
                $("#AccountCreate").click(
                        function(event)
                        {
                            event.preventDefault();
                            if (validate10.all())
                            {
                                document.getElementById("myAccount").submit();
                            }
                        });

                $("#ExtAccountCreatebtn").click(
                        function(event)
                        {
                            event.preventDefault();
                            if (validate12.all())
                            {
                                document.getElementById("ExtAccountCreate").submit();
                            }
                        });

                $("#myEnquirybtn").click(
                        function(event)
                        {
                            event.preventDefault();
                            if (validate11.all())
                            {
                                document.getElementById("myEnquiry").submit();
                            }
                        });
                $("#SubmitButton2").click(
                        function(event)
                        {

                            event.preventDefault();
                            if (validate1.all())
                            {


                                document.getElementById("myForm1").submit();
                            }
                        });


                $("#trasferbutton").click(
                        function(event)
                        {

                            event.preventDefault();
                            if (validate13.all())
                            {


                                document.getElementById("sendstockform").submit();
                            }
                        });
            });





    var validate13 =
            (function()
            {


                var all =
                        function()
                        {
                            var invalidControls = [];
                            var i = 0;
                            for (var controlValidationMethod in validate13.controls)
                            {


                                if (!validate13.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
                                {
                                    invalidControls.push(controlValidationMethod);
                                }
                            }

                            if (invalidControls.length > 0)
                            {
                                // Set focus on the first erroneous control
                                $("#" + invalidControls[0]).focus();
                            }
                            return invalidControls.length == 0;
                        };
                var controls =
                        {
                            StockBranch:
                                    function()
                                    {
//                                          

                                        var $input = $(this);
                                        var StockBranch = $('#StockBranch').val();
                                        var isValid = true;
                                        if (StockBranch === "")
                                        {

                                            $input.formError("Please Select Branch   ");


                                            isValid = false;

                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
//                
//                
                            QuantityStock:
                                    function()
                                    {

//                                                                                 

                                        var $input = $(this);
                                        var avaiablequant = $('#Productavailablequant').val();
                                        var QuantityStock = $('#QuantityStock').val();
                                
                                
                                        var isValid = true;

                                        if (QuantityStock === "")
                                        {
                                            $input.formError("Please Enter a Quantity");
                                            isValid = false;
                                        }
                                        else if (parseInt(QuantityStock)>parseInt(avaiablequant)) 
                                        {
                                            $input.formError("Enter Stock is Grater than Available Stock");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    }
//                          









                        };
                return {
                    "all": all,
                    "controls": controls};
            })();

    var validate10 =
            (function()
            {


                var all =
                        function()
                        {
                            var invalidControls = [];
                            var i = 0;
                            for (var controlValidationMethod in validate10.controls)
                            {


                                if (!validate10.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
                                {
                                    invalidControls.push(controlValidationMethod);
                                }
                            }

                            if (invalidControls.length > 0)
                            {
                                // Set focus on the first erroneous control
                                $("#" + invalidControls[0]).focus();
                            }
                            return invalidControls.length == 0;
                        };
                var controls =
                        {
                            Account_Mobile_No:
                                    function()
                                    {

//                                                                                 
                                        var $input = $(this);
                                        var isValid = true;
                                        var s = $input.val();
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please enter a Contact Number");
                                            isValid = false;
                                        }
                                        else if ($input.val().length != 10)
                                        {
                                            $input.formError("Contact Number cannot be greater or less than 10 Digit");
                                            isValid = false;
                                        }
                                        else if (s[0] != 6 && s[0] != 7 && s[0] != 8 && s[0] != 9)
                                        {




                                            $input.formError("Mobile No Start From 6, 7, 8, 9");
                                            isValid = false;
                                        }
                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            First_Name:
                                    function()
                                    {
                                        var $input = $(this);
                                        var isValid = true;
                                        if ($input.val() === "")
                                        {

                                            $input.formError("Please Enter First Name ");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            AccountAddress:
                                    function()
                                    {
//                                                                                    alert("4");
                                        var $input = $(this);
                                        var isValid = true;
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please Enter Address ");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    }









                        };
                return {
                    "all": all,
                    "controls": controls};
            })();


    var validate12 =
            (function()
            {


                var all =
                        function()
                        {
                            var invalidControls = [];
                            var i = 0;
                            for (var controlValidationMethod in validate12.controls)
                            {


                                if (!validate12.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
                                {
                                    invalidControls.push(controlValidationMethod);
                                }
                            }

                            if (invalidControls.length > 0)
                            {
                                // Set focus on the first erroneous control
                                $("#" + invalidControls[0]).focus();
                            }
                            return invalidControls.length == 0;
                        };
                var controls =
                        {
                            ExtAccount_Mobile_No:
                                    function()
                                    {

//                                                                                 
                                        var $input = $(this);
                                        var isValid = true;
                                        var s = $input.val();
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please enter a Contact Number");
                                            isValid = false;
                                        }
                                        else if ($input.val().length != 10)
                                        {
                                            $input.formError("Contact Number cannot be greater or less than 10 Digit");
                                            isValid = false;
                                        }
                                        else if (s[0] != 6 && s[0] != 7 && s[0] != 8 && s[0] != 9)
                                        {




                                            $input.formError("Mobile No Start From 6, 7, 8, 9");
                                            isValid = false;
                                        }
                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            ExFirst_Name:
                                    function()
                                    {
                                        var $input = $(this);
                                        var isValid = true;
                                        if ($input.val() === "")
                                        {

                                            $input.formError("Please Enter First Name ");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            ExtAccountAddress:
                                    function()
                                    {
//                                                                                    alert("4");
                                        var $input = $(this);
                                        var isValid = true;
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please Enter Address ");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            ExtAccount_Designation:
                                    function()
                                    {
//                                                                                    alert("4");
                                        var $input = $(this);
                                        var isValid = true;
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please Enter Designation ");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    }









                        };
                return {
                    "all": all,
                    "controls": controls};
            })();

    var validate11 =
            (function()
            {


                var all =
                        function()
                        {
                            var invalidControls = [];
                            var i = 0;
                            for (var controlValidationMethod in validate11.controls)
                            {


                                if (!validate11.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
                                {
                                    invalidControls.push(controlValidationMethod);
                                }
                            }

                            if (invalidControls.length > 0)
                            {
                                // Set focus on the first erroneous control
                                $("#" + invalidControls[0]).focus();
                            }
                            return invalidControls.length == 0;
                        };
                var controls =
                        {
                            Inquiry_Mobile_No:
                                    function()
                                    {
//                                                                                 
                                        var $input = $(this);
                                        var isValid = true;
                                        var s = $input.val();
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please enter a Contact Number");
                                            isValid = false;
                                        }
                                        else if ($input.val().length != 10)
                                        {
                                            $input.formError("Contact Number cannot be greater or less  than 10 Digit");
                                            isValid = false;
                                        }
                                        else if (s[0] != 6 && s[0] != 7 && s[0] != 8 && s[0] != 9)
                                        {




                                            $input.formError("Mobile No Start From 6, 7, 8, 9");
                                            isValid = false;
                                        }
                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            Inquiry_Type:
                                    function()
                                    {
//                                                                                  
                                        var $input = $(this);
                                        var isValid = true;
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please Select Inquiry Type  ");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            nxtdate1:
                                    function()
                                    {
                                        var isValid = true;
                                        var $input = $(this);
                                        var currentYear = new Date().getFullYear() - 1;
                                        var currentMonth = new Date().getMonth();
                                        var currentDay = new Date().getDate();
                                        var joindate = $input.val();
                                        var res = joindate.split("-");
                                        if (res[0] > currentYear)
                                        {
                                            if (res[1] > currentMonth)
                                            {
                                                if (res[1] == currentMonth + 1)
                                                {

                                                    if (res[2] > currentDay - 1)
                                                    {
                                                        $input.formError({remove: true});
                                                    } else {
                                                        $input.formError("Please Select Upcoming Date");
                                                        isValid = false;
                                                    }

                                                } else {
                                                    $input.formError({remove: true});
                                                }


                                            }


                                        }



                                        else {
                                            $input.formError("Please Select Upcoming Date");
                                            isValid = false;
                                        }



                                        return isValid;
                                    },
                            ref:
                                    function()
                                    {
//                                                                                  
                                        var $input = $(this);
                                        var isValid = true;
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please Select Reference  ");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            studentname:
                                    function()
                                    {
//                                                                                  
                                        var $input = $(this);
                                        var isValid = true;
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please Enter  Name ");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            requirement:
                                    function()
                                    {
//                                                                                    alert("4");
                                        var $input = $(this);
                                        var isValid = true;
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please Enter Customer Requirement ");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            offer:
                                    function()
                                    {
//                                                                                    alert("4");
                                        var $input = $(this);
                                        var isValid = true;
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please Enter Offer Given By Shop ");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    }









                        };
                return {
                    "all": all,
                    "controls": controls};
            })();
    var validate1 =
            (function()
            {


                var all =
                        function()
                        {
                            var invalidControls = [];
                            var i = 0;
                            for (var controlValidationMethod in validate1.controls)
                            {


                                if (!validate1.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
                                {
                                    alert(controlValidationMethod);
                                    invalidControls.push(controlValidationMethod);
                                }
                            }

                            if (invalidControls.length > 0)
                            {
                                // Set focus on the first erroneous control
                                $("#" + invalidControls[0]).focus();
                            }
                            return invalidControls.length == 0;
                        };
                var controls =
                        {
                            nxtdate:
                                    function()
                                    {

                                        var isValid = true;
                                        var type_remark = $('#type_remark').val();
                                        if (type_remark === "Followup Remark")
                                        {
                                            var $input = $(this);
                                            $input.formError({remove: true});
                                            var currentYear = new Date().getFullYear() - 1;
                                            var currentMonth = new Date().getMonth();
                                            var currentDay = new Date().getDate();
                                            var joindate = $input.val();
                                            var res = joindate.split("-");
                                            if (res[0] > currentYear)
                                            {
                                                if (res[1] > currentMonth)
                                                {
                                                    if (res[1] == currentMonth + 1)
                                                    {

                                                        if (res[2] > currentDay - 1)
                                                        {
                                                            $input.formError({remove: true});
                                                        } else {
                                                            $input.formError("Please Select Upcoming Date");
                                                            isValid = false;
                                                        }


                                                    } else {
                                                        $input.formError({remove: true});
                                                    }


                                                }



                                                else {
                                                    $input.formError("Please Select Upcoming Date");
                                                    isValid = false;
                                                    return isValid;
                                                }
                                            } else {
                                                $input.formError("Please Select Upcoming Date");
                                                isValid = false;
                                                return isValid;
                                            }




                                        } else if (type_remark === "") {
                                            var $input = $(this);
                                            $input.formError("First Select Type of Followup");
                                            isValid = false;
                                            return isValid;
                                        } else {
                                            var $input = $(this);
                                            $input.formError({remove: true});
                                            return isValid;
                                        }

                                        return isValid;

                                    },
                            type_remark:
                                    function()
                                    {
                                        var $input = $(this);
                                        var isValid = true;
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please Select Remark Type");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    },
                            Remark:
                                    function()
                                    {
                                        var $input = $(this);
                                        var isValid = true;
                                        if ($input.val() === "")
                                        {
                                            $input.formError("Please Enter Remark ");
                                            isValid = false;
                                        }

                                        else
                                        {
                                            // Valid, remove any existing form error message for this input
                                            $input.formError({remove: true});
                                        }

                                        return isValid;
                                    }









                        };
                return {
                    "all": all,
                    "controls": controls};
            })();
// jQuery.formError v0.3
//
// Copyright (C)2012 Gareth Elms
// Distributed under MIT License
//
// Documentation and full license availabe at:
// https://github.com/GarethElms/jQuery.formError

    (function($)
    {
        $.fn.formError =
                function(message, options)
                {
                    if (typeof (message) === "string")
                    {
                        options = $.extend(true, {}, $.fn.formError.defaultOptions, options);
                        options.message = message;
                        show.call(this, options);
                    }
                    else
                    {
                        var options = $.extend(true, {}, $.fn.formError.defaultOptions, message);
                        if (typeof (options.message) === "string")
                        {
                            show.call(this, options);
                        }
                        else if (options.remove)
                        {
                            if (remove.call(this, options))
                            {
                                this.addClass("valid");
                            }
                        }
                    }

                    function remove(options)
                    {
                        var wasInErrorState = false;
                        if (options.successImage.enabled)
                        {
                            if (this.hasClass('invalid')) //Used to be invalid
                            {
                                var img = $("<img class='successImage' style='position:absolute; right:-20px; top:3px; z-index:9999;' src='" + options.successImage.src + "' />");
                                var positionMethod = this.css("position");
                                if (positionMethod == "relative" || positionMethod == "absolute" || positionMethod == "fixed")
                                {
                                    img
                                            .css("left", ((this.position().left + this.outerWidth()) + 3) + "px")
                                            .css("top", (this.position().top - 3) + "px");
                                }
                                else
                                {
                                    img
                                            .css("left", ((this.position().left + this.outerWidth()) + 5) + "px")
                                }

                                this.after(img.fadeIn());
                            }
                            else
                            {
                                removeSuccessImage.call(this);
                            }
                        }
                        if (this.hasClass("invalid"))
                        {
                            this.removeClass('invalid');
                            wasInErrorState = true;
                        }
                        this.next(".validationErrorContainer").fadeOut();
                        this.next("img.successImage").next(".validationErrorContainer").fadeOut();
                        return wasInErrorState;
                    }

                    function removeSuccessImage()
                    {
                        if (this.next().hasClass("successImage"))
                        {
                            this.next().fadeOut();
                        }
                    }

                    function show(options)
                    {
                        remove.call(this, {successImage: {disabled: true}}); // Just remove the previous error message if it exists, we are replacing it now
                        removeSuccessImage.call(this); // Also remove the success image if present

                        options.message = options.message.injectNewLines(options.newLineAtCharacterCount);
                        var errorDiv =
                                $("<div class='validationErrorContainer' style='position:absolute; left:101%; top:-2px; z-index:99999;'>" +
                                        "<canvas width='14' height='14' style='position:absolute; left:-3px; top:7px;' />" +
                                        "<div class='validationError' style='border:2px solid #811; border-radius:5px; padding:4px; background-color:#f99; color:#511; position:relative; left:10px; white-space:nowrap;'>" +
                                        options.message +
                                        "</div>" +
                                        "</div>");
                        var positionMethod = this.css("position");
                        if (positionMethod == "relative" || positionMethod == "absolute" || positionMethod == "fixed")
                        {
                            errorDiv
                                    .css("left", ((this.position().left + this.outerWidth()) - 3) + "px")
                                    .css("top", (this.position().top - 3) + "px");
                        }
                        else if (this.parent().hasClass("inputContainer") == false)
                        {
                            this.wrap($("<div class='inputContainer' style='position:relative; width:" + this.width() + "px'></div>"));
                        }

                        this.after(errorDiv.fadeIn()).addClass("invalid");
                        var canvas = $("canvas", errorDiv)[0];
                        if (typeof (canvas.getContext) == "function")
                        {
                            var context = canvas.getContext("2d");
                            context.fillStyle = '#811';
                            context.strokeStyle = '#811';
                            context.lineWidth = 1;
                            context.beginPath();
                            context.moveTo(1, 7);
                            context.lineTo(13, 13);
                            context.lineTo(13, 1);
                            context.lineTo(1, 7);
                            context.closePath();
                            context.fill();
                            context.stroke();
                        }
                    }
                };
        $.fn.formError.defaultOptions =
                {
                    newLineAtCharacterCount: 30,
                    successImage:
                            {
                                enabled: true,
                                src: "success.gif"
                            }
                };
    })(jQuery);
    String.prototype.injectNewLines =
            function(maxLineLength)
            {
                if (typeof (maxLineLength) == "number" && maxLineLength > 0)
                {
                    var tempMessage = "";
                    var lineLength = 0;
                    var words = this.split(/\s+/);
                    for (var word in words)
                    {
                        tempMessage += words[word];
                        lineLength += words[word].length;
                        if (lineLength > maxLineLength)
                        {
                            tempMessage += "<br />";
                            lineLength = 0;
                        }
                        else
                        {
                            tempMessage += " ";
                            lineLength++;
                        }
                    }

                    return tempMessage;
                }

                return this;
            };


</script>
