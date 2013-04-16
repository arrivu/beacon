		class TeachingStaffsController < ApplicationController
			before_filter :admin_user?, :only => [:new, :create]
		  after_filter :teaching_staff_create, :only => [:create]
		  protect_from_forgery :except => :create
			
		 def new
		 	 @teachingstaff = TeachingStaff.new
       @teachingstaff.build_user
       #respond_with(@teachingstaff)	
       

			end

			def create			
				
				@teachingstaff=TeachingStaff.new
				@user=@teachingstaff.build_user(params[:teaching_staff])
				if @teachingstaff.save
					flash[:notice]="Teaching Staff details created successfully"
					redirect_to new_teaching_staff_path
				else
					render 'new'
				end			
		end
			
			def edit
				@teachingstaff=TeachingStaff.find(params[:id])
			end
			def update
				@teachingstaff=TeachingStaff.find(params[:id])
				if @teachingstaff.update_attributes(params[:teaching_staff])
					flash="Teaching Staff details updated successfully"
					redirect_to @teachingstaff
				else
					render 'edit'
				end
			end
			def destroy
				@teachingstaff=TeachingStaff.find(params[:id])
				@teachingstaff.destroy
				redirect_to teachingstaffs_path
				flash[:notice] = "Deleted teaching staff details successfully"
			end
			

		end
