class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
  	search_date = Date.today
  	@orders = Order.where("created_at >= ?",search_date)
  end
end
