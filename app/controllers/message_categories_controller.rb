class MessageCategoriesController < ApplicationController
  before_action :set_message_category, only: [:show, :edit, :update, :destroy]
  before_action :define_severity, only: [:edit, :new, :create, :update]

  # GET /message_categories
  # GET /message_categories.json
  def index
    @message_categories = current_user.message_categories
  end

  # GET /message_categories/1
  # GET /message_categories/1.json
  def show
  end

  # GET /message_categories/new
  def new
    @message_category = MessageCategory.new
  end

  # GET /message_categories/1/edit
  def edit
  end

  # POST /message_categories
  # POST /message_categories.json
  def create
    @message_category = MessageCategory.new(message_category_params)
    @message_category.user_id = current_user.id

    respond_to do |format|
      if @message_category.save
        format.html { redirect_to @message_category, notice: 'Message category was successfully created.' }
        format.json { render :show, status: :created, location: @message_category }
      else
        format.html { render :new }
        format.json { render json: @message_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_categories/1
  # PATCH/PUT /message_categories/1.json
  def update
    respond_to do |format|
      if @message_category.update(message_category_params)
        format.html { redirect_to @message_category, notice: 'Message category was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_category }
      else
        format.html { render :edit }
        format.json { render json: @message_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_categories/1
  # DELETE /message_categories/1.json
  def destroy
    @message_category.destroy
    respond_to do |format|
      format.html { redirect_to message_categories_url, notice: 'Message category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_category
      @message_category = MessageCategory.find(params[:id])
    end

    def define_severity
      @severity = [["Urgent", 1], ["Pressing", 2]]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_category_params
      params.fetch(:message_category, {}).permit(:title, :send_at, :user_id, :severity)
    end
end
