class CreateCollaborations < ActiveRecord::Migration

  def change
    create_table :collaborations do |t|
      t.integer :user_id
      t.integer :page_id
      t.timestamps
    end

    add_index :pages, :id, unique: true
    add_index :users, :id, unique: true
    add_index :collaborations, :id, unique: true
    add_index :collaborations, :page_id
    add_index :collaborations, :user_id
  end
end
