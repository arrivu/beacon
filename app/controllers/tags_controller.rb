class TagsController < ApplicationController
	def index
    @tags = Tag.order(:name).search(params[:search])
  end

  def show
    @tag = Tag.find(params[:id])
    @countBlogsPerPage = 5
    #@courses_for_topic = @topic.courses.paginate(page: params[:page], per_page: 5)
    @blogs_for_tag = @tag.blogs.paginate(page: params[:page], per_page: 5)
    @tags = Tag.order(:name)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      redirect_to tags_path, notice: "Successfully created tag."
    else
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(params[:tag])
      redirect_to @tag, notice: "Successfully updated tag."
    else
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_url, notice: "Successfully destroyed tag."
  end
end
