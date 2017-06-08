class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voteable, polymorphic: true, index: true
      t.integer :value, null: false
      t.timestamps
    end
  end
end
