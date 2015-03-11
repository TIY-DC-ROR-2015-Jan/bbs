class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, null: false, default: false
    add_column :boards, :user_id, :integer
  end
end
