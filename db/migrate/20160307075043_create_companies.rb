class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.text :tax_number
      t.text :name

      t.timestamps null: false
    end
    add_index :companies, :tax_number
    add_index :companies, :name
  end
end
