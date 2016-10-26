module TwilioHelper

def send_SMS(from = "+16042393284", to = "+17783866087", body = "Wow this works")
    @client = Twilio::REST::Client.new

    @client.messages.create(
    from: from,
    to: to,
    body: body
    )
  end

end
