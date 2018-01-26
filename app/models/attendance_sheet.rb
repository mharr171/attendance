class AttendanceSheet < ApplicationRecord
  belongs_to :group
  has_many :members, through: :group
end
