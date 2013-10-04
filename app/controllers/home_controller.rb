class HomeController < ApplicationController
  after_action :allow_iframe

  def index
  end

private

  def allow_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM localhost'
  end

end 