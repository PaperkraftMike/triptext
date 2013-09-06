class HomeController < ApplicationController
  def index
    @json = Addresses.last.to_gmaps4rails
  end
end 