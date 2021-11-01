class CreateFoodCombinations < ActiveRecord::Migration[6.0]
  def change
    create_table :food_combinations do |t|
      t.references :main, null: false, foreign_key: true
      t.references :sub, null: false, foreign_key: true

      t.timestamps
    end
  end
end
