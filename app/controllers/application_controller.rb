class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers

  USER_ID = "admin"
  PASSWORD = "W3C3ntr1s:)"

  protect_from_forgery with: :exception

  def authenticate_account
    authenticate_or_request_with_http_basic do |id, password|
        id == USER_ID && password == PASSWORD
    end
  end
end
