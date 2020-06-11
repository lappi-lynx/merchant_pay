require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { expect { Transaction.new }.to raise_error(RuntimeError) }
end
