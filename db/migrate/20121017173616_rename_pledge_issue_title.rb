class RenamePledgeIssueTitle < ActiveRecord::Migration
  def change
    rename_column :pledges, :issue_title, :title
  end
end
