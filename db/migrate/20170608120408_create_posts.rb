class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :question, null: false
      t.string :title, null: false
      t.integer :creator_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
