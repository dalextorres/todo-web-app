class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :username, presence: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 10 }
    validates :password, confirmation: { case_sensitive: true }

    def self.digest
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

end
