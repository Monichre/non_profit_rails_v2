class CreateNonProfits < ActiveRecord::Migration[5.0]
  def change
    create_table :non_profits do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :location

      t.timestamps
    end
  end
end
