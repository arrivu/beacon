class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user, :only => [:show, :destroy,:index]
  
  
  def index    
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    #@users = User.all.paginate(page: params[:page], :per_page => 10)  
    query = "%#{params[:query]}%"
      if params[:provider]==nil
        @users = User.all.paginate(page: params[:page], :per_page => 10)
      else
        if params[:provider]!="All"
          if(params[:query] == nil || params[:query] == "")
            @users = User.where("provider = ?",params[:provider]).all.paginate(page: params[:page], :per_page => 10)
          else
            @users = User.where("name like ? or email like ?) and provider = ?" , query,query,params[:provider]).paginate(page: params[:page], :per_page => 10)
          end
        else
          if(params[:query] != "")
            @users = User.where("name like ? or email like ?", query,query).paginate(page: params[:page], :per_page => 10) 
          else
            @users = User.all.paginate(page: params[:page], :per_page => 10)
        end
      end  
    end

    
  end

  def show
    @user = User.find(params[:id])
    @student=Student.where(user_id: @user.id).first
    @enrolled_courses= @student.course_enroll
    @completed_courses=@student.course_complete        
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
  
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    users = User.find(params[:id])
    unless users == current_user
      users.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end
