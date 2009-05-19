class User
  def is_member_of?(group)
    self.groups.include?(group)
  end

  def is_owner_of?(group)
    self.owned_groups.include?(group)
  end
end
