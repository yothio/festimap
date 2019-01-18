class ContentHasOneGroup < ActiveRecord::Migration[5.2]
  def change
    add_reference :contents, :group, foreign_key: true
  end
end
