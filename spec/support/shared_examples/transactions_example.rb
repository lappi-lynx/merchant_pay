RSpec.shared_context 'transaction ancestors context' do
  shared_examples_for 'child transaction with validations and associations' do
    it { expect(subject).to be_valid }
    it { expect { Transaction.new }.to raise_error(RuntimeError) }

    describe 'associations' do
      it { should belong_to(:merchant) }
    end

    describe 'validations' do
      it { should validate_presence_of(:uuid) }
      it { should validate_presence_of(:customer_email) }
      it { should validate_presence_of(:status) }
      it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0.0) }

      it do
        is_expected.to define_enum_for(:status).with_values(
          approved: 'approved',
          refunded: 'refunded',
          reversed: 'reversed',
          error: 'error'
        ).backed_by_column_of_type(:enum)
      end

      it { should allow_values(:approved, :refunded, :reversed, :error).for(:status) }
    end
  end
end
