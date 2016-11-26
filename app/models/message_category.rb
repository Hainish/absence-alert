class MessageCategory < ActiveRecord::Base
  has_many :messages
end
