class Conversations::RecurringMessagesController < ApplicationController
  before_action :set_recurring_message, only: [:show, :edit, :update, :destroy]

  def index
    @recurring_messages = RecurringMessage.all
  end

  def show
    @conversation = Conversation.find(params[:conversation_id])
    @follow_ups = @recurring_message.follow_ups
  end


  def new
    @conversation = Conversation.find(params[:conversation_id])
    @recurring_message = current_user.recurring_messages.build
    @recurring_message.follow_ups.build
  end

  def edit
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @recurring_message = RecurringMessage.new(recurring_message_params)
    @recurring_message.user = current_user
    @recurring_message.conversation = @conversation
    @recurring_message.to = @conversation.patient.phone_number

    respond_to do |format|
      if @recurring_message.save
        format.html { redirect_to conversation_messages_path(@conversation), notice: 'Recurring message was successfully created.' }
        format.json { render :show, status: :created, location: @recurring_message }
      else
        format.html { render :new }
        format.json { render json: @recurring_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recurring_message.update(recurring_message_params)
        format.html { redirect_to @recurring_message, notice: 'Recurring message was successfully updated.' }
        format.json { render :show, status: :ok, location: @recurring_message }
      else
        format.html { render :edit }
        format.json { render json: @recurring_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @conversation = Conversation.find(params[:conversation_id])
    @recurring_message.destroy
    respond_to do |format|
      format.html { redirect_to conversation_messages_path(@conversation), notice: 'Recurring message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurring_message
      @recurring_message = RecurringMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recurring_message_params
      params.require(:recurring_message).permit(:end_date, :start_date, :expect_response, :frequency, :body, :to, :user_id, :conversation_id, follow_ups_attributes: [:id, :body, :expect_response, :reference_number, :yes_message_ref, :no_message_ref, :one_message_ref, :two_message_ref, :three_message_ref, :four_message_ref, :five_message_ref, :recurring_message_id, :_destroy])
    end
end
