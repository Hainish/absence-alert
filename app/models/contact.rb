class Contact < ApplicationRecord
  validates_uniqueness_of :email, scope: :user_id
  validates_uniqueness_of :confirmation_token
  before_validation :generate_random_confirmation_token, on: :create
  belongs_to :user

  after_create :send_confirmation

  def send_confirmation
    ContactMailer.confirm_email(self).deliver_now
  end

  private

  def generate_random_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64 64
  end

end
