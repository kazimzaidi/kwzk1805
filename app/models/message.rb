class Message < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates_presence_of :body
end
