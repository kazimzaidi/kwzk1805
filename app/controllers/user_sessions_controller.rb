class UserSessionsController < ApplicationController
  before_filter :login_required, :only => :destroy
  before_filter :no_login_required, :only => [:new, :create]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    respond_to do |format|
      if @user_session.save
        format.html {redirect_to dashboard_url}
      else
        format.html {render :action => :new}
      end
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to new_user_session_url
  end
end
