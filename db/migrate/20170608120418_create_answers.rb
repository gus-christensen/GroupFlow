class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :post_id, null: false, foreign_key: true
      t.references :commentable, polymorphic: true, index: true
      t.references :voteable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
