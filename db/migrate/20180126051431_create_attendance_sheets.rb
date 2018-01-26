class CreateAttendanceSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_sheets do |t|
      t.string :name
      t.datetime :date
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
