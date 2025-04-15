class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, presence: true
  validates :confirm_email_address, presence: true
  validates :password, presence: true

  validate :email_addresses_must_match

  private
  def email_addresses_must_match
    if email_address != confirm_email_address
      errors.add(:confirm_email_address, "must match email address")
    end
  end
end
