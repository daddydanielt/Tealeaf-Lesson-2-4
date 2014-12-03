class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.integer :user_id
      
      #================>
      # polymorphic
      t.string :voteable_type
      t.integer :voteable_id
      # the same as :
      # t.references :voteable, polymorphic: true
      #================>

      t.timestamps
    end
  end
end
