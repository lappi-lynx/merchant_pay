class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  belongs_to :role

  delegate :name, to: :role, prefix: true

  def admin?
    role_name == ::Role::ADMIN
  end

  def merchant?
    role_name == ::Role::MERCHANT
  end
end
