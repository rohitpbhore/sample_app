class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :issue

      t.timestamps
    end
    add_index :comments, :issue_id
  end
end
