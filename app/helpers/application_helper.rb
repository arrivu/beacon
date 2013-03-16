module ApplicationHelper
		# Returns the full title on a per-page basis.
		def full_title(page_title)
			base_title = "Smart Coach"
			@page_title = page_title
			if page_title.empty?
				base_title
			else
				"#{base_title} | #{page_title}"
			end
		end

		def check_null(str)
			if str.empty?
				true
			else
				false
			end
		end

		def display_base_errors resource
			return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
			messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
			html = <<-HTML
			<div class="alert alert-error alert-block">
				<button type="button" class="close" data-dismiss="alert">&#215;</button>
				#{messages}
			</div>
			HTML
			html.html_safe
		end
	end
