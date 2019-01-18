class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :content, foreign_key: true
      t.integer :session_id
      t.string :type

      t.timestamps
    end
  end
end
