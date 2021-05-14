class Lead < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validate :email_should_be_email
  validate :prefs_required

  def email_should_be_email
    unless URI::MailTo::EMAIL_REGEXP.match?(email)
      errors.add(:email, I18n.t('lead.errors.email'))
    end
  end

  def prefs_required
    unless womans_fashion.present? || mens_fashion.present? || children_fashion.present?
      errors.add(:preferences, I18n.t('lead.errors.preferences_required'))
    end
  end
end
