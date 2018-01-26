class Member < ApplicationRecord
  has_and_belongs_to_many :groups
  has_many :attendance_sheets, through: :groups
  has_many :attendance_records, dependent: :destroy
end
