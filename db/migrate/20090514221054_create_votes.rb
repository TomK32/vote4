class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.column :user_id, :integer, :null => false
      t.column :user_login, :string, :null => false
      t.column :voting_id, :integer, :null => false
      t.column :option, :string, :null => false
      t.column :deleted, :boolean
      t.column :tweet_id, :integer, :limit => 8
      

      t.timestamps
    end
    add_index :votes, [:voting_id, :user_id], :unique => true
  end

  def self.down
    remove_index :votes, :column => [:user_id, :voting_id]
    drop_table :votes
  end
end
