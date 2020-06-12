class UpdateMerchantsTotalTransactionSumType < ActiveRecord::Migration[6.0]
  def up
    change_column :merchants, :total_transaction_sum, :integer, default: 0, null: false
  end

  def down
    change_column :merchants, :total_transaction_sum, :decimal, default: 0.0, null: false
  end
end
