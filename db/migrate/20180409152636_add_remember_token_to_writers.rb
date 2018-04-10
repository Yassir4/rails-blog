class AddRememberTokenToWriters < ActiveRecord::Migration[5.1]
  def change
    add_column :writers, :remember_token, :string
  end
end
