class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(:email => params[:invitation][:email], :group_id => params[:group_id],
	                         :status => Invitation::Status[:pending])

    respond_to do |format|
      if @invitation.save
        flash[:notice] = "An invitation was sent to #{@invitation.email}."
      end
      format.html { redirect_to group_path(params[:group_id]) }
    end
  end

  def update
    invitation = Invitation.find(params[:id])
    membership = Membership.new(:group_id => invitation.group_id, :user_id => params[:user_id])

    respond_to do |format|
      if membership.save
        invitation.update_attributes(:status => Invitation::Status[:accepted])
        flash[:notice] = "You're now a member of #{invitation.group.name}."
      end
      format.html { redirect_to group_path(invitation.group) }
    end
  end
end
