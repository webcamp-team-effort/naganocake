class Admins::CustomersController < ApplicationController
	before_action :authenticate_admin!
	def index
<<<<<<< u
		@customers = Customer.all
=======
		@customers = Customer.page(params[:page]).per(10).with_deleted
>>>>>>> local
	end
	def show
		@customer = Customer.find(params[:id])
	end
	def edit
		@customer = Customer.find(params[:id])
	end
	def update
<<<<<<< u
		@customer = Customer.find(params[:id])
		@customer.update(customer_params)
=======
		@customer = Customer.with_deleted.find(params[:id])
		@customer.update(customer_params)
		if @customer.is_actived == true
    		@customer.restore
    	elsif @customer.is_actived == false
    		@customer.destroy
		end
		
>>>>>>> local
		redirect_to admins_customer_path(@customer.id)
	end

    private
	def customer_params
	params.require(:customer).permit(:customer_id, :name, :kana_name, :last_name, :first_name, :last_kana_name, :first_kana_name, :postcode, :address, :phone_number, :email, :is_actived)
	end
end


