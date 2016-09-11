class CreateJoinTableNonProfitUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :non_profits, :users do |t|
      # t.index [:non_profit_id, :user_id]
      # t.index [:user_id, :non_profit_id]
      t.column :non_profit_id, :integer
      t.column :user_id, :integer
    end
  end
end
