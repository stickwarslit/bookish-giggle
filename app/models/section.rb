class Section < ApplicationRecord
  belongs_to :page
  has_many :section_edits
  has_many :admin_users, :through => :section_edits

  scope :visible, -> { where(:visible => true) }
  scope :invisible, -> { where(:visible => false) }

  scope :sorted, -> { order(:position => :asc) }
  scope :newest_first, -> { order(:created_at => :desc) }
  scope :search, ->(query) { where(["name LIKE ?", "%#{query}%"]) }
end
