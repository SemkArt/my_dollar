class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.float :value, null: false
      t.string :type, null: false
      t.datetime :forced_to
      t.timestamps
    end
  end
end
