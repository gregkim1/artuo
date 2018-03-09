class AddCollabCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :collabs_count, :integer
  end
end
