class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user, :only => [:show, :destroy,:index,:interested_users]
  require 'csv'
  
  def index    
    authorize! :index, @user, :message => 'Not authorized as an administrator.'

    query = "%#{params[:query]}%"
      if params[:provider]==nil
        @users = User.all.paginate(page: params[:page], :per_page => 10)
        @total_users = User.all.count
      else
        if params[:provider]!="All"
          if(params[:query] == nil || params[:query] == "")
            @users = User.where("provider = ?",params[:provider]).all.paginate(page: params[:page], :per_page => 10)
            @total_users = User.where("provider = ?",params[:provider]).count
          else
            @users = User.where("(lower(name) like ? or lower(email) like ?) and provider = ?" , query.downcase,query.downcase,params[:provider]).paginate(page: params[:page], :per_page => 10)
            @total_users = User.where("(lower(name) like ? or lower(email) like ?) and provider = ?" , query.downcase,query.downcase,params[:provider]).count
          end
        else
          if(params[:query] != "")
            @users = User.where("lower(name) like ? or lower(email) like ?", query.downcase,query.downcase).paginate(page: params[:page], :per_page => 10) 
            @total_users = User.where("lower(name) like ? or lower(email) like ?", query.downcase,query.downcase).count
          else
            @users = User.all.paginate(page: params[:page], :per_page => 10)
            @total_users = User.all.count
        end
      end  
    end

    
  end

  def show
    @user = User.find(params[:id])
    if @user.has_role? :student
      @student=Student.where(user_id: @user.id).first
      @enrolled_courses= @student.course_enroll
      @completed_courses=@student.course_complete        
    end
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
  def interested_users
    query = "%#{params[:search]}%"
    if params[:search]==nil || params[:search]=="All" || params[:search] == ""
      @users =  StudentCourse.where("status= ?","follow").paginate(page: params[:page], :per_page => 10) 
        @total_users = @users.count
         
    else
      @users = StudentCourse.where("status= ? and course_id=?","follow",params[:search]).paginate(page: params[:page], :per_page => 10) 
    @total_users = StudentCourse.where("status= ? and course_id=?","follow",params[:search]).count
    
    end
    respond_to do |format|
    format.html
        format.xls # { send_data @products.to_csv(col_sep: "\t") }
  end  
      

    end
end
