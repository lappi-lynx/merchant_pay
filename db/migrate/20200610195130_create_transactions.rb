class CreateTransactions < ActiveRecord::Migration[6.0]
  def up
    create_table :transactions do |t|
      t.string  :type
      t.string  :uuid, null: false
      t.decimal :amount, default: 0.0, null: false
      t.string  :customer_phone
      t.string  :customer_email, null: false
      t.references :merchant, foreign_key: true, index: true

      t.timestamps
    end

    execute <<-SQL
      CREATE TYPE transaction_status AS ENUM ('approved', 'reversed', 'refunded', 'error');
    SQL

    add_column :transactions, :status, :transaction_status, null: false
    add_index  :transactions, :status
  end

  def down
    remove_index :transactions, :status
    drop_table   :transactions

    execute <<-SQL
      DROP TYPE IF EXISTS transaction_status;
    SQL
  end
end
