class AddToNoticiasToCometarios < ActiveRecord::Migration[7.0]
  def change
    add_reference :cometarios, :noticia, null: false, foreign_key: true
  end
end
