class CreateCometarios < ActiveRecord::Migration[7.0]
  def change
    create_table :cometarios do |t|
      t.text :detalle

      t.timestamps
    end
  end
end
