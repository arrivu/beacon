class CertifiedProgramUsersController < ApplicationController

	def index
	end

	def create
		@certificateprogramusers = CertifiedProgramUser.new(params[:certificateprogramusers])
		if @certificateprogramusers.save
		  flash[:success] = "certificateprogramuser created!"
		  redirect_to '/'
		else
		  flash[:error] = "Error on creating food"
		  render '/'
		end
	end
	def show
	end
end
