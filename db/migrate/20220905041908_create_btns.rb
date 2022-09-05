class CreateBtns < ActiveRecord::Migration[6.1]
  def change
    create_table :btns do |t|
      t.integer :sttus
      t.string :name
      t.references :kindbtn, null: false, foreign_key: true

      t.timestamps
    end
  end
end
