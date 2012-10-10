class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.string :issue_url
      t.string :issue_title
      t.decimal :amount
      t.belongs_to :user

      t.timestamps
    end
    add_index :pledges, :user_id
  end
end
