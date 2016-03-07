class CreateFinancers < ActiveRecord::Migration
  def change
    create_table :financers do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
