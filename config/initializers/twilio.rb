TWILIO_CLIENT   = Twilio::REST::Client.new(Settings::KEYS['TWILIO_SID'], Settings::KEYS['TWILIO_TOKEN'])
TWILIO_MESSAGES = TWILIO_CLIENT.account.sms.messages