class RemoveGuestFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :guest, :boolean
  end
end
