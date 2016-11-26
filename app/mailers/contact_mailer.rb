class ContactMailer < ApplicationMailer
  default from: Rails.application.secrets.mailer_from

  def confirm_email contact
    @user_email = contact.user.email
    @id = contact.id
    @confirmation_token = contact.confirmation_token

    mail to: contact.email, subject: 'ActionAlert: Please confirm your email'
  end
end
