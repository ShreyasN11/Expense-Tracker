class CreateExpenses < ActiveRecord::Migration[8.1]
  def change
    create_table :expenses do |t|
      t.decimal :amount
      t.string :description
      t.date :spent_on
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_check_constraint :expenses, "amount > 0", name: "amount_positive"
    add_index :expenses, :spent_on
  end
end
