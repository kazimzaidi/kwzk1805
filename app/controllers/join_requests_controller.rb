class JoinRequestsController < ApplicationController
  before_filter :login_required

  def index
    @join_requests = Group.find(params[:group_id]).join_requests(:conditions => {:status => JoinRequest::Status[:pending]})
  end

  def create
    join_request = JoinRequest.new(:group_id => params[:group_id], :user_id => current_user.id, :status => JoinRequest::Status[:pending])

    if join_request.save
      respond_to do |format|
        flash[:notice] = "Your join request was sent to the owner of this group for approval."
        format.html {redirect_to(group_path(params[:group_id]))}
      end
    end
  end

  def update
    jr = JoinRequest.find(params[:id])
    membership = Membership.new(:group_id => jr.group.id, :user_id => jr.user.id)

    respond_to do |format|
      if membership.save
        flash[:notice] = "#{jr.user.name} is now a member of #{jr.group.name}."
        jr.update_attributes(:status => JoinRequest::Status[:approved])
        format.html {redirect_to group_join_requests_url(jr.group)}
      end
    end
  end
end
