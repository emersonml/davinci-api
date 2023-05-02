class CreateCentrals < ActiveRecord::Migration[6.1]
  def change
    create_table :centrals do |t|
      t.string :name
      t.string :tipo
      t.integer :sttus

      t.timestamps
    end
  end
end
