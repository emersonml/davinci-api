class CreateCompartimentos < ActiveRecord::Migration[6.1]
  def change
    create_table :compartimentos do |t|
      t.string :name
      t.references :patrimonio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
