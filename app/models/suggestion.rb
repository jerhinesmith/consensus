class Suggestion < ActiveRecord::Base
  # Associations
  belongs_to :topic

  # Validations
  validates :topic_id, :title, :description, :created_by, presence: true
end
