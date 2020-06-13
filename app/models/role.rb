class Role < ApplicationRecord
  has_many :users

  ADMIN = 'admin'.freeze
  MERCHANT = 'merchant'.freeze
end
