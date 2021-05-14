class LeadMailer < ApplicationMailer
  default from: "bot@micolet.com"
  layout 'mailer'


  def confirmation_email
    mail(to: params[:email], subject: t('message.title'))
  end
end
