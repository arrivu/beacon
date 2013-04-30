module BooleanHelper

	def parse_boolean(value)
	 	[true, 'true', 1, '1', 't'].include?(value.respond_to?(:downcase) ? value.downcase : value)
	end

end 