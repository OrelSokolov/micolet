class Lead < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validate :email_should_be_email

  def email_should_be_email
    unless URI::MailTo::EMAIL_REGEXP.match?(email)
      errors.add(:email, I18n.t('lead.errors.email'))
    end
  end
end
