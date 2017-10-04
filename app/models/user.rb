class User < ApplicationRecord
  before_save { self.email.downcase! }

  validates :name, presence: true, length: { maximum: 40 }
  validates :email, presence: true, length: { maximum: 254 },
                    format: { with: /.+@.+\..+/i}, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, length: {minimum: 6, maximum: 21}, presence: true
end