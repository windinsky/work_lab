var flash_msg_controller = {
	data:"",
	timer:null,
	text_container:null,
	ele:null,
	init:function(){
		this.ele = $("#flash_msg");
		this.text_container = $("#flash_msg .flash_content:first");
		$("#flash_msg .flash_msg_close_btn:first").click(function(){
			clearTimeout(this.timer);
			this.ele.slideUp();
		}.bind(this));
		setInterval(this.check.bind(this),100);
	},
	check: function(){
		if (this.text_container.html().trim() != this.data) {
			this.data = this.text_container.html().trim();
			this.display();
		};
	},
	display: function(){
		this.ele.slideDown("slow");
		this.timer = setTimeout(function(){this.ele.slideUp()}.bind(this),5000);
	},
	show_text:function(text){
		this.text_container.html(text);
		this.display();
	}
};
$(document).ready(function(){
	flash_msg_controller.init();
});