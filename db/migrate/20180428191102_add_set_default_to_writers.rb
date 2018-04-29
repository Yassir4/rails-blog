class AddSetDefaultToWriters < ActiveRecord::Migration[5.1]
  def change
    change_column :writers, :active, :boolean, default: false
  end
end
