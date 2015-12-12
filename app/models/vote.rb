class Vote < ActiveRecord::Base
  belongs_to :topic

  validates :topic_id, :created_by, presence: true
  validates :created_by, uniqueness: { scope: :topic_id }

  def suggestion_ids_string=(id_string)
    self.suggestion_ids = id_string.split(',').map(&:to_i)
  end
end
