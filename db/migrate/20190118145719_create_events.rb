class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.references :user ,foreign_key: true
      t.boolean :is_allow_comment
      t.text :map

      t.timestamps
    end
  end
end
