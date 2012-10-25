class AddProjectIdToPledge < ActiveRecord::Migration
  def change
    add_column :pledges, :project_id, :integer
  end
end
