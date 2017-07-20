class User < ApplicationRecord
  has_secure_password
  enum role: [:admin]
  before_save :downcase_username
  validates :username, uniqueness: true


  def downcase_username
    self.username = self.username.downcase
  end
end
