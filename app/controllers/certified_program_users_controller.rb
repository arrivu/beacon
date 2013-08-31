class CertifiedProgramUsersController < ApplicationController



	def show_applicant_image   
    @certificateprogramusers = CertifiedProgramUser.find(params[:id])
    send_data @certificateprogramusers.applicant_photo, :type => @certificateprogramusers.applicant_photo_type, :disposition => 'inline'
    http_cache(@certificateprogramusers)
  end
	def index
	end
	def new
		@certificateprogramusers = CertifiedProgramUser.new
	end

	def create
		@certificateprogramusers = CertifiedProgramUser.new(params[:certified_program_user])

          
		if @certificateprogramusers.save
		  flash[:success] = "certificateprogramuser created!"
		  redirect_to root_url
		else
		  flash[:error] = "Error on creating food"
		  render :new
		end
	end
	def show
		@certificateprogramusers=CertifiedProgramUser.find(params[:id])
	end
	def show_details
		@certificateprogramusers=CertifiedProgramUser.all
	end
end
