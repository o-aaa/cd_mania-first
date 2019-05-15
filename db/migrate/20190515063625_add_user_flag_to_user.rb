class AddUserFlagToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_flag, :integer, default: 0
    add_column :users, :user_status, :integer, default: 0
  end
end
