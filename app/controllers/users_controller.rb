class UsersController < ApplicationController
  before_filter :no_login_required, :only => [:new, :create]
  before_filter :login_required, :only => [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'New user creation successful.'
        format.html {redirect_to dashboard_url}
      else
        format.html {render :action => :new}
      end
    end
  end
end
