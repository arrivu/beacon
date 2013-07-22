class TestimonialsController < ApplicationController

		
		def new
	  		@testimonial=Testimonial.new
	    end
	    def create
	        @testimonial = Testimonial.new(params[:testimonial])
			    if @testimonial.save
			      flash[:success] = "Testimonial added successfully!!!!"
			      # NewsletterMailer.weekly("ankithbti007@gmail.com", flash[:success]).deliver
			      redirect_to testimonials_path

			    else
			      render :action => 'new'
			    end
        end 

        def edit
    		@testimonial=Testimonial.find(params[:id])
  		end
  		def update
     		 @testimonial = Testimonial.find(params[:id])
     		 if @testimonial.update_attributes(params[:testimonial])
        		flash[:success] = "Testimonial updated"
        			redirect_to testimonials_path
        	else
        			render :action => 'edit'
      		end
 		end	
 		def index
 			 @testimonial=Testimonial.paginate(page: params[:page], :per_page => 10)
		end
		def show
				@testimonial = Testimonial.find(params[:id])
		end
		def destroy
			@testimonial = Testimonial.find(params[:id])
			@testimonial.destroy
			flash[:success] = "Testimonial Deleted"
			redirect_to testimonials_path
		end 
end
