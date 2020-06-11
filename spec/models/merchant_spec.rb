require 'rails_helper'

RSpec.describe Merchant, type: :model do
  subject { build(:merchant) }

  it { expect(subject).to be_valid }

  describe 'associations' do
    it { should have_many(:transactions).dependent(:restrict_with_exception) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:status) }

    it do
      is_expected.to define_enum_for(:status).with_values(
        active: 'active',
        inactive: 'inactive'
      ).backed_by_column_of_type(:enum)
    end
    it { should allow_values(:active, :inactive).for(:status) }
  end
end
