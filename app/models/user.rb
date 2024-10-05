class User < ApplicationRecord
    include ActiveModel::SecurePassword
    include ActiveModel::Validations

    validates :first_name, presence: { strict: true }, length: { minimum: 1 }
    validates :last_name, presence: { strict: true }, length: { minimum: 1 }
    validates :email, presence: { strict: true }, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: { strict: true }, confirmation: true, length: { in: 8..30 }
    validates :password_confirmation, presence: { strict: true }

    # has_secure_password
    # has_secure_password :recovery_password, validations: false

    attr_accessor :password_digest, :recovery_password_digest
end
