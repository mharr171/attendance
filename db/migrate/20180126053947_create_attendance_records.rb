class CreateAttendanceRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_records do |t|
      t.boolean :present
      t.references :attendance_sheet, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
