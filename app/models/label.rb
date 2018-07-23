class Label < ApplicationRecord
  validates :name, presence: true

  has_many :task_labels, dependent: :destroy
  has_many :tasks, through: :task_labels

  def json
    {
      id: id,
      name: name,
      timestamps: {
        created_at: created_at,
        updated_at: updated_at
      }
    }
  end
end
