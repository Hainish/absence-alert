class MessageCategory < ActiveRecord::Base
  has_many :messages
  belongs_to :user

  def severity_label
    if severity == 1
      "Urgent"
    elsif severity == 2
      "Pressing"
    end
  end
end
