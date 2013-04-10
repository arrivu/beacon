class OClassesController < ApplicationController
	
before_filter :authenticate_user!, only: [:index, :create, :edit,:update,:delete]

  def index
	@countOClassesPerPage = 5
    @o_classes = O_Classe.paginate(page: params[:page], per_page: 5)
	@topics = Topic.all
  end

  def new
	@o_classe = O_Classe.new
  end

  def create
   	@o_classe = current_user.o_classes.build(params[:o_classe])
	#@o_classe = O_Classe.new(params[:o_classe])
	if @o_classe.save
		flash[:success] = "Classe added successfully!!!!"
		redirect_to current_user
	else
		render 'new'
	end
  end

  def edit
    	@o_classe = O_Classe.find(params[:id])
  end

  def update
	@o_classes = O_Classe.find(params[:id])
	if @o_classes.update_attributes(params[:o_classe])
	     redirect_to @o_classes, notice: "Successfully updated Online Classe."
	else
	    render :edit
	end
  end

  def show
	@o_classe = O_Classe.find(params[:id])
	uid = @o_classe.user_id
	@author = User.find_by_id(uid)
	# Just to redirect, needed due to button click event
	# @courses = Course.paginate(page: params[:page], per_page: 3)
	# @topics = Topic.all
	#@courses = Course.all
  end

end