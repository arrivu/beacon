class TaxRatesController < ApplicationController
	before_filter :check_admin_user, :only => [:new, :edit, :destroy,:index]
	def new
		@tax_rate=TaxRate.new
	end

	def create
		@tax_rate=TaxRate.new(params[:tax_rate])
		if  (@tax_rate.valid_from>= Date.today )
			if @tax_rate.valid_from<=@tax_rate.valid_until  
				if @tax_rate.save
					flash[:success] = "Tax Successfully created..."
					redirect_to tax_rates_path
				else
					render :new
				end
			else
				flash[:notice] = "End date should be greater than start date"
				render :new
			end
		else
			flash[:notice] = "you have choosed past date"
			render :new
		end
	end

	def edit
		@tax_rate=TaxRate.find(params[:id])
	end

	def update
		@tax_rate=TaxRate.find(params[:id])
		if @tax_rate.update_attributes(params[:tax_rate])
			redirect_to tax_rates_path, notice: "Successfully Updated..."
		else			
			render :edit
		end
	end

	def show
		@tax_rate=TaxRate.find(params[:id])
	end

	def index
		@tax_rate=TaxRate.paginate(page: params[:page], :per_page => 10)
	end

	def destroy
		@tax_rate=TaxRate.find(params[:id])
		@tax_rate.destroy
		redirect_to tax_rates_path, notice: "Tax Successfully Destroyed"
	end
end


