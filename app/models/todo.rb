class Todo < ActiveRecord::Base
    belongs_to :user
    validates :name, :task, presence: true
    validates :completed, inclusion: { in: [true, false], message: "%{value} is not valid"}
end