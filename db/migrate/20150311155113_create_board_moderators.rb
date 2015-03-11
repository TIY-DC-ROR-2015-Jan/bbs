class CreateBoardModerators < ActiveRecord::Migration
  def change
    create_table :board_moderators do |t|
      t.belongs_to :user, index: true
      t.belongs_to :board, index: true

      t.timestamps null: false
    end
    add_foreign_key :board_moderators, :users
    add_foreign_key :board_moderators, :boards
  end
end
