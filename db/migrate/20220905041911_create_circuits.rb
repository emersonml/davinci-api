class CreateCircuits < ActiveRecord::Migration[6.1]
  def change
    create_table :circuits do |t|
      t.integer :sttus
      t.string :name
      t.references :btn, null: false, foreign_key: true
      t.references :dev, null: false, foreign_key: true

      t.timestamps
    end
  end
end
