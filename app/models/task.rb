class Task < ApplicationRecord
  validates :content,  presence: true
  validates :status,   presence: true

  has_many :assignments, dependent: :destroy
  has_many :assignees, through: :assignments,
    class_name: 'User', foreign_key: 'user_id', source: :user

  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels

  scope :recently_updated, -> { order(updated_at: :desc) }
  enum status: {todo: 0, done: 1}

  def json
    {
      id: id,
      content: content,
      status: status,
      timestamps: {
        created_at: created_at,
        updated_at: updated_at
      },
      assignees: assignees.map(&:json)
    }
  end
end
