class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name, null: false
      t.decimal :amount, null: false, default: 0.0
      t.boolean :shared, null: false, default: false

      t.references :category, null: false, index: true, foreign_key: true
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
