module ApplicationHelper
		# Returns the full title on a per-page basis.
		def full_title(page_title)
			base_title = "Beacon Learning"
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

		def check_admin_user
			authenticate_user!
			if current_user.has_role? :admin
				return
			else
     redirect_to root_url # or whatever
   end
    end

  def http_cache(instant_variable,scope=true,expires="#{Settings.cache.time_out}")
    expires_in expires.to_i.hours
    fresh_when instant_variable, public: scope
  end
  #  def http_cache(instant_variable,scope=true)
  #    fresh_when instant_variable, public: scope
  #  end
 
end
