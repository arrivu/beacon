module LmsHelper

	def lms_enable?
		parse_boolean "#{Settings.lms.enable}"	
	end

end