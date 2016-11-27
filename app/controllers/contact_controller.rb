class ContactController < ApplicationController
  before_action :require_login, except: [:confirm, :reject]
  before_action :find_contact_confirm_token, only: [:confirm, :reject]

  def index
    @contacts = current_user.contacts
  end

  def confirm
    @contact.confirmed = true
    @contact.save
    render "confirmation_success"
  end

  def reject
    @contact.rejected = true
    @contact.save
    render "confirmation_reject"
  end

  private

  def find_contact_confirm_token
    begin
      @contact = Contact.find params[:id]
    rescue ActiveRecord::RecordNotFound
      return render "confirmation_failure"
    end

    render "confirmation_failure" unless @contact.confirmation_token == params[:confirmation_token]
  end
end
