class TaxRatesController < ApplicationController
	include TaxRatesHelper
	before_filter :check_admin_user, :only => [:new, :edit, :destroy,:index]
	def new
		@tax_rate=TaxRate.new
	end
	def create
		@tax_rate=TaxRate.new(params[:tax_rate])
		@account=Account.find_by_name(request.subdomain)
   		@tax_rate.accountid=@account.id
		tax_all=TaxRate.all
		if nooverlap?(tax_all,@tax_rate.valid_from,@tax_rate.valid_until)
			if  (@tax_rate.valid_from >= Date.today )
				if @tax_rate.valid_until >= @tax_rate.valid_from
					if @tax_rate.save
						flash[:success] = "Tax Successfully created..."
						redirect_to tax_rates_path
					else
						render :new
					end
				else
					flash[:notice] = "Valid Until date should be greater than or equal to Valid From date"
					render :new
				end
			else
				flash[:notice] = "Valid From date should be greater than or equal to Current date"
				render :new
			end
		else
			flash[:notice] = "Tax Rates already defined for the date range"
			render :new
		end
	end

	def edit
		@tax_rate=TaxRate.find(params[:id])
	end

	def update
		@tax_rate=TaxRate.find(params[:id])
		@tax_rate_params=TaxRate.new(params[:tax_rate])
		@account=Account.find_by_name(request.subdomain)
   		@tax_rate.accountid=@account.id
		tax_all= TaxRate.where("id!=?",@tax_rate.id)
		if nooverlap?(tax_all,@tax_rate_params.valid_from,@tax_rate_params.valid_until)
			if @tax_rate_params.valid_until >= @tax_rate_params.valid_from
				if @tax_rate.update_attributes(params[:tax_rate])
					redirect_to tax_rates_path, notice: "Successfully Updated..."
				else			
					render :edit
				end
			else
				flash[:notice] = "Valid Until date should be greater than or equal to Valid From date"
				render :new
			end
		else
			flash[:notice] = "Tax Rates already defined for the date range"
			render :new
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


