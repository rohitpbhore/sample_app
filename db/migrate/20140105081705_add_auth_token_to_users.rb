class AddAuthTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auto_token, :string
  end
end
