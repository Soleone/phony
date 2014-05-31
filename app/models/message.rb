class Message
  include ActiveModel::Model

  attr_accessor :to, :from, :body, :direction, :sid, :created_at

  def self.list(filter = {})
    messages = TWILIO_MESSAGES.list(filter)
    messages.map { |twilio_message| Message.from_twilio_message(twilio_message) }
  end

  def self.from_twilio_message(twilio_message)
    new({
      to: twilio_message.to,
      from: twilio_message.from,
      body: twilio_message.body,
      direction: twilio_message.direction,
      sid: twilio_message.sid,
      created_at: twilio_message.date_created
    })
  end

  def initialize(attributes={})
    super
    @from = attributes[:from] || Settings::KEYS['DEFAULT_FROM_NUMBER']
  end

  def publish
    TWILIO_MESSAGES.create(twilio_options)
  end

  def inbound?
    direction == 'inbound'
  end

  def outbound?
    !inbound?
  end


  private

  def twilio_options
    {
      from: from,
      to: to,
      body: body
    }
  end
end