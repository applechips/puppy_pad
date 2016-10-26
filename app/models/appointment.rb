class Appointment < ApplicationRecord
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :time, presence: true

  after_create :reminder

  @@REMINDER_TIME = 30.minutes # minutes before appointment

  # Notify our appointment attendee X minutes before the appointment time
  def reminder
    @twilio_number = "+16042393284"
    @client = Twilio::REST::Client.new "AC952f5b95ae7ed71d403af0dec9e94324", "34cc3ac30c00c3ee9b2fce19e562e3a7"
    time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
    reminder = "Hi #{self.first_name}. Just a reminder that you have an appointment coming up at #{time_str}."
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.phone_number,
      :body => reminder,
    )
    puts message.to
  end

  def when_to_run
    time - @@REMINDER_TIME
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
