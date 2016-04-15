class CreateNotepads < ActiveRecord::Migration
  def change
    create_table :notepads do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
