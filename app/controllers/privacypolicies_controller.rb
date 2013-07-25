class PrivacypoliciesController < ApplicationController
  def new
  	@privacypolicy=Privacypolicy.new
  end
 def create
	        @privacypolicy= Privacypolicy.new(params[:privacypolicy])
			    if @privacypolicy.save
			      flash[:success] = "PrivacyPolicy added successfully!!!!"
			       # redirect_to @privacypolicy
              redirect to privacypolicies_path
			    else
			      render :action => 'new'
			    end
        end 
  def show
  	@privacypolicy = Privacypolicy.find(params[:id])
  end
  def index

 			 @privacypolicy=Privacypolicy.paginate(page: params[:page], :per_page => 10)
	end
  def edit
  	@privacypolicy=Privacypolicy.find(params[:id])
  end
  def update
     		 @privacypolicy = Privacypolicy.find(params[:id])
     		 if @privacypolicy.update_attributes(params[:privacypolicy])
        		flash[:success] = "PrivacyPolicy updated"
        			redirect_to privacypolicies_path
        	else
        			render :action => 'edit'
      		end
 		end
 		def destroy
			@privacypolicy = Privacypolicy.find(params[:id])
			@privacypolicy.destroy
			flash[:success] = "Testimonial Deleted"
			redirect_to privacypolicies_path
		end 
end
