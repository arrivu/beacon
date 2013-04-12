class CoursePricingsController < ApplicationController
 before_filter :check_admin_user, :only => [:new,:create, :edit, :destroy,:index]
  def new
    @coursepricing=CoursePricing.new
  end

  def show
  end
  def create
    @coursepricing=CoursePricing.new(params[:course_pricing])
    @coursecheck=CoursePricing.find_by_course_id(params[:course_pricing][:course_id])
    if @coursecheck!=nil
    if @coursecheck.end_date<@coursepricing.start_date && @coursecheck.start_date<@coursepricing.start_date

    if @coursepricing.start_date<=@coursepricing.end_date 
    if @coursepricing.save
      flash[:notice]="Course price saved successfully"
      redirect_to course_pricings_path
    else
      render 'new'
    end
  else
    flash[:error] = "End date should be greater than or equal to start date "
    render 'new'
  end

else
  flash[:error] = "Course Price Alredy defined for the date range"
  render 'new'
  end
else
  if @coursepricing.start_date<=@coursepricing.end_date 
    if @coursepricing.save
      flash[:notice]="Course price saved successfully"
      redirect_to course_pricings_path
    else
      render 'new'
    end
  else
    flash[:error] = "End date should be greater than or equal to start date "
    render 'new'
  end
end
end
  def index
     if(params[:search] != nil && params[:search] != "")
    @coursepricing = CoursePricing.where("course_id=#{params[:search]}").paginate(page: params[:page], :per_page => 15)
     else
       @coursepricing = CoursePricing.paginate(page: params[:page], :per_page => 15)
     end
  
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
