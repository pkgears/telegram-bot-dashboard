class Bot < ApplicationRecord
  encrypts :username, :token
end
