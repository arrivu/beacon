class TopicsController < ApplicationController
 before_filter :custom_method, :only => [:new,:create, :edit, :destroy,:index]
  def index
    @topics = Topic.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @topic = Topic.find(params[:id])
    @total_course_count = @topic.courses.where(ispublished: 1).size
    @courses = @topic.courses.where(ispublished: 1).paginate(page: params[:page], :per_page => 6)
    
    @topics = Topic.order(:name)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      redirect_to topics_path, notice: "Successfully created topic."
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      redirect_to @topic, notice: "Successfully updated topic."
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_url, notice: "Successfully destroyed topic."
  end
end
