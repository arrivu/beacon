class CoursePricingsController < ApplicationController
 before_filter :check_admin_user, :only => [:new,:create, :edit, :destroy,:index]
  def new
    @coursepricing=CoursePricing.new
  end

  def show
  end
  def create
    @coursepricing=CoursePricing.new(params[:course_pricing])
    if @coursepricing.start_date<=@coursepricing.end_date
    if @coursepricing.save
      flash[:notice]="course price registered successfully"
      redirect_to course_pricings_path
    else
      render 'new'
    end
  else
    flash[:error] = "End date should be greater than or equal to start date "
    render 'new'
  end
  end
  def index
    @coursepricing=CoursePricing.paginate(page: params[:page], :per_page => 10)
    @course = Course.all
  end
  def destroy
    @coursepricing=CoursePricing.find(params[:id])

    @coursepricing.destroy

    flash[:success] = "Successfully Destroyed Course Price."
    redirect_to course_pricings_path
  end

  def edit
     @coursepricing=CoursePricing.find(params[:id])
     @course = Course.all
  end
  def update
    @coursepricing=CoursePricing.find(params[:id])
    if @coursepricing.start_date<=@coursepricing.end_date
    if @coursepricing.update_attributes(params[:course_pricing])
      flash[:notice] = "Updated Course Price Details Successfully..."
      redirect_to course_pricings_path
    else
      render 'edit'
    end
  else
    flash[:error] = "End date should be greater than or equal to start date "
    render 'edit'
  end
  end
end
