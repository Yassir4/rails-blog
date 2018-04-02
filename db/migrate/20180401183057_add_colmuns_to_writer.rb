class AddColmunsToWriter < ActiveRecord::Migration[5.1]
  def change
    add_column :writers, :name, :string
    add_column :writers, :email, :string
    add_column :writers, :password, :string
  end
end
