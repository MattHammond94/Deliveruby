require 'order_confirmation'

describe OrderConfirmation do
  context 'Busy?' do
    it 'Should showcase the correct time when busy is false' do
      details = double(:details, twilio_phone_number: '1', my_number: '2', account_sid: '3', auth_token: '4')
      order = double(:order)
      time = Time.now + (30 * 60)
      real_time = time.strftime("%I:%M %p")
      confirmation = OrderConfirmation.new(details, order)
      expect(confirmation.time).to eq(real_time)
    end

    it 'Should showcase the correct time when busy is set to true' do
      details = double(:details, twilio_phone_number: '1', my_number: '2', account_sid: '3', auth_token: '4')
      order = double(:order)
      time = Time.now + (60 * 60)
      real_time = time.strftime("%I:%M %p")
      confirmation = OrderConfirmation.new(details, order)
      confirmation.busy?
      expect(confirmation.time).to eq(real_time)
    end
  end

  context 'Body' do
    it 'Should generate the correct message body showcasing the correct time and receipt' do
      details = double(:details, twilio_phone_number: '1', my_number: '2', account_sid: '3', auth_token: '4')
      order = double(:order, show_receipt: "Receipt:\nSalmon Skin Roll - £12.99\nTotal cost: £12.99")
      time = Time.now + (30 * 60)
      real_time = time.strftime("%I:%M %p")
      confirmation = OrderConfirmation.new(details, order)
      expect(confirmation.confirmation_message).to eq("Thank you!\nYour order has been confirmed and will be delivered before #{real_time}\nReceipt:\nSalmon Skin Roll - £12.99\nTotal cost: £12.99")
    end
  end
end