class Conversations::MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:reply]
  before_action :set_conversation, except: [:reply]
  skip_before_action :verify_authenticity_token, only: [:reply]

  def index
    @messages = @conversation.messages.where(status: 'sent').or(@conversation.messages.where(status: 'received')).order("COALESCE(sent_at, created_at)")
    @pending_messages = @conversation.messages.where(status: 'pending').order("send_at ASC")
    @message = @conversation.messages.build
    @recurring_messages = @conversation.recurring_messages
  end

  def create
    @message = @conversation.messages.build(message_params)

    @message.update(to: @conversation.patient.phone_number, status: 'pending', direction: 'outbound-api')

    if @message.save
      #if has time scheduled, use perform_at else use existing
      if @message.send_at != nil
        #workaround for time zone, need to fix
        send_time = @message.send_at.advance(:hours => 4)
        SendSmsJob.set(wait_until: send_time).perform_later(@message)
      else  
        SendSmsJob.perform_later(@message)
      end
      redirect_to conversation_messages_path(@conversation), notice: 'Message sent'
    else
      redirect_to conversation_messages_path(@conversation), alert: 'Something went wrong'
    end
  end

  def reply
    # handle Twilio POST here
    from = params[:From].gsub(/^\+\d/, '')
    body = params[:Body]
    status = params[:SmsStatus]
    direction = 'inbound'
    message_sid = params[:MessageSid]

    # Find the conversation it should belong to.
    patient = Patient.where("phone_number like ?", "%#{from}%").first
    @conversation = Conversation.where(patient: patient).first
    @last_message = @conversation.messages.where(direction: "outbound-api").where(status: "sent").order("created_at ASC").last
    if @last_message.expect_response.present?
      expect_response = @last_message.expect_response
      reference_number = @last_message.reference_number
      recurring_message_id = @last_message.recurring_message_id
    end
    @conversation.messages.build(expect_response: expect_response, reference_number: reference_number, recurring_message_id: recurring_message_id, body: body, direction: direction, status: status, from: from, message_sid: message_sid).save
    # the head :ok tells everything is ok
    # This stops template errors in the console
    head :ok, content_type: "text/html"
  end


  def destroy
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to conversation_messages_path(@conversation), notice: 'Recurring message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_conversation
      @conversation = current_user.conversations.find(params[:conversation_id])
    end

    def message_params
      params.require(:message).permit(:body, :send_at)
    end
end