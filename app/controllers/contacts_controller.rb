class ContactsController < ApplicationController
  before_action :require_login, except: [:confirm, :reject]
  before_action :find_contact_confirm_token, only: [:confirm, :reject]

  def index
    @contacts = current_user.contacts
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_url, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact = Contact.find params[:id]
    
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Message category was successfully destroyed.' }
      format.json { head :no_content }
    end
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

  def contact_params
    params.fetch(:contact, {}).permit(:email)
  end
end
