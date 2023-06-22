require 'twilio-ruby'

class OrderConfirmation

  def initialize(details, order)
    @busy = false
    @twilio_phone_number = details.twilio_phone_number
    @phone_number = details.my_number
    account_sid = details.account_sid
    auth_token = details.auth_token
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @order = order
  end

  def time
    @busy == false ? time = Time.now + (30 * 60) : time = Time.now + (60 * 60)
    time.strftime('%I:%M %p')
  end

  def busy?
    @busy = true
  end

  def confirmation_message
    "Thank you!\nYour order has been confirmed and will be delivered before #{time}\n#{@order.show_receipt}"
  end

  def send_message
    @client.messages.create(
      body: confirmation_message,
      from: @twilio_phone_number,
      to: @phone_number
    )
  end
end
