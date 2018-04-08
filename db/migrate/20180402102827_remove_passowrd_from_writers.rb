class RemovePassowrdFromWriters < ActiveRecord::Migration[5.1]
  def change
    remove_column :writers, :password, :string
  end
end
