class JoinRequestsController < ApplicationController
  before_filter :login_required

  def index
    @group = Group.find(params[:group_id])
    @join_requests = @group.join_requests.find(:all, :conditions => {:status => JoinRequest::Status[:pending]})
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

    respond_to do |format|
      if params[:status] == JoinRequest::Status[:approved]
        membership = Membership.new(:group_id => jr.group.id, :user_id => jr.user.id)
        if membership.save
          flash[:notice] = "#{jr.user.name} is now a member of #{jr.group.name}."

          # TODO: WA: Send email notification to the user.
          jr.update_attributes!(:status => JoinRequest::Status[:approved])
          format.html {redirect_to group_join_requests_url(jr.group)}
        end
      elsif params[:status] == JoinRequest::Status[:rejected]
        jr.update_attributes!(:status => JoinRequest::Status[:rejected])
        flash[:notice] = "The join request was rejected."
        # TODO: WA: Send email notification to the user.
        format.html {redirect_to group_join_requests_url(jr.group)}
      end
    end
  end
end
