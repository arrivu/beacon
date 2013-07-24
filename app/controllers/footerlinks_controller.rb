class FooterlinksController < ApplicationController
  def new
  	@footerlink=Footerlink.new
  end
  def create
  	@footerlink=Footerlink.new(params[:footerlink])
  	@accountid=Account.find_by_name(request.subdomain)
  	@footerlink.accountid=@accountid.id
  	if @footerlink.save
  		flash[:success]="FooterLinks created successfully"
  		redirect_to footerlinks_path
  	end
  end

  def edit
  	@footerlink=Footerlink.find(params[:id])
  end

  def show
  	@footerlink=Footerlink.find(params[:id])
  end

  def index
  	@footerlink=Footerlink.all
  end
  def update
  	@footerlink=Footerlink.find(params[:id])
  	if @footerlink.update_attributes(params[:footerlink])
  		flash[:success]="Footerlink details updated successfully"
  		redirect_to footerlinks_path
  	end
  end
end
