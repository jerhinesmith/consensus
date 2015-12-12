class Topic < ActiveRecord::Base
  # Relationships
  has_many :suggestions, dependent: :destroy

  # Validations
  validates :name, :description, :slug, :suggestions_start_at, :suggestions_end_at, :created_by, presence: true
  validates :slug, uniqueness: true

  # Scopes
  scope :by_name, -> { order(:name) }

  # Callbacks
  before_validation :set_defaults, on: :create

  def open_for_suggestions?
    self.suggestions_start_at.past? && self.suggestions_end_at.future?
  end

  private
  def set_defaults
    self.suggestions_start_at = Time.now.utc
    self.suggestions_end_at   = self.suggestions_start_at + 1.week
    self.slug                 = self.name.parameterize

    true
  end
end
