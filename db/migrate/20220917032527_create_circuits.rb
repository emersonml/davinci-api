class CreateCircuits < ActiveRecord::Migration[6.1]
  def change
    create_table :circuits do |t|
      t.integer :sttus
      t.string :name
      t.string :description
      t.references :compartimento, null: false, foreign_key: true
      t.references :kindbtn, null: false, foreign_key: true
      t.references :kinddev, null: false, foreign_key: true

      t.timestamps
    end
  end
end
