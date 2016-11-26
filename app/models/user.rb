class User < ApplicationRecord
  include Clearance::User
  has_many :message_categories
  has_many :messages, through: :message_severities
end
