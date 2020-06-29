class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
  	@orders = Order.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
