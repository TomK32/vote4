class CreateVotings < ActiveRecord::Migration
  def self.up
    create_table :votings do |t|
      t.column :question, :text, :null => false
      t.column :permalink, :string, :null => false
      
      t.column :user_login, :string, :null => false
      t.column :user_id, :integer, :null => false
      t.column :options_cache, :text
      
      t.column :public, :boolean, :null => false, :default => true
      t.column :closed, :boolean, :null => false, :default => false

      t.timestamps
    end
    add_index :votings, :question
    add_index :votings, :permalink, :unique => true
  end

  def self.down
    remove_index :votings, :column => :permalink
    remove_index :votings, :permalink
    remove_index :votings, :user_login
    drop_table :votings
  end
end
