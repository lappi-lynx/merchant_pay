RSpec.shared_context 'transaction ancestors context' do
  shared_examples_for 'child transaction with validations and associations' do
    it { expect(subject).to be_valid }
    it { expect { Transaction.new }.to raise_error(RuntimeError) }

    describe 'associations' do
      it { should belong_to(:merchant) }
    end
  end
end
