module ApplicationHelper
	
	def include_page_script(script)
		"<script src=\"/javascripts/pages/#{script}.js\" charset=\"utf-8\" type=\"text/javascript\"></script>"
	end
	
	def include_page_scripts(scripts)
		scripts.inject(""){|result,script| result += include_page_script(script)}
	end
	
	def include_page_css(css)
		"<link rel=\"stylesheet\" href=\"/stylesheets/#{css}.css\" type=\"text/css\" media=\"screen\" title=\"no title\" charset=\"utf-8\"/>"
	end
	
	def default_format_time(d)
		
	end
	
end
