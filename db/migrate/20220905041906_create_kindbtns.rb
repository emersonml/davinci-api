class CreateKindbtns < ActiveRecord::Migration[6.1]
  def change
    create_table :kindbtns do |t|
      t.string :name

      t.timestamps
    end
  end
end
