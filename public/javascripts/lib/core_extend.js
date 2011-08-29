Function.prototype.bind = function(){
    function generateArray(ori){
        var args = new Array(ori.length);
        for(var i=0;i<ori.length;++i) args[i] = ori[i];
        return args;
    }
    if (arguments.length < 2 && typeof(arguments[0]) == "undefined") return this;
    var args = generateArray(arguments);
    var __method = this, object = args.shift();
    return function(){
        var _args = generateArray(arguments);
        for(var i=0;i<arguments.length;++i) _args[i] = arguments[i];
        return __method.apply(object, args.concat(_args));
    };
};
String.prototype.strip = function(){
	return this.replace(/\s|\t|\n/g,"");
};
jQuery.fn.extend({
	setCenter: function(){
		var scrollX = $(document.body).scrollLeft();
		var scrollY = $(document.body).scrollTop();
		var top = ($(window).height() - parseInt(this.height(),10))/2 + scrollY + "px";
		var left = ($(window).width() - parseInt(this.width(),10))/2 + scrollX + "px";
		this.css({
			top:top,
			left:left,
			position:"absolute"
		});
	}
});