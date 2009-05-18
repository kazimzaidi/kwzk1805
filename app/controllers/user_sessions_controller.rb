class UserSessionsController < ApplicationController
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
    redirect_to
  end
end
