class CertifiedProgramUsersController < ApplicationController



	def show_applicant_image   
    @certificateprogramusers = CertifiedProgramUser.find(params[:id])
    send_data @certificateprogramusers.applicant_photo, :type => @certificateprogramusers.applicant_photo_type, :disposition => 'inline'
    http_cache(@certificateprogramusers)
  end
	def index
     @request_url= request.referer

  end
  def download_pdf_pgpba
    path = "#{Rails.root}/public/pdf/Opportunities_in_Analytics-Great_Lakes.pdf"
    send_data File.read(path),:filename => "Opportunities in Analytics - Great Lakes.pdf",:type => "application/pdf" ,disposition: "attachment"
  end
	def new
		@certificateprogramusers = CertifiedProgramUser.new
	end

	def create
		@certificateprogramusers = CertifiedProgramUser.new(params[:certified_program_user])

          
		if @certificateprogramusers.save
		 
		 flash[:success] = "certificate program user created!"
		 if @request_url == "http://pgpba.greatlakes.edu.in/application"  
		  redirect_to "http://pgpba.greatlakes.edu.in/"
		else
			redirect_to root_url
          end     
		else
		  
		 flash.now[:error] = "Mandatory Fields should not be empty"
		 if @request_url == "http://pgpba.greatlakes.edu.in/application"  
		  redirect_to "http://pgpba.greatlakes.edu.in/pgpba/application"
		  else
			 render :new
          end   

		end
	end
	def show
		@certificateprogramusers=CertifiedProgramUser.find(params[:id])
	end
	def show_details
		@certificateprogramusers=CertifiedProgramUser.all
	end
end
