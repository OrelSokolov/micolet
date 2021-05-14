class EmailSendJob < ApplicationJob
  queue_as :default

  def perform(lead)
    LeadMailer.with(lead: lead).confirmation_email.deliver_now
  end
end
