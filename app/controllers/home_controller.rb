class HomeController < ApplicationController
  def index
    @address = Addresses.new
    @destination = Destination.new
    @message = Message.new
  end
end 