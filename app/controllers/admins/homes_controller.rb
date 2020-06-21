class Admins::HomesController < ApplicationController
  def top
  	search_date = Date.today
  	@order_count = Order.where(created_at: search_date.in_time_zone.all_day)
  end
end
