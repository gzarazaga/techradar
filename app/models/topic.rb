class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :slug, presence: true, uniqueness: true
  validates :creator, presence: true

  has_many :blips
  has_many :radars, through: :blips

  belongs_to :creator, class_name: 'User'

  def self.techradar
    find_or_create_by!(name: "techradar.io", creator: User.admin)
  end

  def self.by_name
    order("lower(name)")
  end
end
