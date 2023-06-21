require 'twilio-ruby'

class OrderConfirmation

  def initialize(details, order)
    time = Time.now + (30 * 60)
    @confirmed_time = time.strftime("%I:%M %p")
    @twilio_phone_number = details.twilio_phone_number
    @phone_number = details.my_number
    account_sid = details.account_sid
    auth_token = details.auth_token
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @order = order
  end

  def send_message
    @client.messages.create(
      body: "Thank you!\nYour order has been confirmed and will be delivered before #{@confirmed_time}\n#{@order.show_receipt}",
      from: @twilio_phone_number,
      to: @phone_number
    )
  end
end

# puts message.sid
# puts message.direction 
# puts message.price_unit
# puts message.date_created