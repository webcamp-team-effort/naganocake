class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
  	search_date = Date.today
  	@orders = Order.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
