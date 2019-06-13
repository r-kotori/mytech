class RemoveImageNameToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :image_name, :string
  end
end
