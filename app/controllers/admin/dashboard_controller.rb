class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_KEY_NAME"], password: ENV["ADMIN_KEY_PASS"]
  def show
  end
end
