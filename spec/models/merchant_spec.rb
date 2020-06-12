require 'rails_helper'

RSpec.describe Merchant, type: :model do
  subject { build(:merchant) }

  it { expect(subject).to be_valid }

  describe 'associations' do
    it { should have_many(:transactions).dependent(:restrict_with_exception) }
  end
end
