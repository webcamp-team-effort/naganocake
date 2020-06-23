class Admins::CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end
	def show
		@customer = Customer.find(params[:id])
	end
	def edit
		@customer = Customer.find(params[:id])
	end
	def update
		@customer = Customer.find(params[:id])
		@customer.update(customer_params)
		redirect_to admins_customer_path(@customer.id)
	end

    private
	def customer_params
	params.require(:customer).permit(:customer_id, :name, :kana_name, :last_name, :first_name, :last_kana_name, :first_kana_name, :postcode, :address, :phone_number, :email, :is_actived)
	end
end


