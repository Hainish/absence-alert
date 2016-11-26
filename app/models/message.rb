class Message < ActiveRecord::Base
  belongs_to :message_categories, :message_severities
end
