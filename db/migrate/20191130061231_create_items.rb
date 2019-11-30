class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :user_id
      t.integer :color_id

      t.timestamps
    end
  end
end
