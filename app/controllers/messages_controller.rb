class MessagesController < ApplicationController
  def new
  end

  def create
    @message = current_user.messages.create(:body => params[:message][:body])

    respond_to do |format|
      format.html {redirect_to dashboard_url}
    end
  end
end
