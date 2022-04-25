class ApplicationController < ActionController::Base
#  before_action :basic_auth
  protect_from_forgery with: :exception

  def hello
    render html: "hello, world!"
  end

  $ipaddress_d4rf_rails3   = "52.199.72.224"
  $ipaddress_d4rf_rails7   = ""
  $ipaddress_d4rf_jbrowse3 = "35.73.97.50"
  $ipaddress_d4rf_jbrowse4 = "35.72.126.214"

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
#      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      username == "rf" && password == "RF24seikifugu"
    end
  end

end
