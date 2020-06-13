require 'rails_helper'

RSpec.describe Merchant, type: :model do
  subject { build(:merchant) }

  it { expect(subject).to be_valid }
  it { expect(described_class.superclass).to eq User }

  describe 'associations' do
    it { should have_many(:transactions).dependent(:restrict_with_exception).with_foreign_key(:user_id) }
  end
end
