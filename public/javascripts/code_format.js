var CodeFormat = {
    tags: [],
    keywords:{
    	js:["var","function","for","if","else","return","this"]
    },
    init: function() {
        this.tags = $(".code");
        this.tags.each(function(index,t) {
            var str = $(t).html();
            str = CodeFormat.encode(str);
            lines = str.split("\n");
            for(var i = 0 ; i < lines.length ;i++){
            	var keywords = CodeFormat.keywords[$(t).attr("data-type")];
            	if (keywords) {
            		for(var j = 0 ; j < keywords.length; ++j){
            			var reg = new RegExp("(^|[^0-9A-Za-z_\-])("+keywords[j]+")([^0-9A-Za-z_\-]|&+)","g");
        				lines[i] = lines[i].replace(reg,"$1<span class='keyword'>$2</span>#3").replace(/\t/g,"    ");
            		}
            	};
            }
            $(t).html(lines.join("</br>"));
        });
    },
    encode: function(str) {
        var s = "";
        if (str.length == 0) return "";
        s = str.replace(/&/g, "&gt;");
        s = s.replace(/</g, "&lt;");
        s = s.replace(/>/g, "&gt;");
        s = s.replace(/ /g, "&nbsp;");
        s = s.replace(/\'/g, "&#39;");
        s = s.replace(/\"/g, "&quot;");
        return s;
    },
}
$(document).ready(function(){
	CodeFormat.init();
})