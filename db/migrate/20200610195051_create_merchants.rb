class CreateMerchants < ActiveRecord::Migration[6.0]
  def up
    create_table :merchants do |t|
      t.string  :name, null: false
      t.text    :description
      t.string  :email, null: false
      t.decimal :total_transaction_sum, default: 0.0, null: false

      t.timestamps
    end

    execute <<-SQL
      CREATE TYPE merchant_status AS ENUM ('active', 'inactive');
    SQL

    add_column :merchants, :status, :merchant_status
    add_index  :merchants, :status
  end

  def down
    drop_index :merchants, :status
    drop_table :merchants

    execute <<-SQL
      DROP TYPE merchant_status;
    SQL
  end
end
