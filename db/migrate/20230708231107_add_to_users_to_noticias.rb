class AddToUsersToNoticias < ActiveRecord::Migration[7.0]
  def change
    add_reference :noticias, :user, null: false, foreign_key: true
  end
end
