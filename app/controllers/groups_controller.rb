class GroupsController < ApplicationController
	def index
    @groups = Group.order(:name)
  end

  def show
    @group = Group.find(params[:id])
    @countTutorialsPerPage = 5
    @tutorials_for_group = @group.tutorials.paginate(page: params[:page], per_page: 5)
    @groups = Group.order(:name)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      redirect_to tutorials_path, notice: "Successfully created group."
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      redirect_to @group, notice: "Successfully updated group."
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_url, notice: "Successfully destroyed group."
  end
end
