class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  has_secure_password

  enum role: {user: 0, admin: 1}

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
