class CreateJoinTableCategoryNonProfit < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :non_profits do |t|
      # t.index [:category_id, :non_profit_id]
      # t.index [:non_profit_id, :category_id]
      t.column :category_id, :integer
      t.column :non_profit_id, :integer
    end
  end
end
