class AccountsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user
	def new
     @account = Account.new
    end

    def index 

    end 


    def create
    @account = Account.new(params[:account])
     if @account.save!
	     flash[:success] = "New Account Created"
	     redirect_to users_path
	 else
	      render 'new'
     end
    end

	 def edit
	   @account= Account.find(params[:id])
	 end

	 def update
	   @account = Account.find(params[:id])

	   if @account.update_attributes(params[:account])
	     flash[:success] ="Account Settings Updated"  
	     redirect_to users_path
	   else
	     render :edit
	   end
	 end
end
