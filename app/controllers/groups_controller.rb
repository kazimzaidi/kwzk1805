class GroupsController < ApplicationController
  before_filter :login_required

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(:name => params[:group][:name], :caption => params[:group][:caption],
                       :group_type => params[:group][:group_type], :owner_id => current_user.id,
                       :creator_id => current_user.id, :active => false)
    @group.members << current_user

    respond_to do |format|
      if @group.save
        flash[:notice] = "Group created."
        format.html { redirect_to group_path(@group) }
      else
        format.html { render :action => :new }
      end
    end
  end

  def show
    @group = Group.find(params[:id], :include => :messages)
    @message = Message.new
    @invitation = Invitation.new
  end

end
