class FaqsController < ApplicationController
  before_filter :signed_in_admin_user, only: [:create, :edit,:update,:delete]
  def index
    @faqs = Faq.all
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(params[:faq])
    if @faq.save
      redirect_to faqs_path, :notice => "Successfully created faq."
    else
      render :action => 'new'
    end
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])
    if @faq.update_attributes(params[:faq])
      flash[:success] = "Successfully updated faq."
      redirect_to faqs_path, :notice  => "Successfully updated faq."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    redirect_to faqs_url, :notice => "Successfully destroyed faq."
  end
end
