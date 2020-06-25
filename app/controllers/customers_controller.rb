class CustomersController < ApplicationController
	def leave
	  @customer = Customer.find(current_customer.id)
	  @customer.destroy
      redirect_to root_path
	end
	def confirm
	end
	def edit
		@customer = Customer.find(params[:id])
	end
	def show
		@customer = Customer.find(params[:id])
	end
	def update
		@customer = Customer.find(params[:id])
		@customer.update(customer_params)
		redirect_to customer_path(@customer)
	end

	private
  	def customer_params
      params.require(:customer).permit(:email, :name, :kana_name, :password, :last_name, :first_name, :last_kana_name, :first_kana_name, :postcode, :address, :phone_number, :is_actived)
  	end
end

