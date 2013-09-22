class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :messages_sent, :check_total_number

  private
  
  def messages_sent
    $number = 0
  end

  def check_total_number
    if $number >= MAX_ALLOWED
      redirect_to root_path
    end
  end
end
