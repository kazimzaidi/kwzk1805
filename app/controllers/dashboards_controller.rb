class DashboardsController < ApplicationController
  before_filter :login_required

  def show
    @user = current_user
    @message = Message.new
    @messages = Message.find(:all, :conditions => { :group_id => @user.group_ids }, :order => 'created_at DESC')
  end
end
