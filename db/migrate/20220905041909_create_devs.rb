class CreateDevs < ActiveRecord::Migration[6.1]
  def change
    create_table :devs do |t|
      t.integer :sttus
      t.string :name
      t.string :tipo

      t.timestamps
    end
  end
end
