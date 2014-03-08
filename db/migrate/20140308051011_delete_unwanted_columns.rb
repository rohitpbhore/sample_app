class DeleteUnwantedColumns < ActiveRecord::Migration
  def up
    remove_column :issues, :no_followers, :project_id, :tags
  end

  def down
    add_column :issues, :no_followers, :integer
    add_column :issues, :project_id, :integer
    add_column :issues, :tags, :string
  end
end
