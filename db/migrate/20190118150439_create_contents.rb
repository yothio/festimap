class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.text :body
      t.string :image_path
      t.boolean :is_comment_visible

      t.timestamps
    end
  end
end
