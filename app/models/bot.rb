class Bot < ApplicationRecord
  encrypts :username, :token

  validates_presence_of :token, :username
end
