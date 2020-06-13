class Merchant < User
  before_validation :add_merchant_role
  has_many :transactions, dependent: :restrict_with_exception, foreign_key: 'user_id'

  enum status: { active: 'active', inactive: 'inactive' }

  private

  def add_merchant_role
    self.role_id = Role.find_or_create_by(name: ::Role::MERCHANT).id
  end
end
