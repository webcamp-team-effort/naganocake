class Admins::CustomersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@customers = Customer.page(params[:page]).per(10).with_deleted
	end
	def show
		@customer = Customer.with_deleted.find(params[:id])
	end
	def edit
		@customer = Customer.with_deleted.find(params[:id])
         if @customer.deleted_at == nil
    		@customer.is_actived = true
    	 else
    	    @customer.is_actived = false
    	 end
	end
	def update
		@customer = Customer.find(params[:id])
		@customer = Customer.with_deleted.find(params[:id])
		if @customer.is_actived == true
    		@customer.restore
    	elsif @customer.is_actived == false
    		@customer.destroy
		end
		@customer = Customer.with_deleted.find(params[:id])
		@customer.update(customer_params)
		if @customer.is_actived == true
    		@customer.restore
    	elsif @customer.is_actived == false
    		@customer.destroy
		end
	
		redirect_to admins_customer_path(@customer.id)
		end
		def search
		# application controllerで生成した@qを利用して検索する
		@p_customers = @p.result.page(params[:page]).per(10)
		render :"admins/customers/index"
		end


    private
	def customer_params
	params.require(:customer).permit(:customer_id, :name, :kana_name, :last_name, :first_name, :last_kana_name, :first_kana_name, :postcode, :address, :phone_number, :email, :is_actived)
	end
end


