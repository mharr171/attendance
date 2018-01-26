class AttendanceSheet < ApplicationRecord
  belongs_to :group
  has_many :members, through: :group
  has_many :attendance_records, dependent: :destroy
end
