class AccountsController < ApplicationController
  def new
  	@account=Account.new
  end
  def create
  	@account=Account.new(params[:account])
  	if @account.save
  		flash[:success]="Account details created Successfully"
  		redirect_to accounts_path
  	end
end


  def edit
  	@account=Account.find(params[:id])
  end
  def update
  	@account=Account.find(params[:id])
  	if @account.update_attributes(params[:account])
  		flash[:success]="Account details updated Successfully"
  		redirect_to accounts_path
  	end
  end

  def show
  	@account=Account.where(:subdomain => request.subdomain)
  end

  def index
  	# 
  	@account=Account.all
  end
end
