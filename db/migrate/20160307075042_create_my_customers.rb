class CreateMyCustomers < ActiveRecord::Migration
  def change
    create_table :my_customers do |t|
      t.text :number
      t.integer :tradeable_id
      t.text :tradeable_type

      t.timestamps null: false
    end
    add_index :my_customers, :number
    add_index :my_customers, :tradeable_id
    add_index :my_customers, :tradeable_type
  end
end
