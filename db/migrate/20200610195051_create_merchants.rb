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

    add_column :merchants, :status, :merchant_status, default: 'active'
    add_index  :merchants, :status
  end

  def down
    remove_index :merchants, :status
    drop_table   :merchants

    execute <<-SQL
      DROP TYPE IF EXISTS merchant_status;
    SQL
  end
end
