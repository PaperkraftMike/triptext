class HomeController < ApplicationController
  def index
    @address = Addresses.last.full_addresses
    @destination = Destination.last
  end
end 