class UserForm
  include ActiveModel::Model

  attr_accessor :email, :name, :password, :password_confirmation

  validates :email, presence: true
  validates :password, confirmation: true

  def save
    return false unless valid?

    User.create(email:, name:, password:)
  end
end
