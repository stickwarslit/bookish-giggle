class Page < ApplicationRecord
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :admin_users

  scope :sorted, -> { order(:position => :asc) }
end
