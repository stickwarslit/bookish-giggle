class Section < ApplicationRecord
  belongs_to :page
  has_many :section_edits
  has_many :admin_users, :through => :section_edits

  scope :visible, -> { where(:visible => true) }
  scope :invisible, -> { where(:visible => false) }

  scope :sorted, -> { order(:position => :asc) }
  scope :newest_first, -> { order(:created_at => :desc) }
  scope :search, ->(query) { where(["name LIKE ?", "%#{query}%"]) }

  CONTENT_TYPES = ['text', 'HTML']

  validates_presence_of :name
  validates_length_of :name, maximum: 255
  validates_inclusion_of :content_type, in: CONTENT_TYPES,
    message: "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content
end
