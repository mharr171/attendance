class AttendanceRecord < ApplicationRecord
  belongs_to :attendance_sheet
  belongs_to :member
end
