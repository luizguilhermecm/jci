class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.date :data_not
      t.date :data_update_not
      t.string :titulo_not
      t.text :descricao_not

      t.timestamps
    end
  end
end
