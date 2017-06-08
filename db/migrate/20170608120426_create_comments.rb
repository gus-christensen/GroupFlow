class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.references :voteable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
