class DashboardsController < ApplicationController
  before_filter :login_required

  def show
    @user = current_user
    @message = Message.new
  end
end
