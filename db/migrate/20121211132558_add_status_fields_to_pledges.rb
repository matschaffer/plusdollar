class AddStatusFieldsToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :closed, :boolean, default: false
    add_column :pledges, :awarded_to, :string
    add_column :pledges, :claimed_at, :datetime
  end
end
