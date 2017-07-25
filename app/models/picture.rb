class Picture < ApplicationRecord

  def self.created_before(time)
  Picture.where("created_at < ?", time)
  end

  def self.pictures_created_in_year(year)
    Picture.where("created_at" == year)
  end


end
