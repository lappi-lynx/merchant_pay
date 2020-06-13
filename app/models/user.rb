class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  belongs_to :role

  delegate :name, to: :role, prefix: true
end
