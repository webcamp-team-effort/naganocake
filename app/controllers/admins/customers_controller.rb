class Admins::CustomersController < ApplicationController
	def index
		@customers = Customer.with_deleted
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
		@customer = Customer.with_deleted.find(params[:id])
		if @customer.is_actived == true
    		@customer.restore
    	elsif @customer.is_actived == false
    		@customer.destroy
		end
		@customer.update(customer_params)
		redirect_to admins_customer_path(@customer.id)
end

    private
	def customer_params
	params.require(:customer).permit(:customer_id, :name, :kana_name, :last_name, :first_name, :last_kana_name, :first_kana_name, :postcode, :address, :phone_number, :email, :is_actived)
	end
end


