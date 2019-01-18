class CreateEventContents < ActiveRecord::Migration[5.2]
  def change
    create_table :event_contents do |t|
      t.references :event, foreign_key: true
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
