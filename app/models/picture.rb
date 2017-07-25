class Picture < ApplicationRecord

  def self.created_before(time)
  Picture.where("created_at < ?", time)
  end

  def self.pictures_created_in_year(year)
    Picture.where("created_at" == year)
  end

  validates :artist, presence: true
  validates :title, length: { minimum: 3, maximum: 20 }
  validates :url, presence: true, uniqueness: true


end
