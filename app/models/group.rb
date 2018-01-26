class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :members, dependent: :destroy
  has_many :attendance_sheets, dependent: :destroy
end
