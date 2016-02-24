class Character < ActiveRecord::Base
  belongs_to :game
  has_many :combos
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  #giving character the id
  def to_param
    name
  end
end
