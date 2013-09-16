class HomeController < ApplicationController
  def index
    @address = Addresses.new
  end
end 