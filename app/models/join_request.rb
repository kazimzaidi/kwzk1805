class JoinRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validate   :must_be_moderated

  Status = {:pending => 'PEND', :approved => 'APPR', :rejected => 'REJC'}

  def must_be_moderated
    errors.add_to_base("Must be a Moderated group only.") unless group.is_moderated?
  end

end
