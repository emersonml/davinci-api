class CreatePatrimonios < ActiveRecord::Migration[6.1]
  def change
    create_table :patrimonios do |t|
      t.string :name

      t.timestamps
    end
  end
end
