class Admins::HomesController < ApplicationController
  def top
  	search_date = Date.today
  	@orders = Order.where("created_at >= ?",search_date)
  end
end
