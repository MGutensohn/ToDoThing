class List < ApplicationRecord
  has_many :tasks, inverse_of: :list
  validates :name_string, presence: true
  accepts_nested_attributes_for :tasks,reject_if: proc { |attributes| attributes[:task_string].blank? }, allow_destroy: true
end
