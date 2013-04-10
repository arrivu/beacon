class ContactsController < ApplicationController

	def new
		@contact=Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		if @contact.save
			UserMailer.mail_contact(@contact.name,@contact.email,@contact.message).deliver
			flash[:success]= "We will be in touch with you very soon."
			redirect_to new_contact_path
		else
			render :new
		end

	end

end
