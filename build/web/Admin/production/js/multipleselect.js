/*!
 * multiselect v0.1.0 (https://github.com/harshniketseta/popupMultiSelect)
 * Copyright 2011-2015, Author: Harshniket Seta <harshniketseta@gmail.com>
 * Licensed under MIT (https://github.com/harshniketseta/popupMultiSelect/blob/master/LICENSE)
 */
!function(a){"use strict";function b(b){var d=Array.prototype.slice.call(arguments);return d.shift(),this.each(function(){var e=a(this),f=e.data("bs.multiselect"),g="object"==typeof b&&b;(f||!/destroy|hide/.test(b))&&(f||(f=new c(this,g),e=f.$element,e.data("bs.multiselect",f)),"string"==typeof b&&f[b].apply(f,d))})}var c=function(a,b){this.options=null,this.enabled=null,this.multiple=null,this.timeout=null,this.modalShown=null,this.$element=null,this.type="multiselect",this.init(a,b)};if(!a.fn.modal)throw new Error("MultiSelect requires modal.js");c.VERSION="0.2.0",c.DEFAULTS={animation:!0,selectTemplate:'<div class="selectWrap clearfix"><span class="select-content"></span><a href="#" class="open-options clickable"><span class="glyphicon glyphicon-list" aria-hidden="true"></span></a></div>',selectOptionTemplate:'<span class="addedOption" ><span class="text"></span><span class="clickable removeOption"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></span></span>',modalTemplate:'<div class="select modal in" aria-hidden="false"><div class="modal-dialog modal-sm"><div class="modal-content"><div class="modal-header"><span class="pull-right clickable close" aria-hidden="true">x</span><h4 class="modal-title"></h4><div class="help-block"></div></div><div class="modal-body"></div></div></div></div>',modalOptionTemplate:'<div class="option clickable"><span class="option-text"></span><span class="option-tick"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></span></div>',title:"Select Options"},c.prototype.init=function(b,c){var d=a(b);if(this.$element=d.clone(!0,!0),this.enabled=this.isEnabled(),this.multiple=this.isMultiple(),this.options=this.getOptions(c),!this.$element.is("select"))throw new Error("Popup MultiSelect only possible in select.");this.replaceDefaultSelect(d),this.$selectOptions=this.extractSelectOptions()},c.prototype.isEnabled=function(){return!this.$element.prop("disabled")},c.prototype.isMultiple=function(){return this.$element.prop("multiple")},c.prototype.hasSelectOptions=function(){return this.$selectOptions.length>0},c.prototype.extractSelectOptions=function(){var b=[],d=this.getOptionConfig(),e=this;return a.each(this.$element.find("option"),function(a,f){var g=new c.Option(f,d);b.push(g),g.isSelected()&&e._optionSelected(g)}),b},c.prototype.replaceDefaultSelect=function(a){var b=this.getMultiSelect();a.replaceWith(b),this.$element.css({visibility:"hidden",height:"0px",width:"0px"}),b.append(this.$element),this.postProcess(),this.initMultiSelect()},c.prototype.initMultiSelect=function(){var a=this;this.getMultiSelectOpen().on("click",function(b){b.preventDefault(),a.show()})},c.prototype.getDefaults=function(){return c.DEFAULTS},c.prototype.getOptions=function(b){return b=a.extend({},this.getDefaults(),this.$element.data(),b),this.multiple||(b.maxSelectionAllowed=1),b},c.prototype.getOptionConfig=function(a){return{modalOptionTemplate:this.options.modalOptionTemplate,selectOptionTemplate:this.options.selectOptionTemplate}},c.prototype.getUID=function(a){do a+=~~(1e6*Math.random());while(document.getElementById(a));return a},c.prototype.getMultiSelect=function(){if(!this.$multiSelect){this.$multiSelect=a(this.options.selectTemplate),this.enabled||this.$multiSelect.addClass("disabled");for(var b=this.$element.prop("class").split(" "),c=0;c<b.length;c++)this.$multiSelect.addClass(b[c])}var d=this.getUID(this.$element.attr("id")||"selectContainer");return this.$multiSelect.attr("id",d),this.$element.attr("aria-describedby",d),this.$multiSelect},c.prototype.getSelectOpenIcon=function(){var a=this.getMultiSelectOpen(),b=a.find("span.glyphicon");return b},c.prototype.getMultiSelectOpen=function(){return this.$openOptions||(this.$openOptions=this.$multiSelect.find(".open-options"))},c.prototype.getMultiSelectContent=function(){return this.$selectContent||(this.$selectContent=this.$multiSelect.find(".select-content"))},c.prototype.getSelected=function(){return this.getMultiSelectContent().children()},c.prototype.getModal=function(){return this.$modal||(this.$modal=a(this.options.modalTemplate),this.getModalHelpBlock(this.$modal).html(this.getModalHelpTextContent()),this.getModalTitleBlock(this.$modal).html(this.getModalTitle()),this.getModalBody(this.$modal).html(this.getModalBodyContent()),this.initModal(this.$modal)),this.$modal},c.prototype.getModalClose=function(a){return a.find(".close")},c.prototype.getModalHelpBlock=function(a){return a=a||this.getModal(),a.find(".help-block")},c.prototype.getModalTitleBlock=function(a){return a=a||this.getModal(),a.find(".modal-title")},c.prototype.getModalBody=function(a){return a=a||this.getModal(),a.find(".modal-body")},c.prototype.getModalHelpTextContent=function(a,b){var c="",d=this.getSelected().length,e=this.options.maxSelectionAllowed,f=e-d;if(!(1>e))return 0===d&&f>0?c="Select "+f:f>0?c="Select "+f+" more.":0===f&&(c="Done."),c},c.prototype.getModalTitle=function(){return this.options.title},c.prototype.getModalBodyContent=function(){var b=this,c=[];return a.each(this.$selectOptions,function(d,e){var f=e.createModalOption();f.on("click",function(){var c=a(this),d=c.data("multiselect.option");c.hasClass("selected")?b.optionDeSelected(d):b.optionSelected(d)}),c.push(f)}),c},c.prototype.postProcess=function(){var a=this.$multiSelect.height(),b=this.$multiSelect.outerWidth(),c=parseInt(this.$multiSelect.css("padding-right")),d=parseInt(this.$multiSelect.css("padding-left")),e=this.getMultiSelectContent(),f=this.getMultiSelectOpen(),g=this.getSelectOpenIcon(),h=parseInt(g.css("font-size")),i=(a-h)/2,j=b-c-d-h;e.css({width:j}),f.css({height:h,"margin-top":i,"margin-bottom":i,right:c})},c.prototype.updateHelpText=function(a,b){return this.getModalHelpBlock(this.getModal()).html(this.getModalHelpTextContent(a,b)),!0},c.prototype.initModal=function(b){var c=this;this.getModalClose(b).on("click",function(){c.hide()}),b.on("hide.bs.modal",function(b){var d=a.Event("hide.bs."+c.type);c.$element.trigger(d),d.isDefaultPrevented()&&b.preventDefault()}),b.on("hidden.bs.modal",function(b){c.modalShown=!1;var d=a.Event("hidden.bs."+c.type);c.$element.trigger(d),c.cleanModal()})},c.prototype.show=function(){var b=a.Event("show.bs."+this.type);if(this.hasSelectOptions()&&this.enabled){this.$element.trigger(b);var c=a.contains(this.$multiSelect[0].ownerDocument.documentElement,this.$multiSelect[0]);if(b.isDefaultPrevented()||!c)return;var d=this.getModal(),e=this.getUID(this.type);this.appendModal(),d.attr("id",e),this.$multiSelect.attr("aria-describedby",e),this.options.animation&&d.addClass("fade"),a("body").prepend(d);var f=this;d.on("shown.bs.modal",function(){f.modalShown=!0;var b=a.Event("shown.bs."+f.type);f.$element.trigger(b)}),d.modal("show")}},c.prototype.hide=function(){var a=this.getModal();a.modal("hide")},c.prototype.cleanModal=function(){this.$multiSelect.removeAttr("aria-describedby"),this.$modal.remove(),this.$modal=null},c.prototype.appendModal=function(){a("body").prepend(this.$modal)},c.prototype.addOption=function(b){var d=a("<option></option>",b),e=new c.Option(d,this.getOptionConfig()),f=null;f=a.Event("addingoption.bs."+this.type),this.$element.trigger(f,e),f.isDefaultPrevented()||(this.$element.append(d),this.$selectOptions.push(e),f=a.Event("optionadded.bs."+this.type),this.$element.trigger(f,e),d.prop("selected")&&this.optionSelected(e),this.modalShown&&this.getModalBody().append(e.createModalOption()))},c.prototype.selectOption=function(a){var b=this.$element.find("option[value="+a+"]").data("multiselect.option");this.optionSelected(b)},c.prototype.deselectOption=function(a){var b=this.$element.find("option[value="+a+"]").data("multiselect.option");this.optionDeSelected(b)},c.prototype.enable=function(){if(!this.enabled){this.$multiSelect.removeClass("disabled"),this.$element.prop("disabled",!1),this.enabled=!0;var b=a.Event("enabled.bs."+this.type);this.$element.trigger(b)}},c.prototype.disable=function(){if(this.enabled){this.$multiSelect.addClass("disabled"),this.$element.prop("disabled",!0),this.enabled=!1;var b=a.Event("disabled.bs."+this.type);this.$element.trigger(b)}},c.prototype.optionSelected=function(b){var c=null;return this.options.maxSelectionAllowed==this.getSelected().length?(c=a.Event("maxselected.bs."+this.type),this.$element.trigger(c,b),!0):(c=a.Event("selected.bs."+this.type),this.$element.trigger(c,b),void(c.isDefaultPrevented()||(b.selected(),this._optionSelected(b),c=a.Event("selectiondone.bs."+this.type),this.$element.trigger(c,b),this.updateHelpText(b,c),this.postProcess())))},c.prototype._optionSelected=function(a){var b=this,c=a.getContent();c.find(".removeOption").on("click",function(){b.optionDeSelected(a)}),this.getMultiSelectContent().append(c)},c.prototype.optionDeSelected=function(b){var c=a.Event("deselected.bs."+this.type);this.$element.trigger(c,b),c.isDefaultPrevented()||(b.deselected(),b.getContent().remove(),c=a.Event("deselectiondone.bs."+this.type),this.$element.trigger(c,b),this.updateHelpText(b,c),this.postProcess())},c.Option=function(a,b){this.options=null,this.enabled=null,this.timeout=null,this.$element=null,this.type="multiselect.option",this.init(a,b)},c.Option.DEFAULTS={},c.Option.prototype.init=function(b,c){if(this.$element=a(b),this.enabled=this.isEnabled(),this.options=this.getOptions(c),!this.$element.is("option"))throw new Error("Popup MultiSelect Option only possible on option element.");this.$element.data(this.type,this),this.tip()},c.Option.prototype.tip=function(){this.$tip||(this.$tip=a(this.options.modalOptionTemplate),this.$tip.find(".option-text").html(this.$element.text()),this.enabled||this.$tip.addClass("disabled"),this.isSelected()&&this.selected())},c.Option.prototype.getDefaults=function(){return c.Option.DEFAULTS},c.Option.prototype.getOptions=function(b){return b=a.extend({},this.getDefaults(),this.$element.data(),b)},c.Option.prototype.isEnabled=function(){return!this.$element.prop("disabled")},c.Option.prototype.createModalOption=function(){return this.$tip.data(this.type,this),this.$tip},c.Option.prototype.isSelected=function(){return this.$element.prop("selected")},c.Option.prototype.selected=function(){this.$element.attr("selected","selected"),this.$tip.addClass("selected")},c.Option.prototype.deselected=function(){this.$element.removeAttr("selected"),this.$tip.removeClass("selected")},c.Option.prototype.getContent=function(){return this.$content||(this.$content=a(this.options.selectOptionTemplate),this.$content.find(".text").html(this.$element.html()),this.enabled||this.$content.addClass("disabled"),this.$content.data(this.type,this)),this.$content};var d=a.fn.multiselect;a.fn.multiselect=b,a.fn.multiselect.Constructor=c,a.fn.multiselect.noConflict=function(){return a.fn.multiselect=d,this}}(jQuery);