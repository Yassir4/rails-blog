class AddAdminToWriters < ActiveRecord::Migration[5.1]
  def change
    add_column :writers, :admin, :boolean, default: false
  end
end
