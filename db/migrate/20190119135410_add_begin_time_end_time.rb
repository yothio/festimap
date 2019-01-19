class AddBeginTimeEndTime < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :begin_time, :time
    add_column :events, :end_time, :time

    change_column_default :events, :is_allow_comment, true
  end
end
