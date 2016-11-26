class ContactController < ApplicationController
  before_action :require_login, except: [:confirm, :reject]

  def confirm
    begin
      @contact = Contact.find params[:id]
    rescue ActiveRecord::RecordNotFound
      render "confirmation_failure"
    end

    if @contact.confirmation_token == params[:confirmation_token]
      @contact.confirmed = true
      @contact.save
      render "confirmation_success"
    else
      render "confirmation_failure"
    end
  end

  def reject
    begin
      @contact = Contact.find params[:id]
    rescue ActiveRecord::RecordNotFound
      render "confirmation_failure"
    end

    if @contact.confirmation_token == params[:confirmation_token]
      @contact.rejected = true
      @contact.save
      render "confirmation_reject"
    else
      render "confirmation_failure"
    end

  end
end
