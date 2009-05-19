class MessagesController < ApplicationController
  def new
  end

  def create
    @message = current_user.messages.create(:body => params[:message][:body], :user_id => current_user.id, :group_id => params[:group_id])

    respond_to do |format|
      format.html {redirect_to group_path(params[:group_id])}
    end
  end
end
