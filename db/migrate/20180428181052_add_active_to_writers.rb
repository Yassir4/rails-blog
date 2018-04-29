class AddActiveToWriters < ActiveRecord::Migration[5.1]
  def change
    add_column :writers, :active, :boolean
    add_column :writers, :active_token, :string
  end
end
